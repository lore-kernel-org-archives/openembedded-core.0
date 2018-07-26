Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E3F478C70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 23:35:00 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id b15-v6so6034494oib.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 16:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O/ON5gAsWTfdl1CuiRpMlmiLIn7qxn3O+pCsAtVxZQg=;
	b=NH/GiY7ps67UtvQP3tJA2HvJ0KK3ZQe1KvDXGVGoGF3rHyUQXP9Sn3mQDf3wz/b/6p
	Gppc3L1QbgB1OUQaTtQI995lFcf1QzQL+9SPN0+RmwLTEiPgOpzt/TCLQLgDvg1/CljJ
	USqRGTeQo8JnOpanxr1jXIelnJl4k2NKvrs/i3KIyOCbnRH6oUmCUF/qWQby3G4C/cfG
	uZq3puxpN7aSPFmn5kWes+SiMnqhm4XRvQ4V5eDc8Z/RuRiKoH82pTMmvgUWIK9LEcns
	ju/sc9bM1EI8HGTUx/iYdQer2xPdCg1XiZBy04cbxoBkr1OadvdfSLNSdm1VhSVVEYy7
	ZHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O/ON5gAsWTfdl1CuiRpMlmiLIn7qxn3O+pCsAtVxZQg=;
	b=KMd0j09XaGleh+iPqyG6PyL6cbXJoMPHrwOUXHL1/f6dUqXRJFXalzZRaFuFDy/qYG
	Ptab6krJynssbH8eGmgp2ij/zyx9+b0rIsxkLwofnIt6UQv+jV4On+rlm0odyQ7e2j89
	Zs2/aLK+n300f1DDLVRgso6fYC4pAGbp5Ce4XFIE3TpRNVft+Hr9wIj3UVpImCFO58ig
	dA+YVcxku0T8Xukr+d0X4jzF3Fh1F+C3dM7dTk+1iorLXAdHP5/3X3dhiNPt0CsOLdXr
	ucJOngUNrTNG8JQUfoukiAgRNx1B775oTRoWDW3TIU9QZejBURfBthwWGx551Lo3A2+H
	DNDA==
X-Gm-Message-State: AOUpUlEHOJjWgeQk/nII7fgBA+TS+oRjQ0X+9tfpkiHSnbTwc9logWpn
	ky0TDI5hZpk1BzTfTDt0CY4MA/izDubQQyCNheTHkQ==
X-Google-Smtp-Source: AAOMgpdss/NVAc9Y9hhooVd1BgL1wPNXVMVVxKdizOSBxKpj2cgHqp9KvzIC9ivlpNskoRoSIGHukdV1FTiI+XGt/os=
X-Received: by 2002:aca:5f56:: with SMTP id
	t83-v6mr4438693oib.115.1532648102172; 
	Thu, 26 Jul 2018 16:35:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 16:34:41
	-0700 (PDT)
In-Reply-To: <20180726135835.17632-1-adrian.ratiu@ni.com>
References: <20180726135835.17632-1-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Jul 2018 00:34:41 +0100
Message-ID: <CAJTo0LajamOMF5TsuMZo+sBRLr=AqWYJUJPnifZUME=rKrO48g@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux.inc: add fallocate only for class-target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2018 23:35:01 -0000
Content-Type: text/plain; charset="UTF-8"

On 26 July 2018 at 14:58, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> Because the util-linux_2.32.bb recipe explicitely disables fallocate
> for nativesdk triggering build warnings:

Does anyone know why util-linux disables fallocate for nativesdk and
native builds?

Ross

