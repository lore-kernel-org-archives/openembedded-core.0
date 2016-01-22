Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6A93E769F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 22:58:12 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id mw1so1396968igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 14:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9jjR1UXo4iEEpcSCBUQWPmpNaO/T2Q/YSTX+CrsvHiY=;
	b=rEMV5va9oyA9XZ6xmHxgqlG698yaCrr9eo6kxTsXl8qsK7jjmga4iJfLr0gmodYiA2
	k1TGPryJdlk5NywAoDraSi4HfQOZl6Xl0Qfi3Om8yXa6doHPS/YP2YHR1wcXuP6wIoSO
	VBwEjOGk7ZCL+92BjRz//yvjtM/i2mTB+iB65UHbxLw65Zy0MESfI91EngTtrXic2isb
	EBYDIsWyBicZMM3AqHJkECUzGTBVxE1+PyTCnCzEsft0Yi+b8uJlezlJ7NSZC8ZAFbVA
	rNdMzwBfyFRiEFKlmr/rfr2V2ZfKquCPbAiK62DJT/fK7zea7zA1DHX+m3aJ1VVoWeto
	IV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9jjR1UXo4iEEpcSCBUQWPmpNaO/T2Q/YSTX+CrsvHiY=;
	b=IxVRLaFtnHZIHdIiLwbwTRA4sEqbn5BUBTNXTB80fCJ6QdfIWnHQNv4T1uYOcZ7w4K
	QeImGRjdPyfJJ44Pivts+SCGKIADpI5cmlzJhXL4HbXWZTnzDG9OzVrBjvPn6cKGe/eZ
	9T6HhQcgSOHDgnG98zRLKMq0NeWR+F19LLOJCbIzC1SNMwsk5WD2ayiIJBuTkO0+5bEJ
	99w15ocdF5qpJMoMPmhsOMTbtFt9EAWHKwud4V0Z5H9WIw5sRN8DD/fecizN1rlVyj3U
	Q8Kr+xZgwE+ZhmXySnj7+MacFsXEqKicROdit07oW791eAXJAcEHycE6ONjZMdfcRaxJ
	L1DA==
X-Gm-Message-State: AG10YORAKah/3a/gYvZs+JuxgoQszniYGAhf/Q1v9nl+GtFBnt6ggQawexkt98/695x0iDToJ47y+U2NP6p/nvnT
X-Received: by 10.50.23.108 with SMTP id l12mr3189973igf.78.1453503492966;
	Fri, 22 Jan 2016 14:58:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 22 Jan 2016 14:57:53 -0800 (PST)
In-Reply-To: <7c60a8094ba098006166f4b2eb8f23b6891c7e7e.1453427939.git.liezhi.yang@windriver.com>
References: <cover.1453427939.git.liezhi.yang@windriver.com>
	<7c60a8094ba098006166f4b2eb8f23b6891c7e7e.1453427939.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jan 2016 22:57:53 +0000
Message-ID: <CAJTo0LY17Bv-1XiAhd3O1xti0Xtt0gUsrEer21an+vfRd39zDA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] meta: cleanup PACKAGECONFIG ??= ""
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
X-List-Received-Date: Fri, 22 Jan 2016 22:58:14 -0000
Content-Type: multipart/alternative; boundary=089e0149cbe860e8350529f42772

--089e0149cbe860e8350529f42772
Content-Type: text/plain; charset=UTF-8

On 22 January 2016 at 01:59, Robert Yang <liezhi.yang@windriver.com> wrote:

> The base.bbclass can handle PACKAGECONFIG well when it is not set, so
> PACKAGECONFIG ??= "" isn't useful here, but there are a lot of them,
> which may mislead the newbie that it is a must.
>

I actually like the clarity of PACKAGECONFIG??="".  Does anyone else have
an opinion either way?

Ross

--089e0149cbe860e8350529f42772
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2016 at 01:59, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":u77" =
class=3D"a3s" style=3D"overflow:hidden">The base.bbclass can handle PACKAGE=
CONFIG well when it is not set, so<br>
PACKAGECONFIG ??=3D &quot;&quot; isn&#39;t useful here, but there are a lot=
 of them,<br>
which may mislead the newbie that it is a must.</div></blockquote></div><br=
>I actually like the clarity of PACKAGECONFIG??=3D&quot;&quot;.=C2=A0 Does =
anyone else have an opinion either way?</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--089e0149cbe860e8350529f42772--
