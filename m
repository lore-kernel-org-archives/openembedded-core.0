Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7575078872
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:22:48 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id w19so18083592ite.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 06:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZV68yURvEqVco2j7IKbmz5BFQJs6NuWtU7zfO4aMlGk=;
	b=B6LJScMcqy10tcrA7d52cIjlSE+Brj97drGixydk+G7n7nKEVaii3xv8+91qEDXzv3
	Fju0+eeQJkE6ujRLr6+TJjKa3xqd29UrWTl8DilV/47gNpXK7rRSRpBfY18wfSAdY5Dc
	Wb/BBAi/kO7xH5LVKyLmU7RiQxUzladFpEGvKTULmtngCZ/KmJb/13mUgelMLmlGtZLa
	PahMZx02oukNqZEQeQd8h58+hgfIoRgSUJA546fCPvn+YXp0wGyjoxXybFH5TzrBkHgc
	weJ23z7pCcOoeo8pMP4mB60qNP6EdMSokJ54QQmtmuwXY0c2bm6c29S17BV2S9FSIHeW
	xoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZV68yURvEqVco2j7IKbmz5BFQJs6NuWtU7zfO4aMlGk=;
	b=WLO4p8+YWqrWb22kcXUD2+aZjyWEW/zKv4APYJ3B3iVcJ09Cgi+YJEXj6y8MuztU/0
	vVvdtbYO0UTt0NkmDflb7gK4+Zqnec/qkl3yv3isL7Jg0GZHZfgozHJw4Sqo0Nd3ie/R
	zLxBkGzZIeixCkfXUIsXxsSXu0k08aB3/wVtsiaItZ0j8TEq21OqifxVbQfduU5chhGB
	wmrqdKTbqLqeUGCtD2Kdw4udBnFLAmDNOyjBWM1kOJH7/8ukUCkvxRiXjbF5/ihbS+AS
	TUSQPbjuNqTJfSOR2/CbYU8GrUhy3byZmLW+Mjt2aQ3vqlnY2B0jWWipsgEM0H+Ak01A
	+5eA==
X-Gm-Message-State: APf1xPCrAb1NlNeRxDK2IPJZlvkqkr8zLjcoBK0MC9/xBA/hER0a5TTn
	Bw9jeZ1XeZHyp+VVSAKUThVfD4F9pIbY0qMCrEiLng==
X-Google-Smtp-Source: AG47ELuOs++i4HJlQ1wOeb0znyoaMHLiTLeCzIvdK20B7nzuZ6uwRQbg0EphWY843rE+oPFNo1aT8aYX+29KQ3HDwyY=
X-Received: by 10.36.36.144 with SMTP id f138mr2513479ita.131.1519914169590;
	Thu, 01 Mar 2018 06:22:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 1 Mar 2018 06:22:28 -0800 (PST)
In-Reply-To: <47964139-38be-5fb6-8084-6abad6d19fdd@windriver.com>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
	<20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
	<20180301105836.GA14042@mbabyjoh-desk.ger.corp.intel.com>
	<47964139-38be-5fb6-8084-6abad6d19fdd@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Mar 2018 14:22:28 +0000
Message-ID: <CAJTo0LaRS9yx+TisD3p5+HsK6mkr5wcFHkjZR9mAJXxgK5+HhA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 01 Mar 2018 14:22:48 -0000
Content-Type: multipart/alternative; boundary="001a1147cd302b1c7d05665a98c6"

--001a1147cd302b1c7d05665a98c6
Content-Type: text/plain; charset="UTF-8"

Swore I picked the v2 patch for the second run, I've fired a mini test
build to see.

Ross

On 1 March 2018 at 13:59, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> On 2018-03-01 5:58 AM, Maxin B. John wrote:
>
>>
>> Also fails on musl:
>>>
>>> ERROR: Nothing RPROVIDES 'glibc-utils' (but
>>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/
>>> build/meta/recipes-kernel/linux/kernel-devsrc.bb RDEPENDS on or
>>> otherwise requires it)
>>>
>>> Ross
>>>
>>> On 1 March 2018 at 08:28, Maxin B. John <maxin.john@intel.com> wrote:
>>>
>>
>>   >On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrote:
>>   >> The existing kernel-devsrc package starts with a full copy of the
>> kernel
>>   >> source and then starts to strip out elements that are not required.
>>   >>
>>   >> This results in extra time (I/O) and extra space being taken up in
>> the
>>   >> final package. The main purpose of the kernel-devsrc package has
>> been to
>>   >> build modules against the running kernel, not to include a full copy
>> of
>>   >> the source code for re-building the kernel. The end result was a
>>   >> 600M kernel-devsrc package.
>>
>>   Other failures are listed below:
>>     arm64:
>>   https://autobuilder.yocto.io/builders/nightly-arm64/builds/7
>> 90/steps/Running%20Sanity%20Tests/logs/stdio
>>
>>   RESULTS - kernelmodule.KernelModuleTest.test_kernel_module - Testcase
>> 1541: FAILED
>>
>> HOSTCC  scripts/sortextable
>>   scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such
>> file or directory
>> #include <tools/be_byteshift.h>
>>    ^~~~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
>> make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1
>> make: *** [Makefile:557: scripts] Error 2
>> ----------------------------------------------------------------------
>>
>> Similar on qemuarm - poky-lsb :
>>
>> https://autobuilder.yocto.io/builders/nightly-arm-lsb/builds
>> /812/steps/Running%20Sanity%20Tests/logs/stdio
>>
>> HOSTCC  scripts/recordmcount
>> HOSTCC  scripts/sortextable
>> scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such
>> file or directory
>>      #include <tools/be_byteshift.h>
>>                ^~~~~~~~~~~~~~~~~~~~~~
>>                compilation terminated.
>>                make[1]: *** [scripts/Makefile.host:102:
>> scripts/sortextable] Error 1
>>                make: *** [Makefile:557: scripts] Error 2
>> -------------------------------------------------------------------------
>>
>> Also on PowerPC:
>>
>> https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds
>> /814/steps/Running%20Sanity%20Tests/logs/stdio
>>
>> scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such
>> file or directory
>>   #include <tools/be_byteshift.h>
>>             ^~~~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
>> make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1
>> make: *** [Makefile:557: scripts] Error 2
>>
>
> I have all these fixed now.
>
> Will have a look at musl next.
>
> Cheers,
>
> Bruce
>
>
>> Best Regards,
>> Maxin
>>
>>
>

