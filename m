Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 06A476B073
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 21:23:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r3so10191175wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 14:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lZz00X8j8wI3lLmwMuVlV8pQ0kRfChH4gZNCikbqOSE=;
	b=I8yN1U85T8AyNoAJ8QYJ/ybkzU7NA0eXp4FI2dXmbsVu3guLCvDCZgBfwT3J7sZi3v
	oPy1+TorCPlAlgB9LA4B6jafSh6B1WBWSIL1icRq63CTfBG7w/698brCUBlObOoRmM/d
	S2Ud6SrsEHiqZ5w+CG/6YIFH58/w0E8iq6xxKnt/eRTUPobCKcZoj6p9Bp0h59nzXN19
	XdXa+lvoOzwLoa9UZwY8E02PHfWTaJiV3gFWR69haWCmjDXkzAa6w5FWOrhkncmuj8Yz
	+LFAS2mrb2jed1/oZ2Dsyc0D8cfLutM6i0jGEp4p86FqehLO25C3w6XBAiuXOG5kXL4r
	KMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lZz00X8j8wI3lLmwMuVlV8pQ0kRfChH4gZNCikbqOSE=;
	b=efSOTIwSPw4bWmXCdNPU8Bgwq7e+PIF8lIIsleTBqtZkFiT7ADusxsOe31aNFSS6gM
	B6Un5GjzdIZySJK2/fkCxzjSBHGOpE30vrnV5vMlxY4C72xMuOhWvQkNZJ7eHt1XX/SE
	gRI5Bfywy8FBh8PPJENeFOGqBxCp3ffis6xJ7ot7+MW5J10g3mexNBAoD0Yb9SFCWs2A
	43lPO72nYbQVJp/zVtxuXddiDHZe9lvrbW8bKeUXexfxhWagFcmnDc34KIaT3JgUZFhC
	1J1smj3wgLSuL3enqNNsVj0yNDKHJkPUO0veKVfTbRDa0RtDdBf1PTxAARj8Anm5EZst
	4n3A==
X-Gm-Message-State: APjAAAWJsjS+HnaxQ+Z40SqFBb/y9ZAH/DvSb1FKArPqmSKTelemynoi
	iy4BmHTDlZ7wDIt5ZtjlFmc=
X-Google-Smtp-Source: APXvYqx/gyM4HdT9r41iAWbnCXTl+QqqxvzmmfwdIhBWRC7YOFT70GvYHqrBo7RZ1o1ICK0M0L3HBg==
X-Received: by 2002:adf:e444:: with SMTP id t4mr28193900wrm.262.1566249820631; 
	Mon, 19 Aug 2019 14:23:40 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	16sm21940842wmx.45.2019.08.19.14.23.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 19 Aug 2019 14:23:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 19 Aug 2019 23:23:39 +0200
To: richard.purdie@linuxfoundation.org
Message-ID: <20190819212339.GA1495@jama>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<20190815150548.GA1515@jama> <20190816102441.GB1515@jama>
	<CA+chaQdS_QHpe2jmr6Epqc_CBBHTwbtA5beg1rjD4kwMHbhycA@mail.gmail.com>
	<cad2ebcaf8102857799d0c0a3e921b04348c8515.camel@linuxfoundation.org>
	<20190816172255.GC1515@jama>
