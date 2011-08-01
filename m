Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QnqS8-0005SB-9n
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 13:14:33 +0200
Received: by wwi18 with SMTP id 18so4634258wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 04:10:12 -0700 (PDT)
Received: by 10.216.156.207 with SMTP id m57mr586809wek.44.1312197012127;
	Mon, 01 Aug 2011 04:10:12 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w45sm3253852wec.24.2011.08.01.04.10.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 04:10:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1312195779.git.lianhao.lu@intel.com>
Date: Mon, 1 Aug 2011 13:09:57 +0200
Message-Id: <7798C216-D0A4-422F-BC0C-5C875CFC1433@dominion.thruhere.net>
References: <cover.1312195779.git.lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH BUG #1236 0/3] Unify ldd/ldconfig for all multilib eglibcs
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
X-List-Received-Date: Mon, 01 Aug 2011 11:14:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 aug. 2011, om 13:01 heeft Lianhao Lu het volgende geschreven:

> This series of patch allow all the eglibc(s) in the current multilib=20=

> configuration have the same ldd/ldconfig settings.=20
>=20
> We put the dynamic loaders'(ld.so) names in the dictionary of =
"ld_info_all"=20
> defined in the file eglibc-ld.inc. This dictionary is indexed by the=20=

> TUNENAME. To support a new ABI, new entry should be added into this=20
> dictionary along with the new ABI's TUNENAME.
>=20
> The information in ld_info_all can be used for both ldd script and =
ldconfig=20
> binary.
>=20
> The following changes since commit =
f94b781695cd8fa387daff16ecbf3987a0883018:
>  Bruce Ashfield (1):
>        poky.conf: explicitly referenced preferred linux-yocto version
>=20
> are available in the git repository at:
>=20
>  git://git.pokylinux.org/poky-contrib llu/bug1236
>  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dllu/bug1236

That branch is against poky, making it really hard for people to test =
the patches against the oe-core repo you're submitting it against. =
Please base patches against the oe-core repo when you send them to the =
oe-core mailinglist.=


