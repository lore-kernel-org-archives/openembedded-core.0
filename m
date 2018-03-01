Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 23A1378803
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:57:30 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id q24so7363804ioh.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 06:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TQ11KVKZMkA0eHn9yww6qr137NTMCy5a7o0+w8bGVAY=;
	b=gVp1lUjUnwLs/4/bbrgJamA/jBPziDpW2IjIlvI/lmIpaQ9bIZ7C76P+OTFgshV0/7
	RQRhwzQrkg4BUpEC/alarsfq36SLeiekTmE9Fw+fsUHBunEqi19L7W2uVr9E9JYrdD6c
	ZnrLT7il43I6omhac2nfa08hPvgZC26c8cYo755O+UodUVccfPwR5pOD9OrX1LUzN4OE
	uPUw8QvoCuM8BJ2qw3EHBjfo7Wixgs/eh3NgnVlG2PvWBB4rT1zONoYuC6nLPMivWuUG
	Gsfk+k9u3sWf2RAuO5nHBhGozrEjkq907+1GH4KjaJwRJKOVEiSIcHgQHGIx2D6tOGHN
	AKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TQ11KVKZMkA0eHn9yww6qr137NTMCy5a7o0+w8bGVAY=;
	b=lP/ejdyCaJfWiHgYxdYIpt0PcXJ3P6f/xnzJQqCgfvJHLhIXw33aVVWd+UDPK4+pyV
	mXY92hEhjbPU7jpi7tHavF2aGBxHU/w+yT2dde+7zrjTPsrJCDmILq8jIN+NNZoXfrs2
	o/5oekpuXZZdjJyFUGashzVx4PZyN4cIQkfivP+wLhAqugT1S8RGOIig+HBEROWFpLcd
	fWqg2aotQcVeG5tCvw6nmuufvpPRBw9s9NF0MLR+C6lAiby8UK0zlDvd7h4jABFSyZyg
	zgWcA/e50cWvvboqU5VbbSOrOzRzWu2t5oymcJ0z07fmyhRFLY3nzPzqqCqFElwdE/jl
	25YQ==
X-Gm-Message-State: APf1xPDNsFMcY+QExDNGqhN4hc6wHMqylRwlf9S2sQXH0RTXUWeDdZpN
	i+bSmPq+5THEkbrUbnDU9N41nkCpCMO8vZr3nTKYZQ==
X-Google-Smtp-Source: AG47ELseGe2hxNnliBcLlMbkLXnRUMh4n/nYFsnBjKYkSEOx5kI3cSFdx3jZgMIDJQtXHsLu+kTd3JidFoMT9+rFwj0=
X-Received: by 10.107.6.139 with SMTP id f11mr2356858ioi.23.1519916252422;
	Thu, 01 Mar 2018 06:57:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 1 Mar 2018 06:57:11 -0800 (PST)
In-Reply-To: <d55ef5a0-6bdb-ff5b-7d86-da087326146e@windriver.com>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
	<20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
	<20180301105836.GA14042@mbabyjoh-desk.ger.corp.intel.com>
	<47964139-38be-5fb6-8084-6abad6d19fdd@windriver.com>
	<CAJTo0LaRS9yx+TisD3p5+HsK6mkr5wcFHkjZR9mAJXxgK5+HhA@mail.gmail.com>
	<d55ef5a0-6bdb-ff5b-7d86-da087326146e@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Mar 2018 14:57:11 +0000
Message-ID: <CAJTo0LY=rmCRE0CSoc0+bLkTdBB=8sFJedDGx_tAAdHw8HQ+pQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 01 Mar 2018 14:57:32 -0000
Content-Type: multipart/alternative; boundary="001a113eeaea507cab05665b142d"

--001a113eeaea507cab05665b142d
Content-Type: text/plain; charset="UTF-8"

Ah ok, I misunderstood.

Ross