--001a1147cd302b1c7d05665a98c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Swore I picked the v2 patch for the second run, I&#39;ve f=
ired a mini test build to see.<div><br></div><div>Ross</div></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On 1 March 2018 at 13:59, =
Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windr=
iver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h=
5">On 2018-03-01 5:58 AM, Maxin B. John wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Also fails on musl:<br>
<br>
ERROR: Nothing RPROVIDES &#39;glibc-utils&#39; (but /home/pokybuild/yocto-a=
utobuil<wbr>der/yocto-worker/nightly-musl/<wbr>build/meta/recipes-kernel/<w=
br>linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D"_=
blank">kernel-devsrc.bb</a> RDEPENDS on or otherwise requires it)<br>
<br>
Ross<br>
<br>
On 1 March 2018 at 08:28, Maxin B. John &lt;<a href=3D"mailto:maxin.john@in=
tel.com" target=3D"_blank">maxin.john@intel.com</a>&gt; wrote:<br>
</blockquote>
<br>
=C2=A0 &gt;On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrote:<=
br>
=C2=A0 &gt;&gt; The existing kernel-devsrc package starts with a full copy =
of the kernel<br>
=C2=A0 &gt;&gt; source and then starts to strip out elements that are not r=
equired.<br>
=C2=A0 &gt;&gt;<br>
=C2=A0 &gt;&gt; This results in extra time (I/O) and extra space being take=
n up in the<br>
=C2=A0 &gt;&gt; final package. The main purpose of the kernel-devsrc packag=
e has been to<br>
=C2=A0 &gt;&gt; build modules against the running kernel, not to include a =
full copy of<br>
=C2=A0 &gt;&gt; the source code for re-building the kernel. The end result =
was a<br>
=C2=A0 &gt;&gt; 600M kernel-devsrc package.<br>
<br>
=C2=A0 Other failures are listed below:<br>
=C2=A0 =C2=A0 arm64:<br>
=C2=A0 <a href=3D"https://autobuilder.yocto.io/builders/nightly-arm64/build=
s/790/steps/Running%20Sanity%20Tests/logs/stdio" rel=3D"noreferrer" target=
=3D"_blank">https://autobuilder.yocto.io/b<wbr>uilders/nightly-arm64/builds=
/7<wbr>90/steps/Running%20Sanity%20Te<wbr>sts/logs/stdio</a><br>
<br>
=C2=A0 RESULTS - kernelmodule.KernelModuleTest.<wbr>test_kernel_module - Te=
stcase 1541: FAILED<br>
<br>
HOSTCC=C2=A0 scripts/sortextable<br>
=C2=A0 scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No s=
uch file or directory<br>
#include &lt;tools/be_byteshift.h&gt;<br>
=C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~<br>
compilation terminated.<br>
make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1<br>
make: *** [Makefile:557: scripts] Error 2<br>
------------------------------<wbr>------------------------------<wbr>-----=
-----<br>
<br>
Similar on qemuarm - poky-lsb :<br>
<br>
<a href=3D"https://autobuilder.yocto.io/builders/nightly-arm-lsb/builds/812=
/steps/Running%20Sanity%20Tests/logs/stdio" rel=3D"noreferrer" target=3D"_b=
lank">https://autobuilder.yocto.io/b<wbr>uilders/nightly-arm-lsb/builds<wbr=
>/812/steps/Running%20Sanity%<wbr>20Tests/logs/stdio</a><br>
<br>
HOSTCC=C2=A0 scripts/recordmcount<br>
HOSTCC=C2=A0 scripts/sortextable<br>
scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such fil=
e or directory<br>
=C2=A0 =C2=A0 =C2=A0#include &lt;tools/be_byteshift.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~=
~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compilation terminat=
ed.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make[1]: *** [script=
s/Makefile.host:102: scripts/sortextable] Error 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make: *** [Makefile:=
557: scripts] Error 2<br>
------------------------------<wbr>------------------------------<wbr>-----=
--------<br>
<br>
Also on PowerPC:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/814=
/steps/Running%20Sanity%20Tests/logs/stdio" rel=3D"noreferrer" target=3D"_b=
lank">https://autobuilder.yocto.io/b<wbr>uilders/nightly-ppc-lsb/builds<wbr=
>/814/steps/Running%20Sanity%<wbr>20Tests/logs/stdio</a><br>
<br>
scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such fil=
e or directory<br>
=C2=A0 #include &lt;tools/be_byteshift.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~<br>
compilation terminated.<br>
make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1<br>
make: *** [Makefile:557: scripts] Error 2<br>
</blockquote>
<br></div></div>
I have all these fixed now.<br>
<br>
Will have a look at musl next.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Best Regards,<br>
Maxin<br>
<br>
</blockquote>
<br>
</blockquote></div><br></div>

--001a1147cd302b1c7d05665a98c6--
