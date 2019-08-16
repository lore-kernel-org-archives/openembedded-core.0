Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C20227F30F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:24:34 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y8so1044191wrn.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 03:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Y6RtrdpKpbucO8F+dzjtsE6GtPbWoqdthDwRV6QzG6o=;
	b=E9VCDmEfY5st3qXfAK8D4s266P8U/C+bKAXEZ+9WOOP4ZAP12KW7lpXb+CEGwWmzvr
	75oj13qnUzhYslUHKhcyBjiwXrXgHOGgOveKVNgy1KLBYMLort8c57IeiZvAofLB4PnF
	M0t4eOrLavJ9sNmLOkdqma6LjONKmM2CkkihaWEy/BqeE6SQfy+KoW+1Gey2RdzxMKrU
	t3ByjFgtfuax97EMfC8a1PxSk9HmMeIkg9qY0xTt9wbuYlGac/UWTQBN8jG99S97fd63
	gCf8RfKoe4ZCLKEHzhUMwv2kt32riBa3jjPQCIKwpzlVFzrbmSckOqmQ+Isu26Fvewf/
	8YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Y6RtrdpKpbucO8F+dzjtsE6GtPbWoqdthDwRV6QzG6o=;
	b=VjSikILuuw2FyigYZWfHtOy5Oh3/7IQLjk0mkvUFvQ51cX3IoL2hx0vdqYGCOsvEUE
	vVKspm0G9HAIULUbMi3wFYGB5K6cclvZQqXimdDpc0ydHmurz5PfNy7SrXpxMOJYUIX2
	3MaSIujaET0m4DtVkYW3zQPoWdBHThjQ28kGL28Hn0G+UV4xsyEV5v2FP6djWUskfYzf
	jG5AA31bztUqG0JzOC28U2/dvVL4UmuWmBZuL7CfnFhpQEAyZR3Iovh/yH+sQxDJc1Ap
	DV4j7QLO/q01aIlmvnbhSYxPdCql1SUUFEOlD+hHLnmLQtCW1ZZbOUmzCtJPhwagg1sE
	kkOg==
X-Gm-Message-State: APjAAAV38VB9TaPGsGQsBFA8PMW9QgiYj1qA16fMeOxQ54VSBgVXIdvq
	JmBl0KNqtfWXJd0kLbttiUI=
X-Google-Smtp-Source: APXvYqzYI12gJuz8XqqyqFjywh3+QKkz9K7rdxFNaXZan4gbbVGvTN+DBFb/gkaWyNdCeo+Vbyoamg==
X-Received: by 2002:adf:d188:: with SMTP id v8mr9258835wrc.213.1565951075268; 
	Fri, 16 Aug 2019 03:24:35 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	t24sm3668782wmj.14.2019.08.16.03.24.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Aug 2019 03:24:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 16 Aug 2019 12:24:41 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190816102441.GB1515@jama>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<20190815150548.GA1515@jama>
MIME-Version: 1.0
In-Reply-To: <20190815150548.GA1515@jama>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Fri, 16 Aug 2019 10:24:35 -0000
X-Groupsio-MsgNum: 127952
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline

--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2019 at 05:05:48PM +0200, Martin Jansa wrote:
> On Tue, Aug 13, 2019 at 10:04:08AM +0100, Richard Purdie wrote:
> > On Mon, 2019-08-12 at 20:26 +0000, Peter Kjellerstedt wrote:
> > > Comparing that build to a corresponding do-nothing build with Thud,
> > > the time difference matches those three minutes where I have no idea
> > > what bitbake is doing now that it didn=E2=80=99t need to do before=E2=
=80=A6
> > > =20
> > > Hopefully these time degradations can be solved, because the current
> > > state of bitbake is barely usable. We also need to look into possible
> > > ways to improve the cooker output when it is running the setscene
> > > tasks so it makes some kind of sense again.
> >=20
> > We talked on irc and you pointed at the commit things started to go
> > wrong. Just to summarise things for the benefit of the list, this is
> > some quick testing I did:
> >=20
> > "bitbake -p; time bitbake core-image-minimal -n"
> >=20
> > 30.0s 6c7c0cefd34067311144a1d4c01986fe0a4aef26
> > 30.6s a0d941c787cf3ef030d190903279d311bc05d752
> > 40.3s 7df31ff36892c2f9c65326b06b4c70=20
> > 42.2s a0542ed3ff700eca35f9195f743c9e28bcd50f3e=20
> > 45.4s 9983b07fffd19082abded7c3f15cc77d306dd69c=20
> > 76.9s master-next
>=20
> I know I'm late to the party, but it took really long for the test to fin=
ish..
>=20
> I'm not using poky, so reproduce this testing on our builds I've used
> bitbake revisions matching with poky revision RP was testing:
>=20
> + oe-core 18cdc087fd5da30e2b31f3d4e81b153cd36ca844 for older bitbake, bec=
ause current master isn't compatible with old bitbake (bb.data_smart.Expans=
ionError: Failure expanding variable OE_IMPORTED[:=3D], expression was ${@o=
e_import(d)} which triggered exception AttributeError: module 'bb.siggen' h=
as no attribute 'SignatureGeneratorUniHashMixIn')
> and oe-core 23db236a054ee7a989cdbbcb42ad5c6eefd4a6ae for newer bitbake (t=
o possibly eliminate impact of metadata changes)
>=20
> tested on 72core (Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz) with 380GB R=
AM
>=20
> nothing in TMPDIR/SSTATE_DIR, no SSTATE_MIRRO, no Hash Equivalence Server=
 configured
>=20
> on a build with few more layers:
> Parsing of 3238 .bb files complete (0 cached, 3238 parsed). 7632 targets,=
 1927 skipped, 54 masked, 0 errors.