On 1 March 2018 at 14:45, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> On 2018-03-01 9:22 AM, Burton, Ross wrote:
>
>> Swore I picked the v2 patch for the second run, I've fired a mini test
>> build to see.
>>
>
> The other failures reported were valid and not addressed by v2. So only
> 32 bit ARM would have been fixed (packaging wise), the rest were ok.
>
> I build and deployed kernel-devsrc for ARM multiple times, so if it does
> actually fail again .. I'm *very* interested to hear.
>
> Bruce
>
>
>> Ross
>>
>> On 1 March 2018 at 13:59, Bruce Ashfield <bruce.ashfield@windriver.com
>> <mailto:bruce.ashfield@windriver.com>> wrote:
>>
>>     On 2018-03-01 5:58 AM, Maxin B. John wrote:
>>
>>
>>             Also fails on musl:
>>
>>             ERROR: Nothing RPROVIDES 'glibc-utils' (but
>>             /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/
>> build/meta/recipes-kernel/linux/kernel-devsrc.bb
>>             <http://kernel-devsrc.bb> RDEPENDS on or otherwise requires
>> it)
>>
>>             Ross
>>
>>             On 1 March 2018 at 08:28, Maxin B. John
>>             <maxin.john@intel.com <mailto:maxin.john@intel.com>> wrote:
>>
>>
>>            >On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield
>> wrote:
>>            >> The existing kernel-devsrc package starts with a full copy
>>         of the kernel
>>            >> source and then starts to strip out elements that are not
>>         required.
>>            >>
>>            >> This results in extra time (I/O) and extra space being
>>         taken up in the
>>            >> final package. The main purpose of the kernel-devsrc
>>         package has been to
>>            >> build modules against the running kernel, not to include a
>>         full copy of
>>            >> the source code for re-building the kernel. The end result
>>         was a
>>            >> 600M kernel-devsrc package.
>>
>>            Other failures are listed below:
>>              arm64:
>>         https://autobuilder.yocto.io/builders/nightly-arm64/builds/7
>> 90/steps/Running%20Sanity%20Tests/logs/stdio
>>         <https://autobuilder.yocto.io/builders/nightly-arm64/builds/
>> 790/steps/Running%20Sanity%20Tests/logs/stdio>
>>
>>            RESULTS - kernelmodule.KernelModuleTest.test_kernel_module -
>>         Testcase 1541: FAILED
>>
>>         HOSTCC  scripts/sortextable
>>            scripts/sortextable.c:31:10: fatal error:
>>         tools/be_byteshift.h: No such file or directory
>>         #include <tools/be_byteshift.h>
>>             ^~~~~~~~~~~~~~~~~~~~~~
>>         compilation terminated.
>>         make[1]: *** [scripts/Makefile.host:102: scripts/sortextable]
>>         Error 1
>>         make: *** [Makefile:557: scripts] Error 2
>>         ------------------------------------------------------------
>> ----------
>>
>>         Similar on qemuarm - poky-lsb :
>>
>>         https://autobuilder.yocto.io/builders/nightly-arm-lsb/builds
>> /812/steps/Running%20Sanity%20Tests/logs/stdio
>>         <https://autobuilder.yocto.io/builders/nightly-arm-lsb/build
>> s/812/steps/Running%20Sanity%20Tests/logs/stdio>
>>
>>         HOSTCC  scripts/recordmcount
>>         HOSTCC  scripts/sortextable
>>         scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h:
>>         No such file or directory
>>               #include <tools/be_byteshift.h>
>>                         ^~~~~~~~~~~~~~~~~~~~~~
>>                         compilation terminated.
>>                         make[1]: *** [scripts/Makefile.host:102:
>>         scripts/sortextable] Error 1
>>                         make: *** [Makefile:557: scripts] Error 2
>>         ------------------------------------------------------------
>> -------------
>>
>>         Also on PowerPC:
>>
>>         https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds
>> /814/steps/Running%20Sanity%20Tests/logs/stdio
>>         <https://autobuilder.yocto.io/builders/nightly-ppc-lsb/build
>> s/814/steps/Running%20Sanity%20Tests/logs/stdio>
>>
>>         scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h:
>>         No such file or directory
>>            #include <tools/be_byteshift.h>
>>                      ^~~~~~~~~~~~~~~~~~~~~~
>>         compilation terminated.
>>         make[1]: *** [scripts/Makefile.host:102: scripts/sortextable]
>>         Error 1
>>         make: *** [Makefile:557: scripts] Error 2
>>
>>
>>     I have all these fixed now.
>>
>>     Will have a look at musl next.
>>
>>     Cheers,
>>
>>     Bruce
>>
>>
>>         Best Regards,
>>         Maxin
>>
>>
>>
>>
>

--001a113eeaea507cab05665b142d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah ok, I misunderstood.<div><br></div><div>Ross</div></div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 1 March 2018 =
at 14:45, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashf=
ield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 2018-03=
-01 9:22 AM, Burton, Ross wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Swore I picked the v2 patch for the second run, I&#39;ve fired a mini test =
build to see.<br>
</blockquote>
<br></span>
The other failures reported were valid and not addressed by v2. So only<br>
32 bit ARM would have been fixed (packaging wise), the rest were ok.<br>
<br>
I build and deployed kernel-devsrc for ARM multiple times, so if it does<br=
>
actually fail again .. I&#39;m *very* interested to hear.<br>
<br>
Bruce<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Ross<span class=3D""><br>
<br>
On 1 March 2018 at 13:59, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfie=
ld@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a> &lt;ma=
ilto:<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruc=
e.ashfield@windriv<wbr>er.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 On 2018-03-01 5:58 AM, Maxin B. John wrote:<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Also fails on musl:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR: Nothing RPROVIDES &#39;gli=
bc-utils&#39; (but<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/pokybuild/yocto-autobuil<wb=
r>der/yocto-worker/nightly-musl/<wbr>build/meta/recipes-kernel/<wbr>linux/<=
a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">ker=
nel-devsrc.bb</a><br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://kernel-devs=
rc.bb" rel=3D"noreferrer" target=3D"_blank">http://kernel-devsrc.bb</a>&gt;=
 RDEPENDS on or otherwise requires it)<span class=3D""><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ross<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 On 1 March 2018 at 08:28, Maxin B=
