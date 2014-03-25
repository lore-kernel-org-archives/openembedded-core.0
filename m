Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 98B546FA65
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 05:50:30 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so5113124eei.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 22:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AtLht8U+tbKoODIeIDa0QAp3VSs22LbM7wLrhcZq2lQ=;
	b=vu1b2+S07q582vQfryOW2K8XzNZewQFIiTzqXrkxQxDNNOQNtOaLn5S6YWj3cqKAgt
	tp49yEIBzcdHgH/G8yHRGURP7cGjTcXYd9g7+Z9Cpk2L+TgXAPsCeSIw9Kqxp/J7NE73
	4VEjIVwZIaBGsNBx5mqnahzkmjo2KAGOd2ILVh87TjKoQ8nP5qDgM7Y0iNfJQd4Wf9lN
	uAzoTFt1TFDnZfX07wsn070wZVFzuD7z9dQBKYqQHz8UwfG7TPTv7KPDpQXJNpSq3scL
	hrnZI212X2MevlZlJY54lmGYdskvRXd5cehno2Sjd2EKes14YgQ5qnMUY4dWmuNW/Kxl
	CCCQ==
X-Received: by 10.15.44.3 with SMTP id y3mr1295545eev.58.1395726631306;
	Mon, 24 Mar 2014 22:50:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bc51sm37934500eeb.22.2014.03.24.22.50.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Mar 2014 22:50:29 -0700 (PDT)
Date: Tue, 25 Mar 2014 06:50:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20140325055028.GA3710@jama>
References: <1395676843.24890.7.camel@ted>
 <5330C9A8.904@linaro.org>
MIME-Version: 1.0
In-Reply-To: <5330C9A8.904@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: --conf Was: Features in Yocto Project 1.7
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
X-List-Received-Date: Tue, 25 Mar 2014 05:50:32 -0000
X-Groupsio-MsgNum: 51544
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2014 at 08:11:20PM -0400, Trevor Woerner wrote:
> On 03/24/14 12:00, Richard Purdie wrote:
> > I think from my perspective, in 1.7 I'd like to see us looking at
> > "Developer Workflow".
>=20
> Maybe I'm using things incorrectly :-)
>=20
> But I often find that I'm switching between building different images.
> For example, one moment I might be building core-image-minimal (CIM),
> then later I'll want to build a GUI image with Wayland.
>=20
> Switching between CIM and the GUI image requires changes to both
> conf/local.conf and conf/bblayers.conf. I will either have two separate
> sets of files and symlink between them, or I'll need to edit them by
> hand to comment/uncomment out various blocks. I often get this wrong and
> will need to restart a couple times before the build can hope to
> complete successfully.
>=20
> If I could wish for one workflow change, it would be the ability to
> switch between various build configurations with the minimum of fuss:
> - maybe the layer information could be contained within the
> configuration file, then on the bitbake cmdline I could just say
> "bitbake --conf wayland" or "bitbake --conf mycim" and it would know to
> find and use conf/wayland.conf or conf/mycim.conf?
> - maybe the local.conf could be renamed wayland.conf and the
> bblayers.conf could be renamed wayland.bblayers then I could type
> "bitbake --conf wayland" and it would know to look for wayland.conf and
> wayland.bblayers?
>=20
> Does this sort of workflow make sense to others? Or have people noticed
> this and solved it in some clever way?

Can you show some example of config you need to have wor wayland and
cannot have for core-image-minimal?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMxGSQACgkQN1Ujt2V2gBzXqgCgt7v5522+FkIZ8dEYamLfGSN4
btEAn2tNrQlmPvGNAKic9NkiX91itfT1
=IIGb
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