>=20
> but first doing just core-image-minimal like RP did:
>=20
> time		poky						bitbake						oe-core
> 2m8.191s	6c7c0cefd34067311144a1d4c01986fe0a4aef26	18d4a31fdcec1f0e5d2199d=
6142f0ce833fca1a7	18cdc087fd5da30e2b31f3d4e81b153cd36ca844
> N/A		a0d941c787cf3ef030d190903279d311bc05d752	doesn't exist in poky/poky-=
contrib		18cdc087fd5da30e2b31f3d4e81b153cd36ca844
> 2m17.053s	7df31ff36892c2f9c65326b06b4c70			1f630fdf0260db08541d3ca9f25f85=
2931c19905	18cdc087fd5da30e2b31f3d4e81b153cd36ca844
> 2m18.515s	a0542ed3ff700eca35f9195f743c9e28bcd50f3e	f43778c2d19e70d4befd48=
3b06aaf247fc65c799	23db236a054ee7a989cdbbcb42ad5c6eefd4a6ae
> 2m22.220s	9983b07fffd19082abded7c3f15cc77d306dd69c	8c26b451f22193ef1c544e=
2017cc84515566c1b8
> 2m38.185s	master-next					fbcb89dc3dbabfc80310e9a4ebe72d919300a32e
> cache.py:446: ResourceWarning: unclosed <socket.socket fd=3D10, family=3D=
AddressFamily.AF_INET, type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3D('=
127.0.0.1', 41117)>
>   value =3D pickled.load()
> started showing with this revision
> 2m17.991s	master-next + fixups				f7cd14f90463957b3e4be6d3876def98b78f1424
> 2m9.651s	master-next + "Holding off tasks %s" out
>=20
> now world
> 253m36.637s	7df31ff36892c2f9c65326b06b4c70			1f630fdf0260db08541d3ca9f25f=
852931c19905	18cdc087fd5da30e2b31f3d4e81b153cd36ca844
> 174m13.324s	a0542ed3ff700eca35f9195f743c9e28bcd50f3e	f43778c2d19e70d4befd=
483b06aaf247fc65c799	23db236a054ee7a989cdbbcb42ad5c6eefd4a6ae
>    this is time when killed at "NOTE: Executing Tasks" without showing an=
y progress on the tasks (unlike other tests) and only one bitbake process i=
s running
> 633m27.475s	master-next					fbcb89dc3dbabfc80310e9a4ebe72d919300a32e
>    this is time when killed at (1417 from 71749) - running very slowly un=
like other bitbake revisions where the task number changes relatively quick=
ly - about 10 tasks per second
> 89m13.992s	master-next + "Holding off tasks %s" out
> 89m59.201s	master-next updated today			85fe627fdb6510f0942917964386fad9d8=
c479c8
>=20
> Interestingly old 1f630fdf0260db08541d3ca9f25f852931c19905 is 3 times
> slower than recent master-next.
>=20
> I'll send -P output next.


So 1f630fdf0260db08541d3ca9f25f852931c19905 was already "bad", because
this commit introduced that
logger.debug(2, "Holding off tasks %s" % pprint.pformat(self.holdoff_tasks))

Here is -P output from it:

5min (til "Executing Tasks" message):
profile.log.processed.1f630fdf0260db08541d3ca9f25f852931c19905.return.at.Ex=
ecuting.Tasks
http://paste.ubuntu.com/p/Nw6n5hTPmF/

5hours (whole dry run):
profile.log.processed.1f630fdf0260db08541d3ca9f25f852931c19905.whole.dry.run
http://paste.ubuntu.com/p/sydFGvYTxQ/
profile.log.processed.1f630fdf0260db08541d3ca9f25f852931c19905.worker.log.p=
rocessed
http://paste.ubuntu.com/p/RMGbm9DyZz/

So for good old baseline I need to go few commits back, to e.g. 18d4a31f RP=
 was testing before:

1f630fdf runqueue: Enable dynamic task adjustment to hash equivalency
a0d941c7 siggen: Convert to use self.unitaskhashes
1f326f2c siggen: Add new unitaskhashes data variable which is cached
b707d0cb runqueue: Improve scenequeue processing logic
19a6e356 cache: Add SimpleCache class
7bb79099 siggen: Import unihash code from OE-Core
7aec8632 hashserv: SQL Optimizations
18d4a31f fetch2/wget: avoid 'maximum recursion depth' RuntimeErrors when ha=
ndling 403 codes

94m19.081s
profile.log.processed.18d4a31fdcec1f0e5d2199d6142f0ce833fca1a7.whole.dry.run
http://paste.ubuntu.com/p/Jnvv8GJNKB/

And here is profile with latest master from yesterday:
90mins:
profile.log.processed.a5e084a266f63c2fd370122327615e49beaeb94e.whole.dry.run
http://paste.ubuntu.com/p/YhMCHPmg56/

So good news is that current master is a bit faster than "good old" 18d4a31=
fdcec1f0e5d2199d6142f0ce833fca1a7.

But still significantly slower on my fast builder compared to world tests o=
n poky + meta-oe,
not sure if it's all just because the size of metadata in my builds (with 7=
1K tasks).

Even the dry running the tasks was about 10 tasks/second while RP was seein=
g around 200 tasks/second.

Will try to bump BB_NUMBER_THREADS from 8 to 72.

I've already disabled rm_work and PRserv, but that doesn't seem to have any=
 significant impact on performance here. Other than resolving the PRserv te=
rminating and then warnings about lost connection.

Cheers,
>=20
> >=20
> > So basically the original changes showed a 25% hit but the performance
> > of -next is dire.
> >=20
> > This is with no hash equiv server configured.
> >=20
> > It will vary depending on the target used (numbers with -sato for the
> > above would be interesting for comparision) and how much was or is in
> > sstate, they type of sstate mirror configured and so on.
> >=20
> > I really need to focus on getting the new code functioning correctly
> > before we attempt to optimise but if nobody tests the new code due to
> > performance problems we have a different issue. We also have a scaling
> > problem with the hash server itself I need to fix to stop the
> > autobuilder throwing weird errors. I'm therefore a bit challenged on
> > where to start with it all :/.
> >=20
> > Cheers,
> >=20
> > Richard
> >=20
> >=20
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXVaEaQAKCRA3VSO3ZXaA
HKaDAJsEuybCq3ghxYgkXcCpB7VJnqNinACghgeLcMHYOZGvzMYjgYUq3VU4PKw=
=ahSs
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
