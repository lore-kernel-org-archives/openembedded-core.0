Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UdKuN-0000fr-S8
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 15:41:22 +0200
Received: by mail-ee0-f48.google.com with SMTP id b47so2589958eek.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 06:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=fk3r/9YNhPWljpN3AKQUgz4jQCx9YQ2nfQEjBNKrFZQ=;
	b=v1xLZKP/KVmVFGUmWEKwD4cFDdc6S7Puv9AofTicIf9sEHJTY8fnEO8hEpK/Qd/Hrz
	rjj6H4XyeZwR7gZuz0PyxiI9EkRXu6JwQgLcllrQqq269LB7viLsms7WhUQ5KTDxd/68
	hHCAvUt8GDcR9YUuWeN/B4c2e0NFGpzpA1GdLCr8myixIqC38JyqgoW84mcTu6V5NWtE
	Bck7bE/MSgbmWcV1huEOR2sDSEvtNQlxqcLjCSVWeEYzuf8I9Z9Cih+XB0DpDh9QyCrl
	bX6owwg0s30lvduNHxaLl2A3eBCderE/2YbEqZR+3a4SiFEP9f+1c/nnPL/3R1G4qMj/
	4dsA==
X-Received: by 10.15.33.195 with SMTP id c43mr89904544eev.2.1368796984396;
	Fri, 17 May 2013 06:23:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bp51sm18719869eeb.5.2013.05.17.06.23.02 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 17 May 2013 06:23:03 -0700 (PDT)
Date: Fri, 17 May 2013 15:23:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20130517132314.GK24809@jama.dyndns-home.com>
References: <1368689187-4714-1-git-send-email-xiao.zhang@windriver.com>
	<1368689187-4714-2-git-send-email-xiao.zhang@windriver.com>
	<5194AE0D.8030508@windriver.com> <5195D693.9090003@linux.intel.com>
	<5195FBBA.6030309@topic.nl>
	<20130517101526.GI24809@jama.dyndns-home.com>
	<51960BB9.5000706@topic.nl>
MIME-Version: 1.0
In-Reply-To: <51960BB9.5000706@topic.nl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: package_write_ipk somehow looks into the wrong path
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
X-List-Received-Date: Fri, 17 May 2013 13:41:25 -0000
X-Groupsio-MsgNum: 39400
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7l042bGvurpep9Wg"
Content-Disposition: inline

--7l042bGvurpep9Wg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2013 at 12:51:37PM +0200, Mike Looijmans wrote:
> On 05/17/2013 12:15 PM, Martin Jansa wrote:
> > On Fri, May 17, 2013 at 11:43:22AM +0200, Mike Looijmans wrote:
> >>
> >> I got this very weird build failure. It builds fine for one machine
> >> (zedboard), but it craps out in a really weird way on the "zynq-zc702"
> >> machine.
> >>
> >> Somehow the "package_write_ipk" task wants to find files in a directory
> >> with "1-r0" (a version that has once existed a long long time ago) in
> >> the version part, instead of the proper git hashed name.
> >>
> >> I've tried a "cleansstate" but that did not help. The "compile" step in
> >> this recipe takes about 1,5 hour on my i7 system, so debugging this
> >> recipe is painfully slow...
> >>
> >> I've attached the recipes, pasted the log below.
> >
> > try it with 2/2 patch from
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4102
> >
>=20
> I somehow fail to extract the patch from the mail correctly (probably=20
> lack of skilz on my side, I am not often at the receiving end of mailed=
=20
> patches).

Patchwork makes it a lot easier:
http://patchwork.openembedded.org/patch/47329/

> But my recipe does mess with the PV string because the Xilinx tools will=
=20
> fail to work properly when there is a "+" sign in the path. I'll try to=
=20
> fix it in a more proper way than using a python replace, see if that help=
s.

It could be caused by something else, just the error message looks the
same when your recipe was built with different PV in different
architecture before (that's what referenced patch detects and shows
better error message then "No such file" later).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7l042bGvurpep9Wg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGWL0IACgkQN1Ujt2V2gBwFIACgmtX1acbLzeADd7Ok6h1IX0LQ
+TUAniHhW2zJl5KivI9v18Zb4NMXaevf
=jmD+
-----END PGP SIGNATURE-----

--7l042bGvurpep9Wg--
