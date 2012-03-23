Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB7cP-00083R-V7
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 17:45:38 +0100
Received: by wera1 with SMTP id a1so2804150wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gEjjeGKuoSuOuh5v1iaZpNiYKyHrTXHf88Y1vOb/+NQ=;
	b=vz3TdIsj0bMr+sMNpyEAuSFHvdZvE8GYx+zL8rNQxKK4kytlSQdwe0p+a5Hubvx6bA
	zyjQTgIWukRtiu0Afg3AXV3/40pvBcN7AUysn3MZmhakZmnxBYJ3hMpKwM6NdIOfnAnx
	R05JhatYwpD9eiakyZmhiFdRa05owZbde/EBR717VrN8NWuxTfB1hbb5F9yt3TeYfsXu
	2FrctTTd46De7Hcx1UMVawFrkPfN42mzbOGte/jHzQbWxPN3oKt+CGva+TEulMOxGuey
	VpxVXoVOgAEjPazVHCutjiCMGt1a/S3pVPSZFrEDGovuDutIvDrHJ96uh7pNPtP1h6eh
	7yHg==
Received: by 10.216.135.199 with SMTP id u49mr7700546wei.7.1332520601454;
	Fri, 23 Mar 2012 09:36:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gp8sm15057548wib.5.2012.03.23.09.36.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 09:36:40 -0700 (PDT)
Date: Fri, 23 Mar 2012 17:36:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120323163641.GL3879@jama.jama.net>
References: <1332516428-9675-1-git-send-email-gary@mlbassoc.com>
	<1332516428-9675-3-git-send-email-gary@mlbassoc.com>
	<20120323153553.GJ3879@jama.jama.net>
	<20120323154819.GK3879@jama.jama.net>
	<4F6CA27B.5050800@mlbassoc.com> <4F6CA4C7.3080600@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4F6CA4C7.3080600@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] python: Fix minimal packaging dependencies
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
X-List-Received-Date: Fri, 23 Mar 2012 16:45:38 -0000
X-Groupsio-MsgNum: 19584
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eMP3JyRexyk9c0Bv"
Content-Disposition: inline

