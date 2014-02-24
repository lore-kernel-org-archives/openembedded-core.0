Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id D6C386F284
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 09:35:40 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id w10so6073889pde.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 01:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=6O7nFtKq1kVN5BdHXgahVPOZ7tOvMDjmdyzpkPWTH5E=;
	b=e+Zlb45KN+fQVWnydQz7M2DadqurjWdGQpod2/FY2felA/zk0Q4gKXxIVmvU2yuPGW
	YVgGutcd8fIegnVsGmgn07U7C4Zb/mEdrgVViXjVlP+ZXniIdkDEdYlhL/r0oHckaqNG
	zI7NtnbVwvnViu1sYaZpEMgD/6CWzsjRoHaPXbxx2PW+s2dvdvhLEiiL4Ak9zHYjUq4S
	fEO7gIFdC5YowCTrZXUOFll4DarVr3PgORR2AmnsOV6IvRknQUjQN+/zks+l+vqYvO9p
	bSISmcPD3gSfAgnVYCmGC+d6/9lr6aiGSqW8cRm2yGHu13UXS8O1sJ7rmKP0k2rH0jh3
	zG6A==
X-Gm-Message-State: ALoCoQkIS+VCVpXMp9G5ubHXG/w4F9Ey9njhiG5u5rR068dhBSp7Eiru0g2tTLfdk6lpQe4lLkBA
MIME-Version: 1.0
X-Received: by 10.66.163.138 with SMTP id yi10mr24019205pab.95.1393234541314; 
	Mon, 24 Feb 2014 01:35:41 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 24 Feb 2014 01:35:41 -0800 (PST)
In-Reply-To: <CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
Date: Mon, 24 Feb 2014 09:35:41 +0000
X-Google-Sender-Auth: Yc2w8N6obPgNBumzxPzxaSXdadY
Message-ID: <CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Conf notes
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
X-List-Received-Date: Mon, 24 Feb 2014 09:35:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 6:34 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Fri, Feb 21, 2014 at 8:06 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>
>> I have just put a conf notes file into my own layer, but when I source
>> the oe-init-build-env script, I am still getting the notes from Yocto
>> rather than my customized.
>>
>> What am I doing wrong? I see this in the ./scripts/oe-setup-builddir file:
>>
>> TEMPLATECONF=${TEMPLATECONF:-meta-yocto/conf}
>>
>> and other references, but I have not pin the issue down just yet.
>
> are you setting TEMPLATECONF variable? if so, how?

cat setup.sh
#!/bin/bash

TEMPLATECONF=meta-foo/conf . oe-init-build-env

> also, if you provide conf-notes.txt you need to provide
> local.conf.sample and bblayers.conf.sample.
>
> if TEMPLATECONF is set, it will use these files:
>
>     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
>     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
>     OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"

ls ./meta-foo/conf/
bblayers.conf.sample  conf-notes.txt  distro  layer.conf
local.conf.sample  site.conf.sample

