Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDAO4-0002NH-RX
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 10:07:16 +0200
Received: by eekc1 with SMTP id c1so697706eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=x2U+MXXwy0xuriBvk0UWpZOimtTpsHxBq9TaRQ7Egt8=;
	b=bS3Mq9Clr6Pngi0Wm4BXIDYG6aM1hNoFGlyfyHOdbEZh/f2DUJKnIANic3ckgG/wcS
	df/aEjLXiG/fY8yrMcmFMA7QCjSW5u+Vu4+cRXqllfVGX326iSl9HoB0a+V64SDpTIDR
	RXgFVFblbfbtr6UFm5ozBELnkF5qpS0j22fKdIqRp4E8zSvp156N/sTPozKZ6H1PWiTP
	k8fbkO3E0t2hSXAIrJZIYaBSQZK7+gWBlxpL6VsoiB2Aoxx2WalnZ6G+dhMAuN0PEeFs
	KB5+JoBYoD1kzU9iNyRPk0OAR1hUL6gTYAVfMqK1ZnSXUZqKsZnT84GjvUqaUpeNW43K
	zi2Q==
Received: by 10.180.107.104 with SMTP id hb8mr3110840wib.8.1333007893843;
	Thu, 29 Mar 2012 00:58:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg2sm25042479wib.7.2012.03.29.00.58.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 00:58:12 -0700 (PDT)
Date: Thu, 29 Mar 2012 09:58:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120329075812.GI4004@jama.jama.net>
References: <27A3051A-BC1D-4937-B936-42760021F584@dominion.thruhere.net>
	<1322240018.24330.37.camel@ted>
	<A23FAF45-E1BD-41B6-B8EA-92BC2C74E429@dominion.thruhere.net>
	<2E5909A2-C9B9-4228-9A16-0FD8F038A8C3@dominion.thruhere.net>
	<20111129114052.GE7441@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111129114052.GE7441@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: opkg-make-index cache failing
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
X-List-Received-Date: Thu, 29 Mar 2012 08:07:17 -0000
X-Groupsio-MsgNum: 19933
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EdRE1UL8d3mMOE6m"
Content-Disposition: inline