. John<br></span><div><div class=3D"h5">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:maxin.john@=
intel.com" target=3D"_blank">maxin.john@intel.com</a> &lt;mailto:<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;&gt; wrote:<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 &gt;On Wed, Feb 28, 2018 at 02:20:=
45PM -0500, Bruce Ashfield wrote:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 &gt;&gt; The existing kernel-devsr=
c package starts with a full copy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the kernel<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 &gt;&gt; source and then starts to=
 strip out elements that are not<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 required.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 &gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 &gt;&gt; This results in extra tim=
e (I/O) and extra space being<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 taken up in the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 &gt;&gt; final package. The main p=
urpose of the kernel-devsrc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 package has been to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 &gt;&gt; build modules against the=
 running kernel, not to include a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 full copy of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 &gt;&gt; the source code for re-bu=
ilding the kernel. The end result<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 was a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 &gt;&gt; 600M kernel-devsrc packag=
e.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 Other failures are listed below:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 arm64:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://autobuilder.yocto.io/builder=
s/nightly-arm64/builds/790/steps/Running%20Sanity%20Tests/logs/stdio" rel=
=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.io/b<wbr>uilder=
s/nightly-arm64/builds/7<wbr>90/steps/Running%20Sanity%20Te<wbr>sts/logs/st=
dio</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://autobuilder.yocto.io/bui=
lders/nightly-arm64/builds/790/steps/Running%20Sanity%20Tests/logs/stdio" r=
el=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.io/<wbr>build=
ers/nightly-arm64/builds/<wbr>790/steps/Running%20Sanity%20T<wbr>ests/logs/=
stdio</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 RESULTS - kernelmodule.KernelModul=
eTest.<wbr>test_kernel_module -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Testcase 1541: FAILED<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HOSTCC=C2=A0 scripts/sortextable<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 scripts/sortextable.c:31:10: fatal=
 error:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tools/be_byteshift.h: No such file or directory=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &lt;tools/be_byteshift.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compilation terminated.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make[1]: *** [scripts/Makefile.host:102: script=
s/sortextable]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make: *** [Makefile:557: scripts] Error 2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------------=
------------------<wbr>----------<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Similar on qemuarm - poky-lsb :<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://autobuilder.yocto.io/builder=
s/nightly-arm-lsb/builds/812/steps/Running%20Sanity%20Tests/logs/stdio" rel=
=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.io/b<wbr>uilder=
s/nightly-arm-lsb/builds<wbr>/812/steps/Running%20Sanity%<wbr>20Tests/logs/=
stdio</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://autobuilder.yocto.io/bui=
lders/nightly-arm-lsb/builds/812/steps/Running%20Sanity%20Tests/logs/stdio"=
 rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.io/<wbr>bui=
lders/nightly-arm-lsb/build<wbr>s/812/steps/Running%20Sanity%<wbr>20Tests/l=
ogs/stdio</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HOSTCC=C2=A0 scripts/recordmcount<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HOSTCC=C2=A0 scripts/sortextable<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/sortextable.c:31:10: fatal error: tools=
/be_byteshift.h:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 No such file or directory<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0#include &lt;tools/be=
_byteshift.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0compilation terminated.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0make[1]: *** [scripts/Makefile.host:102:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/sortextable] Error 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0make: *** [Makefile:557: scripts] Error 2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------------=
------------------<wbr>-------------<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Also on PowerPC:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://autobuilder.yocto.io/builder=
s/nightly-ppc-lsb/builds/814/steps/Running%20Sanity%20Tests/logs/stdio" rel=
=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.io/b<wbr>uilder=
s/nightly-ppc-lsb/builds<wbr>/814/steps/Running%20Sanity%<wbr>20Tests/logs/=
stdio</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://autobuilder.yocto.io/bui=
lders/nightly-ppc-lsb/builds/814/steps/Running%20Sanity%20Tests/logs/stdio"=
 rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.io/<wbr>bui=
lders/nightly-ppc-lsb/build<wbr>s/814/steps/Running%20Sanity%<wbr>20Tests/l=
ogs/stdio</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/sortextable.c:31:10: fatal error: tools=
/be_byteshift.h:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 No such file or directory<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 #include &lt;tools/be_byteshift.h&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ^~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compilation terminated.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make[1]: *** [scripts/Makefile.host:102: script=
s/sortextable]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make: *** [Makefile:557: scripts] Error 2<br>
<br>
<br>
=C2=A0 =C2=A0 I have all these fixed now.<br>
<br>
=C2=A0 =C2=A0 Will have a look at musl next.<br>
<br>
=C2=A0 =C2=A0 Cheers,<br>
<br>
=C2=A0 =C2=A0 Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Best Regards,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Maxin<br>
<br>
<br>
<br>
</div></div></blockquote>
<br>
</blockquote></div><br></div>

--001a113eeaea507cab05665b142d--
