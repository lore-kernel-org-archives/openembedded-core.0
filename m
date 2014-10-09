Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 40B0D6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 12:50:14 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id q108so1776863qgd.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Oct 2014 05:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=di5JrlUsDSp4MO03INbBw+gM7Ri+TDJS8dmcZfhm8ng=;
	b=X6HM1oi7U/hoBAyOJXUQPxC6ozMzP/IKWUTgHci/ZemCrH0dTMopAstfUVr2xXlSZT
	Wy2duxOvd27FwlnGU0NtKVn2xGKkTUy7Sqq2/WpqzQ5pe4sJke6bwYZrmih7YmnfxdoW
	QeWgnG2kbjPsZ8J8Kh6Sg0PcPbawPt/b+X0qv0LzI/ceQKTiXhYBraFmT3ggPX0TLifN
	CX7+nOctR5X0W5f/YSdp3P1M1LlJJvD87h8cLfo0WUifRTHD7hxAembq2GgN/4jRrdQg
	m18OA6N6buk8bFVEs8xI3Vmnipw5YG2Z1FMwOscWDKZW4x8BXVMqZGe7fkIq4cNcNXL4
	JDJQ==
X-Gm-Message-State: ALoCoQleMl+fsUqsG2T3VqXKWuBXlswJaMN7+Np19nXfvbcbzT0D++kU0g5Zs0REqg6DxiySGWgw
X-Received: by 10.224.72.84 with SMTP id l20mr20073018qaj.93.1412859015452;
	Thu, 09 Oct 2014 05:50:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Thu, 9 Oct 2014 05:49:55 -0700 (PDT)
In-Reply-To: <406803c854b29b938a72d217c889ed63e1d7fe92.1412847857.git.liezhi.yang@windriver.com>
References: <cover.1412847857.git.liezhi.yang@windriver.com>
	<406803c854b29b938a72d217c889ed63e1d7fe92.1412847857.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Oct 2014 13:49:55 +0100
Message-ID: <CAJTo0LZ+6dC=FZFYO17YyCKNLr8=-wGFOGTmL+tE9teDKzhJ=g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nss-myhostname: skip it when systemd
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
X-List-Received-Date: Thu, 09 Oct 2014 12:50:15 -0000
Content-Type: text/plain; charset=UTF-8

On 9 October 2014 10:45, Robert Yang <liezhi.yang@windriver.com> wrote:
> +python () {
> +       if bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
> +               raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
> +}

Please use distro_features_check for conciseness.

Ross

