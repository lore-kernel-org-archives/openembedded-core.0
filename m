Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 327F5617B8;
	Mon, 25 Aug 2014 10:12:16 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id x48so13189664wes.31
	for <multiple recipients>; Mon, 25 Aug 2014 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Dt2rETEmxollyq1eY0yt5OEv/20Prmd/z+DmCyr60cU=;
	b=NQXTOintIiGcRG625k9+mIe2rYzjCGIJQR5q36co4UXiKVNPluZxkooNRyykeW8N4P
	blObzvNAoVrIJYvQn2k861N0YozR6ZIyMmCxDguxu5w+jr0uAWMs2DOWkonT8IDjizN8
	Dobw3+sM+c6sLQRbU2MYHyERHx5txqq4cf+mJQaxrHmP+43MFxKP8zAKF2tA919O/ucC
	rEXFO2Jh3rpygfu1T5963SL6evH+gNNfDF7EDtIiKieBlPI9+tnCJ1oOAggaIsQf0P2E
	3FXBtEwx7c1He73qi+cY1l+7iWC2CJZpTRkdGNANpwcNk8YKjEsJAQi+kJ0md6bd3HR0
	mqdg==
X-Received: by 10.180.81.169 with SMTP id b9mr14280085wiy.10.1408961537827;
	Mon, 25 Aug 2014 03:12:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ge8sm30239714wib.4.2014.08.25.03.12.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 03:12:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 25 Aug 2014 12:12:24 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140825101224.GO20524@jama>
References: <20140823220223.0DA1E50496@opal.openembedded.org>
	<20140824155625.GJ20524@jama> <53FA9C10.1060408@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53FA9C10.1060408@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : sanity.bbclass: check the format of MIRRORS
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
X-List-Received-Date: Mon, 25 Aug 2014 10:12:23 -0000
X-Groupsio-MsgNum: 56896
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LkYZvX65tyO4RZtj"
Content-Disposition: inline

