Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TEnxQ-00037M-Ch
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 23:06:48 +0200
Received: by wgbdq11 with SMTP id dq11so1801197wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2012 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mraRHLxv9enxVGpz5mz6nTjnKeePgJP1gy7KPSAaBro=;
	b=dSqsgoAlBUMRd5P82Amy4Jkgd3523tWWqjeQ58maHjLqxg+M6vR3iYqnD3CpvF4tR+
	KWY9/9eLmFxk2L1zUxuqwMNKmXFTcZk31Y1x7BoMk3mRD/4Sc+SdLlWKV95G6DCxbN6E
	8vxQf4rMx7+rhRSxBsLlQY27rTavvQTORsot0QUTOaMwpNJK1lMrDRXqLJETMyHvTb+E
	GiGcUjRWf5D2thWzWG+O98ueKaw772dyEWJOvihuch7SU8usI3gsnheSUDD3eDYToxa7
	q7Cv8sAwHtHbGHWV9k7KExUe7S948S48T/mCs/QUxTX/8kVuwvnKxKP/zbcltkvwCg4q
	nW/g==
Received: by 10.180.8.40 with SMTP id o8mr8194507wia.9.1348174445322;
	Thu, 20 Sep 2012 13:54:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm12621163wiy.4.2012.09.20.13.54.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Sep 2012 13:54:03 -0700 (PDT)
Date: Thu, 20 Sep 2012 22:54:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20120920205400.GC10268@jama.jama.net>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<CALbNGRTCyvfZFYHx6bKV8oVDJWH3X0tj1DHSJm9CkvT4xY2f7A@mail.gmail.com>
	<5059E5C3.2080603@intel.com>
	<CALbNGRS2WzGmRgM0ibnArYgbWWrRVG8VEYayXB12mLcKJmaPAA@mail.gmail.com>
	<CALbNGRST8C-p=M5V8KoVe5ug1MXwp5=7z2rUubEg_MxeR776Kw@mail.gmail.com>
	<505B5D26.5@intel.com>
MIME-Version: 1.0
In-Reply-To: <505B5D26.5@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 0/7] Postinstall improvements
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
X-List-Received-Date: Thu, 20 Sep 2012 21:06:48 -0000
X-Groupsio-MsgNum: 29615
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Content-Disposition: inline

--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 20, 2012 at 09:15:02PM +0300, Laurentiu Palcu wrote:
>=20
>=20
> On 09/20/2012 07:12 PM, Andreas M=FCller wrote:
> > On Thu, Sep 20, 2012 at 5:38 PM, Andreas M=FCller
> > <schnitzeltony@googlemail.com> wrote:
> >> On Wed, Sep 19, 2012 at 5:33 PM, Laurentiu Palcu
> >> <laurentiu.palcu@intel.com> wrote:
> >>>
> >>>
> >>> On 09/19/2012 04:41 PM, Andreas M=FCller wrote:
> >>>> On Wed, Sep 19, 2012 at 1:49 PM, Laurentiu Palcu
> >>>> <laurentiu.palcu@intel.com> wrote:
> >>>>> Hi,
> >>>>>
> >>>>> It's been quite a long time since I sent the first version of posti=
nstall
> >>>>> improvements which, after some debate, we decided it needed run-once
> >>>>> support of postinst scriptlets on host. This patcheset (RFC actuall=
y) adds
> >>>>> that.
> >>>>>
> >>>>> So, in order to achieve this goal I took advantage of
> >>>>> ROOTFS_POSTPROCESS_COMMAND variable. Basically, if running some pos=
tinst
> >>>>> scriptlets is time consuming (even on host) and execute repeatedly,
> >>>>> then we can postpone the running and run the scriplet just once. Th=
e idea is
> >>>>> to put the scriptlet in the ${WORKDIR}/intercept_scripts directory.=
 When the
> >>>>> ROOTFS_POSTPROCESS_COMMAND is executed, it will pick up all the scr=
ipts in
> >>>>> this directory and execute them.
> >>>>>
> >>>>> This actual patchset does the above for the gtk icon cache generati=
on which
> >>>>> takes a very long time to run on target and even on some hosts.
> >>>>>
> >>>>> The people willing to give this patchset a test, are most than welc=
ome. Also,
> >>>>> please feel free to review.
> >>>>>
> >>>>> Thanks,
> >>>>> Laurentiu
> >>>>>
> >>>> Thanks for taking care. I will give it a test tonight and hope to ha=
ve
> >>>> results tomorrow.
> >>> It would be great if you could give it a try and let me know your res=
ults.
> >>>
> >> I removed gtk-native append in meta-oe, build from scratch and tested
> Any special reason you removed it?

That BBCLASSEXTEND was in meta-oe for long time (for gtk+3):

http://lists.linuxtogo.org/pipermail/openembedded-commits/2012-January/0626=
22.html

Last time I've tried to merge that .bbappend to oe-core it was refused:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019648.ht=
ml

But now it's in oe-core and there is no reason to keep it in meta-oe too.

Cheers,

>=20
> >> the image. No issues so far - seems you have done a great job -
> >> Thanks!
> >>
> > Aargh I really would like to consider this done but I found suspicious
> > when browsing on the machine with the new image (hicolor- and
> > gnome-icon-theme installed):
> Let's hope we'll have it done soon. Thanks a lot for testing it. Can you
> instruct me what image did you use and give some more details in order
> to debug it on my side?
>=20
> >=20
> > * in the folder /usr/share/icons/gnome *no* icon-theme.cache is found
> > * /usr/share/icons/hicolor/icon-theme.cache is there but it has the
> > date of 01.01.2000 (have no rtc backup on the machine). I would expect
> > this file to have build host's date.
> >=20
> > So I checked the contents on the build machine in image's rootfs:
> >=20
> > * in the folder /usr/share/icons/gnome *no* icon-theme.cache is found
> That's weird... You could add some debug info in the intercept script
> itself to see if it really scans the gnome directory and if there are
> any errors.
>=20
> > * /usr/share/icons/hicolor/icon-theme.cache is there but has only
> > 64,5KB (the version on the machine is 2,3MB!!).
> On my build machine (I used Sato image) the icon-theme.cache has 2.5MB.
> There must be something wrong somewhere... At least this directory
> should have been cached properly.
>=20
> If you give all the details I asked above, I'll give it a try myself.
> >=20
> >=20
> > Andreas
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBbgmgACgkQN1Ujt2V2gBx/XwCffP6iRuWJH3spXYTomVzwPl5V
xfgAn3nUYsO0G8yq6l3Cd8gpeoR2GCDU
=oqKm
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--
