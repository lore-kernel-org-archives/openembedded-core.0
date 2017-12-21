Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 58F33787F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 11:39:43 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id x129so20757611iod.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 03:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c70EhqYpccA+EMS5WqrViTfwHJfuUQX4pL5VKr9KrZ8=;
	b=vTcuCG9axnTUZOuzoE2uizRUcV/HY7XR9iVy0mdZP587mZxlXz0d4y1uvsMmlxEqAB
	YXoqvbaqtJcVgrj9x3xqYvmtQICqVfTvSFeS5V/LW6ke6WxW2vkmk48aYCLAFo10Ja/X
	ePcvTh+qDYA2T9r5G3x2dAG/AwXlsj+nongG3+CQ3pVTyhzPPna5ayPbqZ4XiEG3ryjt
	sAooRcwybO/eC5cPITEyPtMPy4vz2ZSBrnUX/kGiMcUoL8OVbYA9+TH3KRAmnMLd2dQ+
	K4LGA/pKG+Ga3AqMpcigt/NBMYo2uSCjxDqZ/mYv6mWIUdxpaILmBS4Nn2Xlx84ty5b1
	NTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c70EhqYpccA+EMS5WqrViTfwHJfuUQX4pL5VKr9KrZ8=;
	b=liXw4f6iJvnxLH7UnJRehXGhjebs+5/g/3pmlobh9V0P7y0HTCXCd++/Ebz5wyUq5/
	rtrHmNJpDw0T2+MY8dz0//xWYGGo1D+TAVh4sP7aUbn5CAgDaq5b8c0HD/KCq2iy6ZlN
	w5PSjRz+jXiF7ykJ+oPu7OywPseWsp8BablGFAPKFUrk68fphEEa4ezQdIhPRnWGih9j
	U7rw0A7pw4fJW9/t+3CBgO8MQF5UKp1DvuLsBovm8try2do/Lnq+QtYdrwvGknal0q8Y
	oXyawhKuuDHCNkiFDRDGUo0YPcCZElTeURPGWntmTJQEvKagsuMk7wz6wznBZEtKhhAY
	iZuw==
X-Gm-Message-State: AKGB3mJ6rZX2u9pa0iDF8shURJNqtKOpAf/0bNF9XwARiACvLoVrckya
	OlTJlh9gSnH6p+W71yClWU+ARUalV3ytCeFaSC8LTw==
X-Google-Smtp-Source: ACJfBosEm1PsJNKWc9nY3UuvYIHALvnlm1IQdSIlTsINSVAEhCXL9aThxTbwkc7tJhklPoKIH92Kuolmz7gOqQ39bwc=
X-Received: by 10.107.47.1 with SMTP id j1mr12649485ioo.217.1513856385339;
	Thu, 21 Dec 2017 03:39:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.34.140 with HTTP; Thu, 21 Dec 2017 03:39:24 -0800 (PST)
In-Reply-To: <6d1905cf-26d2-49cf-d0bb-248cbf4a071d@dresearch-fe.de>
References: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
	<CAJTo0LaHXJMMNg8VmqFNne_8rgEV9TER5saUzUXudRgvzggWNw@mail.gmail.com>
	<6d1905cf-26d2-49cf-d0bb-248cbf4a071d@dresearch-fe.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Dec 2017 11:39:24 +0000
Message-ID: <CAJTo0LYWwMnj4Wb6JC1y7uw4ZrPv6=SynfkSc0TU0dwi9Dezjw@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: MS Windows machine?
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
X-List-Received-Date: Thu, 21 Dec 2017 11:39:44 -0000
Content-Type: multipart/alternative; boundary="001a11377fbc16e8a80560d8288a"

--001a11377fbc16e8a80560d8288a
Content-Type: text/plain; charset="UTF-8"

On 21 December 2017 at 09:54, Steffen Sledz <sledz@dresearch-fe.de> wrote:

> On 21.12.2017 10:08, Burton, Ross wrote:
> > On 21 December 2017 at 06:40, Steffen Sledz <sledz@dresearch-fe.de>
> wrote:
> >> Anyone tried to cross-compile for MS Windows target with Yocto/OE?
> >
> > Yes, see meta-mingw.
>
> A misunderstanding?
>
> I like to build *for* MS Windows, not *at* MS Windows.
>

"OpenEmbedded meta layer for mingw based SDKs"

Running bitbake on Windows isn't possible.  It's getting closer with the
new Subsystem for Linux thing but that's not ready yet.

meta-mingw lets you build SDKs *for* Windows.  We've used it to build cross
compilers that run on Windows that generate Linux binaries.

If you want to build for a Windows target then that should be possible but
nobody as far as I'm aware has made the work public.  meta-mingw will
contain most of the changes needed as that does build Windows binaries.

Ross

--001a11377fbc16e8a80560d8288a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 December 2017 at 09:54, Steffen Sledz <span dir=3D"l=
tr">&lt;<a href=3D"mailto:sledz@dresearch-fe.de" target=3D"_blank">sledz@dr=
esearch-fe.de</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:=
rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">On 21.12.2017 10:=
08, Burton, Ross wrote:<br>
&gt; On 21 December 2017 at 06:40, Steffen Sledz &lt;<a href=3D"mailto:sled=
z@dresearch-fe.de">sledz@dresearch-fe.de</a>&gt; wrote:<br>
&gt;&gt; Anyone tried to cross-compile for MS Windows target with Yocto/OE?=
<br>
&gt;<br>
&gt; Yes, see meta-mingw.<br><br>
</span>A misunderstanding?<br>
<br>
I like to build *for* MS Windows, not *at* MS Windows.<br></blockquote><div=
><br></div><div>&quot;OpenEmbedded meta layer for mingw based SDKs&quot;</d=
iv><div><br></div><div>Running bitbake on Windows isn&#39;t possible.=C2=A0=
 It&#39;s getting closer with the new Subsystem for Linux thing but that&#3=
9;s not ready yet.</div><div><br></div><div>meta-mingw lets you build SDKs =
*for* Windows.=C2=A0 We&#39;ve used it to build cross compilers that run on=
 Windows that generate Linux binaries.</div><div><br></div><div>If you want=
 to build for a Windows target then that should be possible but nobody as f=
ar as I&#39;m aware has made the work public. =C2=A0meta-mingw will contain=
 most of the changes needed as that does build Windows binaries.</div><div>=
<br></div><div>Ross</div></div></div></div>

--001a11377fbc16e8a80560d8288a--
