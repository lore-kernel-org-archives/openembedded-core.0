Return-Path: <msm-oss@mcclintock.net>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 645B171DAE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 18:27:09 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id g2so11993236pge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 11:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mcclintock.net; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2Tt8O6A6c8PsaeOiisbRtGxU9aTUPeHMitqDKgA8D40=;
	b=d3JhD4CSWLput7xuDG58BGXPD1nld9emaDwUhI7BAT8X/HATHlNoYlE/J7QbPMsz2d
	g2mD8gqj2SKzuoyYXytJqVoFSrzsHAwDbI292W0GsxY3hsd1rqc7lLSTKeq3UXbqB9T1
	KINht0E8rBVeodujb644wjddPGz9YGvIwDTHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2Tt8O6A6c8PsaeOiisbRtGxU9aTUPeHMitqDKgA8D40=;
	b=pwJs5xsOgJBoETBLq66ONsDnGAURyM/DmY6SjzpE551diHQ//bsrOOA09G3CuhUxcP
	msUhYMQSOCioRYtpLgWp2ZKcA4F1CRRjhOX2ZqGJk/WnifZdfweFRITb0nnVcWVq4IXj
	c74/JeKsG8Z6sRzdg2krBHvvqPMnff3yiFZ675JUEEHnFZ5OTdGo/9QUFh4v4QN/IBHg
	gP6PaQiI8+DneFMJXhYKpT83NnoY11wQbGhnaJE/66S6GBdK8tmsvhLEdaHrUqmCedkB
	CNWVVpJv+UuqTQ4alsZYy2+egvTNXGkVz7tbpp3M3vfJ7EMgGLP/341X9RiO5E65X2PU
	ZMsg==
X-Gm-Message-State: AFeK/H0mEXY7kcExVxSAl2lmFDb8qmjAwzHJGFl7JVvZWR2FtaRfbpZgCb3BW4FCMmHEqejdlhyUHx7/DmeMTQ==
X-Received: by 10.98.64.129 with SMTP id f1mr30142435pfd.123.1491416831207;
	Wed, 05 Apr 2017 11:27:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.153.197 with HTTP; Wed, 5 Apr 2017 11:26:50 -0700 (PDT)
In-Reply-To: <CAGQ4JX12JDMaffLGYO16626BhXCSAQ3wzVEzN21wzcrZ7mwJ5A@mail.gmail.com>
References: <CAGQ4JX3rYtONiVv_eOhj-MK=2FA7=h3xCA_iytd=fpTF00rT6A@mail.gmail.com>
	<CAGQ4JX06AcUkSzRyg2255mZxxT=etOaE786_fVQqGp32EO8S2Q@mail.gmail.com>
	<CAEsOVNencj+9iW4xnqAUTzJAZ1_W=o8-N2-S6x0fr2pB-YJd9g@mail.gmail.com>
	<1491407333.17200.22.camel@linuxfoundation.org>
	<CAGQ4JX1DGeQuO3WhhpHZbJFsUpOg1uHmOou1fcQvgBy+hJpjOQ@mail.gmail.com>
	<CAGQ4JX12JDMaffLGYO16626BhXCSAQ3wzVEzN21wzcrZ7mwJ5A@mail.gmail.com>
From: Matthew McClintock <msm-oss@mcclintock.net>
Date: Wed, 5 Apr 2017 13:26:50 -0500
Message-ID: <CAEsOVNcN6=XAt8b7_PN288yHs8syzV08LreRkwSf2Mxpeb8Cgw@mail.gmail.com>
To: Ravi chandra reddy <vlsireddy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe [patch] modification to generate a static library instead of shared library
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
X-List-Received-Date: Wed, 05 Apr 2017 18:27:10 -0000
Content-Type: text/plain; charset=UTF-8

Do you have the staticdev packages in your TMPDIR? E.g.

tmp/work/cortexa15t2hf-neon-rdk-linux-gnueabi/libxml2/2.9.4-r0/deploy-ipks/cortexa15t2hf-neon/libxml2-staticdev_2.9.4-r0_cortexa15t2hf-neon.ipk

-M

