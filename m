Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id C46B371E53
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 16:55:37 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id f9so179078501otd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 08:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=QOox9FISCuWlwQqSTeRYOwWwVBajtTHnvSJoqfff19Q=;
	b=TR8w+9OIU4m8N9JsC+WrMiAFQP8M2nUk2Q4A9Uwm/qql7OKFOllIjNNwCPQsZ44U0O
	V5wcqQEyz/BqftJ8P0naQsCeSFkkok3AwgirkkSBa6EuCge8HSQRQ44csC4izzJfII5n
	WolY7NpUnQPsX/u2bHLIEoRpxCoApDgcm/DZymsDj2DKOshnpEx5+9bCro7xkt2u30W9
	wrlXKsrRZH1Im+yuKA+garqjUiZuIAjFw4CdSRC31Gqk9eJAY3YnMVQ5wjNO9KSgcri6
	RDnltL3CZQieih5jMdYzQOUDZKwkiryZTtjB8UtEtvU23XR0u25vbzc4DDQwB+fO6aeF
	ACFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=QOox9FISCuWlwQqSTeRYOwWwVBajtTHnvSJoqfff19Q=;
	b=CCGZTUCi/NjpIw6vj0m7nHg1AKpMaQX8G7gRjGr7Wr2/TAa5wcg/QirLOlZP8efVKf
	veDV66JdVfBoH2ktt2Zl0pJHFkCj49ee5w5slXuufVORHtim/R6MYarqsw0AcmGNFa3c
	caAiPTRH/FzOvktgQlAlEJgNZ/j84qLIl55V7vjk1CDUgbwMQNbyAcxRLuki4I2ulXy2
	WAFbQLlszjFUT48xjRDvNUjcihLoqnbJBQWZ1YMFLe1cP51h637vUIA3MRb1/MVZux3V
	o+YUw2IwubtdmV4knp/mSDTbiD2Uh5K4Yr6bNclNJV0QL27hvSuv6LdEd0+mLRBJSqau
	MIZw==
X-Gm-Message-State: AIkVDXJuKOHLsz5u3huzV1RqBnOWZKm1cTNGXfLnvH2uGvZ2T1pV2zCZUxBbwA42lNcmKrKQ3+GX2pW4tyagRA==
X-Received: by 10.157.44.153 with SMTP id p25mr1544586otb.27.1485449738368;
	Thu, 26 Jan 2017 08:55:38 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.5.8 with HTTP; Thu, 26 Jan 2017 08:55:17 -0800 (PST)
In-Reply-To: <20170126164518.23219-1-freesilicon@gmail.com>
References: <20170126164518.23219-1-freesilicon@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 26 Jan 2017 09:55:17 -0700
X-Google-Sender-Auth: RuG3ALlhnWG2pwxI4eDQekMJfo0
Message-ID: <CABcZANku1Wz5zdouv5e1sCp8FgHRBWMQTdTQ6-mN3Bot8rg8eQ@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: conditional inclusion of login utilities
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
X-List-Received-Date: Thu, 26 Jan 2017 16:55:39 -0000
Content-Type: multipart/alternative; boundary=001a113b12fafcbdba0547023745

--001a113b12fafcbdba0547023745
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 26, 2017 at 9:45 AM, David Vincent <freesilicon@gmail.com>
wrote:

> diff --git a/meta/recipes-core/busybox/busybox_git.bb
> b/meta/recipes-core/busybox/busybox_git.bb
> index c2ee3e6c4b..4213ef4b1e 100644
> --- a/meta/recipes-core/busybox/busybox_git.bb
> +++ b/meta/recipes-core/busybox/busybox_git.bb
> @@ -31,7 +31,7 @@ SRC_URI = "git://busybox.net/busybox.git \
>             file://run-ptest \
>             file://inetd.conf \
>             file://inetd \
> -           file://login-utilities.cfg \
> +           ${@["", "file://login-utilities.cfg"][
> (d.getVar('VIRTUAL-RUNTIME_login_manager') == 'busybox')]} \
>             file://recognize
>

Question, why not use ${PN} here?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113b12fafcbdba0547023745
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jan 26, 2017 at 9:45 AM, David Vincent <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:freesilicon@gmail.com" target=3D"_blank">freesilicon@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ji" cl=
ass=3D"a3s aXjCH m159dbacee1f49e12">diff --git a/meta/recipes-core/busybox/=
<a href=3D"http://busybox_git.bb" rel=3D"noreferrer" target=3D"_blank">bu<w=
br>sybox_git.bb</a> b/meta/recipes-core/busybox/<a href=3D"http://busybox_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">bu<wbr>sybox_git.bb</a><br>
index c2ee3e6c4b..4213ef4b1e 100644<br>
--- a/meta/recipes-core/busybox/<a href=3D"http://busybox_git.bb" rel=3D"no=
referrer" target=3D"_blank">bu<wbr>sybox_git.bb</a><br>
+++ b/meta/recipes-core/busybox/<a href=3D"http://busybox_git.bb" rel=3D"no=
referrer" target=3D"_blank">bu<wbr>sybox_git.bb</a><br>
@@ -31,7 +31,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://busybox.net/bus=
ybox.git" rel=3D"noreferrer" target=3D"_blank">busybox.net/busybox.git</a> =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://inetd.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://inetd \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://login-utilities.cfg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@[&quot;&quot;, &quot;file://lo=
gin-utilities.cfg&quot;][<wbr>(d.getVar(&#39;VIRTUAL-RUNTIME_<wbr>login_man=
ager&#39;) =3D=3D &#39;busybox&#39;)]} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://recognize</div></blockquot=
e></div><br>Question, why not use ${PN} here?<br>-- <br><div class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Christ=
opher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedd=
ed, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></di=
v>
</div></div>

--001a113b12fafcbdba0547023745--
