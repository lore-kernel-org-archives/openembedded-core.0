Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DDA6871A20;
	Wed, 23 Nov 2016 18:25:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so2792119wme.2;
	Wed, 23 Nov 2016 10:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jf0LXiZfIULqjTMsHDueepNyZ7dL8hWVHMpAQRQCi3k=;
	b=Np3tYMGhsBi64+rTsPJmqw71ddPt1Jys+/P825/uPYai7ttHYy3bgv6CBHOTbWcfs7
	znap8QjIqaZckfZ7cczy/zKl3gBW0HT63IyokyKHOTeK1+KNZCb/L/wReQ78g878XYDp
	1r0MKxpsZ0xI+qqJhwa5stcSlGPM6kMuLCYduuKo1RuVXBv6uo7eaNYvZACsnqVqX8w6
	xZjKvKDn6Tz6YZlrUs6jGfggqt7K7B9ihU/Qk1rA9yLPqa5zpGt6MxU5XN55gpOBtBUH
	4hVEOBKRmOwfHxqfOqHNoGE8hib9KgbUe+F/HW0uSajdcJoD7FVt7hwFmlsu+jcvF8/M
	/Ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jf0LXiZfIULqjTMsHDueepNyZ7dL8hWVHMpAQRQCi3k=;
	b=IYAUJ3tNONU0SlXcIC58GYVTIRFr6sISkiaQDMhT7C6XVHuF9t7UCrifY9LuhqwL2a
	hO13J8rEUkoPWshCnNB/HcEzCafW4NuLoYf0DayWFYleN9KP1i0CncqNNdxA1CG5ALIu
	ygb/LEzjXT9ko6ka8tC7gUvxPASQBnXGKWTXTwLJTJT53xNuNdQvumInLjFPm+YYixMr
	GDg9rtNItGr4xgCos2kz2iGEM4n5d9SQVx9BMGD5IvCdAaUUbK6fJsBg0O1hzwQ5w8jY
	P9j0uTVvjGpLJzoYBSNTNeitnRpWnpWWGnrBqXRJ2RjQUz6DXUZU83ciVMpP1ZKmWfz8
	y8Xw==
X-Gm-Message-State: AKaTC03mTFqkkU4KyCbav5McpFJ1xBXgRmGZfrMEO3iv800PfKepCuIyAxyBn0mY0TknyWGfBSYQzRYU0xKpyA==
X-Received: by 10.28.184.88 with SMTP id i85mr4340502wmf.49.1479925559539;
	Wed, 23 Nov 2016 10:25:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Wed, 23 Nov 2016 10:25:59 -0800 (PST)
In-Reply-To: <e3fde391-64a2-12b2-7dc8-5845bf9e699b@windriver.com>
References: <20161103133345.6936.13797@opal.openembedded.org>
	<20161103133346.EC39750212@opal.openembedded.org>
	<20161123171218.GE3265@jama>
	<e3fde391-64a2-12b2-7dc8-5845bf9e699b@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 23 Nov 2016 19:25:59 +0100
Message-ID: <CA+chaQdobgh2HcA1wMCc0m9B=Kd65W1SrLNe08kvFH7GmsJb0w@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/05: linux-yocto/4.8: update to 4.8.6
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
X-List-Received-Date: Wed, 23 Nov 2016 18:25:59 -0000
Content-Type: multipart/alternative; boundary=001a114b7c38453e170541fc059f

--001a114b7c38453e170541fc059f
Content-Type: text/plain; charset=UTF-8

I know it's not a fix and doesn't help to find the root cause of this
issue, but it built OK after cleansstate.

