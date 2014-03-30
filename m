Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 487626F7B5;
	Sun, 30 Mar 2014 15:43:40 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id ij19so7451146vcb.38
	for <multiple recipients>; Sun, 30 Mar 2014 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=WiZfVZCt01O3DFGIOP6BCvvXdFFgOHyDRMDr7HKK+mk=;
	b=Fc/M7K8k4hqicQBZ+a+raBCHDDVX+HXtSRhZRzyS6cJORbKvrEKNVC+M1BuUbvjnrc
	zWJzVE7RBaqRZHJfM9QD91U3Vn2CClckcSg/KZ2hGvLHNfp4DHmGdySkL2KG/qyJeZY0
	nvx6/Vi1nY0bUr8K/XWMUygu5TPLeVaIUg6WQwYNrrQaKhf3Pvr4A8o9OQEWwX4+n5VH
	UJdCMGwJ1YJwjNr1HB837M96wB9xv/hdAO5GnoEG0w1wfQg5JzUCySWKz1fDfVxjqNMF
	gKs0itjugRexHE3XZjjWlWHbcq1xtzy/3nJKXRiFgkA9a/9Ug+i6DRIultQCb3QqZORU
	jtpw==
X-Received: by 10.220.133.80 with SMTP id e16mr18563736vct.13.1396194221309;
	Sun, 30 Mar 2014 08:43:41 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Sun, 30 Mar 2014 08:43:01 -0700 (PDT)
In-Reply-To: <CAMKF1sqPB+QCvPHHcxsU+ExBmNWg9jPXajkAR_FdKpJ76-x9dg@mail.gmail.com>
References: <CAMKF1soKZqqmQUVCQnUqS1GV1FO5KictTO+=up=d7Jw3+QhXMw@mail.gmail.com>
	<CAJTo0LYF0VNwy7=rhmr7U_=tXwJtPOax3AKttn66q3qD_QXd2w@mail.gmail.com>
	<CANyK_8deVKbC6xOUQHubvphfwQCQefHGWCt7Mp1QM4DUVXja5g@mail.gmail.com>
	<CAMKF1sqPB+QCvPHHcxsU+ExBmNWg9jPXajkAR_FdKpJ76-x9dg@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 30 Mar 2014 16:43:01 +0100
X-Google-Sender-Auth: o9kTunvH_9YbOJXbcOLF8ylH7E0
Message-ID: <CANyK_8er+2sjvU1csLOEpZ06qCL4h+bP2ecUYYGzyiEw0kXzQw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] initial support for musl libc with OE/Yocto Project
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
X-List-Received-Date: Sun, 30 Mar 2014 15:43:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 30 March 2014 05:17, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Mar 27, 2014 at 5:53 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
>> On 26 March 2014 22:12, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 26 March 2014 22:04, Khem Raj <raj.khem@gmail.com> wrote:
>>>> There were interest in other threads in having musl as an alternative
>>>> to eglibc/uclibc that we already have in OE, in that direction I have
>>>> poured in my on and off work and put it into a contrib tree
>>>
>>> Blimey Khem that was quick. :)
>>>
>>
>> Agreed!
>>
>> I wonder if it's worth splitting this out into its own layer though
>
> I thought about it and since class/conf changes that need to go in into OE-core
> first I kept it as it is (lazyness too). I think once the core support
> is available in OE-core
> we can spin the recipes into a layer of its own.
>
>> (with fixes done via bbappends) so that it's easy for multiple people
>> to contribute to. It would also mean it doesn't need rebasing onto
>> master all the time.
>>
>> I'd definitely like to get involved with this. In particular I can
>> ensure opkg (both current release and development branch) work with
>> musl and see if some of my preferred software from meta-oe will build
>> (vim, htop, etc).
>
> start with what we have. Once master opens up I would propose the needed
> changes to OE-core and spin a layer
>

I did a quick 'bitbake -k core-image-minimal' to see what's currently
failing. Full logs and config at
http://www.paulbarker.me.uk/musl-build/

Build Configuration:
BB_VERSION        = "1.21.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "arm-oe-linux-musleabi"
MACHINE           = "qemuarm"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "armv5 thumb dsp"
TARGET_FPU        = "soft"
meta              = "kraj/musl:faafa7022ed057d55c131c456d1bdd5dfa3d2517"

Summary: 6 tasks failed:
  openembedded-core/meta/recipes-support/attr/attr_2.4.47.bb, do_compile
  openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_compile
  openembedded-core/meta/recipes-core/util-linux/util-linux_2.24.1.bb,
do_compile
  openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_compile
  openembedded-core/meta/recipes-core/busybox/busybox_1.22.1.bb, do_compile
  openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb, do_compile

I can see for util-linux that we need to implement qsort_r().

Busybox probably just needs config changes:
http://wiki.musl-libc.org/wiki/Building_Busybox

glib is getting confused as both musl and libiconv provide <iconv.h> as warned:

    WARNING: The recipe libiconv is trying to install files into a shared area
    when those files already exist. Those files and their manifest location are:
       /home/pbarker/musl-build/build/tmp-musl/sysroots/qemuarm/usr/include/iconv.h
       Matched in manifest-qemuarm-musl.populate_sysroot
    Please verify which package should provide the above files.

We also have:

    WARNING: The recipe gettext is trying to install files into a shared area
    when those files already exist. Those files and their manifest location are:
       /home/pbarker/musl-build/build/tmp-musl/sysroots/qemuarm/usr/include/libintl.h
       Matched in manifest-qemuarm-musl.populate_sysroot
    Please verify which package should provide the above files.

    WARNING: QA Issue: gettext: Files/directories were installed but not shipped
      /usr/lib/charset.alias

Hope this helps,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

