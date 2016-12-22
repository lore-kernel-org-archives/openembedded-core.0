Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id A0ABE77616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 12:59:39 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id n21so107439223qka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 04:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XsMxvOXlu2vcmjB1H/uaj9pNqTUXrHLGXA3V0dStjrA=;
	b=nGO7RipxPLRIa2be8iWrrsd6y29UObeGLNn0F4NPHHGMcpXV0uG+2LM45eyL5Fsf6b
	SqTwYmw/ZHld12l6+14LAKmPD+iONFABI0bpy2h+B3vVfKFhjY4tZ+57SEvJRoaZNUJu
	XEjkHCGLjZKhD+WTz8PFjTF9/So7AS07iH/Qr92cuCohUXLVQOi9YSxoQifSe9pnRetZ
	pbOCdQMgrp8o6BollOGihYAqeE5kgezwqMfKYwte/KRr2oOtTy5Xv+FvuY7OrnhnTh80
	6XVopdO6x2FBuqoIQs4YeNvnGGGCMmNwhQ22/FbKYmxHPTqgtMqddOzGaDJWo/PX56Ib
	RIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XsMxvOXlu2vcmjB1H/uaj9pNqTUXrHLGXA3V0dStjrA=;
	b=Lwkq89NYUoHToQPbMZ1UQ0IVOwhkxr7qrPhr3Xj54RVP1ompj+4FPsI/6TqvB49Kfk
	wIHHU+sz8whOlNfozvJCuPAFYLRV3eRdfsx/QJY3JgL2u2EElSkXEOogNbbOP1edtIzB
	iTExuLapGJFtHcyfowCvhmBLsAI8JknlBVpptMlJcJbYzhpZuyeKJPOCrtLL09N6L6Co
	fbP90WEZ2pOxLpi6iHNWNCnbApj6PTmsKjzTXq74Yr0U+12vYVxWfbvBIqH0UB1eIgE0
	NwOBzFVM2Pw1gNzEgm7VAMgLrYzaMUShjJGMn/0TbpTa+cYPOcuqfy+pUsAckdcTbEe8
	3Xaw==
X-Gm-Message-State: AIkVDXLElfKM7YviT1qSJ3MPLuIucyf4DAMZHaTbZhHV4i6X/xr+Gse6wOuU1feRSl/ZUKtL2GeVRixfdRd9jJLn
X-Received: by 10.55.75.17 with SMTP id y17mr9618039qka.26.1482411580774; Thu,
	22 Dec 2016 04:59:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 22 Dec 2016 04:59:20 -0800 (PST)
In-Reply-To: <1482373460-40914-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1482373460-40914-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Dec 2016 12:59:20 +0000
Message-ID: <CAJTo0LYRpvnTveDpj7oavGA2X0OAzk8akDG17JPFo48MY9VR-g@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] elfutils 0.166->0.167
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
X-List-Received-Date: Thu, 22 Dec 2016 12:59:41 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8aeffe705443ed707

--001a114a88c8aeffe705443ed707
Content-Type: text/plain; charset=UTF-8

This patch is removed as you say it is merged upstream:

On 22 December 2016 at 02:24, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> --- a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-
> fix-a-stack-usage-warning.patch
> +++ /dev/null
> -diff --git a/backends/ppc_initreg.c b/backends/ppc_initreg.c
> -index 64f5379..52dde3e 100644
> ---- a/backends/ppc_initreg.c
> -+++ b/backends/ppc_initreg.c
> -@@ -93,7 +93,7 @@ ppc_set_initial_registers_tid (pid_t tid __attribute__
> ((unused)),
> -       return false;
> -     }
> -   const size_t gprs = sizeof (user_regs.r.gpr) / sizeof
> (*user_regs.r.gpr);
> --  Dwarf_Word dwarf_regs[gprs];
> -+  Dwarf_Word dwarf_regs[sizeof (user_regs.r.gpr) / sizeof
> (*user_regs.r.gpr)];
>


However the upstream code
(https://git.fedorahosted.org/cgit/elfutils.git/tree/backends/ppc_initreg.c?h=elfutils-0.167#n95)
still says:


  const size_t gprs = sizeof (user_regs.r.gpr) / sizeof (*user_regs.r.gpr);
  Dwarf_Word dwarf_regs[gprs];

So this wasn't merged.  Please re-review the patches (and maybe this is a
good opportunity to push more of them upstream).

Ross

--001a114a88c8aeffe705443ed707
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">This patch is removed as you sa=
y it is merged upstream:</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">On 22 December 2016 at 02:24, Zheng Ruoqin <span dir=3D"=
ltr">&lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">z=
hengrq.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex"><div id=3D"gmail-:e2" class=3D"gmail-a3s gmail-aXjCH g=
mail-m1592459f2e5d6967">--- a/meta/recipes-devtools/<wbr>elfutils/elfutils-=
0.166/0001-<wbr>fix-a-stack-usage-warning.<wbr>patch<br>
+++ /dev/null<br>-diff --git a/backends/ppc_initreg.c b/backends/ppc_initre=
g.c<br>
-index 64f5379..52dde3e 100644<br>
---- a/backends/ppc_initreg.c<br>
-+++ b/backends/ppc_initreg.c<br>
-@@ -93,7 +93,7 @@ ppc_set_initial_registers_tid (pid_t tid __attribute__ (=
(unused)),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0const size_t gprs =3D sizeof (user_regs.r.gpr) / sizeof (*use=
r_regs.r.gpr);<br>
--=C2=A0 Dwarf_Word dwarf_regs[gprs];<br>
-+=C2=A0 Dwarf_Word dwarf_regs[sizeof (user_regs.r.gpr) / sizeof (*user_reg=
s.r.gpr)];</div></blockquote></div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra"><br></div><pre style=3D"margin-top:0px;margin-botto=
m:0px;padding:0px"><code><font face=3D"arial, sans-serif"><span style=3D"wh=
ite-space:normal">However the upstream code (</span></font></code><span sty=
le=3D"font-family:arial,sans-serif"><a href=3D"https://git.fedorahosted.org=
/cgit/elfutils.git/tree/backends/ppc_initreg.c?h=3Delfutils-0.167#n95">http=
s://git.fedorahosted.org/cgit/elfutils.git/tree/backends/ppc_initreg.c?h=3D=
elfutils-0.167#n95</a>) still says:</span></pre><pre style=3D"margin-top:0p=
x;margin-bottom:0px;padding:0px"><font color=3D"#000000" size=3D"3" style=
=3D"font-family:arial,sans-serif"><br></font></pre>=C2=A0 const size_t gprs=
 =3D sizeof (user_regs.r.gpr) / sizeof (*user_regs.r.gpr);<br>=C2=A0 Dwarf_=
Word dwarf_regs[gprs];</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">So this wasn&#39;t merged.=C2=A0 Please re-review the patc=
hes (and maybe this is a good opportunity to push more of them upstream).</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a114a88c8aeffe705443ed707--
