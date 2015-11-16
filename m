Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id BFBCE76643
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 21:56:20 +0000 (UTC)
Received: by wmww144 with SMTP id w144so139169919wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 13:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Yb7LksBqpiLCHuIn5/6vrFNh0474+rIVjZB/ELN00D0=;
	b=ynFzkiia3dEMPLRpjC46mLmnK7t2nKuXNa9xnnztQ6jrIDYbT7//Jk1DLNhs7/sA9y
	2JqhPob+wnfW5npNseu1ANTvhI3MvVcG3Z2tdvyQtnaxw0CQcAB+rK0leawMGFjyeYqv
	4GDND9IX5ojY26oXnngqMdwTCisIZY+3PctLM2HrHEtY7LCN0dJkKP0vBRtMAs3uLfbq
	gZAfiDzESgBURfM0BwYmkvTYG5I1JOMWDow0IdUnzJHk2CviNpdK8Q9WOVESduvfYPwd
	xQSuLIVflF6TKvt6NLYAXm2Zu09wX782BgHv5X/ZkzghALAr3htFpOt+jEL7rVrL1iTh
	h5zA==
X-Received: by 10.194.82.170 with SMTP id j10mr39601512wjy.55.1447710980722;
	Mon, 16 Nov 2015 13:56:20 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bo7sm36536612wjb.46.2015.11.16.13.56.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 13:56:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Nov 2015 21:56:35 +0100
To: Michael Halstead <michael@yoctoproject.org>
Message-ID: <20151116205635.GC2240@jama>
References: <56451D46.50707@gmail.com> <20151113115958.GD2567@jama>
	<056F5AC5-DD52-4BF7-B88D-4312C40DFA2A@gmail.com>
	<564658A0.60609@yoctoproject.org>
	<DC4D8315-D63D-495C-B3AF-2932584B319C@gmail.com>
	<564659EF.8070606@yoctoproject.org>
	<447B01D9-C528-4B24-9B45-812CA1C6685D@gmail.com>
	<56465E1B.8040900@yoctoproject.org> <20151116205235.GB2240@jama>
MIME-Version: 1.0
In-Reply-To: <20151116205235.GB2240@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: oecommit ml
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
X-List-Received-Date: Mon, 16 Nov 2015 21:56:25 -0000
X-Groupsio-MsgNum: 73515
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline

--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2015 at 09:52:35PM +0100, Martin Jansa wrote:
> On Fri, Nov 13, 2015 at 02:03:07PM -0800, Michael Halstead wrote:
> >=20
> > On 11/13/2015 01:50 PM, Khem Raj wrote:
> > >> On Nov 13, 2015, at 1:45 PM, Michael Halstead <michael@yoctoproject.=
org> wrote:
> > >>
> > >> Bitbake is disabled with the note:
> > >>
> > >> # interferes with patchwork sice it sends emails after the patches a=
re
> > >> closed
> > >> # we could re-enable it if the mails went to someother ml may be
> > >> bitbake-commits
> > >>
> > >> This happens because it was mailing bitbake-devel@lists.openembedded=
=2Eorg
> > >>
> > >> We can mail openembedded-commits@lists.openembedded.org which would =
work
> > >> fine. Or I can create a bitbake-commits@lists.openembedded.org. Whic=
h is
> > >> better?
> > > I think mailing to openembedded-commits@lists.openembedded.org might =
be ok. with [bitbake] in message subject for filtering help.
> >=20
> > I've altered the script to include [reponame] in the subject of all
> > e-mails and enabled for bitbake.
>=20
> Seems to be causing some new warnings when pushing to the repo:
>=20
> OE @ ~/meta-openembedded $ git push origin master
> Counting objects: 204, done.
> Delta compression using up to 8 threads.
> Compressing objects: 100% (193/193), done.
> Writing objects: 100% (204/204), 38.00 KiB | 0 bytes/s, done.
> Total 204 (delta 147), reused 0 (delta 0)
> remote: Scalar found where operator expected at /home/git/git-notify line=
 140, near "$subject"