--EdRE1UL8d3mMOE6m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 12:40:52PM +0100, Martin Jansa wrote:
> On Fri, Nov 25, 2011 at 08:59:06PM +0100, Koen Kooi wrote:
> >=20
> > Op 25 nov. 2011, om 19:15 heeft Koen Kooi het volgende geschreven:
> >=20
> > >=20
> > > Op 25 nov. 2011, om 17:53 heeft Richard Purdie het volgende geschreve=
n:
> > >=20
> > >> On Fri, 2011-11-25 at 16:38 +0100, Koen Kooi wrote:
> > >>> In OE-classic the opkg-make-index cache was working pretty well,
> > >>> do_rootfs only spent a few seconds doing opkg-make-index on
> > >>> incremental builds. In the OE-core world the situation is different,
> > >>> opkg-make-index will reindex every package on each do_rootfs run, so
> > >>> after a while building images starts taking *really* long, on my
> > >>> systemd (work/ on ssd, deploy on rotating media) it now takes
> > >>> =B17minutes just do refresh the opkg indices.
> > >>>=20
> > >>> Since I can't blame sstate for this I suspect that pseudo gets in t=
he
> > >>> way of the naive caching logic. Is there a simple way to turn off
> > >>> pseudo when running opkg-make-index?
> > >=20
> > > With a relatively small deploy:
> > >=20
> > > real	6m14.611s
> > > user	2m45.909s
> > > sys	0m43.674s
> > >=20
> > >> You could try:
> > >>=20
> > >> PSEUDO_DISABLED=3D1 opkg-make-index
> > >=20
> > > real	5m25.920s
> > > user	2m41.279s
> > > sys	0m41.681s
> > >=20
> > >> or even
> > >>=20
> > >> PSEUDO_UNLOAD=3D1 opkg-make-index
> > >=20
> > > real	5m5.699s
> > > user	2m37.283s
> > > sys	0m37.508s
> > >=20
> > > Now I need to double check to see if  the patches are really having e=
ffect on the opkg caching instead of just not having pseudo overhead.
> >=20
> > Retesting without PSEUDO changes:
> >=20
> > real    5m18.412s
> > user    2m40.736s
> > sys     0m41.374s
> >=20
> > So the PSEUDO changes don't seem to do much :(
>=20
> I can confirm this change here too:
> OE om-gta02@shr ~/shr-core $ time /usr/bin/python2.7 \
> /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/opkg-make-index \
> -r /OE/shr-core/tmp/deploy/ipk/armv4t/Packages \
> -p /OE/shr-core/tmp/deploy/ipk/armv4t/Packages \
> -l /OE/shr-core/tmp/deploy/ipk/armv4t/Packages.filelist \
> -m /OE/shr-core/tmp/deploy/ipk/armv4t/
>=20
>=20
> real    11m47.949s
> user    4m13.848s
> sys     0m17.917s
>=20
> It hurts even more when someone is building ie for spitz and
> linux-kexecboot depends on initramfs image which calls another=20
> opkg-make-index with every image build.
>=20
> If I replace opkg-make-index from oe-core with old oe-classic version, I
> get a lot of messages like:
> "Lost field license, MIT-X"
>=20
> but the time is similar
> real    10m23.953s
> user    4m10.940s
> sys     0m15.833s
>=20
> And if I do the same completely in shr-unstable (based on OE-classic)
> OE om-gta02@shr ~/shr-unstable $ time /usr/bin/python2.7 \
> /OE/shr-unstable/tmp/sysroots/x86_64-linux/usr/bin/opkg-make-index \
> -r /OE/shr-unstable/tmp/deploy/ipk/armv4t/Packages \
> -p /OE/shr-unstable/tmp/deploy/ipk/armv4t/Packages \
> -l /OE/shr-unstable/tmp/deploy/ipk/armv4t/Packages.filelist \
> -m /OE/shr-unstable/tmp/deploy/ipk/armv4t/
>=20
>=20
> real    0m6.469s
> user    0m6.056s
> sys     0m0.400s
>=20
> Another difference seems to be in Packages.filelist which were empty in
> OE-classic:
>=20
> OE om-gta02@shr ~/shr-core $ find tmp/deploy/ipk/ -name Packages.filelist=
 -exec wc -l {} \;
