Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFMN8-0004w3-2h
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 11:23:55 +0100
Received: by mail-pb0-f43.google.com with SMTP id md12so4867892pbc.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 03:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=tTZqMCIjzrcqwTDRet1cJAcUrgKBs5gO3M/DXjny/bg=;
	b=Z2bmfXJ2LCoYIWvwVUA5O+gx6ToK2pSQKIyiNefCQO0vQv9YEX3YIo7Mdt981aKCft
	z+C/qBhSm1k20SLgPxXNoLTQdcoRCuBPdvW7V/jNnbiYe8KJUm8jlviq41wsHuMBSe7G
	jRouSIvrs6MYpqf/G1UQ7gSUZi7S9r1kTucY1ltocsAcxF/3kNvFGrtR/36X9989SEV9
	+XG5hORKvcZvnZDN3u+j0C/ST3TKj8KUTJadG0gA/9T29Si6tUrPMH2+bQ8o1069tiwC
	UFMgP1TrgogbYKq/gdNuEf7509D9ARGexHn8JwQdSo8XHRuN289hLbpJkDSLYMFedO1k
	/rdQ==
X-Received: by 10.68.224.1 with SMTP id qy1mr37045769pbc.169.1363082834113;
	Tue, 12 Mar 2013 03:07:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pn9sm24358511pbb.22.2013.03.12.03.07.10
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 03:07:12 -0700 (PDT)
Date: Tue, 12 Mar 2013 11:07:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130312100713.GJ9724@jama.dyndns-home.com>
References: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
	<1363010209-18220-3-git-send-email-cristian.iorga@intel.com>
	<20130312070053.GE9724@jama.dyndns-home.com>
	<CAJTo0LZtUg+fUrLd6sVfSk1gQrauyq60ukMg5jh-_kcgeaK0Lg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZtUg+fUrLd6sVfSk1gQrauyq60ukMg5jh-_kcgeaK0Lg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] bluez5: new package for v5.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 10:24:00 -0000
X-Groupsio-MsgNum: 36501
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="va4/JQ6j8/8uipEp"
Content-Disposition: inline

--va4/JQ6j8/8uipEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2013 at 02:24:30AM -0700, Burton, Ross wrote:
> Hi Martin,

Hi Ross,

> On 12 March 2013 00:00, Martin Jansa <martin.jansa@gmail.com> wrote:
> > And is that correct? I guess some files on target will conflict between
> > bluez4 and bluez5, so how is user/distro supposed to upgrade from 4 to
> > 5?
>=20
> You can't just upgrade from bluez4 to bluez5 like you'd upgrade from
> glib 2.10 to glib 2.12 - the API was totally rewritten and the reason
> that we're maintaining both is because removing bluez4 would mean
> removing bluetooth support is most of the integration points (connman
> being the notable exception).
>=20
> A distro upgrades from 4 to 5 when they've made the explicit decision
> to do so, and changes all of their dependencies to reflect this.

That would work with bluez_5.3 with negative D_P too, wouldn't it?

Now they need to refine RREPLACES/RCONFLICTS/RPROVIDES combo in distro
config too when they do explicit decision to change bluez version.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--va4/JQ6j8/8uipEp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE+/lEACgkQN1Ujt2V2gBzvpgCgsyGM3QVXuW9zz9Nq2kVmMPTA
pzoAn3p4u5s0v2o+rnlVUouZuqaitkXn
=taN2
-----END PGP SIGNATURE-----

--va4/JQ6j8/8uipEp--
