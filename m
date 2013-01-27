Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hchapman-oecore@3gfp.com>) id 1TzbTm-0007u7-Dj
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 00:17:38 +0100
X-Authority-Analysis: v=2.0 cv=W/m6pGqk c=1 sm=0 a=0BEmelG+NCIkmYz4MtfDKA==:17
	a=KAMKcUAUZugA:10 a=QyJNhWbWBEYA:10 a=h1JwTc6auzgA:10
	a=wPDyFdB5xvgA:10 a=kj9zAlcOel0A:10 a=cL4bF6sHAAAA:8
	a=hQ3ypW5fEB4A:10 a=HihYlcsHAAAA:8 a=8yU60a1Q462IN4eaCLUA:9
	a=CjuIK1q_8ugA:10 a=0BEmelG+NCIkmYz4MtfDKA==:117
X-Cloudmark-Score: 0
X-Authenticated-User: 
X-Originating-IP: 65.34.9.19
Received: from [65.34.9.19] ([65.34.9.19:44105] helo=blue.3gfp.com)
	by hrndva-oedge02.mail.rr.com (envelope-from
	<hchapman-oecore@3gfp.com>) (ecelerity 2.2.3.46 r()) with ESMTP
	id 1D/B4-08009-AA1B5015; Sun, 27 Jan 2013 23:00:59 +0000
Received: from localhost (localhost [127.0.0.1])
	by blue.3gfp.com (Postfix) with ESMTP id 2E38A1080071;
	Sun, 27 Jan 2013 18:00:57 -0500 (EST)
X-Virus-Scanned: by amavisd-new-2.6.4 (20090625) (Debian) at 3gfp.com
Received: from blue.3gfp.com ([127.0.0.1])
	by localhost (blue.3gfp.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWP-gAigQohQ; Sun, 27 Jan 2013 18:00:51 -0500 (EST)
Received: from [192.168.1.26] (65349hfc19.tampabay.res.rr.com [65.34.9.19])
	by blue.3gfp.com (Postfix) with ESMTPSA id 221681080497;
	Sun, 27 Jan 2013 18:00:49 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Harvey Chapman <hchapman-oecore@3gfp.com>
In-Reply-To: <alpine.DEB.2.02.1301271622090.24073@oneiric>
Date: Sun, 27 Jan 2013 18:00:49 -0500
Message-Id: <F9201BC4-B773-4B6F-B404-7C5ECCC66BE6@3gfp.com>
References: <alpine.DEB.2.02.1301271622090.24073@oneiric>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.1499)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to tweak a kernel recipe file to point at a local git repo?
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
X-List-Received-Date: Sun, 27 Jan 2013 23:17:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Jan 27, 2013, at 4:26 PM, "Robert P. J. Day" <rpjday@crashcourse.ca> =
wrote:

> SRC_URI +=3D =
"git://arago-project.org/git/projects/linux-davinci.git;protocol=3Dgit;bra=
nch=3D${BRANCH} \
>        file://defconfig"
> =3D=3D=3D=3D=3D snip =3D=3D=3D=3D=3D
>=20
>  now i already *have* that repo cloned on my local hard drive, so
> what would i change in the recipe file (just temporarily) to point the
> fetcher there?  i would only need to do that once since i've set up my

Something like this:

SRC_URI =3D =
"git:///home/hchapman/kernel.git;branch=3Domap-3.5;protocol=3Dfile"



