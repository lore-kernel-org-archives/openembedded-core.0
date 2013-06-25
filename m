Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD9E6A549
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 14:25:51 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so6795788eaj.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 07:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=732tG/cCK+8OCIdIEQb+/HEn38z6EmjdCSsiGiWxywk=;
	b=DxABKE6sijP++4jKQwDYDO0+82s5zapbEGYUAwbKvQgmrEbNoeTXnAskU3p0CHN8Ep
	/3Risi2jgr9IkcdW7ktXKSOF/Liwl3xVNjbJ62lWQu5hpWggig5W3yQx3BUvzANFhZSW
	keLk0gWOEmO51AAWhb0MUStanz+uL8AuP9uYxLHT4DuhMmqJDKGbJZFUnagP8VbUfrbR
	tocABSN1XQvB+p6LWpt0WCpnhByDBjRNL6BvjmDGEGgFsAgzJlnTGQJ2ucpi28vPfdGd
	smeOngUm/URmG1VJuGSrXpQXgpaj4/TBvYGTEvsPFgNZrPQ2RiW80piCRMf8Mr1/g0pB
	mwPw==
X-Received: by 10.15.10.132 with SMTP id g4mr10809732eet.38.1372170351416;
	Tue, 25 Jun 2013 07:25:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm36341222eeu.4.2013.06.25.07.25.50 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 07:25:50 -0700 (PDT)
Date: Tue, 25 Jun 2013 16:26:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20130625142627.GR14021@jama>
References: <1372085149-30510-1-git-send-email-mark.hatle@windriver.com>
	<1372085149-30510-2-git-send-email-mark.hatle@windriver.com>
	<51C8C398.1070908@linux.intel.com> <51C8FB13.6020703@windriver.com>
	<20130625112006.GO14021@jama> <51C9A548.8050800@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51C9A548.8050800@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] sanity.bbclass: Check for the known broken version of make
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jun 2013 14:25:52 -0000
X-Groupsio-MsgNum: 40965
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="phbq2bkSb+hZnunM"
Content-Disposition: inline

--phbq2bkSb+hZnunM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2013 at 09:12:24AM -0500, Mark Hatle wrote:
> On 6/25/13 6:20 AM, Martin Jansa wrote:
> > On Mon, Jun 24, 2013 at 09:06:11PM -0500, Mark Hatle wrote:
> >> On 6/24/13 5:09 PM, Saul Wold wrote:
> >>> On 06/24/2013 07:45 AM, Mark Hatle wrote:
> >>>> See GNU Savannah bug 30612 -- make 3.82 is known to be broken.
> >>>>
> >>>> A number of vendors are providing a modified version, so checking
> >>>> for just the version string is not enough.  We also need to check
> >>>> if the patch for the issue has been applied.  We use a modified
> >>>> version of the reproduced to check for the issue.
> >>>>
> >>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >>>> ---
> >>>>     meta/classes/sanity.bbclass | 39 +++++++++++++++++++++++++++++++=
++++++++
> >>>>     1 file changed, 39 insertions(+)
> >>>>
> >>>
> >>> Seems this needs a rebase since RP also changed sanity.bbclass recent=
ly.
> >>
> >> This is from Friday morning.  I'll start a rebase and send new code wh=
en I have
> >> it ready.
> >
> > There is another issues with unpatched make-3.82, webkit and newer
> > nodejs are failing for some people.
> > https://savannah.gnu.org/bugs/?36451
> >
> > What about for cycle which generates some very long "ls" or something
> > like that?
> >
> > On other hand so long commands arn't so common, so many people
> > could be using "broken" make without seeing issues with their images.
>=20
> If you can point me to a reproducer, I'm happy to add it to the sanity ch=
eck as=20
> part of the rebase work.
>=20
> The current reproducer covers two cases (see the patch for the savannah b=
ug=20
> number).  These were the two cases that I knew had caused problems for ot=
hers in=20
> the past.

I don't have simple reproducer, because it works fine in both make-3.82
I'm using (from Gentoo and Ubuntu) and with my reasonable long TOPDIR.

