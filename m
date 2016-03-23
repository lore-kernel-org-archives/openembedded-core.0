Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id DE11D606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 16:23:53 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 124so48318749iov.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tT1Acppvey0S1DLI1W/Ax93jOn6aoWXFBm9Dxn9u1CU=;
	b=NsCTTTdjpH+IvPTWHSSjpP7P2XiMOqA7ylpepkn9xs1VB8fxmP0avRb8IYL50wXTWu
	xUFFuNQhPaqay57glIdXSCVOzhXRvdNS0dEq9U7t187IELYov9VUWCmADEh3+vAouR+J
	FruipjPcOKaNCuuFrZPaMQANFODOFcsDrdy8L4SJFSGUqo4vaGO7dPKrXXzQ1BOWqwQA
	jHCv/vAciDkGOXcO8d68UcorUOEAZIThsct6vdGx85QD9VQOym4qAhkL5YUmmlrliZs+
	dS9Dl27S2foNZwfvNKTJcJDR0zYp6byyIZqGe4+2/5iV0hdUNiBlIVOimbUFWNWJcryD
	+GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tT1Acppvey0S1DLI1W/Ax93jOn6aoWXFBm9Dxn9u1CU=;
	b=DBmzShJ4aDwE27Z+p49QCKYrMGcctn9jd1yxuKuqUdgr+9bz56DHM1Ol7vbfU3kqxU
	QvKtcRk7uVjbvMxixMqU6u1Nor7aFTsY+TM/dMqs6WQvQBtA9IZnV1LPAo9IlS6UBoRI
	zXdVXKn6V8CyeTWaD80bbryHhL0sPv/BjpYi9mWqeIW53zg2L6cQ1ZCBgGhilCmyPKYg
	dSlMhi+ZiiwP8A+PPmxd2UcJ2LzNT0QjlrfvveBi3NVAx5wZnbtAmnmeLdNvXX6OE5VH
	yZ3AWtLN4p9b70Cpa/Wq8YTQ1YoK5tdMOvU86jd2+dJBFvS7qCbwiuFl2Es4Aia/Sf16
	DJ+w==
X-Gm-Message-State: AD7BkJLR0SxiYl0CCq6eFZx+cLhDMYNpqkuOcvXDrz43xHccLDCCZtjjJePhfKbynqOMe+1Jr7shZWghAzKoz85o
X-Received: by 10.50.43.226 with SMTP id z2mr25791893igl.78.1458750204652;
	Wed, 23 Mar 2016 09:23:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 23 Mar 2016 09:23:05 -0700 (PDT)
In-Reply-To: <1458748461-4643-1-git-send-email-william.c.randle@intel.com>
References: <1458748461-4643-1-git-send-email-william.c.randle@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Mar 2016 16:23:05 +0000
Message-ID: <CAJTo0LYjV1OROv5oO3_Wi8638pnnhOh3SgEp31yJ8GRk2XfsfQ@mail.gmail.com>
To: Bill Randle <william.c.randle@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: tighten lib_re and exec_re patterns to avoid false positive
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
X-List-Received-Date: Wed, 23 Mar 2016 16:23:54 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4c413c4052eb9bf0c

--047d7bfea0f4c413c4052eb9bf0c
Content-Type: text/plain; charset=UTF-8

On 23 March 2016 at 15:54, Bill Randle <william.c.randle@intel.com> wrote:

> +    lib_re = re.compile("^/lib.+\.so(\.\d+){0,3}$")
> +    exec_re = re.compile("^%s.*/lib.+\.so(\.\d+){0,3}$" % exec_prefix)
>

I worry that this goes too far in the other way, my Debian host has a
library called /usr/lib/libblas.so.3gf.

Maybe we should add a "is this an ELF" test into the libdir check instead?
That might kill performance though, and this is just a sanity check.

Any other thoughts?

Ross

--047d7bfea0f4c413c4052eb9bf0c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 March 2016 at 15:54, Bill Randle <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:william.c.randle@intel.com" target=3D"_blank">william.c.randle@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div id=3D":fn1" class=3D"" sty=
le=3D"overflow:hidden">+=C2=A0 =C2=A0 lib_re =3D re.compile(&quot;^/lib.+\.=
so(\.\d+){0,3}$&quot;)<br>
+=C2=A0 =C2=A0 exec_re =3D re.compile(&quot;^%s.*/lib.+\.so(\.\d+){0,3}$&qu=
ot; % exec_prefix)<br></div></blockquote></div><br>I worry that this goes t=
oo far in the other way, my Debian host has a library called=C2=A0/usr/lib/=
libblas.so.3gf.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Maybe we should add a &quot;is this an ELF&quot; test into the li=
bdir check instead?=C2=A0 That might kill performance though, and this is j=
ust a sanity check.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Any other thoughts?</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--047d7bfea0f4c413c4052eb9bf0c--
