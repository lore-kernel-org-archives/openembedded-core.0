Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF1D731D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 17:50:30 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id mw1so17033818igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 09:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/QI2ewz6RtuoDuk2f7udweuwVPxqaKufrdMdNIIumgA=;
	b=HDmvCo8PaUqc+Gl1T0WN9hoAFgDdvXqq7u70+/bqehl+MbjtWFkxAO31Qf6Qj+C9fE
	8szqSjKlpr5/RFgHSHfpvHYVRBj1lCmmWvtVybweEEVeKEJYQGrQ2+gDIgJYYs5hUfUk
	Gd91KfjnU2rFy4gOOvzaW/v9ffc8BoEulLL5LDMxjftXc8iJrwUDdcntnCM44cqmAUho
	suRZI2zlXpKisENrjGN8R8W9TyxuSiYlI3yfrPNPl0dlFAB4lgtOSqnyuIeEV3iKgu5D
	t+bAR1k3dYUDFKyqIyh1GX7YBjn7ILvL+KvJM1FKW1ooVWpUVlZJjjAwawLRM9lKkMv3
	SRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/QI2ewz6RtuoDuk2f7udweuwVPxqaKufrdMdNIIumgA=;
	b=VDJyyTHbZsSj48DXpU4UAPtuPSkwGVju3/h1sRBUecr070R5+lu5K+6cyaRaVLqu2z
	A5hwVg3gUEi/6ZAhNxeilcIg7AP/yIKRC4uOU48eZMw3hrnMrbQbTCptI5xEAclAUVA7
	xSn0CLhwixUKk1S7MQawEM9CYs1dJ+6ZolAVQEvdbm2uYIr2zOoseK/7eUnytQl+Kt4b
	ROEkG24Lq+qXTL0xtA3Hqsb41owaQkGZx44/iA7jExkxsOpJB4i6xTftIDMHnAAJrnCX
	DBFaK1Y70vI/dwX0S+/Ie0yU+B5eKB3mO6PYg0hnlRslmYZWG8vn8/qGNxAI2YDvXRAz
	lodw==
X-Gm-Message-State: ALoCoQmUntkeTv0SRvnQ2wLimlpu912EwDP7ashQLk2jPbRcRHSZH9iM7d7Umb9+++PuXapdA0tqCPKSFcpdbAl4ACLR/qHUD5ISKCLLT7XPdQosttR7GRE=
X-Received: by 10.50.126.8 with SMTP id mu8mr4720896igb.52.1452016231465; Tue,
	05 Jan 2016 09:50:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 5 Jan 2016 09:50:11 -0800 (PST)
In-Reply-To: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jan 2016 17:50:11 +0000
Message-ID: <CAJTo0LZKb6T8xPMJfeVc=0AkFkr2ZV91f5AydZrqMqeym9XRDQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: update to 3.11.0
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
X-List-Received-Date: Tue, 05 Jan 2016 17:50:31 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bfaf5e72052899dfc5

--047d7b1635bfaf5e72052899dfc5
Content-Type: text/plain; charset=UTF-8

On 15 December 2015 at 15:02, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> LICENSE checksums are changed due to a change in FSF address, or copyright
> years update.
>
> Rebased patches:
> sepbuildfix.patch rebased to 0004-Fix-out-of-tree-builds.patch
> add-ptest.patch rebased to
> 0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
>
> Removed patches:
> force-nostabs.patch removed because it's patching lines that have been
> removed upstream
> remove-ppc-tests-failing-build.patch removed because it no longer applies,
> and rebasing it
> requires building with special ppc32 machine configurations; qemuppc build
> is fine without it.
> enable.building.on.4.x.kernel.patch removed because the problem is fixed
> upstream
> glibc.patch removed for the same reason
>
> Removed backports:
> pass-maltivec-only-if-it-supported.patch
> 0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch
>

This fails to build on real PPC hardware such as p1022ds or mpc8315e-rdb:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=862d702fbb99e484631315aa44b9e46f8fc567da&filter=valgrind&type=recipe

There are two different failures:

In file included from
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/ppce300c3-poky-linux/valgrind/3.11.0-r0/valgrind-3.11.0/none/tests/ppc32/testVMX.c:252:0:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/powerpc-poky-linux/gcc/powerpc-poky-linux/5.3.0/include/altivec.h:34:2:
error: #error Use the "-maltivec" flag to enable PowerPC AltiVec support
 #error Use the "-maltivec" flag to enable PowerPC AltiVec support
  ^
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/ppce300c3-poky-linux/valgrind/3.11.0-r0/valgrind-3.11.0/none/tests/ppc32/testVMX.c:281:4:
error: expected specifier-qualifier-list before '__vector'
    vector signed char    v;

