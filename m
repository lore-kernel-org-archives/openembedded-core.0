Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9B41360AD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 14:10:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v11so3161385wrm.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ciJsr+fIF018ppErvVRWBADmoHCR0+9Oubxbu8Y0v1E=;
	b=YKLQwxPj/qsZB5FYC+j5FwRuVHFthUDDVBES+KneN5vQs1/iRYNFgVt6qTWHAptAkl
	tzQjiss+5LdS0CAR3rEqCcEeqyEriOzxi7JhKrFL0ygHv+/jW41trQ0WyTgfpWEFbEhJ
	zZI/1xZlujAThkrUgnuEAHCdrKUt8dRm+7OIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ciJsr+fIF018ppErvVRWBADmoHCR0+9Oubxbu8Y0v1E=;
	b=kLo26jPIDrgsib/Phhk6NezDcRpRCDaiRTQiZDgYK0LrgLK0t+nKmRsKTwyE5P8iLz
	B4TiHlae7mDz2z/xYCw20L7IX6NAc9oYzmwj1O/k+/R00Nlw3arJOOuQE59IlU0CCE2p
	V/DMyskNTI387Gihq1SAvuXpbQ2epm1M0yTN1ILl4S9JvDqGYoLCMxUWvPn43oXp8QwG
	+513TTNZ2IwNKXLydjyDFJgP06XV3DSj05C0YBWK/h41JmM30akyrXpDOqwgTScaWFBh
	vhUK5wX/G1jciXDALX7okscBsT6Ye3TkSJfL1nbFD2lFREqa7ONSt2447k19JtYAuiNB
	h7wQ==
X-Gm-Message-State: ANhLgQ2dtRrlpet/F4vtOC/HMV3b8UZq2uxkBYwmvktNOOwfskwPlvwe
	EO5rrn3BxjhkPPgdpScmKKPOmQ==
X-Google-Smtp-Source: ADFU+vtsGriV3gbmS3+isnXizyAvawIGUE660V6Tq98371DAKucPLOGm3RhgLv+tIjBbsRODDyer5g==
X-Received: by 2002:adf:eac7:: with SMTP id o7mr4811319wrn.292.1584627056737; 
	Thu, 19 Mar 2020 07:10:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id b5sm3752625wrj.1.2020.03.19.07.10.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Mar 2020 07:10:56 -0700 (PDT)
Message-ID: <d88284c9fa0ca7eda58543a4a3b262b6fbe1fcb3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2020 14:10:52 +0000
In-Reply-To: <1584603707-43423-6-git-send-email-wangmy@cn.fujitsu.com>
References: <1584603707-43423-1-git-send-email-wangmy@cn.fujitsu.com>
	<1584603707-43423-6-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH] mc: upgrade 4.8.23 -> 4.8.24
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
X-List-Received-Date: Thu, 19 Mar 2020 14:10:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-19 at 00:41 -0700, Wang Mingyu wrote:
> 0001-Add-option-to-control-configure-args.patch
> 0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch
> removed since they are included in 4.8.24
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...Add-option-to-control-configure-args.patch |  99 ----------------
>  ...29-configure.ac-drop-bundled-gettext.patch | 110 ----------------
> --

Fails in do_install:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1945
https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/609

How was this tested?

Cheers,

Richard


