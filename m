Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 12A4460024
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 10:11:01 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id i138so25110683oig.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 02:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hhWp3vNJVBX/vuN7CBr4pXa/qQdbQVo9oWygtr0h8eU=;
	b=hT3aEWO23jBgTpUYRk4ioBmq+3VWbs30WGhC2TjIlRWVR244oQIUt86so6JrgAlGqz
	/TlImzVoaHkGydkNgYHqyjCzxvnaoZAgz5O8NWDQ6iVvTHe0NOQ7Tsc6Bb/mDGMXZfq9
	CzBJWLfKA5d2QkHHfaZ6YQg/wLqrMCzn2eqkpRqGI0dLvy47CxfPHU5isvXF0Qwh6ZMK
	iKcCWeXyREItbX+jQn9/jBtfmgM6McTEpYhjxuWbDCvLILNb9ikckgPupkVjtCPvoptu
	hJ12S5Pt0x9SZ367+8gBt8R3qpPszC8bS7ESA+l/bQB+VYO+u9a++wRO4hdgAr6tfBs9
	z6JA==
X-Gm-Message-State: ALoCoQkV+eJXffZdQod6HZj6FjKBK7LpwkTQOtIYkGne4yABtNhWiSHEOrjt2jhSFBtpkbafzghh
X-Received: by 10.202.180.70 with SMTP id d67mr4655030oif.119.1422526262903;
	Thu, 29 Jan 2015 02:11:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.116.167 with HTTP; Thu, 29 Jan 2015 02:10:42 -0800 (PST)
In-Reply-To: <54CA05D4.6040404@windriver.com>
References: <1422435425-20620-1-git-send-email-pengyu.ma@windriver.com>
	<CAP71Wjyba6f0VpKMFJkOs21KPFdtX_ScR3E=jtJTit_mkaN0cA@mail.gmail.com>
	<54CA05D4.6040404@windriver.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 29 Jan 2015 11:10:42 +0100
Message-ID: <CAP71WjwH+Z6Ys+vLQ66Agr07HrDNzVmy1q5NFgLXzdwCK5L=+A@mail.gmail.com>
To: Pengyu Ma <pengyu.ma@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] mesa: Upgrade to 10.4.0
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
X-List-Received-Date: Thu, 29 Jan 2015 10:11:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 29, 2015 at 11:05 AM, Pengyu Ma <pengyu.ma@windriver.com> wrote:
> On 01/29/2015 05:53 PM, Nicolas Dechesne wrote:
>>
>> On Wed, Jan 28, 2015 at 9:57 AM, Pengyu Ma <pengyu.ma@windriver.com>
>> wrote:
>>>
>>> diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.3.4.bb
>>> b/meta/recipes-graphics/mesa/mesa-gl_10.4.0.bb
>>> similarity index 100%
>>> rename from meta/recipes-graphics/mesa/mesa-gl_10.3.4.bb
>>> rename to meta/recipes-graphics/mesa/mesa-gl_10.4.0.bb
>>> diff --git a/meta/recipes-graphics/mesa/mesa_10.3.4.bb
>>> b/meta/recipes-graphics/mesa/mesa_10.4.0.bb
>>> similarity index 78%
>>> rename from meta/recipes-graphics/mesa/mesa_10.3.4.bb
>>> rename to meta/recipes-graphics/mesa/mesa_10.4.0.bb
>>
>> why not 10.4.3 directly, instead?
>
> 10.4.0 is intel graphic stack 2014 Q4 Release version
> https://01.org/linuxgraphics/downloads/2014/2014q4-intel-graphics-stack-release
>
> It is stable and verified with other packages libdrm xorg-video-intel and
> xserver-xorg in oe-core master.

well, i am not sure this is right... at least probably not the right
argument. oe-core is not meant to be tied to specific intel stable
releases, whether it is about content or  schedule..

i would believe our goal is to provide the most recent stable release
instead. so that each OE (well, Yocto) release ends up with the most
recent versions.

fwiw, for the boards/platforms i care about, 10.4.3 would be fine.

>>
>>
>>
>>> index 50092c9..7d3723e 100644
>>> --- a/meta/recipes-graphics/mesa/mesa_10.3.4.bb
>>> +++ b/meta/recipes-graphics/mesa/mesa_10.4.0.bb
>>> @@ -2,8 +2,8 @@ require ${BPN}.inc
>>>
>>>   SRC_URI =
>>> "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
>>>
>>> -SRC_URI[md5sum] = "fa0558a3d02c2bb8c208c030ccdc992e"
>>> -SRC_URI[sha256sum] =
>>> "e6373913142338d10515daf619d659433bfd2989988198930c13b0945a15e98a"
>>> +SRC_URI[md5sum] = "b7b37117eecbdfaaf3075acfb063d5a3"
>>> +SRC_URI[sha256sum] =
>>> "98a7dff3a1a6708c79789de8b9a05d8042e867067f70e8f30387c15026233219"
>>>
>>>   S = "${WORKDIR}/Mesa-${PV}"
>>>
>>> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb
>>> b/meta/recipes-graphics/mesa/mesa_git.bb
>>> index b046ae2..e554ff4 100644
>>> --- a/meta/recipes-graphics/mesa/mesa_git.bb
>>> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
>>> @@ -4,8 +4,8 @@ DEFAULT_PREFERENCE = "-1"
>>>
>>>   LIC_FILES_CHKSUM =
>>> "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3de"
>>>
>>> -SRCREV = "c7b9a2e38a3e471562b50dab8be65db8ac6819f8"
>>> -PV = "10.3.4+git${SRCPV}"
>>> +SRCREV = "f70e4d4afd16e66506ce3b055edb3b71b1464890"
>>> +PV = "10.4.3+git${SRCPV}"
>>
>> that's the commit for 10.4.3 tag, this isn't consistent with the
>> change you did in the non _git recipe.
>
> _git version include the latest stable version of mesa.
> So that's why we keep 2 versions.


ok, that makes sense. i wasn't sure about what the _git was supposed to be.

