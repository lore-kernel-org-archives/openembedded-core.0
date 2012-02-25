Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S1JA4-0007Aj-Kd for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 16:03:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1PEtPfV020903
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 14:55:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19581-06 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 14:55:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1PEtFVX020897
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 14:55:17 GMT
Message-ID: <1330181716.13788.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 25 Feb 2012 14:55:16 +0000
In-Reply-To: <17057774.C0TjevbrGC@kgy>
References: <17057774.C0TjevbrGC@kgy>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q1PEtPfV020903
Subject: Re: empty dirs in glib-2.0
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
X-List-Received-Date: Sat, 25 Feb 2012 15:03:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-02-25 at 13:26 +0100, K=C3=B6vesdi Gy=C3=B6rgy wrote:
> Hi,
>=20
> Compiling the Angstrom Linux, in the file openembedded-core/meta/recipe=
s-
> core/glib-2.0/glib-2.0_2.30.2.bb (a85f283ffae5407b23532ce2262142ee2d986=
af2)=20
> there are the followings:
>=20
> do_install_append() {
>   # remove some unpackaged files
>   rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
>   rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
>   # and empty dirs
>   rmdir ${D}${libdir}/gio/modules/
>   rmdir ${D}${libdir}/gio/
> }
>=20
> I have problems with the "empty dirs" section: the directory is not emp=
ty and=20
> therefore the installation fails here.
> I replaced it with "rm -rf ..." and now it worx but i do not sure it is=
 a good=20
> solution.
> Why these directories are expected to be empty? What does it mean if th=
ey are=20
> not?

rmdir was used specifically so we'd know if the directory wasn't empty.
What files are in there?

Are there any .bbappends to the glib recipe in any of your other layers?

Cheers,

Richard



