Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8C7CCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 11:09:59 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.12500.1760440198291960831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 04:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fU133uud;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so52907065e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 04:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760440196; x=1761044996; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GIGC+XD29JrtHDPFS3N7PG6YjZySIA4P79M5xKjEXIc=;
        b=fU133uudVqyBoo3HgoLhW2XR7eeHRt89f+sImgpFZiIdKr4ohPScDaMFg0JnFL1yR8
         MjS5tOSBUB6TGANkRDR/F8Ax80MWIv5oGItUlbGvr0DK59iMXRLSfFh87xKAdze5Xnne
         UR5G3nVerF50rA8veDJ4TvGowLTkK0/Eks3yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760440196; x=1761044996;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GIGC+XD29JrtHDPFS3N7PG6YjZySIA4P79M5xKjEXIc=;
        b=sHseJeqt/903g8GN0FPyWya2dknjcWilFO1i3DuUALaj2PdSmHJBr0uwqwvudei//Q
         +BsFoQ8UlA2RUZums0fUq2nxXdbDcEF88XeVTgdGB9nJuoolH25Yq8lym2AuqkkXjNi3
         a6jaqITrFpO2lQC1W+FOBuTXmulCNVsi8Z6Z+8sHvKvC3JjQft9cfG+f7yhj7a5FDd+E
         yXuktQgaOfz1EQn5niqa6mUVseDG8af7UWF28csjjHSKADjuTib0f1akh/JDpWv+sNbi
         vjNiKPnWoXgVR3Qq7n8C3Zbjh+ZUgXcXz20MOK9kiAQW4v+R4MsJKbNbSHSMdiCiVR2i
         BLDg==
X-Forwarded-Encrypted: i=1; AJvYcCUawKLQHN4jmxgCHZcoG59cw9ErXSoqqXFqhl8ntLvI2MZHTfxTWgihZnkXGFn1tSrv6B1ZEAMC49A/yxyQdnRzRA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwaF5afKGtG3wY4YczBcRnDjJS/X69b+XuzWTu3af9pOmwyyYW/
	PLsS9X/4X3qZARzi2GmkXcXnhBZOXYfkOfg5wgZldimKbpAKi8b4CHGa1F9WovXJOrs=
X-Gm-Gg: ASbGncv0AZb2krIqhtgbdLHWJzuD1HtvnjYjTPPLHvwSsRqaMu3cK3Lt1eEVM9lwWUR
	vog+RgeVDCzigIuUNwjvFOINrzym0PLWNgP9nMyMSqAdIL2sySRO+za1I1a4vk9A1IyBB663ayt
	bPiqr76LFPTJNbsLuyWSoNNXojghZd/MHhN6e/tnoT+YwgM98NBJ3gbY+Niskxr/n6qEmY2edYn
	PFkU+5B1JAknzUsLSDC/yX2UuHFUvONE0FbWfFPP/Y1icxluPnWYwI7JglKHk2rnvgiKA+S/eQz
	IOJtrAqeTXsTxO6th7oadV9Dz7oG+14wougI/zE9N/cpkWy2dVASK0i17AJhP6DHp2f7OscdK1u
	OdKACtju8T+7kcndwwxJiTjrN0mgsYKX4Tyn78n0yF5jkvFHlODgfrBcYoe0Bx6RHKPNOThjqbq
	wxe10fiMT0TJKRtj7biddO/Rm1AEUHX1JNvdAZlQ==
