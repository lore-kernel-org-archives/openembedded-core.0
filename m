Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id CCEAF7680D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 10:06:46 +0000 (UTC)
Received: by qgx61 with SMTP id 61so169927149qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 03:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8a9he/haW19a8hws++TEBTo6yIGp3dtKmKpsgXVcAa0=;
	b=lWxQPPqESdkWI8gqhuCqZBShd4Gqu2T2romgKY6VoT5wB51BOqmbRhUlyGd64VsyiG
	UkgWwio/V/UvyFwtWE4AK9kQFEciP86/fG760l3dKvrFyfDZ9ahXd6ex5AWVVK3o/6vd
	adpkDIU8K/sBI4mSmTvbDBBmM3hZSXgJ0VBDcba9ATUTTJsAYrn89H8sIVRMGnixEtd/
	PVF/Iaz9PQk9gpQ//dQBBhKoPeiqlHfqooG+iX+X2pOaGGllzHxKXFx3RwixGguVD0Ya
	1kTzCMKdeF87Ni5wUF8c/wz0/jv19A1q2VbMQpBs9oopob1lZlutZEoNazsJRM2R8HlQ
	2fwg==
X-Gm-Message-State: ALoCoQmOz8XejCeBwqhSKwngXcAR93tp5Cx2dp1F7BMfJV0/FpIcGt55DhShK+S4+MNfli8MIT/d
X-Received: by 10.140.235.147 with SMTP id g141mr45487750qhc.22.1444126006105; 
	Tue, 06 Oct 2015 03:06:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 6 Oct 2015 03:06:26 -0700 (PDT)
In-Reply-To: <b64576e3c49076498b7cfb0cbf9f3963@technux.se>
References: <cover.1413452836.git.kai.kang@windriver.com>
	<6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
	<b64576e3c49076498b7cfb0cbf9f3963@technux.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Oct 2015 11:06:26 +0100
Message-ID: <CAJTo0LZjxvCgVLFGVhn0O2PCWTGYFOM46zZ7KG_tqOZgzd9xgQ@mail.gmail.com>
To: petter@technux.se
Cc: Openembedded core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
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
X-List-Received-Date: Tue, 06 Oct 2015 10:06:48 -0000
Content-Type: multipart/alternative; boundary=001a11376e6e9b0b9005216cc95e

--001a11376e6e9b0b9005216cc95e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6 October 2015 at 09:11, Petter Mab=C3=A4cker <petter@technux.se> wrote:

> I played around with the new meta-security-isafw layer and the
> cve-check-tool. In readline the cve CVE-2014-2524 is marked as 'missing' =
by
> the framework and I was confused to start with, since I saw that this
> commit was included. But after looking at the actual patch I realized tha=
t
> it only contains a report and not the patch itself. My question is if tha=
t
> is with purpose and due to some decision that the CVE isn't really causin=
g
> any harm or if it's by mistake?
>
>
As can be seen at
http://lists.gnu.org/archive/html/bug-readline/2014-03/msg00057.html the
CVE patch is simply adding a #if defined (DEBUG), which is in the patch
included in oe-core master as readline-6.3/readline63-003.

The tool is probably reporting it as missing as -- if i recall correctly --
it identifies CVE patches by filename.

Ross

--001a11376e6e9b0b9005216cc95e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 October 2015 at 09:11, Petter Mab=C3=A4cker <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:petter@technux.se" target=3D"_blank">petter@technux.se</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><p>I played around with the new meta-se=
curity-isafw layer and the cve-check-tool. In readline the cve CVE-2014-252=
4 is marked as &#39;missing&#39; by the framework and I was confused to sta=
rt with, since I saw that this commit was included. But after looking at th=
e actual patch I realized that it only contains a report and not the patch =
itself. My question is if that is with purpose and due to some decision tha=
t the CVE isn&#39;t really causing any harm or if it&#39;s by mistake?</p>
<p></p></blockquote></div><br>As can be seen at <a href=3D"http://lists.gnu=
.org/archive/html/bug-readline/2014-03/msg00057.html">http://lists.gnu.org/=
archive/html/bug-readline/2014-03/msg00057.html</a> the CVE patch is simply=
 adding a #if defined (DEBUG), which is in the patch included in oe-core ma=
ster as=C2=A0readline-6.3/readline63-003.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">The tool is probably reporting it as mi=
ssing as -- if i recall correctly -- it identifies CVE patches by filename.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a11376e6e9b0b9005216cc95e--