On Wed, Nov 23, 2016 at 7:12 PM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> On 2016-11-23 12:12 PM, Martin Jansa wrote:
>
>> On Thu, Nov 03, 2016 at 01:33:47PM +0000, git@git.openembedded.org wrote:
>>
>>> rpurdie pushed a commit to branch master-next
>>> in repository openembedded-core.
>>>
>>> commit 2a7d3173c7a05cd09bbcf5fe465403b2d4b2b589
>>> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> AuthorDate: Thu Nov 3 09:25:14 2016 -0400
>>>
>>>     linux-yocto/4.8: update to 4.8.6
>>>
>>>     Integrating the korg -stable release.
>>>
>>
>> Not sure if it's caused by this upgrade or one of kernel tooling
>> improvements, but now it fails to build for me in default qemux86
>> config:
>>
>
>
> Interesting. The latest set of commits that I pushed are building with
> that same addon feature enabled.
>
> I can rewind to that older commit and see if something is broken, but
> the new tools and error checking shouldn't be coming into play with
> a commit of that vintage.
>
> Bruce
>
>
>
>
>> ERROR: linux-yocto-4.8.6+gitAUTOINC+87e5fc8b7c_9d5f74f941-r0
>> do_kernel_metadata: Function failed: do_kernel_metadata (log file is
>> located at /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yoct
>> o/4.8.6+gitAUTOINC+87e5fc8b7c_9d5f74f941-r0/temp/log.do_
>> kernel_metadata.441)
>> ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/wo
>> rk/qemux86-oe-linux/linux-yocto/4.8.6+gitAUTOINC+87e5fc8b7c_
>> 9d5f74f941-r0/temp/log.do_kernel_metadata.441
>> Log data follows:
>> | DEBUG: Executing shell function do_kernel_metadata
>> | ERROR. input file "features/nfsd/nfsd-enable.scc" does not exist
>> | ERROR: could not process input files: features/nfsd/nfsd-enable.scc
>> features/debug/printk.scc features/netfilter/netfilter.scc
>> cfg/virtio.scc cfg/sound.scc cfg/paravirt_kvm.scc
>> |        See /tmp/tmp.tLkBgIybCS for details
>> | ERROR. input file "features/nfsd/nfsd-enable.scc" does not exist
>> | ERROR: could not process input files: features/nfsd/nfsd-enable.scc
>> features/debug/printk.scc features/netfilter/netfilter.scc
>> cfg/virtio.scc cfg/sound.scc cfg/paravirt_kvm.scc
>> |        See /tmp/tmp.T7cBZctbo1 for details
>> | ERROR: Function failed: do_kernel_metadata (log file is located at
>> /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yoct
>> o/4.8.6+gitAUTOINC+87e5fc8b7c_9d5f74f941-r0/temp/log.do_
>> kernel_metadata.441)
>> ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-kernel/
>> linux/linux-yocto_4.8.bb:do_kernel_metadata) failed with exit code '1'
>>
>>
>>
>>
>>>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>  meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
>>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
>>>  meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20
>>> ++++++++++----------
>>>  3 files changed, 16 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>>> index e51c9cd..26b309d 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>>> @@ -11,13 +11,13 @@ python () {
>>>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel
>>> to linux-yocto-rt to enable it")
>>>  }
>>>
>>> -SRCREV_machine ?= "4057556c041f6aac0d29aa3425587d414c9a0090"
>>> -SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
>>>
>>
>> +SRCREV_machine ?= "b99b6fac437104e206d30540a5cb12103049af1e"
>>> +SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
>>>
>>>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBR
>>> ANCH};name=machine
>>> <http://git.yoctoproject.org/linux-yocto-4.8.git;branch=$%7BKBRANCH%7D;name=machine>
>>> \
>>>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;nam
>>> e=meta;branch=yocto-4.8;destsuffix=${KMETA}
>>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=$%7BKMETA%7D>
>>> "
>>>
>>> -LINUX_VERSION ?= "4.8.3"
>>> +LINUX_VERSION ?= "4.8.6"
>>>
>>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>>> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>>> index c8ddbd9..63dd11b 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>>> @@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
>>>
>>>  require recipes-kernel/linux/linux-yocto.inc
>>>
>>> -LINUX_VERSION ?= "4.8.3"
>>> +LINUX_VERSION ?= "4.8.6"
>>>
>>>  KMETA = "kernel-meta"
>>>  KCONF_BSP_AUDIT_LEVEL = "2"
>>>
>>> -SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
>>> -SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
>>> +SRCREV_machine ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
>>> +SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
>>>
>>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
>>> b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
>>> index 13778b9..0369198 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
>>> @@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
>>>  KBRANCH_qemux86-64 ?= "standard/base"
>>>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>>>
>>> -SRCREV_machine_qemuarm ?= "4cc544ad09ad704322cb66fe4ba197a6a05dc71f"
>>> -SRCREV_machine_qemuarm64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
>>> -SRCREV_machine_qemumips ?= "c285969d4f9376a671167ecf397578c8ad3e6a75"
>>> -SRCREV_machine_qemuppc ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
>>> -SRCREV_machine_qemux86 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
>>> -SRCREV_machine_qemux86-64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
>>> -SRCREV_machine_qemumips64 ?= "64f96ba530e58456070f26b0f3fcce3f64988b72"
>>> -SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
>>> -SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
>>> +SRCREV_machine_qemuarm ?= "94d3e8675e2fcb09f29814a33ccf79df06149104"
>>> +SRCREV_machine_qemuarm64 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
>>> +SRCREV_machine_qemumips ?= "046ff6344eee25dcc0eea1214e0ad8771ddfabfb"
>>> +SRCREV_machine_qemuppc ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
>>> +SRCREV_machine_qemux86 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
>>> +SRCREV_machine_qemux86-64 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
>>> +SRCREV_machine_qemumips64 ?= "edcb167f91abc071cc98cbd762418ff7ab9d839b"
>>> +SRCREV_machine ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
>>> +SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
>>>
>>>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine
>>> ;branch=${KBRANCH}
>>> <http://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=$%7BKBRANCH%7D>;
>>> \
>>>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;nam
>>> e=meta;branch=yocto-4.8;destsuffix=${KMETA}
>>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=$%7BKMETA%7D>
>>> "
>>>
>>> -LINUX_VERSION ?= "4.8.3"
>>> +LINUX_VERSION ?= "4.8.6"
>>>
>>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>>
>>>
>>> --
>>> To stop receiving notification emails like this one, please contact
>>> the administrator of this repository.
>>> --
>>> _______________________________________________
>>> Openembedded-commits mailing list
>>> Openembedded-commits@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>>
>>
>>
>

