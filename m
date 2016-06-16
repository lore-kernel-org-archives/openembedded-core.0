Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D999612E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 14:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 621E918178;
	Thu, 16 Jun 2016 16:57:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id pthVrFfhV5iL; Thu, 16 Jun 2016 16:57:13 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id E763C1816B;
	Thu, 16 Jun 2016 16:57:12 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D141D1B4A;
	Thu, 16 Jun 2016 16:57:12 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id C6655F88;
	Thu, 16 Jun 2016 16:57:12 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id C4521F3F;
	Thu, 16 Jun 2016 16:57:12 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Thu, 16 Jun 2016 16:57:12 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Thu, 16 Jun 2016 16:57:12 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1156.000;
	Thu, 16 Jun 2016 16:57:12 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, Jan Remmet <J.Remmet@phytec.de>
Thread-Topic: [OE-core] [PATCH] rootfs-postcommands: generate
	/var/lib/systemd/clock
Thread-Index: AQHRx9y1ocCjN+BtSEi91r7btF+bt5/sLikA
Date: Thu, 16 Jun 2016 14:57:12 +0000
Message-ID: <3aa678e40c764504b9cdce828c1d236c@XBOX02.axis.com>
References: <1465997797-6613-1-git-send-email-j.remmet@phytec.de>
	<7E603C53-3E9F-488E-8AC2-AA8D4AB8DBC0@gmail.com>
	<5762b536.ea7ec20a.4591c.ffffbfc2SMTPIN_ADDED_BROKEN@mx.google.com>
	<693FEC68-8F39-42E1-AF73-D709F9EAD441@gmail.com>
In-Reply-To: <693FEC68-8F39-42E1-AF73-D709F9EAD441@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.107]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs-postcommands: generate	/var/lib/systemd/clock
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
X-List-Received-Date: Thu, 16 Jun 2016 14:57:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: den 16 juni 2016 16:38
> To: Jan Remmet
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] rootfs-postcommands: generate
> /var/lib/systemd/clock
>=20
>=20
> > On Jun 16, 2016, at 7:17 AM, Jan Remmet <J.Remmet@phytec.de> wrote:
> >
> > On Wed, Jun 15, 2016 at 12:14:17PM -0700, Khem Raj wrote:
> >>
> >>> On Jun 15, 2016, at 6:36 AM, Jan Remmet <J.Remmet@phytec.de> wrote:
> >>>
> >>> systemd timesyncd check /var/lib/systemd/clock instead of
> >>> /etc/timestamp.
> >>> If this file is missing it defaults to TIME_EPOCH. It's set while
> >>> configuring systemd.
> >>>
> >>> Signed-off-by: Jan Remmet <j.remmet@phytec.de>
> >>> ---
> >>> meta/classes/rootfs-postcommands.bbclass | 6 ++++++
> >>> 1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass
> >>> index db8b551..0c7b764 100644
> >>> --- a/meta/classes/rootfs-postcommands.bbclass
> >>> +++ b/meta/classes/rootfs-postcommands.bbclass
> >>> @@ -234,6 +234,12 @@ python write_image_manifest () {
> >>> # sane default time setting
> >>> rootfs_update_timestamp () {
> >>> 	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
> >>> +
> >>> +	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true",
> "false", d)}; then
> >>> +		# touch needs timestamp as [[CC]YY]MMDDhhmm[.ss]
> >>> +		TS=3D$(sed 's/[.]*/&./13' ${IMAGE_ROOTFS}/etc/timestamp)
> >>> +		touch -t $TS ${IMAGE_ROOTFS}/var/lib/systemd/clock
> >>> +	fi
> >>> }
> >>
> >> i wonder if this will work with read only rootfs.
> > I found no special handling for systemd and /var/lib if
> > IMAGE_FEATURES read-only-rootfs is used.

If read-only-rootfs is used, then /var/lib is a bind mount to=20
/var/volatile/lib (which is a tmpfs). This is handled by the
volatile-binds recipe.

> > If timesyncd didn't find /var/lib/systemd/clock it defaults to the
> > configure time value und try to write /var/lib/systemd/clock. On=20
> > read-only it will silently fail.
> > So I don't see a problem here.
>=20
> It fixes one case when rootfs is r/w but create another behavior when
> its r/o in r/o case /var/lib/systemd must be mounted r/w during boot.
> So the timesyncd service should check for that directory to exist I=20
> have a hunch if thats checked then this patch may not be needed
>=20
> >
> > Jan

//Peter