The problem is triggered in some webkit builds and also in nodejs-0.10.4
http://patchwork.openembedded.org/patch/48253/

Tasslehoff reported today that nodejs was failing for him with
/home/tas/angstrom-setup-scripts and works fine with /home/tas/oe
adding him to Cc, maybe he has better reproducer now.

>=20
> --Mark
>=20
> >>
> >> --Mark
> >>
> >>> Sau!
> >>>
> >>>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbcla=
ss
> >>>> index 7f95f31..dc251a1 100644
> >>>> --- a/meta/classes/sanity.bbclass
> >>>> +++ b/meta/classes/sanity.bbclass
> >>>> @@ -336,6 +336,41 @@ def check_gcc_march(sanity_data):
> >>>>
> >>>>         return result
> >>>>
> >>>> +# Unpatched versions of make 3.82 are known to be broken.  See GNU =
Savannah Bug 30612.
> >>>> +# Use a modified reproducer from http://savannah.gnu.org/bugs/?3061=
2 to validate.
> >>>> +def check_make_version(sanity_data, loosever):
> >>>> +    status, result =3D oe.utils.getstatusoutput("make --version")
> >>>> +    if status !=3D 0:
> >>>> +        return "Unable to execute make --version, exit code %s\n" %=
 status
> >>>> +    version =3D result.split()[2]
> >>>> +    if loosever(version) =3D=3D loosever("3.82"):
> >>>> +        # Construct a test file
> >>>> +        f =3D open("makefile_test", "w")
> >>>> +        f.write("makefile_test.a: makefile_test_a.c makefile_test_b=
=2Ec makefile_test.a( makefile_test_a.c makefile_test_b.c)\n")
> >>>> +        f.write("\n")
> >>>> +        f.write("makefile_test_a.c:\n")
> >>>> +        f.write("	touch $@\n")
> >>>> +        f.write("\n")
> >>>> +        f.write("makefile_test_b.c:\n")
> >>>> +        f.write("	touch $@\n")
> >>>> +        f.close()
> >>>> +
> >>>> +        # Check if make 3.82 has been patched
> >>>> +        status,result =3D oe.utils.getstatusoutput("make -f makefil=
e_test")
> >>>> +
> >>>> +        os.remove("makefile_test")
> >>>> +        if os.path.exists("makefile_test_a.c"):
> >>>> +            os.remove("makefile_test_a.c")
> >>>> +        if os.path.exists("makefile_test_b.c"):
> >>>> +            os.remove("makefile_test_b.c")
> >>>> +        if os.path.exists("makefile_test.a"):
> >>>> +            os.remove("makefile_test.a")
> >>>> +
> >>>> +        if status !=3D 0:
> >>>> +            return "Your version of make 3.82 is broken. Please rev=
ert to 3.81 or install a patched version.\n"
> >>>> +    return None
> >>>> +
> >>>> +
> >>>>     # Tar version 1.24 and onwards handle overwriting symlinks corre=
ctly
> >>>>     # but earlier versions do not; this needs to work properly for s=
state
> >>>>     def check_tar_version(sanity_data, loosever):
> >>>> @@ -407,6 +442,10 @@ def check_sanity(sanity_data):
> >>>>             messages =3D messages + 'Please set a MACHINE in your lo=
cal.conf or environment\n'
> >>>>             machinevalid =3D False
> >>>>
> >>>> +    makemsg =3D check_make_version(sanity_data, LooseVersion)
> >>>> +    if makemsg:
> >>>> +        messages =3D messages + makemsg
> >>>> +
> >>>>         tarmsg =3D check_tar_version(sanity_data, LooseVersion)
> >>>>         if tarmsg:
> >>>>             messages =3D messages + tarmsg
> >>>>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--phbq2bkSb+hZnunM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHJqJMACgkQN1Ujt2V2gBxLewCfXqdlPsLeNTbKSi/vLEuWChrV
gXIAoKMTTOUJWxzb9N/OywsWvnK2+S0r
=9lEn
-----END PGP SIGNATURE-----

--phbq2bkSb+hZnunM--