--eMP3JyRexyk9c0Bv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 10:28:55AM -0600, Gary Thomas wrote:
> On 2012-03-23 10:19, Gary Thomas wrote:
> > On 2012-03-23 09:48, Martin Jansa wrote:
> >> On Fri, Mar 23, 2012 at 04:35:53PM +0100, Martin Jansa wrote:
> >>> On Fri, Mar 23, 2012 at 09:27:08AM -0600, Gary Thomas wrote:
> >>>> If you install the top-level python package only on a minimal
> >>>> system which has no other python packages installed then python
> >>>> is not functional at all. Without any extra packages installed
> >>>> this error is seen:
> >>>> # python
> >>>> Traceback (most recent call last):
> >>>> File "/usr/lib/python2.7/site.py", line 64, in<module>
> >>>> import traceback
> >>>> ImportError: No module named traceback
> >>>>
> >>>> Installing python-lang only partly fixes the problem as this
> >>>> error still exists:
> >>>> # python
> >>>> Traceback (most recent call last):
> >>>> File "/usr/lib/python2.7/site.py", line 569, in<module>
> >>>> main()
> >>>> File "/usr/lib/python2.7/site.py", line 551, in main
> >>>> known_paths =3D addusersitepackages(known_paths)
> >>>> File "/usr/lib/python2.7/site.py", line 278, in addusersitepackages
> >>>> user_site =3D getusersitepackages()
> >>>> File "/usr/lib/python2.7/site.py", line 253, in getusersitepackages
> >>>> user_base =3D getuserbase() # this will also set USER_BASE
> >>>> File "/usr/lib/python2.7/site.py", line 243, in getuserbase
> >>>> USER_BASE =3D get_config_var('userbase')
> >>>> File "/usr/lib/python2.7/sysconfig.py", line 520, in get_config_var
> >>>> return get_config_vars().get(name)
> >>>> File "/usr/lib/python2.7/sysconfig.py", line 400, in get_config_vars
> >>>> import re
> >>>> ImportError: No module named re
> >>>>
> >>>> Signed-off-by: Gary Thomas<gary@mlbassoc.com>
> >>>> ---
> >>>> meta/recipes-devtools/python/python_2.7.2.bb | 3 ++-
> >>>> 1 files changed, 2 insertions(+), 1 deletions(-)
> >>>>
> >>>> diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/rec=
ipes-devtools/python/python_2.7.2.bb
> >>>> index 8111b31..f1ba42d 100644
> >>>> --- a/meta/recipes-devtools/python/python_2.7.2.bb
> >>>> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> >>>> @@ -1,6 +1,6 @@
> >>>> require python.inc
> >>>> DEPENDS =3D "python-native bzip2 db gdbm openssl readline sqlite3 zl=
ib"
> >>>> -PR =3D "${INC_PR}.8"
> >>>> +PR =3D "${INC_PR}.9"
> >>>>
> >>>> DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
> >>>> DISTRO_SRC_URI_linuxstdbase =3D ""
> >>>> @@ -123,6 +123,7 @@ py_package_preprocess () {
> >>>> require python-${PYTHON_MAJMIN}-manifest.inc
> >>>
> >>> This should be fixed probably in
> >>> scripts/contrib/python/generate-manifest-2.7.py
> >>>
> >>>>
> >>>> # manual dependency additions
> >>>> +RRDEPENDS_${PN} =3D "${PN}-lang ${PN}-re"
> >>>
> >>> And here is typo, how did you test this change?
> >>
> >> And also notice that there is no ${PN} in PACKAGES, so by "top-level
> >> python package" you mean python-core right?
> >
> > Yes. As far as my testing, it got muddled with something else and
> > what I've proposed doesn't help, sorry. I'm looking into how to fix
> > this via the generate-manifest script and will send a different patch
> > shortly [I hope].
>=20
> Sadly, my attempt to fix this doesn't work.  Here's what I tried, but
> it has no effect:

have you executed updated script to actually regenerate manifest and
rebuild python with updated manifest?

> diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/co=
ntrib/python/generate-manifest-2.7.py
> index 85ca353..bde7db9 100755
> --- a/scripts/contrib/python/generate-manifest-2.7.py
> +++ b/scripts/contrib/python/generate-manifest-2.7.py
> @@ -160,7 +160,7 @@ if __name__ =3D=3D "__main__":
>       # Parameters: revision, name, description, dependencies, filenames
>       #
>=20
> -    m.addPackage( "${PN}-core", "Python Interpreter and core modules (ne=
eded!)", "",
> +    m.addPackage( "${PN}-core", "Python Interpreter and core modules (ne=
eded!)", "${PN}-lang ${PN}-re",
>       "__future__.* _abcoll.* abc.* copy.* copy_reg.* ConfigParser.* " +
>       "genericpath.* getopt.* linecache.* new.* " +
>       "os.* posixpath.* struct.* " +
> @@ -276,7 +276,7 @@ if __name__ =3D=3D "__main__":
>       m.addPackage( "${PN}-json", "Python JSON Support", "${PN}-core ${PN=
}-math ${PN}-re",
>       "json lib-dynload/_json.so" ) # package
>=20
> -    m.addPackage( "${PN}-lang", "Python Low-Level Language Support", "${=
PN}-core",
> +    m.addPackage( "${PN}-lang", "Python Low-Level Language Support", "",

why? what if someone tries to install python-lang, how he get
python-core?

>       "lib-dynload/_bisect.so lib-dynload/_collections.so lib-dynload/_he=
apq.so lib-dynload/_weakref.so lib-dynload/_funct
>       "lib-dynload/array.so lib-dynload/itertools.so lib-dynload/operator=
=2Eso lib-dynload/parser.so " +
>       "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.* =
heapq.* inspect.* keyword.* opcode.* symbol.* rep
> @@ -322,7 +322,7 @@ if __name__ =3D=3D "__main__":
>       m.addPackage( "${PN}-profile", "Python Basic Profiling Support", "$=
{PN}-core ${PN}-textutils",
>       "profile.* pstats.* cProfile.* lib-dynload/_lsprof.so" )
>=20
> -    m.addPackage( "${PN}-re", "Python Regular Expression APIs", "${PN}-c=
ore",
> +    m.addPackage( "${PN}-re", "Python Regular Expression APIs", "",

the same, why? what if someone tries to install python-re, how he get
python-core?

>       "re.* sre.* sre_compile.* sre_constants* sre_parse.*" ) # _sre is b=
uiltin
>=20
>       m.addPackage( "${PN}-readline", "Python Readline Support", "${PN}-c=
ore",
>=20
> >
> > Query: if I change the script, should I also bum PR in this recipe?
> >
> >
>=20
> For now, I'll just have to install python-lang and python-re manually...
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eMP3JyRexyk9c0Bv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9sppkACgkQN1Ujt2V2gBxkBACgoBm9EOYDJGavsZVskdF0Qr1s
INQAnR++HRGz89wId9TIyOIKgGW2Nie+
=QbIr
-----END PGP SIGNATURE-----

--eMP3JyRexyk9c0Bv--