> remote:         (Missing semicolon on previous line?)
> remote: Global symbol "@openembedded" requires explicit package name at /=
home/git/git-notify line 60.
> remote: syntax error at /home/git/git-notify line 140, near "$subject "
> remote: Execution of /home/git/git-notify aborted due to compilation erro=
rs.
> remote: E: failed to find patch for rev 7df2b574f1c4ad445b1656666878cb2ce=
ffca2e0.
> remote: E: failed to find patch for rev ea5bc66444a1e9b5fb330d8a6d42dc95e=
4bc9500.
> remote: E: failed to find patch for rev 1ec69e6b3891c01734e57a908a2a67512=
8f126eb.
> remote: E: failed to find patch for rev a1d3dce036f80867d30993742d55abb17=
c6bc057.
> ...

and it got stuck (maybe 5 mins sofar) after few more "failed to find patch"=
 messages
=2E..

remote: E: failed to find patch for rev 035374299937302bf15d14a4175b15b6bfc=
b4cfa.
remote: E: failed to find patch for rev 1d35641ab6da3d381af511ee406e2c1d3ea=
f636b.
remote: E: failed to find patch for rev a497a46ef629788b77b9b0b23d1618a673d=
08709.
remote: E: failed to find patch for rev 45a6d2537dac421803fcefe8d2e4899a3fc=
39e43.
remote: E: failed to find patch for rev f558b195c3b880069dd51a29be4aefd50ea=
ec329.
remote: E: failed to find patch for rev 9ba2e55b0f1f7f8326523c1b418997eb382=
76f2e.
remote: E: failed to find patch for rev 2200a08dc60486017e59c1950fd3138f79e=
21030.
remote: E: failed to find patch for rev 9a381e8c4d4f3ce074a1f934e2f6dfc3172=
efe8e.
remote: E: failed to find patch for rev b145a503839840c0ea43cdab5dcab3a9c6c=
a7f7b.
remote: E: failed to find patch for rev 1f96c7d8ce6e18a2c87a180a94afc179f40=
7c5ab.
remote: E: failed to find patch for rev 72c82837f614fa5d1d3677db71243fe74bf=
5a496.
remote: E: failed to find patch for rev f6a3cd4dcd1654a953c505ff77909071731=
4871a.
remote: E: failed to find patch for rev c3d88ca50de5657b9b6c05ed19ac1702c95=
b3c9c.
remote: E: failed to find patch for rev e51b35fdbd6bd64b4e8e1b67d76c7e90d7b=
9f6d6.
remote: E: failed to find patch for rev 99d96c933f3fa4f4d7ef5727154b0d8ef65=
33caa.
remote: E: failed to find patch for rev 437f22e9aa4977a95cfab5f0dd835941028=
1bcfd.
remote: E: failed to find patch for rev 926eeea7c613721cf30105f7c6d7ecc531c=
cc736.
remote: E: failed to find patch for rev 1b2a08a9f1a27426662c703d0cea8091aa7=
7ab11.
remote: E: failed to find patch for rev d70899b30f7acea4eba3870bbe14a37a44e=
a7528.
remote: E: failed to find patch for rev e528f2e16033dc011e5c8ac2d843af6c788=
08077.
remote: E: failed to find patch for rev 907037a7f989c5bfe699109cef7aa456995=
d2fea.
remote: E: failed to find patch for rev df552bed28c6ed983a94ebad4185bc9b2d0=
4486f.

"failed to find patch for rev" isn't new, patchwork hook never finds anythi=
ng and
I have to mark the reviews manually, but it shouldn't be stuck (maybe tryin=
g to
send e-mails?).

Also strange that I was pushing 33 changes and only 26 messages were shown =
(sofar).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZKQwIACgkQN1Ujt2V2gBxJOACfXp8umRUQEvIDQJvUyh26d7lg
t68AniiNTdCBG52y8e8hzOxisUgyEax0
=8JQx
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
