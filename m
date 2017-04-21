Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C51FF77B95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 13:44:31 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 6so8039201wra.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 06:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Wgt5hPXUXHyE15BI1BxJjWFac62oOBLkQduT0rL33xQ=;
	b=Dt6nqym/W/rLl3izh/GnmeCZ7tqyY43h/SkKdf84zep5NJxb3IHxfJknQKxCufRTfZ
	oNcjvdr8VekB4fEg3QJIwuUa+H36rkTAXDYo1VEBEBcoZV+2Teb1rlmsGkjnJs8Wuhkl
	NO0wTwy9ecjPAescg5jLHlrAzAW8xFZiUZ2luLt1fNaNnuRcRQGhS4W2CRXXtEGV1bqz
	njBUQfXRy+WPotmYwXp2itKNfSo2l0/Yp2OzlLMRDjV4ZQk5m4JRC8MGT+Zt2TyDtKvi
	yr/eR4QTI6RWTsq2y3PHHLTXatU4UyajLoXc91S6MoAW1mw3/bQ2tsfcb2mI2SkXA35W
	AYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Wgt5hPXUXHyE15BI1BxJjWFac62oOBLkQduT0rL33xQ=;
	b=CoDeRsGZBsLtzYJcp/BiXa5inIShCo0vZ0UfRfs+8nKZMpCF5osZ4e0AZ0/lz2zspc
	6DmTeqkjUc8H6D7vBnEiJU7Ly+A5QLqE2MUsowSmR8aGsEtNQCTrtG/ignkqTk3dgQYr
	dqLvUGUbyiuNCGqQXvqRXJxdY4I5LALa03SRqniHkW2xQOgGXysuZyRXwU9Bh7oXNSBn
	gjvclbZ8lJb5kdPkdRcD/SOnbHJkBgRNZy10W3YCxDqZs1Q21MbPElES/v62N5FFTtmz
	31NwIbZ/3Gz/IC0ix7xT+xjMO29ty2nZ1XyeBuMkzJgbt6BLC7npE/bWA7smCeXyaOfF
	egqw==
X-Gm-Message-State: AN3rC/4y0aiyLdBGlymjYZYQJ1cqmMoFuk6omui0PJkKtp86OHKu7gUb
	c2KNE6o3M3xA/15N
X-Received: by 10.223.142.135 with SMTP id q7mr1545783wrb.180.1492782272487;
	Fri, 21 Apr 2017 06:44:32 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k45sm11742755wrk.15.2017.04.21.06.44.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 21 Apr 2017 06:44:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Apr 2017 15:44:41 +0200
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20170421134441.GB3024@jama>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<CADkTA4Pi7SWq_PrYYJZiJa0CQUU-EN+ZVxPTPZV0Z8SvAYjcaA@mail.gmail.com>
	<64a94df4-970f-b80c-3e43-0f6d75c52ba4@linux.intel.com>
	<CADkTA4PzffD=HdOQ3KQe7NTjTx-=GwJfUNmC3G0ZDvY738TeAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4PzffD=HdOQ3KQe7NTjTx-=GwJfUNmC3G0ZDvY738TeAw@mail.gmail.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Fri, 21 Apr 2017 13:44:32 -0000
X-Groupsio-MsgNum: 96561
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2017 at 08:39:33AM -0400, Bruce Ashfield wrote:
> On Fri, Apr 21, 2017 at 8:36 AM, Alexander Kanavin <
> alexander.kanavin@linux.intel.com> wrote:
>=20
> > On 04/21/2017 03:26 PM, Bruce Ashfield wrote:
> >
> >     Anyone else seeing this as well?
> >>
> >>
> >>
> >> Richard saw this once last week, and we weren't able to reproduce it.
> >> I've just updated
> >> and am doing builds now.
> >>
> >> If anyone has info on their config, build steps, etc, I'm interested to
> >> hear so I can figure
> >> out what is going on.
> >>
> >
> > I saw this once as well today. I nuked tmp/ and it was gone.
> >
>=20
> Interesting. I'm updating my existing build (I only ever have one that I
> constantly update and re-use), so maybe it'll show up in that existing tmp
> dir.
>=20
> If there's a clean/rebuild cycle that was in play, let me know as well,
> since I'll try that as well.
>=20
> I've been carrying a config like Richard was using since last week and
> in all my builds it has never happened.

I've seen it 4 times already in various builds executed today and
yesterday. All of them were incremental.

Last failure was a bit different and failed in do_patch already (maybe
some race-condition between do_patch and do_validate_branches?

ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_patch: C=
ould not apply patches for qemux86.
ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_patch: P=
atch failures can be resolved in the linux source directory work-shared/qem=
ux86/kernel-source)
ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_patch: F=
unction failed: do_patch (log file is located at linux-yocto/1_4.10.9+gitAU=
TOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_patch.25077)
ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOINC+ad2e88=
5015_fe0fb8da3d-r0/temp/log.do_patch.25077
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['meta/recipes-devtools/quilt/quilt-native_=
0.65.bb:do_populate_sysroot', 'meta/recipes-kernel/kern-tools/kern-tools-na=
tive_git.bb:do_populate_sysroot']
| NOTE: Considering setscene task: ['icecc-create-env-native', 'do_populate=
_sysroot']
|   considering dependency: ['quilt-native', 'do_populate_sysroot']
| Adding dependency on icecc-create-env-native
| NOTE: quilt-native exists in sysroot, skipping
| NOTE: kern-tools-native exists in sysroot, skipping
| NOTE: icecc-create-env-native exists in sysroot, skipping
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_patch
| ERROR: Could not apply patches for qemux86.
| ERROR: Patch failures can be resolved in the linux source directory work-=
shared/qemux86/kernel-source)
|=20
| [ERROR] Can't find patch dir at .kernel-meta/
| usage: kgit s2q
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_patch (log file is located at linux-yocto/1_4.=
10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_patch.25077)
NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: task=
 do_patch: Failed
ERROR: Task (meta/recipes-kernel/linux/linux-yocto_4.10.bb:do_patch) failed=
 with exit code '1'

>=20
> Bruce
>=20
>=20
> >
> > Alex
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWPoMyAAKCRA3VSO3ZXaA
HLzaAJ0SJ9IHCLCf3/7XaRPuhc0Rv/lwZACdET6AwBzEg07gjRUv1Fg8zWIRhM4=
=51xn
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
