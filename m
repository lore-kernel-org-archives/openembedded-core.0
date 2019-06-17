Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4890A65CE9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 15:54:50 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so9679051wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 08:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=BcCFSLg3lQmsHlj4pzAjdsFbhAg3Z+rGaBjVb2zfSFg=;
	b=aHR+lFjntky8RvXc9d8aCYWTcJE+i7VrnCzvMXl3+an3M37t6GsqDhjUS1lIawYoOc
	PjOK1TecP/rsWVCO2X+crlXmIFhcfiHJFRuFtkSPUx+rCDIzd0+NGLm3wHkoM0Saou4J
	qTdY+DMAXXOjUOwzuaZDCxfaXxb2ylJYXDS9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BcCFSLg3lQmsHlj4pzAjdsFbhAg3Z+rGaBjVb2zfSFg=;
	b=MpudL44wxpdZis8HYLw38/BZbE7AjlMZA1M7Xhin/QBDsQSHaVXB/dn1EmIpRWyWae
	a5bkPlSIhWah74OYqPObxWMiy/dk5M5QQOjdVnw1O+u53cpvTt8dG4HSXWbRARwNtl+i
	EIFmTcWZ04Xo9Llq1DZ2RC048EpjGJdfBydgji0vHpg1zBcWmTdLlW1CxzKwqFbNdpD/
	SrJviDhXMKAKjF70r8Zj9fUadXWGmgWVhxOxICU2+Tw8sm8kSDBXVKpLOcMchVp7g70h
	XbrwSRHMeI0moBdPTHopj3+AXc8CVaGRr0S5EuM2kRTwcw0ZHrcgRT2+DtVpkcb5uHt2
	yPRQ==
X-Gm-Message-State: APjAAAWqxP1O1Sr3Tt6rDZATspO+WnlNSY3R01tacH/8lGM1wDHtkv6p
	mG0OLgc4bj221azsaC+uEPh5/PCmkLU=
X-Google-Smtp-Source: APXvYqw+BNBcwgCe+rFpQRTRFKe4hj/4rh24sHUM5ZVDVKHX7JsRtoMFLP7NpY0kNMVFBKHnTDS/kg==
X-Received: by 2002:a1c:2004:: with SMTP id g4mr18084336wmg.173.1560786891099; 
	Mon, 17 Jun 2019 08:54:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t7sm8556719wrn.52.2019.06.17.08.54.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 08:54:50 -0700 (PDT)
Message-ID: <f70ae3aaabc1a52a994fe5a0eae73f9e0416c851.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 16:54:49 +0100
In-Reply-To: <28e0391ef22f3e131227d66dae731fa14f48e1a0.1560763400.git.Qi.Chen@windriver.com>
References: <cover.1560763400.git.Qi.Chen@windriver.com>
	<28e0391ef22f3e131227d66dae731fa14f48e1a0.1560763400.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] manifest.py: fix test_SDK_manifest_entries
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
X-List-Received-Date: Mon, 17 Jun 2019 15:54:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-17 at 17:24 +0800, Chen Qi wrote:
> TOOLCHAIN_OUTPUTNAME could be overridden. So use this variable directly
> instead of its default value ${SDK_NAME}-toolchain-${SDK_VERSION}.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/manifest.py | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
> index c0b25ab..5d13f35 100644
> --- a/meta/lib/oeqa/selftest/cases/manifest.py
> +++ b/meta/lib/oeqa/selftest/cases/manifest.py
> @@ -86,11 +86,8 @@ class VerifyManifest(OESelftestTestCase):
>          try:
>              mdir = self.get_dir_from_bb_var('SDK_DEPLOY', self.buildtarget)
>              for k in d_target.keys():
> -                bb_vars = get_bb_vars(['SDK_NAME', 'SDK_VERSION'], self.buildtarget)
> -                mfilename[k] = "{}-toolchain-{}.{}.manifest".format(
> -                        bb_vars['SDK_NAME'],
> -                        bb_vars['SDK_VERSION'],
> -                        k)
> +                toolchain_outputname = get_bb_var('TOOLCHAIN_OUTPUTNAME', self.buildtarget)
> +                mfilename[k] = "{}.{}.manifest".format(toolchain_outputname, k)

Whilst I agree there is a problem here, this code is iterating over
multiple targets. Isn't TOOLCHAIN_OUTPUTNAME only going to be correct
for one of them?

Cheers,

Richard