X-Google-Smtp-Source: AGHT+IFNMmOWWP6vPVM2JMEaEoh/EB+mP9fEHX5QNwKhZYRrTZR92o7Q+WgVOg0LXEqDdAP1CTuNZw==
X-Received: by 2002:a05:600c:1394:b0:45b:7a93:f108 with SMTP id 5b1f17b1804b1-46fa9a8f090mr171344945e9.3.1760440196523;
        Tue, 14 Oct 2025 04:09:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2ac0:755:9ed5:f113? ([2001:8b0:aba:5f3c:2ac0:755:9ed5:f113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab656554sm150250485e9.11.2025.10.14.04.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:09:55 -0700 (PDT)
Message-ID: <59f5af6c290efef806b73ba905cbfc412c290109.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] ltp: upgrade 20250530 -> 20250930
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@eng.windriver.com>, Khem Raj <raj.khem@gmail.com>, Hui
 Min Mina Chou <minachou@andestech.com>
Date: Tue, 14 Oct 2025 12:09:54 +0100
In-Reply-To: <20251013185934.GA114595@pevik>
References: <20251013185934.GA114595@pevik>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 11:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224816

On Mon, 2025-10-13 at 20:59 +0200, Petr Vorel wrote:
> Hi Richard, all,
>=20
> [ I accidentally deleted mail thread. Unfortunately I don't see Message-i=
d in
> web UI [1] therefore I cannot set In-Reply-To:. Due this also any reply t=
o other
> LTP developers about runltp vs. kirk would not be in the thread ]
>=20
> > > $ . oe-init-build-env
> > >=20
> > > .../build $ bitbake ltp
> > > ERROR: Error importing OE modules: module 'bb.parse' has no attribute
> > > 'vardepsexclude'
> > > ERROR: Unable to parse
> > > /home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py
> > > Traceback (most recent call last):
> > > =C2=A0 File
> > > =C2=A0 "/home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/as=
t.py",
> > > =C2=A0 line 372, in eval
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 layerid, fragment_name =3D f.split('/'=
, 1)
> > > 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^
> > > 		=C2=A0 ValueError: not enough values to unpack (expected 2, got 1)
> > >=20
>=20
> > > FYI I also plan to get rid of some patches posted.
>=20
> > Are you setting OE_FRAGMENTS to something in a config file? It
> > shouldn't traceback like this so that is a bug but something is
> > triggering it...
>=20
> No, simple clone and the 2 commands above. I'll later try it again on fre=
sh
> git clone.

If you could share the repo/branch you cloned (poky?) I'd appreciate it
as I did try and reproduce that and couldn't. I will write some patches
to improve the code/error regardless as that much is clear from the
failure. It really shouldn't fail like that, it is embarrassing :/.

> > I did send some questions and had some discussion on kirk a while ago.
> > Quite simply, it isn't useful/interesting to Yocto Project.
>=20
> I see your points [2] [3].
>=20
> > What we want to test with is our images and our kernel, as we build it.
> > kirk, as far as I understand it has gone a different route where there
> > isn't really any userspace left and it simply tests against a kernel
> > binary. We'd no longer be testing our build artefacts but some more
> > artificial construct.
>=20
> I don't understand "any userspace left and it simply tests against a kern=
el
> binary". LTP tests are mostly focused on the kernel (+ it's modules). And=
 you
> can run individual tests by just executing them (+ handle environment var=
iables)
> or use runltp or use kirk. The executor does not matter that much. In the=
 end we
> at SUSE also test with LTP our built image :). (LTP is used by mainline f=
olks
> and by distro folks).

Sorry, I'm not really being clear. The Yocto Project is in the middle
of some huge changes and I'm struggling with those. Equally, I did want
to at least given some response to your upgrade which is appreciated.

I guess we're one of the few ltp users with a cross environment. We
have a way to launch target images under emulation and our own methods
for controlling them and transferring files. We do all this without
special permissions or access other than ability to use kvm. As such we
liked being able to just run runltp on the target in the environment we
already have.

kirk, at least as I understand it, wants to do much of this for itself.
That means we end up with two ways of running the target emulation
which may or may not match. We'd much prefer just having one so we
either have issues there or we do not but our test environment is
consistent across all tests.

> FYI although kirk is meant to be run on the host, doing a different conne=
ctions,
> it can also be run on SUT. Sure, there is then python3 dependency on SUT
> (heavier than shell + it's dependencies), but still kind of runltp replac=
ement.
>=20
> >=20
> > We're trying to test what we build. You're trying to test the kernel
> > for regressions. They're two different things.
> >=20
> > I totally understand why you've gone that direction with kirk but I
> > also did spell out at the time that it wasn't something which really
> > fits in with the way we run tests, or what we actually aim to test. I
> > was told at the time that basically, nobody is interested in what we
> > want/do.
>=20
> ...
> > > I see in meta/lib/oeqa/runtime/cases/ltp.py the deprecated
> > > /opt/ltp/runltp is still being used. We want to remove it (not sure
> > > when, but it will happen sooner or later). Any change somebody would
> > > submit a patch to switch to kirk?
>=20
> > It is more likely that when you drop runltp, we'll just have to drop
> > ltp. Sorry :(. I did explain this at while ago :/.
>=20
> It's a question if any of the users really need LTP. If yes, you could ve=
ndor
> runltp.
>=20
> Or, write a simple script which parses the content of the runtest files a=
nd
> execute them. FYI for part of openSUSE testing we still use our custom op=
enQA
> runner which does exactly this. It would be very light: -d and -r can be
> replaced by TMPDIR and LTPROOT, -I is supported by all tests. The only mi=
ssing
> thing will be generating of results (if you really need it, I'd recommend=
 kirk
> and it's JSON output).

We'd appreciate and be able to use the json output, we already have
json output for most of our other tests. Beyond that, as you say, we
don't really need much beyond what runltp does though. kirk brings with
it a number of things we definitely do not want (as mentioned above). I
don't know if we can avoid those or not.

> The reason we go to kirk + ltx is that in the future we plan to get rid o=
f
> runtests, replace them with metadata info (that will allow many things [4=
],
> but you were Cc at the discussion [5]). Once this happen, runltp (or any =
custom
> script / framework runner) will be broken. But this likely take long time=
.

Right, using a vendored runltp would just buy us a small amount of time
so likely isn't a long term viable solution sadly. I'd consider it if
it were but it doesn't seem a good investment of time.

Cheers,

Richard