MIME-Version: 1.0
In-Reply-To: <20190816172255.GC1515@jama>
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
X-List-Received-Date: Mon, 19 Aug 2019 21:23:40 -0000
X-Groupsio-MsgNum: 128056
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2019 at 07:22:55PM +0200, Martin Jansa wrote:
> On Fri, Aug 16, 2019 at 04:54:48PM +0100, richard.purdie@linuxfoundation.=
org wrote:
> > On Fri, 2019-08-16 at 17:00 +0200, Martin Jansa wrote:
> > > > Will try to bump BB_NUMBER_THREADS from 8 to 72.
> > >=20
> > > I've tried to remove icecc.bbclass inherit (because it does things
> > > while parsing and RP probably doesn't have it inherited), but that
> > > didn't save much time.
> > >=20
> > > All 3 tests were with bitbake
> > > 18d4a31fdcec1f0e5d2199d6142f0ce833fca1a7
> > > 94m19.081s  8 BB_NUMBER_THREADS and icecc
> > > 82m59.574s  8 BB_NUMBER_THREADS no icecc
> > > 68m3.556s    72 BB_NUMBER_THREADS no icecc
> > >=20
> > > Still don't know how to get to sub 10min world runs RP was seeing,
> > > but at least it's as slow as it was before runqeueu changes (or even
> > > a bit faster in lastest master).
> >=20
> > Just thinking out loud, other things which can influence timings:
> >=20
> > Is SSTATE_DIR on NFS or local disk?
>=20
> SSTATE_DIR is empty directory on local disk
> /dev/mapper/vg00-jenkins on /jenkins type ext4 (rw,noatime,nobarrier,comm=
it=3D6000,stripe=3D128,data=3Dordered)
>=20
> > Are sstate mirrors configured?
>=20
> None, normally I have SSTATE_MIRRORS over sshfs in this case, but I've
> removed it before any performance testing.
>=20
> > Is there an existing build or not, if so, how much is valid?
>=20
> Nothing, I remove whole TMPDIR and cache before each run. Then let it
> recreate the cache before starting the profile:
> bitbake -p; time bitbake world -P -n
>=20
> > Underlying filesystem of the build?
>=20
> ext4, everything is pretty much generic Ubuntu 18.04
>=20
> There is plenty of ram, I'll try to test this from tmpfs as well.

I did the same "bitbake -p; time bitbake world -P -n" on the same build wit=
h thud, warrior and zeus:

thud/profile.log.processed:         2803894450 function calls (2803191143 p=
rimitive calls) in 3340.784 seconds
thud/profile-worker.log.processed:         27005515 function calls (2694403=
0 primitive calls) in 3243.139 seconds
warrior/profile.log.processed:         2804294486 function calls (280344629=
6 primitive calls) in 3604.226 seconds
warrior/profile-worker.log.processed:         27649679 function calls (2759=
1220 primitive calls) in 3503.772 seconds
zeus/profile.log.processed:         2327031298 function calls (2326396186 p=
rimitive calls) in 4433.851 seconds
zeus/profile-worker.log.processed:         28829453 function calls (2877173=
0 primitive calls) in 4331.257 seconds

thud/time:real    55m41.595s
warrior/time:real    60m4.954s
zeus/time:real    72m23.053s

with multilib disabled I got
zeus-no-multilib/profile.log.processed:         1232798107 function calls (=
1232447521 primitive calls) in 1773.164 seconds
zeus-no-multilib/profile-worker.log.processed:         15561565 function ca=
lls (15555044 primitive calls) in 1716.234 seconds
real    29m33.658s

Which seems reasonable as the number of tasks was cut in half.

Let me know if it's worth uploading these profiles somewhere.

Cheers,

> > Your build seems especially slow at executing through the tasks which
> > is effectively a test on how fast the system can fork() and return in
> > some ways. It would be interesting to block dry-run on the server side,
> > skip the fork and see how the numbers compare.
>=20
> As discussed on IRC, it's slower than yours (8 minutes from 68), but the
> most significant chunk of time is lost somewhere else.
>=20
> > My build manages some parts of the tasklist faster than others, perhaps
> > because there are more "free" tasks to execute at some points in the
> > task graph than others.
> >=20
> > Also, I have some patches which improve performance a bit which I'm
> > still testing.
>=20
> Thanks for all the work on this!
>=20
> Cheers,
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXVsTWwAKCRA3VSO3ZXaA
HEcAAJ49mwNPgW+UDuZGTIy1bYvjEpGMxACgp5cMsrUxDxndgQLlSx9O4+vBe+k=
=pnh5
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
