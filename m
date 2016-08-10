Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id E4CFD77117
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 22:53:36 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id y195so3802240iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 15:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=nkIfUeVg33lVaaB2uI845G923UpN8DIjpigmgLdJRQM=;
	b=D3uJ9iCIYo51UyaPMP6jT6MQo3a/DFzTub6SUL80qnSK/IR8vUG2CadWW6mD/76ajh
	WjfHGT+KOlB6jQB1tHusbbr/0JYi/3JchDz4j1i10RhJTsDSFinHqCZAp7z4FK8ebPMz
	eTYsLoTW7nzkeGSPVhWkSgN7l8xkbCv/gMVsXQyjCq737jSCkDqfFb20lhFqLu+2Y37e
	c/RoE1XMcoFEtrDDIW9QDJxqDBOWkOEfzn8oIvs/5i2ohSq+dUYR9hDfT86MKJ8Tsgzq
	n9tM/h+tqHCrWXLotGIWHM5iTBFWPeNgZs/KZhX/Y4dgK15luh3ScVsA+btARLEPcoxF
	/M6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=nkIfUeVg33lVaaB2uI845G923UpN8DIjpigmgLdJRQM=;
	b=du0363TExVyleBxeTcl3GsjUuwNDlA0oDapznJ/x2xXjklLCzEcGh8d98BHxgh9enm
	iQShNYQZ0OszC2h4Wl/XzQBt++IAxH83GrRsVcUzZdXtV35k8ieYKcg3OuKrbaAbvK8K
	n1FprIpJ18xRmk9y/VSKtRyK5Buj6pTg1FzxFWQ6xkRvtNZOZ/iMrRv7mVOtM86yLBA+
	ujYkN17gOl+quVEjJg+6GRQtN/JttzUCAQzxEOEqqQ3iQy6gL/SgYJV5SFxGgC19ACI6
	p0YEigev/wqXkQ4XuqdopIvNlNfYCg2FwPTsCuQu19Xci3iV4tsM+2w6wnbJHxJIL78Q
	xnLA==
X-Gm-Message-State: AEkoouukX57dCpbiFFH6eemlD2+BBd95O8EZ91sfFl5ybSoYbIp3jhx6RRBtcTeGgMYl1pw4F/vGfZpfagIIwg==
X-Received: by 10.107.128.210 with SMTP id k79mr8115783ioi.3.1470869617098;
	Wed, 10 Aug 2016 15:53:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.138.7 with HTTP; Wed, 10 Aug 2016 15:53:16 -0700 (PDT)
In-Reply-To: <1470867341-12828-1-git-send-email-henry.bruce@intel.com>
References: <1470867341-12828-1-git-send-email-henry.bruce@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 10 Aug 2016 15:53:16 -0700
X-Google-Sender-Auth: W46DZ4sqMXU5SEdiQoZ3s0Rilik
Message-ID: <CABcZAN=FFN7C+4xu9CZW2tvgXf33CBCm4Smno+wVXrvsi4Wn6Q@mail.gmail.com>
To: Henry Bruce <henry.bruce@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] npm: npm.bbclass now adds nodejs to RDEPENDS
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
X-List-Received-Date: Wed, 10 Aug 2016 22:53:37 -0000
Content-Type: multipart/alternative; boundary=001a113f8aae09c31a0539bf8552

--001a113f8aae09c31a0539bf8552
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 10, 2016 at 3:15 PM, Henry Bruce <henry.bruce@intel.com> wrote:

> We expect that any package that uses the npm bbclass
> will have a runtime dependency on node.js
>
> Signed-off-by: Henry Bruce <henry.bruce@intel.com>
> ---
>  meta/classes/npm.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index 95be751..541fd3b 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -1,4 +1,5 @@
>  DEPENDS_prepend = "nodejs-native "
> +RDEPENDS_${PN}_prepend += "nodejs "
>

The += here is pointless. It adds a leading space, which does nothing, and
isn't needed for a prepend anyway. Just use =, the same as is used for
DEPENDS.


-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113f8aae09c31a0539bf8552
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 10, 2016 at 3:15 PM, Henry Bruce <span dir=3D"ltr">&lt;<a href=
=3D"mailto:henry.bruce@intel.com" target=3D"_blank">henry.bruce@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ot" clas=
s=3D"a3s aXjCH m15676870c8031a2f">We expect that any package that uses the =
npm <span class=3D"il">bbclass</span><br>
will have a runtime dependency on node.js<br>
<br>
Signed-off-by: Henry Bruce &lt;<a href=3D"mailto:henry.bruce@intel.com">hen=
ry.bruce@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/npm.<span class=3D"il">bbclass</span> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes/npm.<span class=3D"il">bbclass</span> b/meta/clas=
ses/npm.<span class=3D"il">bbclass</span><br>
index 95be751..541fd3b 100644<br>
--- a/meta/classes/npm.<span class=3D"il">bbclass</span><br>
+++ b/meta/classes/npm.<span class=3D"il">bbclass</span><br>
@@ -1,4 +1,5 @@<br>
=C2=A0DEPENDS_prepend =3D &quot;nodejs-native &quot;<br>
+RDEPENDS_${PN}_prepend +=3D &quot;nodejs &quot;</div></blockquote></div><b=
r>The +=3D here is pointless. It adds a leading space, which does nothing, =
and isn&#39;t needed for a prepend anyway. Just use =3D, the same as is use=
d for DEPENDS.<br><br clear=3D"all"><div><br></div>-- <br><div class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clar=
son at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Ma=
intainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113f8aae09c31a0539bf8552--