> 1173 tmp/deploy/ipk/palmpre2/Packages.filelist
> 1254 tmp/deploy/ipk/palmpre/Packages.filelist
> 107346 tmp/deploy/ipk/armv4t/Packages.filelist
> 110557 tmp/deploy/ipk/armv7a-vfp-neon/Packages.filelist
> 0 tmp/deploy/ipk/Packages.filelist
> 1365 tmp/deploy/ipk/nokia900/Packages.filelist
> 812 tmp/deploy/ipk/all/Packages.filelist
> 1643 tmp/deploy/ipk/om_gta02/Packages.filelist
> OE om-gta02@shr ~/shr-core $ cd ../shr-unstable/
> OE om-gta02@shr ~/shr-unstable $ find tmp/deploy/ipk/ -name Packages.file=
list -exec wc -l {} \;
> 0 tmp/deploy/ipk/armv7a/Packages.filelist
> 0 tmp/deploy/ipk/om-gta01/Packages.filelist
> 0 tmp/deploy/ipk/om-gta02/Packages.filelist
> 0 tmp/deploy/ipk/palmpre2/Packages.filelist
> 0 tmp/deploy/ipk/armv6/Packages.filelist
> 0 tmp/deploy/ipk/palmpre/Packages.filelist
> 0 tmp/deploy/ipk/armv4t/Packages.filelist
> 0 tmp/deploy/ipk/armv4/Packages.filelist
> 0 tmp/deploy/ipk/armv6-novfp/Packages.filelist
> 0 tmp/deploy/ipk/Packages.filelist
> 0 tmp/deploy/ipk/htcdream/Packages.filelist
> 0 tmp/deploy/ipk/nokia900/Packages.filelist
> 0 tmp/deploy/ipk/all/Packages.filelist
> 0 tmp/deploy/ipk/armv7/Packages.filelist
>=20
> But that's not the cause, because even without Packages.filelist
> generation it takes about 3 min (better but it still writes info for
> every package).
>=20
> Weird is that there is only small diff between new and old opkg.py/opkg-m=
ake-index
> --- /OE/shr-unstable/tmp/sysroots/x86_64-linux/usr/bin/opkg.py  2011-05-2=
7 18:35:03.000000000 +0200
> +++ /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/opkg.py      2011-09-0=
1 16:36:35.000000000 +0200
> @@ -145,6 +145,7 @@
>          self.priority =3D None
>          self.tags =3D None
>          self.fn =3D fn
> +        self.license =3D None
>=20
>          if fn:
>              # see if it is deb format
> @@ -319,6 +320,12 @@
>      def get_section(self, section):
>          return self.section
>=20
> +    def set_license(self, license):
> +        self.license =3D license
> +
> +    def get_license(self, license):
> +        return self.license
> +
>      def get_file_list(self):
>          if not self.fn:
>              return []
> @@ -425,6 +432,7 @@
>          if self.description: out =3D out + "Description: %s\n" % (self.d=
escription)
>          if self.oe: out =3D out + "OE: %s\n" % (self.oe)
>          if self.homepage: out =3D out + "HomePage: %s\n" % (self.homepag=
e)
> +        if self.license: out =3D out + "License: %s\n" % (self.license)
>          if self.priority: out =3D out + "Priority: %s\n" % (self.priorit=
y)
>          if self.tags: out =3D out + "Tags: %s\n" % (self.tags)
>          out =3D out + "\n"
> (reverse-i-search)`uNr': diff -^Cr ~/common/conf/shr-core/ conf/
>=20
> --- /OE/shr-unstable/tmp/sysroots/x86_64-linux/usr/bin/opkg-make-index  2=
011-05-27 18:35:03.000000000 +0200
> +++ /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/opkg-make-index      2=
011-11-29 12:32:39.000000000 +0100
> @@ -197,7 +197,15 @@
>  names =3D packages.packages.keys()
>  names.sort()
>  for name in names:
> -     for fn in packages[name].get_file_list():
> +     try:
> +          fnlist =3D packages[name].get_file_list()
> +     except OSError, e:
> +          sys.stderr.write("Package %s disappeared on us!\n" % (name))
> +          continue
> +     except IOError, e:
> +          sys.stderr.write("Package %s disappeared on us!\n" % (name))
> +          continue
> +     for fn in fnlist:
>            (h,t) =3D os.path.split(fn)
>            if not t: continue
>            if not files.has_key(t): files[t] =3D name+':'+fn
>=20
>=20
> Regards,
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

Today I did some more tests and started using simple bash script to
reindex all Packages files just once (instead of rebuilding common arch
many times with bitbake package-index).

OPKG_MAKE_INDEX=3D~/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/opkg-=
make-index
DEPLOY_IPK=3D~/shr-core/tmp-eglibc/deploy/ipk/
for PACKAGE_FILE in `find ${DEPLOY_IPK} -name Packages`; do
  PACKAGE_DIR=3D`dirname ${PACKAGE_FILE}`
  touch ${PACKAGE_FILE}
  echo "Regenerating ${PACKAGE_FILE}"
  time flock ${PACKAGE_FILE}.flock -c "${OPKG_MAKE_INDEX} -r ${PACKAGE_FILE=
} -p ${PACKAGE_FILE} -l ${PACKAGE_FILE}.filelist -m ${PACKAGE_DIR}/"
done

And on my machine it takes really long to finish
real    26m40.108s
user    23m6.673s
sys     0m14.464s

So I'll look into opkg-make-index changes again and to make it easier I wou=
ld like=20
to move all oe-core local patches:
http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/op=
kg-utils/opkg-utils
to yocto git repo:
http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/
should I send pull-request for opkg-utils repo here or somewhere else? e.g.=
 yocto ML?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EdRE1UL8d3mMOE6m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk90FhQACgkQN1Ujt2V2gBxnhQCeOd+3B5BVTite2A7wiymXcbK2
o+kAnRq2B3Z9HcXDh5WTCA/K+AfGsjhZ
=o9Q9
-----END PGP SIGNATURE-----

--EdRE1UL8d3mMOE6m--
