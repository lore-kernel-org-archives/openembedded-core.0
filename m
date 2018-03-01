Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id A0CA977EA8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 09:33:06 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id u5so7113531itc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 01:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hXqmc/vXQDyWRLoChLo1PsC8BOumi7WIcMzOVO6/Cmc=;
	b=aYdUHGvF5yeJg0+ucc+OwQwstfK1uF7GTZ/t41ZFJlNniXx3GE/HiHUbjQ4/VSG1yq
	MlwKxjp18z4WigVDCqrDLG+Ri/JdjwX2cCnuDsOJJNVUyIlijy2L8HfFHleOlhKlfh6i
	xNCOUbf6QJUKizgSoUwoJbv71TW20p7p9Ko5Ns9N2SAutxOinhBRuivEb7f51EXcOobS
	iHPt6EWA25ciW5JOgRm+/oJDH5CT9pQ8cQydDDfDN7OE/XGOLDlsoCB0iLAgyGxzgYWV
	Ms++F8mVtnOtkBPqNeqOvD/U3T9orpjFDoQOAyiPVMf8LAzivgeJ5QHYbVCrp43Fp+ba
	SXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hXqmc/vXQDyWRLoChLo1PsC8BOumi7WIcMzOVO6/Cmc=;
	b=qk6p1I6qAumzo2o3bIhAueH5brvJ/Q32JRaBZFWupk51qnkm+DoITsqRxA5TVxmdyU
	kLzy2vdZzW2XY8Ss207PyqxmgnIg/v+PrYTllBX3PlHaoRW5ZqDeBNLzmNK1X9zB38E1
	FaAC8nEnQAlQEfE+RS59IUdfoucJwdzeFgqWv07XA+UQ9EaUMKHGoJgfZWLKow9Al96b
	pXBu5CLKcQB2610XhkkBo1VD27P00gqdvsSyOpbmjJKAy5ygLuBuolSjvGjCkZZQ525c
	OmCwqfFdJTUVXVie+d+AzxY7xT7mOPDq7tlYB2eknORRXt8KLfPElI9GqqsnXBiLrM9w
	dHuw==
X-Gm-Message-State: APf1xPBdrIieHst/KO5LsNKfj5LVTbIdwshxfxSWqdicrOPNu5cU3O5i
	7YQTn0Wp8UxZgWl4tZlLnsvNOhEpbwOT6xPtwDbSZQ==
X-Google-Smtp-Source: AG47ELv487+IOcbmL/G3G2BpVoAkqVzDVqtfbORHX20HDE3CKFLbzmKSItsV75mDTqv1+OqokdZrSzV84es/x0reXdY=
X-Received: by 10.36.34.11 with SMTP id o11mr1932039ito.60.1519896788113; Thu,
	01 Mar 2018 01:33:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 1 Mar 2018 01:32:47 -0800 (PST)
In-Reply-To: <20180301085354.GA16642@mbabyjoh-desk.ger.corp.intel.com>
References: <cover.1519783331.git.bruce.ashfield@windriver.com>
	<800a060ed6aa52970d0672be3b63acf046abf522.1519783331.git.bruce.ashfield@windriver.com>
	<20180301085354.GA16642@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Mar 2018 09:32:47 +0000
Message-ID: <CAJTo0LZJexf7ZPdv+HYYhsT5KPD6NsXg8put0gPKRC3YO0OVYQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto/4.14/4.15: yaffs2 fixes
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
X-List-Received-Date: Thu, 01 Mar 2018 09:33:07 -0000
Content-Type: multipart/alternative; boundary="001a113f77ba26b2a70566568c16"

--001a113f77ba26b2a70566568c16
Content-Type: text/plain; charset="UTF-8"

This is most likely to be the kernel-devsrc change.  There's a number of
failures across the autobuilder, I've just asked Maxin to collate the
failures. :)

On 1 March 2018 at 08:53, Maxin B. John <maxin.john@intel.com> wrote:

> Hi Bruce,
>
> On Tue, Feb 27, 2018 at 09:06:54PM -0500, Bruce Ashfield wrote:
> > Integrating the following fixes for yaffs2:
> >
> >   9f9649fffac9 yaffs2: Adjust the timer callback and init functions
> >   0ef24a829eee yaffs2: include rawnand.h instead of nand.h
> >
> > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  4 ++--
> >  meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  4 ++--
> >  meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  4 ++--
> >  meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  4 ++--
> >  meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 18
> +++++++++---------
> >  meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 18
> +++++++++---------
> >  6 files changed, 26 insertions(+), 26 deletions(-)
> <snip>
>
> For MIPS, KernelModuleTest fails in autobuilder ( probably due to this
> change - haven't bisected it)
>
> https://autobuilder.yocto.io/builders/nightly-mips/builds/
> 806/steps/Running%20Sanity%20Tests/logs/stdio
>
> RESULTS - kernelmodule.KernelModuleTest.test_kernel_module - Testcase
> 1541: FAILED
>
> NOTE: ============================================================
> ==========
> | NOTE: FAIL: test_kernel_module (kernelmodule.KernelModuleTest)
> | NOTE: ------------------------------------------------------------
> ----------
> | NOTE: Traceback (most recent call last):
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-mips/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in
> wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-mips/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in
> wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-mips/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in
> wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-mips/build/meta/lib/oeqa/runtime/cases/kernelmodule.py", line 40,
> in test_kernel_module
> |     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
> | AssertionError: 2 != 0 : cd /usr/src/kernel && make scripts
> | arch/mips/Makefile:240: arch/mips/Kbuild.platforms: No such file or
> directory
> | make: *** No rule to make target 'arch/mips/Kbuild.platforms'.  Stop.
>
> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113f77ba26b2a70566568c16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is most likely to be the kernel-devsrc change.=C2=A0 =
There&#39;s a number of failures across the autobuilder, I&#39;ve just aske=
d Maxin to collate the failures. :)</div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On 1 March 2018 at 08:53, Maxin B. John <span dir=
=3D"ltr">&lt;<a href=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxi=
n.john@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi=
 Bruce,<br>
<span class=3D""><br>
On Tue, Feb 27, 2018 at 09:06:54PM -0500, Bruce Ashfield wrote:<br>
&gt; Integrating the following fixes for yaffs2:<br>
&gt;<br>
&gt;=C2=A0 =C2=A09f9649fffac9 yaffs2: Adjust the timer callback and init fu=
nctions<br>
&gt;=C2=A0 =C2=A00ef24a829eee yaffs2: include rawnand.h instead of nand.h<b=
r>
&gt;<br>
&gt; Signed-off-by: Kevin Hao &lt;<a href=3D"mailto:kexin.hao@windriver.com=
">kexin.hao@windriver.com</a>&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@win=
driver.com">bruce.ashfield@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.14.=
bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.14.bb</a>=C2=
=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.15.=
bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.15.bb</a>=C2=
=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.1=
4.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-tiny_4.14.bb</a=
> |=C2=A0 4 ++--<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.1=
5.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-tiny_4.15.bb</a=
> |=C2=A0 4 ++--<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.14.bb</a>=C2=A0 =
=C2=A0 =C2=A0 | 18 +++++++++---------<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.15.bb</a>=C2=A0 =
=C2=A0 =C2=A0 | 18 +++++++++---------<br>
&gt;=C2=A0 6 files changed, 26 insertions(+), 26 deletions(-)<br>
</span>&lt;snip&gt;<br>
<br>
For MIPS, KernelModuleTest fails in autobuilder ( probably due to this chan=
ge - haven&#39;t bisected it)<br>
<br>
<a href=3D"https://autobuilder.yocto.io/builders/nightly-mips/builds/806/st=
eps/Running%20Sanity%20Tests/logs/stdio" rel=3D"noreferrer" target=3D"_blan=
k">https://autobuilder.yocto.io/<wbr>builders/nightly-mips/builds/<wbr>806/=
steps/Running%20Sanity%<wbr>20Tests/logs/stdio</a><br>
<br>
RESULTS - kernelmodule.KernelModuleTest.<wbr>test_kernel_module - Testcase =
1541: FAILED<br>
<br>
NOTE: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
| NOTE: FAIL: test_kernel_module (kernelmodule.<wbr>KernelModuleTest)<br>
| NOTE: ------------------------------<wbr>------------------------------<w=
br>----------<br>
| NOTE: Traceback (most recent call last):<br>
|=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worke=
r/<wbr>nightly-mips/build/meta/lib/<wbr>oeqa/core/decorator/__init__.<wbr>p=
y&quot;, line 32, in wrapped_f<br>
|=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
|=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worke=
r/<wbr>nightly-mips/build/meta/lib/<wbr>oeqa/core/decorator/__init__.<wbr>p=
y&quot;, line 32, in wrapped_f<br>
|=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
|=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worke=
r/<wbr>nightly-mips/build/meta/lib/<wbr>oeqa/core/decorator/__init__.<wbr>p=
y&quot;, line 32, in wrapped_f<br>
|=C2=A0 =C2=A0 =C2=A0return func(*args, **kwargs)<br>
|=C2=A0 =C2=A0File &quot;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worke=
r/<wbr>nightly-mips/build/meta/lib/<wbr>oeqa/runtime/cases/<wbr>kernelmodul=
e.py&quot;, line 40, in test_kernel_module<br>
|=C2=A0 =C2=A0 =C2=A0self.assertEqual(status, 0, msg=3D&#39;\n&#39;.join([c=
md, output]))<br>
| AssertionError: 2 !=3D 0 : cd /usr/src/kernel &amp;&amp; make scripts<br>
| arch/mips/Makefile:240: arch/mips/Kbuild.platforms: No such file or direc=
tory<br>
| make: *** No rule to make target &#39;arch/mips/Kbuild.platforms&#39;.=C2=
=A0 Stop.<br>
<br>
Best Regards,<br>
Maxin<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113f77ba26b2a70566568c16--