On Wed, Apr 5, 2017 at 1:09 PM, Ravi chandra reddy <vlsireddy@gmail.com> wrote:
> Hi,
>     Let me thank you guys for quick reply.
> let me put my  email in correct steps
>
> 1. below local/local.conf changes makes bitbake fail.
>
>                             IMAGE_INSTALL_append = "lib32-glibc lib32-libgcc
> lib32-libstdc++ libedit libxml2-staticdev"
>
> error:=============
> ================================== i get the following
> errors==================================
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
> ERROR: Logfile of failure stored in:
> /home/polar/zcu_yocto/poky/build/tmp/work/zcu102_zynqmp-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.17721
> ERROR: Task 9
> (/home/polar/zcu_yocto/poky/meta/recipes-core/images/core-image-minimal.bb,
> do_rootfs) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2144 tasks of which 2143 didn't need to be
> rerun and 1 failed.
> ===================================
>
> 2.  without staticdev changes [in local/local.conf], it
> [bitbake-core-image-minimal] goes through and it builds [but there is only
> .so [dynamic library] generated]
>
> IMAGE_INSTALL_append = "lib32-glibc lib32-libgcc lib32-libstdc++ libedit
> libxml2"
>
>
> 3. i ran the search and found that all "no-static" lines are commented
>
> bitbake -e | grep static-libs
>
>
> and all the "no-static-libs.inc" are commented [#]
>
> Thanks
> RC
>
> On Wed, Apr 5, 2017 at 2:04 PM, Ravi chandra reddy <vlsireddy@gmail.com>
> wrote:
>>
>> Hi,
>>        in local/local.conf it [bitbake core-image-minimal] fails, if i use
>> libxml2-staticdev
>>
>>   # Specify the 32-bit libraries to be added to all images
>> IMAGE_INSTALL_append = "lib32-glibc lib32-libgcc lib32-libstdc++ libedit
>> libxml2-staticdev"
>>
>> ================================== i get the following
>> errors==================================
>> ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
>> ERROR: Logfile of failure stored in:
>> /home/polar/zcu_yocto/poky/build/tmp/work/zcu102_zynqmp-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.17721
>> ERROR: Task 9
>> (/home/polar/zcu_yocto/poky/meta/recipes-core/images/core-image-minimal.bb,
>> do_rootfs) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 2144 tasks of which 2143 didn't need to be
>> rerun and 1 failed.
>> ===================================
>>
>> if i use as below, there is no issue. however there is no .so
>>
>> # Specify the 32-bit libraries to be added to all images
>> IMAGE_INSTALL_append = "lib32-glibc lib32-libgcc lib32-libstdc++ libedit
>> libxml2"
>>
>> i ran
>>
>> bitbake -e | grep static-libs
>>
>> and all the "no-static-libs.inc" are commented [#]
>>
>> Thanks
>> RC
>>
>>
>>
>> On Wed, Apr 5, 2017 at 11:48 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> On Wed, 2017-04-05 at 10:33 -0500, Matthew McClintock wrote:
>>> > On Wed, Apr 5, 2017 at 10:18 AM, Ravi chandra reddy <vlsireddy@gmail.
>>> > com> wrote:
>>> > >
>>> > > Hi All,
>>> > >           I am using meta-oe to generate libxml2 library using
>>> > > AARCH64
>>> > > compiler. However it generates shared object [.so] library.
>>> > >
>>> > > is there any setting in recipe to modify this, to generate static
>>> > > library
>>> > > [instead of shared library]
>>> > >
>>> > > if so, please point me to the recipe/file to change.
>>> > >
>>> > > if not, i will try to add it as patch, plz point me to appropriate
>>> > > files to
>>> > > change
>>> > Is the ${PN}-staticdev package getting generated for you?
>>>
>>> Its possible you have conf/distro/include/no-static-libs.inc included
>>> in your build (bitbake -e would tell you).
>>>
>>> If so, you could remove that include or set:
>>>
>>> DISABLE_STATIC = ""
>>>
>>> as it would currently be set to this if that include file is included:
>>>
>>> DISABLE_STATIC = " --disable-static"
>>>
>>> We tend not to build static libraries as they're a waste of space/time
>>> on the most part.
>>>
>>> Cheers,
>>>
>>> Richard
>>
>>
>