--001a114b7c38453e170541fc059f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I know it&#39;s not a fix and doesn&#39;t help to find the=
 root cause of this issue, but it built OK after cleansstate.</div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Nov 23, 2016 at 7=
:12 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfie=
ld@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 2016-11-2=
3 12:12 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Thu, Nov 03, 2016 at 01:33:47PM +0000, <a href=3D"mailto:git@git.openemb=
edded.org" target=3D"_blank">git@git.openembedded.org</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
rpurdie pushed a commit to branch master-next<br>
in repository openembedded-core.<br>
<br>
commit 2a7d3173c7a05cd09bbcf5fe465403<wbr>b2d4b2b589<br>
Author: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com" =
target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
AuthorDate: Thu Nov 3 09:25:14 2016 -0400<br>
<br>
=C2=A0 =C2=A0 linux-yocto/4.8: update to 4.8.6<br>
<br>
=C2=A0 =C2=A0 Integrating the korg -stable release.<br>
</blockquote>
<br>
Not sure if it&#39;s caused by this upgrade or one of kernel tooling<br>
improvements, but now it fails to build for me in default qemux86<br>
config:<br>
</blockquote>
<br>
<br></span>
Interesting. The latest set of commits that I pushed are building with<br>
that same addon feature enabled.<br>
<br>
I can rewind to that older commit and see if something is broken, but<br>
the new tools and error checking shouldn&#39;t be coming into play with<br>
a commit of that vintage.<span class=3D"HOEnZb"><font color=3D"#888888"><br=
>
<br>
Bruce</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
ERROR: linux-yocto-4.8.6+gitAUTOINC+8<wbr>7e5fc8b7c_9d5f74f941-r0 do_kernel=
_metadata: Function failed: do_kernel_metadata (log file is located at /OE/=
build/oe-core/tmp-glibc/wo<wbr>rk/qemux86-oe-linux/linux-yoct<wbr>o/4.8.6+g=
itAUTOINC+87e5fc8b7c_<wbr>9d5f74f941-r0/temp/log.do_<wbr>kernel_metadata.44=
1)<br>
ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/wo<wbr>rk/=
qemux86-oe-linux/linux-yoct<wbr>o/4.8.6+gitAUTOINC+87e5fc8b7c_<wbr>9d5f74f9=
41-r0/temp/log.do_<wbr>kernel_metadata.441<br>
Log data follows:<br>
| DEBUG: Executing shell function do_kernel_metadata<br>
| ERROR. input file &quot;features/nfsd/nfsd-enable.scc<wbr>&quot; does not=
 exist<br>
| ERROR: could not process input files: features/nfsd/nfsd-enable.scc featu=
res/debug/printk.scc features/netfilter/netfilter.s<wbr>cc cfg/virtio.scc c=
fg/sound.scc cfg/paravirt_kvm.scc<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 See /tmp/tmp.tLkBgIybCS for details<br>
| ERROR. input file &quot;features/nfsd/nfsd-enable.scc<wbr>&quot; does not=
 exist<br>
