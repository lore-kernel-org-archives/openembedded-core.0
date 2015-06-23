Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id CAC3C73905
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:47:43 +0000 (UTC)
Received: by qcbcf1 with SMTP id cf1so3228896qcb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 07:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=QfeYwDoyezlYsquCIZlR07sVVUc3BDuKioFOyxvU+Kg=;
	b=I5ZduBKnVMWCL8b9K1sw+Y+kVkZgLWO3ff8xGT4RhhwxgP1IUE2UUJV5vlusyMCr4U
	Ohu+fOtNnUtLlyVwaCDTbAem3wudOPKV7rKwwcLNqMhS45b5mYUdci/0MLc12h5dejc1
	pT24rJfs+HSzhd1QHBZSBINt5OlXUZNH4C3yg1YchT2GOrTqoXC/dQpaNJ+NC24eAIbY
	RoJEib7+K5KptMtvtlC2xova69A5vPperyToIHOLpHzogQb/9xQ7I8RheVjNRm+hTuMR
	eGjftecaW5ll0VFH8sNyTC8HhOyaSdaO+HIARtLstHbX/I5GDwe7BBBP+cf3dswywDQf
	0ujw==
X-Gm-Message-State: ALoCoQkUwRK2u4nQpn7mWOct7w38uBE3sYvdsxGlzvrTTyr7c8lllzPFYpc0CRojDk8zPC8ngIjb
X-Received: by 10.140.43.199 with SMTP id e65mr10616019qga.80.1435070863989;
	Tue, 23 Jun 2015 07:47:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 23 Jun 2015 07:47:23 -0700 (PDT)
In-Reply-To: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
References: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jun 2015 15:47:23 +0100
Message-ID: <CAJTo0LYpcKWFAgDHcQ3FFsFypdHp6J8FBYkUGo3aQoJ6yRy4ng@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Move libexecdir to $prefix/libexec
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
X-List-Received-Date: Tue, 23 Jun 2015 14:47:45 -0000
Content-Type: multipart/alternative; boundary=001a113a9baa13ae93051930790b

--001a113a9baa13ae93051930790b
Content-Type: text/plain; charset=UTF-8

Forgot to cross-post oe-devel...

On 23 June 2015 at 15:30, Ross Burton <ross.burton@intel.com> wrote:

> Hi,
>
> Yes, I'm bringing this up again. :)
>
> Our default of libexecdir=$libdir/$BPN is contrary to both the FHS[1] and
> GNU
> Coding Standards[2], mainly because the key point is that libexecdir
> should be
> global and not change per-recipe.  The new FHS allows /usr/libexec so this
> series changes the default to that, and fixes up the recipes which need
> fixing.
>
> Several of the recipe fixes are unrelated to the change and will be
> submitted to
> master shortly, but others (eg sudo) are intimately tied to the change.
>
> I've done basic multilib-enabled builds but more testing welcome.  I'd say
> that
> in general multilib problems this exposes are in fact problems with the
> recipe:
> for example GConf should install the binaries once and libraries in each
> libdir.
>
> Ross
>
> [1] http://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s07.html
> [2] https://www.gnu.org/prep/standards/html_node/Directory-Variables.html
>
>

--001a113a9baa13ae93051930790b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Forgot to cross-post oe-devel...</div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On 23 June 2015 at 15:30, Ross Burton=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_=
blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Hi,<br>
<br>
Yes, I&#39;m bringing this up again. :)<br>
<br>
Our default of libexecdir=3D$libdir/$BPN is contrary to both the FHS[1] and=
 GNU<br>
Coding Standards[2], mainly because the key point is that libexecdir should=
 be<br>
global and not change per-recipe.=C2=A0 The new FHS allows /usr/libexec so =
this<br>
series changes the default to that, and fixes up the recipes which need fix=
ing.<br>
<br>
Several of the recipe fixes are unrelated to the change and will be submitt=
ed to<br>
master shortly, but others (eg sudo) are intimately tied to the change.<br>
<br>
I&#39;ve done basic multilib-enabled builds but more testing welcome.=C2=A0=
 I&#39;d say that<br>
in general multilib problems this exposes are in fact problems with the rec=
ipe:<br>
for example GConf should install the binaries once and libraries in each li=
bdir.<br>
<br>
Ross<br>
<br>
[1] <a href=3D"http://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s07.html=
" rel=3D"noreferrer" target=3D"_blank">http://refspecs.linuxfoundation.org/=
FHS_3.0/fhs/ch04s07.html</a><br>
[2] <a href=3D"https://www.gnu.org/prep/standards/html_node/Directory-Varia=
bles.html" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.org/prep/st=
andards/html_node/Directory-Variables.html</a><br>
<br>
</blockquote></div><br></div>

--001a113a9baa13ae93051930790b--