--LkYZvX65tyO4RZtj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2014 at 10:14:40AM +0800, Robert Yang wrote:
>=20
>=20
> On 08/24/2014 11:56 PM, Martin Jansa wrote:
> > On Sat, Aug 23, 2014 at 10:02:23PM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: c8c213bb25b137cf70ba8ce9a45e60065d926735
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3Dc8c213bb25b137cf70ba8ce9a45e60065d926735
> >>
> >> Author: Robert Yang <liezhi.yang@windriver.com>
> >> Date:   Fri Aug 22 01:31:27 2014 -0700
> >>
> >> sanity.bbclass: check the format of MIRRORS
> >>
> >> Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS:
> >> * Each mirror shoudl contain two memebers.
> >
> > shoudl -> should
> >
> >> * The local "file://" url must use absolute path (file:///).
> >> * The protocol must in protocols list.
> >
> > must "be"? seems like something is missing
> >
>=20
> Sorry for the typos.
>=20
>=20
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>
> >> ---
> >>
> >>   meta/classes/sanity.bbclass | 33 +++++++++++++++++++++++++++++++++
> >>   1 file changed, 33 insertions(+)
> >>
> >> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> >> index 3b40ebe..dbcc26b 100644
> >> --- a/meta/classes/sanity.bbclass
> >> +++ b/meta/classes/sanity.bbclass
> >> @@ -753,6 +753,39 @@ def check_sanity_everybuild(status, d):
> >>       if oeroot.find(' ') !=3D -1:
> >>           status.addresult("Error, you have a space in your COREBASE d=
irectory path. Please move the installation to a directory which doesn't in=
clude a space since autotools doesn't support this.")
> >>
> >> +    # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
> >> +    mir_types =3D ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
> >> +    protocols =3D ['http://', 'ftp://', 'file://', 'https://', 'https=
?$://', \
> >> +        'git://', 'gitsm://', 'hg://', 'osc://', 'p4://', 'svk://', '=
svn://', \
> >> +        'bzr://', 'cvs://']
> >> +    for mir_type in mir_types:
> >> +        mirros =3D (d.getVar(mir_type, True) or '').split('\\n')
> >
> > Is the "\n" (followed by actuall line break) really required as separat=
or?
> >
> > openembedded-core/meta/classes/own-mirrors.bbclass doesn't separate the
> > entries with "\n".
> >
> > and bitbake code seems to handle them both:
> > def mirror_from_string(data):
> >      return [ i.split() for i in (data or "").replace('\\n','\n').split=
('\n') if i ]
>=20
> I think that "\n" is required, otherwise it can't split it as the code sh=
ows,

I think the code shows that it splits it by normal line feed,=20
"\\n" are replaced with "\n" so they probably just add extra line feed
which is ignored because of empty line it produces.

On the other hand "\\n" is probably still useful when appending to it as
multiline variable (with \ at the end of line) - then the line feeds
aren't preserved when parsing and \\n is needed.

> and I had tried that it didn't work without the "\n" at the end of the li=
ne
> (except the last line, but we really need add the "\n" to the last line e=
ven
> it works, in case of _append).
>=20
> I will update the own-mirrors.bbclass after more investigations.
>=20
> >
> > If you want to unify the format to enforce "\\n" then I think it would
> > be better to show the warning in bitbake fetcher, not in stanity.bbclass
> >
> > Also the list of supported protocols would be IMHO better in bitbake fe=
tcher module.
>=20
> Do it in the fetcher sounds fine to me, but we have to do more work,
> for example, make sure that only check the various MIRRORS once rather
> than checked in every do_fetch.

On the other hand it will show the warning in all projects which can
possibly use bitbake and it will make easier to ensure that checked
conditions are consistent with the code.

>=20
> // Robert
>=20
> >
> >> +        for mir in mirros:
> >> +            mir_list =3D mir.split()
> >> +            # Should be two members.
> >> +            if len(mir_list) not in [0, 2]:
> >> +                bb.warn('Invalid %s: %s, should be 2 members, but fou=
nd %s.' \
> >> +                    % (mir_type, mir.strip(), len(mir_list)))
> >> +            elif len(mir_list) =3D=3D 2:
> >> +                # Each member should start with protocols
> >> +                valid_protocol_0 =3D False
> >> +                valid_protocol_1 =3D False
> >> +                file_absolute =3D True
> >> +                for protocol in protocols:
> >> +                    if not valid_protocol_0 and mir_list[0].startswit=
h(protocol):
> >> +                        valid_protocol_0 =3D True
> >> +                    if not valid_protocol_1 and mir_list[1].startswit=
h(protocol):
> >> +                        valid_protocol_1 =3D True
> >> +                        # The file:// must be an absolute path.
> >> +                        if protocol =3D=3D 'file://' and not mir_list=
[1].startswith('file:///'):
> >> +                            file_absolute =3D False
> >> +                    if valid_protocol_0 and valid_protocol_1:
> >> +                        break
> >> +                if not (valid_protocol_0 and valid_protocol_1):
> >> +                    bb.warn('Invalid protocol in %s: %s' % (mir_type,=
 mir.strip()))
> >> +                if not file_absolute:
> >> +                    bb.warn('Invalid file url in %s: %s, must be abso=
lute path (file:///)' % (mir_type, mir.strip()))
> >> +
> >>       # Check that TMPDIR hasn't changed location since the last time =
we were run
> >>       tmpdir =3D d.getVar('TMPDIR', True)
> >>       checkfile =3D os.path.join(tmpdir, "saved_tmpdir")
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LkYZvX65tyO4RZtj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP7DAgACgkQN1Ujt2V2gBzpqwCdGd+uUQmiu8QrE32KNS0ctlRG
Wl4An3QeWGO5/ed/ypQgRTORdI5f/loD
=cTyN
-----END PGP SIGNATURE-----

--LkYZvX65tyO4RZtj--