And:

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/valgrind/3.11.0-r0/valgrind-3.11.0/memcheck/tests/ppc32/power_ISA2_05.c:56:4:
error: impossible constraint in 'asm'
    __asm__ volatile ("lfiwax %0, 0, %1":"=f" (FRT1):"r"(base));
    ^
Makefile:661: recipe for target 'power_ISA2_05-power_ISA2_05.o' failed

Any ideas?  Of interest is that it's always the ptest compilation that
breaks.

Ross

--047d7b1635bfaf5e72052899dfc5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 December 2015 at 15:02, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":kq" class=3D"" style=3D"overflow:hidden">LICENSE checksums are changed=
 due to a change in FSF address, or copyright<br>
years update.<br>
<br>
Rebased patches:<br>
sepbuildfix.patch rebased to 0004-Fix-out-of-tree-builds.patch<br>
add-ptest.patch rebased to 0005-Modify-vg_test-wrapper-to-support-PTEST-for=
mats.patch<br>
<br>
Removed patches:<br>
force-nostabs.patch removed because it&#39;s patching lines that have been =
removed upstream<br>
remove-ppc-tests-failing-build.patch removed because it no longer applies, =
and rebasing it<br>
requires building with special ppc32 machine configurations; qemuppc build =
is fine without it.<br>
enable.building.on.4.x.kernel.patch removed because the problem is fixed up=
stream<br>
glibc.patch removed for the same reason<br>
<br>
Removed backports:<br>
pass-maltivec-only-if-it-supported.patch<br>
0001-<span class=3D"">valgrind</span>-Enable-rt_sigpending-syscall-on-ppc64=
-linux.patch</div></blockquote></div><div class=3D"gmail_extra"><br></div>T=
his fails to build on real PPC hardware such as p1022ds or mpc8315e-rdb:<br=
><br></div><div class=3D"gmail_extra"><a href=3D"http://errors.yoctoproject=
.org/Errors/Search/?items=3D10&amp;query=3D862d702fbb99e484631315aa44b9e46f=
8fc567da&amp;filter=3Dvalgrind&amp;type=3Drecipe">http://errors.yoctoprojec=
t.org/Errors/Search/?items=3D10&amp;query=3D862d702fbb99e484631315aa44b9e46=
f8fc567da&amp;filter=3Dvalgrind&amp;type=3Drecipe</a><br></div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">There are two differe=
nt failures:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">In file included from /home/pokybuild/yocto-autobuilder/yocto-worker=
/nightly-ppc-lsb/build/build/tmp/work/ppce300c3-poky-linux/valgrind/3.11.0-=
r0/valgrind-3.11.0/none/tests/ppc32/testVMX.c:252:0:<br>/home/pokybuild/yoc=
to-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/sysroots/x86_64=
-linux/usr/lib/powerpc-poky-linux/gcc/powerpc-poky-linux/5.3.0/include/alti=
vec.h:34:2: error: #error Use the &quot;-maltivec&quot; flag to enable Powe=
rPC AltiVec support<br>=C2=A0#error Use the &quot;-maltivec&quot; flag to e=
nable PowerPC AltiVec support<br>=C2=A0 ^<br>/home/pokybuild/yocto-autobuil=
der/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/ppce300c3-poky-linux/=
valgrind/3.11.0-r0/valgrind-3.11.0/none/tests/ppc32/testVMX.c:281:4: error:=
 expected specifier-qualifier-list before &#39;__vector&#39;<br>=C2=A0 =C2=
=A0 vector signed char =C2=A0 =C2=A0v;<br><br>And:</div><div class=3D"gmail=
_extra"><br>/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-=
lsb/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/valgrind/3.11.0-r0/val=
grind-3.11.0/memcheck/tests/ppc32/power_ISA2_05.c:56:4: error: impossible c=
onstraint in &#39;asm&#39;<br>=C2=A0 =C2=A0 __asm__ volatile (&quot;lfiwax =
%0, 0, %1&quot;:&quot;=3Df&quot; (FRT1):&quot;r&quot;(base));<br>=C2=A0 =C2=
=A0 ^<br>Makefile:661: recipe for target &#39;power_ISA2_05-power_ISA2_05.o=
&#39; failed</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Any ideas?=C2=A0 Of interest is that it&#39;s always the ptest compi=
lation that breaks.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--047d7b1635bfaf5e72052899dfc5--
