Return-Path: <ebenard@free.fr>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC8978D7A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:34:54 +0000 (UTC)
Received: from mail-oi0-f53.google.com (unknown [209.85.218.53])
	(Authenticated sender: ebenard)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8E6F92003D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 17:34:53 +0200 (CEST)
Received: by mail-oi0-f53.google.com with SMTP id v8-v6so4463278oie.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:34:53 -0700 (PDT)
X-Gm-Message-State: AOUpUlHkPPqPTogt4LyKoirepouyCk9T03XECfZeoNmz0Wo6a4ptahBm
	SxSkWb3xpA8LQhwEvoWHNFBjmFPu/S/e+6jiXw==
X-Google-Smtp-Source: AA+uWPxaB/5q/0mflGHEEEe4yBP6zl/cq/aB11B9xVH0Xcd2jAVIJUoKR6XtJZtT+2/DNRK0RX+jkKrF8l7rVDJdLcc=
X-Received: by 2002:aca:171a:: with SMTP id
	j26-v6mr3554328oii.277.1533742492494; 
	Wed, 08 Aug 2018 08:34:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:c591:0:0:0:0:0 with HTTP;
	Wed, 8 Aug 2018 08:34:51 -0700 (PDT)
From: Eric BENARD <ebenard@free.fr>
Date: Wed, 8 Aug 2018 17:34:51 +0200
X-Gmail-Original-Message-ID: <CABS_+k8mSL+Cnzz0jK=xovQHt_J_HL1m0Rhn6SD+y4FArzApEQ@mail.gmail.com>
Message-ID: <CABS_+k8mSL+Cnzz0jK=xovQHt_J_HL1m0Rhn6SD+y4FArzApEQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: SRCPV / prserv problem
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
X-List-Received-Date: Wed, 08 Aug 2018 15:34:54 -0000
Content-Type: multipart/alternative; boundary="0000000000007135f60572ee40cb"

--0000000000007135f60572ee40cb
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a strange issue with a recipe fetching from git for which I fix the
HASH in a conf file :
I'm using PRSERV_HOST = "localhost:0"
The recipe has PV = "gitr${SRCPV}" so I expect the package numbering to be
handled by the prserv.

If I add a SRCREV_pn-mysw = "1ad58b2488ce91ce4d0c4aae4189108b0281aae6", I
see in buildhistory :
PV = gitrAUTOINC+1ad58b2488
PKGV = gitr0+1ad58b2488

If I then fix the hash to 6bd8208a0754a23b5437cb34a361fc22d7dc0c3b, I see
in buildhistory :
-PKGV = gitr0+1ad58b2488
+PKGV = gitr0+6bd8208a07
+PKGR = r0.0
which is expected

But then if I come back to the hash
1ad58b2488ce91ce4d0c4aae4189108b0281aae6, I see :
-PKGV = gitr2+6bd8208a07
-PKGR = r0.1
+PKGV = gitr0+1ad58b2488
and thus I have the package numbering going backward with a QA error.

Do you have any idea on what is causing this behavior and where to dig to
fix this ?

Thanks
Eric

--0000000000007135f60572ee40cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I have a strange issue with a recipe fetching f=
rom git for which I fix the HASH in a conf file :<br>I&#39;m using PRSERV_H=
OST =3D &quot;localhost:0&quot;<br>The recipe has PV =3D &quot;gitr${SRCPV}=
&quot; so I expect the package numbering to be handled by the prserv.<br><b=
r>If I add a SRCREV_pn-mysw =3D &quot;1ad58b2488ce91ce4d0c4aae4189108b0281a=
ae6&quot;, I see in buildhistory :<br>PV =3D gitrAUTOINC+1ad58b2488<br>PKGV=
 =3D gitr0+1ad58b2488<br><br>If I then fix the hash to 6bd8208a0754a23b5437=
cb34a361fc22d7dc0c3b, I see in buildhistory :<br>-PKGV =3D gitr0+1ad58b2488=
<br>+PKGV =3D gitr0+6bd8208a07<br>+PKGR =3D r0.0<br>which is expected<br><b=
r>But then if I come back to the hash 1ad58b2488ce91ce4d0c4aae4189108b0281a=
ae6, I see :<br>-PKGV =3D gitr2+6bd8208a07<br>-PKGR =3D r0.1<br>+PKGV =3D g=
itr0+1ad58b2488<br>and thus I have the package numbering going backward wit=
h a QA error.<br><br>Do you have any idea on what is causing this behavior =
and where to dig to fix this ?<br><br>Thanks<br>Eric<br></div>

--0000000000007135f60572ee40cb--
