Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SujbT-0004Ke-S3
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:25:11 +0200
Received: by weyr6 with SMTP id r6so1843662wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 05:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PmKpfgg9wkB+7PTdVt6VcLeEgEIsStWG+zI/MbL0SLM=;
	b=MzHdV0ZuTHEUttlMP5vyCd/KdgkuBSVZOE0NFH4JFF2gOPykowkQqsvsU74Lc0Khr/
	wscwSJPC9uCFrLij3hD9MTJ+wBqwZ0g50hAgKL+ZQz+WaBFpH03IO2Cl5rRzbjyEoFQw
	h794AcGmO4GWWSWPwppNoQllpzmAxCD4L+ln6SEQUsCqbs5NtGB+vFS5Gyw5sA8yz26G
	8ZoozzI1+ZoXH6bQDQGDThifRGVV4uyz9z6FZlRGF39iAxIKVVtD7Z+LswAgfPvxOubL
	h/SiP+NqpSfLVAqaZVRPz1yQKEB4/Pf50ouWkenh9SicaqasthyRaifp6E8o6HCDmP5Y
	n0OA==
Received: by 10.180.86.133 with SMTP id p5mr5667963wiz.17.1343391220054;
	Fri, 27 Jul 2012 05:13:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm6084075wix.6.2012.07.27.05.13.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 05:13:37 -0700 (PDT)
Date: Fri, 27 Jul 2012 14:13:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120727121344.GL3621@jama.jama.net>
References: <20120726135324.6971710217@opal>
	<20120727110521.GH3621@jama.jama.net>
	<20120727115256.GK3621@jama.jama.net>
	<1343390744.5878.101.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1343390744.5878.101.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Cristian Iorga : libpcap: upgrade to ver. 1.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2012 12:25:11 -0000
X-Groupsio-MsgNum: 26390
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sCNd3Ivk/oijKKf1"
Content-Disposition: inline

--sCNd3Ivk/oijKKf1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2012 at 01:05:43PM +0100, Phil Blundell wrote:
> On Fri, 2012-07-27 at 13:52 +0200, Martin Jansa wrote:
> >  * check_data_file_clashes: Package libpcap1 wants to install file /usr=
/lib/libpcap.so.1
> >         But that file is already provided by package  * libpcap
> >  * check_data_file_clashes: Package libpcap1 wants to install file /usr=
/lib/libpcap.so.1
> >         But that file is already provided by package  * libpcap
>=20
> If the old library was also libpcap.so.1, why has the package name
> changed?  You said in your first mail that the patch "changes .so
> version" but if that was the case then there oughtn't to have been a
> file conflict here.

True, I haven't seen this error before sending my first reply. So I've
assumed that it was libpcap0 before and I was wrong.=20

The real reason for package rename was that before this upgrade libpcap=20
package contained also pcap-config (so debian naming wasn't used):

http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=3D85d=
ae3abafee082905ffb5b9f1a2072e8f3eb047#patch190

Once again https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2787 proves
to be usefull..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sCNd3Ivk/oijKKf1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAShfgACgkQN1Ujt2V2gByUUQCfTBZCfwQozPHD+iLRGJoBPj3o
wJcAnRpYSdCZ31C90W9wo7cXlhyE2Sro
=aZfZ
-----END PGP SIGNATURE-----

--sCNd3Ivk/oijKKf1--