| ERROR: could not process input files: features/nfsd/nfsd-enable.scc featu=
res/debug/printk.scc features/netfilter/netfilter.s<wbr>cc cfg/virtio.scc c=
fg/sound.scc cfg/paravirt_kvm.scc<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 See /tmp/tmp.T7cBZctbo1 for details<br>
| ERROR: Function failed: do_kernel_metadata (log file is located at /OE/bu=
ild/oe-core/tmp-glibc/wo<wbr>rk/qemux86-oe-linux/linux-yoct<wbr>o/4.8.6+git=
AUTOINC+87e5fc8b7c_<wbr>9d5f74f941-r0/temp/log.do_<wbr>kernel_metadata.441)=
<br>
ERROR: Task (/OE/build/oe-core/openembedde<wbr>d-core/meta/recipes-kernel/<=
wbr>linux/linux-yocto_4.8.bb:do_<wbr>kernel_metadata) failed with exit code=
 &#39;1&#39;<br>
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
=C2=A0 =C2=A0 Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ash=
field@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;=
<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundatio<=
wbr>n.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto-rt_4.8.bb</a>=C2=A0 =C2=
=A0|=C2=A0 6 +++---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto-tiny_4.8.bb</a> |=C2=
=A0 6 +++---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=
=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto_4.8.bb</a>=C2=A0 =C2=A0 =
=C2=A0 | 20 ++++++++++----------<br>
=C2=A03 files changed, 16 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8=
.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a> b/=
meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a><br>
index e51c9cd..26b309d 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a><br>
@@ -11,13 +11,13 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipPackage(&quot;Set PREF=
ERRED_PROVIDER_virtual/ker<wbr>nel to linux-yocto-rt to enable it&quot;)<br=
>
=C2=A0}<br>
<br>
-SRCREV_machine ?=3D &quot;4057556c041f6aac0d29aa3425587<wbr>d414c9a0090&qu=
ot;<br>
-SRCREV_meta ?=3D &quot;83110d94edeb856a3667b62903ed4<wbr>ae91c24117d&quot;=
<br>
</blockquote>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+SRCREV_machine ?=3D &quot;b99b6fac437104e206d30540a5cb1<wbr>2103049af1e&qu=
ot;<br>
+SRCREV_meta ?=3D &quot;87e5fc8b7cb387f197cdd098cdde4<wbr>e96e9e8ed0d&quot;=
<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-4.8.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" ta=
rget=3D"_blank">git.yoctoproject.org/li<wbr>nux-yocto-4.8.git;branch=3D${KB=
R<wbr>ANCH};name=3Dmachine</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.8;=
destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_blank">git.yoctopr=
oject.org/yoc<wbr>to-kernel-cache;type=3Dkmeta;nam<wbr>e=3Dmeta;branch=3Dyo=
cto-4.8;destsu<wbr>ffix=3D${KMETA}</a>&quot;<br>
<br>
-LINUX_VERSION ?=3D &quot;4.8.3&quot;<br>
+LINUX_VERSION ?=3D &quot;4.8.6&quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.8.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a=
> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a><br>
index c8ddbd9..63dd11b 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a><br>
@@ -4,13 +4,13 @@ KCONFIG_MODE =3D &quot;--allnoconfig&quot;<br>
<br>
=C2=A0require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
<br>
-LINUX_VERSION ?=3D &quot;4.8.3&quot;<br>
+LINUX_VERSION ?=3D &quot;4.8.6&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
-SRCREV_machine ?=3D &quot;1adf9d36338dc3c63cdbf6f98bcbd<wbr>c7bba42a794&qu=
ot;<br>
-SRCREV_meta ?=3D &quot;83110d94edeb856a3667b62903ed4<wbr>ae91c24117d&quot;=
<br>
+SRCREV_machine ?=3D &quot;9d5f74f941c3ca234f58ff8e539f5<wbr>ca64458c0a7&qu=
ot;<br>
+SRCREV_meta ?=3D &quot;87e5fc8b7cb387f197cdd098cdde4<wbr>e96e9e8ed0d&quot;=
<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb=
" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=3D"noreferrer=
" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a><br>
index 13778b9..0369198 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a><br>
@@ -11,20 +11,20 @@ KBRANCH_qemux86=C2=A0 ?=3D &quot;standard/base&quot;<br=
>
=C2=A0KBRANCH_qemux86-64 ?=3D &quot;standard/base&quot;<br>
=C2=A0KBRANCH_qemumips64 ?=3D &quot;standard/mti-malta64&quot;<br>
<br>
-SRCREV_machine_qemuarm ?=3D &quot;4cc544ad09ad704322cb66fe4ba19<wbr>7a6a05=
dc71f&quot;<br>
-SRCREV_machine_qemuarm64 ?=3D &quot;1adf9d36338dc3c63cdbf6f98bcbd<wbr>c7bb=
a42a794&quot;<br>
-SRCREV_machine_qemumips ?=3D &quot;c285969d4f9376a671167ecf39757<wbr>8c8ad=
3e6a75&quot;<br>
-SRCREV_machine_qemuppc ?=3D &quot;1adf9d36338dc3c63cdbf6f98bcbd<wbr>c7bba4=
2a794&quot;<br>
-SRCREV_machine_qemux86 ?=3D &quot;1adf9d36338dc3c63cdbf6f98bcbd<wbr>c7bba4=
2a794&quot;<br>
-SRCREV_machine_qemux86-64 ?=3D &quot;1adf9d36338dc3c63cdbf6f98bcbd<wbr>c7b=
ba42a794&quot;<br>
-SRCREV_machine_qemumips64 ?=3D &quot;64f96ba530e58456070f26b0f3fcc<wbr>e3f=
64988b72&quot;<br>
-SRCREV_machine ?=3D &quot;1adf9d36338dc3c63cdbf6f98bcbd<wbr>c7bba42a794&qu=
ot;<br>
-SRCREV_meta ?=3D &quot;83110d94edeb856a3667b62903ed4<wbr>ae91c24117d&quot;=
<br>
+SRCREV_machine_qemuarm ?=3D &quot;94d3e8675e2fcb09f29814a33ccf7<wbr>9df061=
49104&quot;<br>
+SRCREV_machine_qemuarm64 ?=3D &quot;9d5f74f941c3ca234f58ff8e539f5<wbr>ca64=
458c0a7&quot;<br>
+SRCREV_machine_qemumips ?=3D &quot;046ff6344eee25dcc0eea1214e0ad<wbr>8771d=
dfabfb&quot;<br>
+SRCREV_machine_qemuppc ?=3D &quot;9d5f74f941c3ca234f58ff8e539f5<wbr>ca6445=
8c0a7&quot;<br>
+SRCREV_machine_qemux86 ?=3D &quot;9d5f74f941c3ca234f58ff8e539f5<wbr>ca6445=
8c0a7&quot;<br>
+SRCREV_machine_qemux86-64 ?=3D &quot;9d5f74f941c3ca234f58ff8e539f5<wbr>ca6=
4458c0a7&quot;<br>
+SRCREV_machine_qemumips64 ?=3D &quot;edcb167f91abc071cc98cbd762418<wbr>ff7=
ab9d839b&quot;<br>
+SRCREV_machine ?=3D &quot;9d5f74f941c3ca234f58ff8e539f5<wbr>ca64458c0a7&qu=
ot;<br>
+SRCREV_meta ?=3D &quot;87e5fc8b7cb387f197cdd098cdde4<wbr>e96e9e8ed0d&quot;=
<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-4.8.git;name=3Dmachine;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" ta=
rget=3D"_blank">git.yoctoproject.org/li<wbr>nux-yocto-4.8.git;name=3Dmachin=
e<wbr>;branch=3D${KBRANCH}</a>; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.8;=
destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_blank">git.yoctopr=
oject.org/yoc<wbr>to-kernel-cache;type=3Dkmeta;nam<wbr>e=3Dmeta;branch=3Dyo=
cto-4.8;destsu<wbr>ffix=3D${KMETA}</a>&quot;<br>
<br>
-LINUX_VERSION ?=3D &quot;4.8.3&quot;<br>
+LINUX_VERSION ?=3D &quot;4.8.6&quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
<br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org" target=3D"_b=
lank">Openembedded-commits@lists.ope<wbr>nembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</blockquote>
<br>
</blockquote>
<br>
</div></div></blockquote></div><br></div>

--001a114b7c38453e170541fc059f--
