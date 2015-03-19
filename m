Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9574F65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 20:29:21 +0000 (UTC)
Received: by yhjf44 with SMTP id f44so30602732yhj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 13:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=tE7NzJQEPu5Ur0xhvfZVdKxuI/XzI3XP9qdhWH9cNH8=;
	b=NinTp6IYq/O4RjMaGEyMe+uxrJhYi7R2NHtUZ3luBEsFR5ZzRlLixnWFTlpISVbmVG
	OJi33Zy/jy9N1Vt/l0E4VQzq1thzR9DvupOQeMu7VyAaPF7HAikh6C52C/DLEDl+YaSC
	THMTNXOPacb5aTvAclSFO9Ayz/c6VhZmb62HjGWFmHrmSf89HIY6PJ4Vx1XAodgVgaD5
	6PqlOb1nPxtRd97RrwFEa5bILVrt4oNEGSH4gxaCmT1pdG+mIRdUOFL68mXVFai/ISoZ
	YC/jw2Go3cl4FcS5YqWZwOKBLaIFjbOZQjBU+cX+3JM8kvqb56Dp3fltXiOoavDWuGPC
	8Hxw==
MIME-Version: 1.0
X-Received: by 10.236.44.98 with SMTP id m62mr43949931yhb.136.1426796962244;
	Thu, 19 Mar 2015 13:29:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Thu, 19 Mar 2015 13:29:22 -0700 (PDT)
In-Reply-To: <CAJ86T=UH09ye6Vpfv+exa4rwJjeQkbixx0wy_gd=4H8Xnv-8GA@mail.gmail.com>
References: <1426746558-2920-1-git-send-email-armccurdy@gmail.com>
	<CAP9ODKo7=Ehs-BOL3NUFXXx8Mjt4tMR6GeKyZtokXfugEnX6BA@mail.gmail.com>
	<CAJ86T=UH09ye6Vpfv+exa4rwJjeQkbixx0wy_gd=4H8Xnv-8GA@mail.gmail.com>
Date: Thu, 19 Mar 2015 17:29:22 -0300
X-Google-Sender-Auth: CJDQSsUSdD5BJ4bfm_pOBa-coKM
Message-ID: <CAP9ODKpE8oYaUcQzCo4QLM6PP3s-e0SxA_VEJbbutu0avaqGcg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-plugins-good: fix nondeterministic udev dependency
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
X-List-Received-Date: Thu, 19 Mar 2015 20:29:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 19, 2015 at 5:19 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Mar 19, 2015 at 5:20 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>>> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
>>> index 85f2196..af18281 100644
>>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
>>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
>>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>>>
>>>  PR = "r8"
>>>
>>> -PACKAGECONFIG ?= "jpeg \
>>> +PACKAGECONFIG ?= "jpeg v4l \
>>
>> This is not needed.
>
> The reasons I had for explicit enabling were:
>
> - The video4linux2 plug-in is typically being built now and judging by
> the patches to gst-plugins-good it's not unusual for it to break
> during kernel upgrades, so keeping it enabled maintains that test
> coverage.
>
> - The video4linux2 plug-in is enabled by default in
> gstreamer1.0-plugins-good (with a hardcoded option passed via
> EXTRA_OECONF), so explicit enabling in gst-plugins-good keeps the two
> versions in sync.

Agreed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

