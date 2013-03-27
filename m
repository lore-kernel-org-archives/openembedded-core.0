Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UKoII-0000YP-Q9 for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 12:13:33 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2RB4Qn2006663; Wed, 27 Mar 2013 11:06:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bm2BitTi-8iq; Wed, 27 Mar 2013 11:06:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2RB61id006825
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 27 Mar 2013 11:06:04 GMT
Message-ID: <1364381760.28471.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Mar 2013 10:56:00 +0000
In-Reply-To: <CAJTo0LbxZfG5M4koRxRFCLDmfjxn2afT2Sd=cfFvr04BoU=i7g@mail.gmail.com>
References: <1364255259-2920-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lb8-CbnMtcxgximM7W_2YxbexGB49VLM+HbEqQrWHGpYg@mail.gmail.com>
	<CALbNGRQVd3yi7bEuCO_Yyh_RVnnfcB0k9yMG3jHg_BCF9=2Reg@mail.gmail.com>
	<1364298513.3097.75.camel@ted>
	<CALbNGRSvGR75F4-bg123eQhTFaM_ex9Rs=Hyo2-Y6o8m2v9w0Q@mail.gmail.com>
	<1364340556.28471.2.camel@ted>
	<CALbNGRQE4kGAmeXQ2TqfVqb4rFkQeQJua6COxBEvQNh-FbAKSg@mail.gmail.com>
	<CALbNGRTq6A9RoAdyHXeun_vhmsgEyRgV8wSY+xCdRsS7-BdPJA@mail.gmail.com>
	<CAJTo0LbxZfG5M4koRxRFCLDmfjxn2afT2Sd=cfFvr04BoU=i7g@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r2RB4Qn2006663
Cc: otavio@ossystems.com.br, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+: don't provide gtk-update-icon-cache-native
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
X-List-Received-Date: Wed, 27 Mar 2013 11:13:46 -0000
X-List-Received-Date: Wed, 27 Mar 2013 11:13:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-03-27 at 10:23 +0000, Burton, Ross wrote:
> Hi Andreas,
>=20
> On 27 March 2013 08:27, Andreas M=C3=BCller <schnitzeltony@googlemail.c=
om> wrote:
> > meta-browser: chromium
>=20
> The latest commit to the Chromium 24 recipe changes gtk+-native to
> gtk+, so it appears that any gtk+-native references you're seeing are
> bad and the same fix should be applied to the other versions.
>=20
> > openembedded-core: packagegroup-toolset-native
>=20
> This is a packagegroup that builds ~all of the native packages.
>=20
> > openembedded-core: sstate.bbclass
>=20
>     def isPostInstDep(x):
>         if x in ["qemu-native", "gdk-pixbuf-native", "gtk+-native",
> "qemuwrapper-cross", "depmodwrapper-cross",
> "systemd-systemctl-native", "gtk-update-icon-cache-native"]:
>             return True
>         return False
>=20
> Some sstate black magic.

That can just be removed if we don't use gtk+-native in any postinsts
which I don't believe we do now...

> > openembedded-core: seperatebuilddir.inc
>=20
> Just a variable saying it can be built out of tree.

Right, that can also just be dropped.

> packagegroup-toolset-native is the only place that actually uses
> gtk+-native, so anyone actually using that for whatever purpose will
> need to set the preferred provider.

This can also just get dropped, it was only there to allow building the
collection of native recipes.

So as far as I'm concerned all these references can just be removed.

Cheers,

Richard




