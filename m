Return-Path: <pidge@toganlabs.com>
Received: from egyptian.birch.relay.mailchannels.net
	(egyptian.birch.relay.mailchannels.net [23.83.209.56])
	by mail.openembedded.org (Postfix) with ESMTP id F3BC477CDC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:15:16 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B1FA810399B;
	Wed, 29 Mar 2017 13:15:15 +0000 (UTC)
Received: from hp181.hostpapa.com (unknown [100.96.131.98])
	by relay.mailchannels.net (Postfix) with ESMTPA id 399551038E2;
	Wed, 29 Mar 2017 13:15:15 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from hp181.hostpapa.com (hp181.hostpapa.com [172.20.66.218])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:2500 (trex/5.7.37); Wed, 29 Mar 2017 13:15:15 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|pidge@toganlabs.com
X-MailChannels-Auth-Id: hostpapa
X-Spot-Plucky: 7af8bb2c661b0e6c_1490793315560_2183585746
X-MC-Loop-Signature: 1490793315560:2205084893
X-MC-Ingress-Time: 1490793315560
Received: from [213.46.252.136] (port=31403 helo=[192.168.229.56])
	by hp181.hostpapa.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.87)
	(envelope-from <pidge@toganlabs.com>)
	id 1ctDRS-001MKz-98; Wed, 29 Mar 2017 15:15:14 +0200
Message-ID: <1490793311.15543.19.camel@toganlabs.com>
From: Beth 'pidge' Flanagan <pidge@toganlabs.com>
Reply-To: pidge@toganlabs.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 15:15:11 +0200
In-Reply-To: <1490783533.13980.313.camel@linuxfoundation.org>
References: <1490781608-1841-1-git-send-email-pidge@toganlabs.com>
	<1490783533.13980.313.camel@linuxfoundation.org>
Organization: toganlabs.com
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-OutGoing-Spam-Status: No, score=5.0
X-AuthUser: pidge@toganlabs.com
Subject: Re: [PATCH] bitbake.conf: Add aws to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 29 Mar 2017 13:15:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-03-29 at 11:32 +0100, Richard Purdie wrote:
> On Wed, 2017-03-29 at 12:00 +0200, Elizabeth 'pidge' Flanagan wrote:
> >=20
> > This adds aws to HOSTTOOLS_NONFATAL in order to get the s3 fetcher
> > working again.=C2=A0
> Cool on this bit although you just broke the sorting patch I just
> merged under duress (I knew this would cause pain) :/.
>=20

Ah, yes, I see that. I'll get it sorted right.

> >=20
> > It also sets FETCHCMD_s3 for completions sake.
> Please don't if we don't need it.
>=20
> Note your patch and this description don't match (FETCHCMD_aws) so
> its
> clearly not needed ;-).
>=20

*facepalm*

> Cheers,
>=20
> Richard
>=20
> >=20
> > Signed-off-by: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
> > ---
> > =C2=A0meta/conf/bitbake.conf | 3 ++-
> > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 96a9ed9..bfa8dd8 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -469,7 +469,7 @@ HOSTTOOLS +=3D " \
> > =C2=A0HOSTTOOLS +=3D "ip ping ps scp ssh stty"
> > =C2=A0
> > =C2=A0# Link to these if present
> > -HOSTTOOLS_NONFATAL +=3D "ccache gcc-ar gpg ld.bfd ld.gold nc sftp
> > socat sudo"
> > +HOSTTOOLS_NONFATAL +=3D "ccache gcc-ar gpg ld.bfd ld.gold nc sftp
> > socat sudo aws"
> > =C2=A0
> > =C2=A0# Temporary add few more detected in bitbake world
> > =C2=A0HOSTTOOLS_NONFATAL +=3D "join nl size yes zcat"
> > @@ -640,6 +640,7 @@ FETCHCMD_cvs =3D "/usr/bin/env cvs"
> > =C2=A0FETCHCMD_wget =3D "/usr/bin/env wget -t 2 -T 30 -nv --passive-f=
tp --
> > no-check-certificate"
> > =C2=A0FETCHCMD_bzr =3D "/usr/bin/env bzr"
> > =C2=A0FETCHCMD_hg =3D "/usr/bin/env hg"
> > +FETCHCMD_aws =3D "/usr/bin/env aws"
> > =C2=A0
> > =C2=A0SRCDATE =3D "${DATE}"
> > =C2=A0SRCREV ??=3D "INVALID"
> > --=C2=A0
> > 1.9.1
> >=20

