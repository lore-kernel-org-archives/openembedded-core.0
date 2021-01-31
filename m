Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.17779.1612098627766095557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 05:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GmSOvW7v;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id n6so15726696edt.10
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 05:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/46j6kmCmw1UJJx3d9LYUVl7dWlwgGpANMgJlIjenkU=;
        b=GmSOvW7vCwQuTkUg9MUKmbhr16wfJgIxPzQDEuJIC67m9op3CLNjpmErz5XrvpFDyt
         Cw0Clo/pEhoJ71xpwlzRu11ThjNwF5W6COuxTe6bJ4xh4MYglglc37qc9o1oe6+u7aBQ
         R3s6fTtKSbHYwy5hH2zPwO2nQ5ybyk9wyUdeqXSp03JZBOQQYPt2c154cNnQTvQl3oIP
         afRSF7ppRiCdKuyAypHho9rUZubMPPV7TJyoOVdtu5bSCDW39YqMYvXoICJdYiKAvrVA
         YYMwkVyNlQN2r0FEBZB4V3Kx64QUbxklLPa6xx6KIKmt3v/tjuReiUsByZJ249XtGrZZ
         MNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/46j6kmCmw1UJJx3d9LYUVl7dWlwgGpANMgJlIjenkU=;
        b=Q2hr+R7F3CjScekGw0K2BKHDAMlp/76V/85BOG8gRCj27DLiPwFSO0jrBWWzm/LeTA
         T1hiDaCBOh5fSBDPKbRg3aVvEEkvkVFJ5I1aJWgP2jxGN8VnxGjRfWPredTtB+Rxzsah
         ekMUhTsjWiVAqjd1PQtOKETBJKESmV6JzGMpRueOPoeBBcTvHQKm/LQzKsDLApTKj6nS
         KukZapBn6G2CrsChdVAKS5xcS+nVckLMkSc2ad0CJQR1g3PSFx0O0nmm4vVnZzFNIwbY
         yurOpbni0fz5IWVWazbZBg5hLv9IsuwZhkEnLN1+UFZaXCOiFfoF0wm2Y1Qj0kmYOgGK
         pqRA==
X-Gm-Message-State: AOAM532r+ZioFPq7dGKEuwYT9iIdG+wrfYMCj+jATJmDKXUM+XKitXpE
	ogn3DR1udZRttP1qmOS9Vx4=
X-Google-Smtp-Source: ABdhPJy6SJ21a0UrJNCwiHeVorGmdXrgbNBeiZpcbGq12astGBv/LhBY0YnQl+aJJiFH7N6YMG3A2w==
X-Received: by 2002:a05:6402:510f:: with SMTP id m15mr14265242edd.267.1612098625279;
        Sun, 31 Jan 2021 05:10:25 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m8sm7288551eds.70.2021.01.31.05.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 05:10:24 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 31 Jan 2021 14:10:23 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/7] native: Stop clearing PACKAGES
Message-ID: <20210131131023.2oor4o3nmhhg3gxi@jama>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
 <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
 <CA+chaQdc7P6NsTno6oCcB4HmoseMziAXA57f646=YWWDPyEH8w@mail.gmail.com>
 <d29734c79a8d5712f4c2cc720e11071dedb68383.camel@linuxfoundation.org>
 <20210131095518.iqqi2lrx7n5b2csp@jama>
 <1af99424085f84d64915e6251cc809ac450b8b0f.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1af99424085f84d64915e6251cc809ac450b8b0f.camel@linuxfoundation.org>
X-Groupsio-MsgNum: 147492
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oakhxkhbkbqq3tp4"
Content-Disposition: inline

--oakhxkhbkbqq3tp4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 31, 2021 at 10:34:48AM +0000, Richard Purdie wrote:
> On Sun, 2021-01-31 at 10:55 +0100, Martin Jansa wrote:
> > On Sun, Jan 31, 2021 at 09:07:50AM +0000, Richard Purdie wrote:
> > > On Sat, 2021-01-30 at 17:15 +0100, Martin Jansa wrote:
> > > > I'm asking because meta-python2 has the same issue in:
> > > > https://git.openembedded.org/meta-python2/tree/recipes-devtools/pyt=
hon/python-setuptools.inc#n49
> > > >=20
> > > > and my fix I was planing to send was to replace it with:
> > > > RDEPENDS_${PN}_append_class-target =3D " ${PYTHON_PN}-pkg-resources"
> > > > and drop the RPROVIDES, because it unfortunately causes bitbake to
> > > > get stuck after reporting parsing error as:
> > > >=20
> > > > ERROR: meta-python2/recipes-devtools/python/python-
> > > > setuptools_42.0.2.bb: QA Issue: meta-python2/recipes-
> > > > devtools/python/python-setuptools_42.0.2.bb: Variable RPROVIDES is
> > > > set as not being package specific, please fix this. [pkgvarcheck]
> > > > ERROR: meta-python2/recipes-devtools/python/python-
> > > > setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> > > > ERROR: Failed to parse recipe: meta-python2/recipes-
> > > > devtools/python/python-setuptools_42.0.2.bb
> > >=20
> > > Are you saying that it does that with the RPROVIDES removed? That see=
ms
> > > odd :/
> >=20
> > No, this was before removing RPROVIDES in meta-python2, I was just
> > surprised that bitbake got stuck after reporting parsing failure, I'm
> > seeing bitbake getting stuck in dunfell builds quite often, but don't
> > remember seeing it with gatesgarth and newer (and was believing that you
> > have already fixed most if not all cases there). But it's also true that
> > our jenkins runs 1000x more builds based on dunfell, so it's much more
> > likely to happen there.
>=20
> Its the first time I've heard a report of that and it sounds a little
> worrying. What you say stuck, bitbake hangs? Is it using cpu? A process
> tree of what it looks like when stuck would be interesting if it is
> hanging and maybe the last things in any running or just finished task
> logs. It could be some issue with the way a failing task is handled?
>=20
> We've seen a lot of weird issues on the autobuilder but not that. Could
> you have something enabled in your setup for logging/reporting whch
> wouldn't be in ours and could be causing it?

It doesn't seem to happen very often and I guess autobuilder doesn't
include meta-python2 (which is currently the only reproducer in my list
of layers).

I've tried to reproduce it with just 3 layers included:
BBLAYERS =3D " \
  /OE/build/oe-core/meta-python2 \
  /OE/build/oe-core/meta-openembedded/meta-oe \
  /OE/build/oe-core/openembedded-core/meta \
"

and it happened on 3rd try (cache, tmpdir, sstate-cache were removed
only before 1st try)

martin@jama:/OE/build/oe-core$ bitbake -k python-native
Loading cache: 100% |                                                      =
                                                                           =
                                                                           =
                      | ETA:  --:--:--
Loaded 0 entries from dependency cache.
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setupt=
ools_42.0.2.bb: QA Issue: /OE/build/oe-core/meta-python2/recipes-devtools/p=
ython/python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being p=
ackage specific, please fix this. [pkgvarcheck]
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setupt=
ools_42.0.2.bb: Fatal QA errors found, failing task.
ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-devto=
ols/python/python-setuptools_42.0.2.bb                                     =
                                                                           =
                       | ETA:  0:00:14

Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
martin@jama:/OE/build/oe-core$ bitbake -k python-native
NOTE: Reconnecting to bitbake server...
Loading cache: 100% |######################################################=
###########################################################################=
###########################################################################=
#######################| Time: 0:00:00
Loaded 845 entries from dependency cache.
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-native=
_2.7.18.bb: Error executing a python function in <code>:                   =
                                                                           =
                       | ETA:  0:01:10

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 14, function: <module>
     0010:__anon_35__OE_build_oe_core_openembedded_core_meta_classes_devshe=
ll_bbclass(d)
     0011:__anon_151__OE_build_oe_core_openembedded_core_meta_classes_sstat=
e_bbclass(d)
     0012:__anon_20__OE_build_oe_core_openembedded_core_meta_classes_blackl=
ist_bbclass(d)
     0013:__anon_177__OE_build_oe_core_openembedded_core_meta_classes_sitei=
nfo_bbclass(d)
 *** 0014:__anon_90__OE_build_oe_core_meta_python2_recipes_devtools_python_=
python_native_2_7_18_bb(d)
File: '/OE/build/oe-core/meta-python2/recipes-devtools/python/python-native=
_2.7.18.bb', lineno: 76, function: __anon_90__OE_build_oe_core_meta_python2=
_recipes_devtools_python_python_native_2_7_18_bb
     0072:        manifest_file.seek(json_start)
     0073:        manifest_str =3D manifest_file.read()
     0074:        python_manifest =3D json.loads(manifest_str)
     0075:
 *** 0076:    rprovides =3D d.getVar('RPROVIDES').split()
     0077:
     0078:    # Hardcoded since it cant be python-native-foo, should be pyt=
hon-foo-native
     0079:    pn =3D 'python'
     0080:
Exception: AttributeError: 'NoneType' object has no attribute 'split'

ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setupt=
ools_42.0.2.bb: QA Issue: /OE/build/oe-core/meta-python2/recipes-devtools/p=
ython/python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being p=
ackage specific, please fix this. [pkgvarcheck]
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setupt=
ools_42.0.2.bb: Fatal QA errors found, failing task.
ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-devto=
ols/python/python-native_2.7.18.bb                                         =
                                                                           =
                       | ETA:  0:00:30

Summary: There were 4 ERROR messages shown, returning a non-zero exit code.
martin@jama:/OE/build/oe-core$ bitbake -k python-native
NOTE: Reconnecting to bitbake server...
Loading cache: 100% |######################################################=
###########################################################################=
###########################################################################=
#######################| Time: 0:00:00
Loaded 1289 entries from dependency cache.
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setupt=
ools_42.0.2.bb: QA Issue: /OE/build/oe-core/meta-python2/recipes-devtools/p=
ython/python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being p=
ackage specific, please fix this. [pkgvarcheck]
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setupt=
ools_42.0.2.bb: Fatal QA errors found, failing task.
ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-devto=
ols/python/python-setuptools_42.0.2.bb                                     =
   =20

and here it's stuck for around 1 hour, bitbake using very little cpu.

martin@jama:~$ ps aux | grep bitbake
martin    372784  0.0  0.0  11552   884 pts/1    S+   13:43   0:00 grep --c=
olor=3Dauto bitbake
martin    928962  0.1  0.1 219204 133704 ?       Sl   12:42   0:04 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    943698  0.0  0.0 119900 29928 pts/8    Sl+  12:43   0:01 python3 =
/OE/build/oe-core/bitbake/bin/bitbake -k python-native
martin    945507  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945528  0.0  0.0 214364 124740 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945532  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945563  0.0  0.0 214364 124732 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945577  0.0  0.0 214364 124740 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945621  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945632  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945643  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945653  0.0  0.0 214364 124740 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945669  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945685  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945703  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945736  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945753  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945774  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945778  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945819  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945839  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945860  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945878  0.0  0.0 214364 124740 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945894  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945909  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945915  0.0  0.0 214364 124804 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945929  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945950  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945953  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945964  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945966  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    945989  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946005  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946016  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946037  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946038  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946064  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946068  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946080  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946103  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946109  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946122  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946135  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946137  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946152  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946167  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946168  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946185  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946197  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946214  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946228  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946243  0.0  0.0 214364 124728 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946249  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946265  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946298  0.0  0.0 214364 124740 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946345  0.0  0.0 214364 124736 ?       Sl   12:43   0:01 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946364  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946386  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946389  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946405  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946410  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946442  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946458  0.0  0.0 214364 124612 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946463  0.0  0.0 214364 124652 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946481  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946501  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin    946518  0.0  0.0 214364 124736 ?       Sl   12:43   0:00 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0

martin@jama:~$ sudo strace -p 928962
strace: Process 928962 attached
wait4(945507,=20

martin@jama:~$ kill 928962

adds an warning to the stuck build:

martin@jama:/OE/build/oe-core$ bitbake -k python-native
NOTE: Reconnecting to bitbake server...
Loading cache: 100% |######################################################=
###########################################################################=
###########################################################################=
#######################| Time: 0:00:00
Loaded 1289 entries from dependency cache.
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setupt=
ools_42.0.2.bb: QA Issue: /OE/build/oe-core/meta-python2/recipes-devtools/p=
ython/python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being p=
ackage specific, please fix this. [pkgvarcheck]
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-setupt=
ools_42.0.2.bb: Fatal QA errors found, failing task.
ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-devto=
ols/python/python-setuptools_42.0.2.bb                                     =
                                                                           =
                       | ETA:  0:00:50
WARNING: Cooker received SIGTERM, shutting down...

killing the main process:
martin@jama:~$ kill 943698

terminates the stuck build, but all bitbake-server processes are left behin=
d.

If I try to kill all remaining bitbake-server processes, then only one is l=
eft behind:
martin    928962  0.1  0.1 285004 137688 ?       S    12:42   0:05 bitbake-=
server /OE/bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbak=
e-cookerdaemon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake=
=2Esock None None 0
martin@jama:/OE/build/oe-core$ sudo strace -p 928962
strace: Process 928962 attached
select(7, [6], [], [], {tv_sec=3D0, tv_usec=3D40768}) =3D 0 (Timeout)
poll([{fd=3D7, events=3DPOLLIN}], 1, 0)     =3D 0 (Timeout)
poll([{fd=3D8, events=3DPOLLIN}], 1, 0)     =3D 0 (Timeout)
select(7, [6], [], [], {tv_sec=3D0, tv_usec=3D100000}) =3D 0 (Timeout)
poll([{fd=3D7, events=3DPOLLIN}], 1, 0)     =3D 0 (Timeout)
poll([{fd=3D8, events=3DPOLLIN}], 1, 0)     =3D 0 (Timeout)

and then it dies as well after a while.

Here is bitbake-cookerdaemon.log, but doesn't look very interesting to me:

928962 12:42:56.099747 --- Starting bitbake server pid 928962 at 2021-01-31=
 12:42:56.099713 ---
928962 12:42:56.110782 Started bitbake server pid 928962
928962 12:42:56.111010 Entering server connection loop
928962 12:42:56.111833 Accepting [<socket.socket fd=3D6, family=3DAddressFa=
mily.AF_UNIX, type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3Dbitbake.soc=
k>] ([])
928962 12:42:56.112382 Processing Client
928962 12:42:56.112428 Connecting Client
928962 12:42:56.112733 Running command ['setFeatures', [2]]
928962 12:42:56.113448 Command Completed
928962 12:42:56.113566 Running command ['updateConfig', {'abort': False, 'f=
orce': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures'=
: [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfi=
le': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False=
, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': =
None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default=
_loglevel': 20, 'debug_domains': {}}, {'SHELL': '/bin/bash', 'SSH_AUTH_SOCK=
': '/run/user/1000/keyring/ssh', 'SSH_AGENT_PID': '3080', 'PWD': '/OE/build=
/oe-core', 'LOGNAME': 'martin', 'HOME': '/home/martin', 'MACHINE': 'qemux86=
-64', 'BB_ENV_EXTRAWHITE': 'MACHINE DISTRO http_proxy ftp_proxy https_proxy=
 all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY =
SDKMACHINE BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD=
', 'USER': 'martin', 'LC_ALL': 'en_US.UTF-8', 'PATH': '/OE/build/oe-core/op=
enembedded-core/scripts:/OE/build/oe-core/bitbake/bin:/home/martin/bin:/usr=
/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/lo=
cal/games:/snap/bin', 'SESSION_MANAGER': 'local/jama:@/tmp/.ICE-unix/2943,u=
nix/jama:/tmp/.ICE-unix/2943', 'WINDOWID': '79691779', 'QT_ACCESSIBILITY': =
'1', 'COLORTERM': 'truecolor', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-xubuntu:/et=
c/xdg:/etc/xdg', 'XDG_SESSION_PATH': '/org/freedesktop/DisplayManager/Sessi=
on0', 'XDG_MENU_PREFIX': 'xfce-', 'CLUTTER_BACKEND': 'x11', 'LANGUAGE': 'en=
_US', 'TERMCAP': 'SC|screen.xterm-256color|VT 100/ANSI X3.64 virtual termin=
al:DO=3D\\E[%dB:LE=3D\\E[%dD:RI=3D\\E[%dC:UP=3D\\E[%dA:bs:bt=3D\\E[Z:cd=3D\=
\E[J:ce=3D\\E[K:cl=3D\\E[H\\E[J:cm=3D\\E[%i%d;%dH:ct=3D\\E[3g:do=3D^J:nd=3D=
\\E[C:pt:rc=3D\\E8:rs=3D\\Ec:sc=3D\\E7:st=3D\\EH:up=3D\\EM:le=3D^H:bl=3D^G:=
cr=3D^M:it#8:ho=3D\\E[H:nw=3D\\EE:ta=3D^I:is=3D\\E)0:li#51:co#263:am:xn:xv:=
LP:sr=3D\\EM:al=3D\\E[L:AL=3D\\E[%dL:cs=3D\\E[%i%d;%dr:dl=3D\\E[M:DL=3D\\E[=
%dM:dc=3D\\E[P:DC=3D\\E[%dP:im=3D\\E[4h:ei=3D\\E[4l:mi:IC=3D\\E[%d@:ks=3D\\=
E[?1h\\E=3D:ke=3D\\E[?1l\\E>:vi=3D\\E[?25l:ve=3D\\E[34h\\E[?25h:vs=3D\\E[34=
l:ti=3D\\E[?1049h:te=3D\\E[?1049l:us=3D\\E[4m:ue=3D\\E[24m:so=3D\\E[3m:se=
=3D\\E[23m:mb=3D\\E[5m:md=3D\\E[1m:mh=3D\\E[2m:mr=3D\\E[7m:me=3D\\E[m:ms:Co=
#8:pa#64:AF=3D\\E[3%dm:AB=3D\\E[4%dm:op=3D\\E[39;49m:AX:vb=3D\\Eg:G0:as=3D\=
\E(0:ae=3D\\E(B:ac=3D\\140\\140aaffggjjkkllmmnnooppqqrrssttuuvvwwxxyyzz{{||=
}}~~..--++,,hhII00:po=3D\\E[5i:pf=3D\\E[4i:Km=3D\\E[<:k0=3D\\E[10~:k1=3D\\E=
OP:k2=3D\\EOQ:k3=3D\\EOR:k4=3D\\EOS:k5=3D\\E[15~:k6=3D\\E[17~:k7=3D\\E[18~:=
k8=3D\\E[19~:k9=3D\\E[20~:k;=3D\\E[21~:F1=3D\\E[23~:F2=3D\\E[24~:kB=3D\\E[Z=
:kh=3D\\E[1~:@1=3D\\E[1~:kH=3D\\E[4~:@7=3D\\E[4~:kN=3D\\E[6~:kP=3D\\E[5~:kI=
=3D\\E[2~:kD=3D\\E[3~:ku=3D\\EOA:kd=3D\\EOB:kr=3D\\EOC:kl=3D\\EOD:km:', 'LC=
_ADDRESS': 'cs_CZ.UTF-8', 'LC_NAME': 'cs_CZ.UTF-8', 'WINDOW': '6', 'DESKTOP=
_SESSION': 'xubuntu', 'LC_MONETARY': 'cs_CZ.UTF-8', 'EDITOR': 'vim', 'XDG_S=
EAT': 'seat0', 'XDG_SESSION_DESKTOP': 'xubuntu', 'QT_QPA_PLATFORMTHEME': 'g=
tk2', 'XDG_SESSION_TYPE': 'x11', 'PANEL_GDK_CORE_DEVICE_EVENTS': '0', 'GPG_=
AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'XAUTHORITY': '/home/m=
artin/.Xauthority', 'XDG_GREETER_DATA_DIR': '/var/lib/lightdm-data/martin',=
 'GDM_LANG': 'en_US', 'LANG': 'C', 'LC_PAPER': 'cs_CZ.UTF-8', 'LS_COLORS': =
'rs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=3D01;35:bd=
=3D40;33;01:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D30;43:ca=3D=
30;41:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:*.tgz=3D01;=
31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=3D01;31:*.=
lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D01;31:*.t7z=
=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.dz=3D01;31:*.gz=3D01;31:*.lrz=3D01;31:=
*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D01;31:*.tzst=3D01;31:*.bz2=
=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31:*.tz=3D01;31:*.deb=3D01;=
31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=3D01;31:*.sar=3D01;31:*.=
rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01;31:*.cpio=3D01;31:*.7z=
=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.swm=3D01;31:*.dwm=3D01;=
31:*.esd=3D01;31:*.jpg=3D01;35:*.jpeg=3D01;35:*.mjpg=3D01;35:*.mjpeg=3D01;3=
5:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=3D01;35:*.ppm=3D01;35:*.t=
ga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35:*.png=
=3D01;35:*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.mov=3D0=
1;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=3D01;3=
5:*.webp=3D01;35:*.ogm=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;35:*=
=2Evob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=
=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*.flv=3D0=
1;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.=
cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.au=3D=
00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;=
36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;36:*.o=
ga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xspf=3D00;36:', 'XDG_CURRENT_DESK=
TOP': 'XFCE', 'VTE_VERSION': '6200', 'XDG_SEAT_PATH': '/org/freedesktop/Dis=
playManager/Seat0', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_SESSION_CL=
ASS': 'user', 'LC_IDENTIFICATION': 'cs_CZ.UTF-8', 'TERM': 'screen.xterm-256=
color', 'GTK_OVERLAY_SCROLLING': '0', 'LESSOPEN': '| /usr/bin/lesspipe %s',=
 'DISPLAY': ':0.0', 'SHLVL': '2', 'LC_TELEPHONE': 'cs_CZ.UTF-8', 'LC_MEASUR=
EMENT': 'cs_CZ.UTF-8', 'XDG_VTNR': '7', 'XDG_SESSION_ID': 'c2', 'LD_LIBRARY=
_PATH': '', 'XDG_RUNTIME_DIR': '/run/user/1000', 'LC_TIME': 'cs_CZ.UTF-8', =
'XDG_DATA_DIRS': '/usr/share/xubuntu:/usr/share/xfce4:/usr/local/share:/usr=
/share:/var/lib/snapd/desktop:/usr/share', 'STY': '5368.x', 'GDMSESSION': '=
xubuntu', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=3D/run/user/1000/bus', 'BU=
ILDDIR': '/OE/build/oe-core', 'LC_NUMERIC': 'cs_CZ.UTF-8', 'OLDPWD': '/OE/b=
uild/oe-core/meta-python2', '_': '/OE/build/oe-core/bitbake/bin/bitbake'}, =
['/OE/build/oe-core/bitbake/bin/bitbake', '-k', 'python-native']]
928962 12:42:56.450688 Command Completed
928962 12:42:56.450996 Running command ['getVariable', 'BBINCLUDELOGS']
928962 12:42:56.451159 Command Completed
928962 12:42:56.451239 Running command ['getVariable', 'BBINCLUDELOGS_LINES=
']
928962 12:42:56.451360 Command Completed
928962 12:42:56.451436 Running command ['getSetVariable', 'BB_CONSOLELOG']
928962 12:42:56.451656 Command Completed
928962 12:42:56.451740 Running command ['getSetVariable', 'BB_LOGCONFIG']
928962 12:42:56.453927 Command Completed
928962 12:42:56.454122 Running command ['getUIHandlerNum']
928962 12:42:56.454289 Command Completed
928962 12:42:56.454392 Running command ['setEventMask', 1, 20, {'BitBake.Ru=
nQueue.HashEquiv': 19, 'BitBake.SigGen.HashEquiv': 19}, ['bb.runqueue.runQu=
eueExitWait', 'bb.event.LogExecTTY', 'logging.LogRecord', 'bb.build.TaskFai=
led', 'bb.build.TaskBase', 'bb.event.ParseStarted', 'bb.event.ParseProgress=
', 'bb.event.ParseCompleted', 'bb.event.CacheLoadStarted', 'bb.event.CacheL=
oadProgress', 'bb.event.CacheLoadCompleted', 'bb.command.CommandFailed', 'b=
b.command.CommandExit', 'bb.command.CommandCompleted', 'bb.cooker.CookerExi=
t', 'bb.event.MultipleProviders', 'bb.event.NoProvider', 'bb.runqueue.scene=
QueueTaskStarted', 'bb.runqueue.runQueueTaskStarted', 'bb.runqueue.runQueue=
TaskFailed', 'bb.runqueue.sceneQueueTaskFailed', 'bb.event.BuildBase', 'bb.=
build.TaskStarted', 'bb.build.TaskSucceeded', 'bb.build.TaskFailedSilent', =
'bb.build.TaskProgress', 'bb.event.ProcessStarted', 'bb.event.ProcessProgre=
ss', 'bb.event.ProcessFinished']]
928962 12:42:56.454523 Command Completed
928962 12:42:56.454599 Running command ['getVariable', 'BB_DEFAULT_TASK']
928962 12:42:56.454741 Command Completed
928962 12:42:56.454816 Running command ['setConfig', 'cmd', 'build']
928962 12:42:56.454947 Command Completed
928962 12:42:56.455022 Running command ['buildTargets', ['python-native'], =
'build']
928962 12:42:56.457778 Command Completed
928962 12:43:04.560968 Processing Client
928962 12:43:04.561063 Disconnecting Client
928962 12:43:08.544918 Accepting [<socket.socket fd=3D6, family=3DAddressFa=
mily.AF_UNIX, type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3Dbitbake.soc=
k>] ([])
928962 12:43:08.557050 Processing Client
928962 12:43:08.557154 Connecting Client
928962 12:43:08.557787 Running command ['setFeatures', [2]]
928962 12:43:08.558183 Command Completed
928962 12:43:08.558952 Running command ['updateConfig', {'abort': False, 'f=
orce': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures'=
: [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfi=
le': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False=
, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': =
None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default=
_loglevel': 20, 'debug_domains': {}}, {'SHELL': '/bin/bash', 'SSH_AUTH_SOCK=
': '/run/user/1000/keyring/ssh', 'SSH_AGENT_PID': '3080', 'PWD': '/OE/build=
/oe-core', 'LOGNAME': 'martin', 'HOME': '/home/martin', 'MACHINE': 'qemux86=
-64', 'BB_ENV_EXTRAWHITE': 'MACHINE DISTRO http_proxy ftp_proxy https_proxy=
 all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY =
SDKMACHINE BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD=
', 'USER': 'martin', 'LC_ALL': 'en_US.UTF-8', 'PATH': '/OE/build/oe-core/op=
enembedded-core/scripts:/OE/build/oe-core/bitbake/bin:/home/martin/bin:/usr=
/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/lo=
cal/games:/snap/bin', 'SESSION_MANAGER': 'local/jama:@/tmp/.ICE-unix/2943,u=
nix/jama:/tmp/.ICE-unix/2943', 'WINDOWID': '79691779', 'QT_ACCESSIBILITY': =
'1', 'COLORTERM': 'truecolor', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-xubuntu:/et=
c/xdg:/etc/xdg', 'XDG_SESSION_PATH': '/org/freedesktop/DisplayManager/Sessi=
on0', 'XDG_MENU_PREFIX': 'xfce-', 'CLUTTER_BACKEND': 'x11', 'LANGUAGE': 'en=
_US', 'TERMCAP': 'SC|screen.xterm-256color|VT 100/ANSI X3.64 virtual termin=
al:DO=3D\\E[%dB:LE=3D\\E[%dD:RI=3D\\E[%dC:UP=3D\\E[%dA:bs:bt=3D\\E[Z:cd=3D\=
\E[J:ce=3D\\E[K:cl=3D\\E[H\\E[J:cm=3D\\E[%i%d;%dH:ct=3D\\E[3g:do=3D^J:nd=3D=
\\E[C:pt:rc=3D\\E8:rs=3D\\Ec:sc=3D\\E7:st=3D\\EH:up=3D\\EM:le=3D^H:bl=3D^G:=
cr=3D^M:it#8:ho=3D\\E[H:nw=3D\\EE:ta=3D^I:is=3D\\E)0:li#51:co#263:am:xn:xv:=
LP:sr=3D\\EM:al=3D\\E[L:AL=3D\\E[%dL:cs=3D\\E[%i%d;%dr:dl=3D\\E[M:DL=3D\\E[=
%dM:dc=3D\\E[P:DC=3D\\E[%dP:im=3D\\E[4h:ei=3D\\E[4l:mi:IC=3D\\E[%d@:ks=3D\\=
E[?1h\\E=3D:ke=3D\\E[?1l\\E>:vi=3D\\E[?25l:ve=3D\\E[34h\\E[?25h:vs=3D\\E[34=
l:ti=3D\\E[?1049h:te=3D\\E[?1049l:us=3D\\E[4m:ue=3D\\E[24m:so=3D\\E[3m:se=
=3D\\E[23m:mb=3D\\E[5m:md=3D\\E[1m:mh=3D\\E[2m:mr=3D\\E[7m:me=3D\\E[m:ms:Co=
#8:pa#64:AF=3D\\E[3%dm:AB=3D\\E[4%dm:op=3D\\E[39;49m:AX:vb=3D\\Eg:G0:as=3D\=
\E(0:ae=3D\\E(B:ac=3D\\140\\140aaffggjjkkllmmnnooppqqrrssttuuvvwwxxyyzz{{||=
}}~~..--++,,hhII00:po=3D\\E[5i:pf=3D\\E[4i:Km=3D\\E[<:k0=3D\\E[10~:k1=3D\\E=
OP:k2=3D\\EOQ:k3=3D\\EOR:k4=3D\\EOS:k5=3D\\E[15~:k6=3D\\E[17~:k7=3D\\E[18~:=
k8=3D\\E[19~:k9=3D\\E[20~:k;=3D\\E[21~:F1=3D\\E[23~:F2=3D\\E[24~:kB=3D\\E[Z=
:kh=3D\\E[1~:@1=3D\\E[1~:kH=3D\\E[4~:@7=3D\\E[4~:kN=3D\\E[6~:kP=3D\\E[5~:kI=
=3D\\E[2~:kD=3D\\E[3~:ku=3D\\EOA:kd=3D\\EOB:kr=3D\\EOC:kl=3D\\EOD:km:', 'LC=
_ADDRESS': 'cs_CZ.UTF-8', 'LC_NAME': 'cs_CZ.UTF-8', 'WINDOW': '6', 'DESKTOP=
_SESSION': 'xubuntu', 'LC_MONETARY': 'cs_CZ.UTF-8', 'EDITOR': 'vim', 'XDG_S=
EAT': 'seat0', 'XDG_SESSION_DESKTOP': 'xubuntu', 'QT_QPA_PLATFORMTHEME': 'g=
tk2', 'XDG_SESSION_TYPE': 'x11', 'PANEL_GDK_CORE_DEVICE_EVENTS': '0', 'GPG_=
AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'XAUTHORITY': '/home/m=
artin/.Xauthority', 'XDG_GREETER_DATA_DIR': '/var/lib/lightdm-data/martin',=
 'GDM_LANG': 'en_US', 'LANG': 'C', 'LC_PAPER': 'cs_CZ.UTF-8', 'LS_COLORS': =
'rs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=3D01;35:bd=
=3D40;33;01:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D30;43:ca=3D=
30;41:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:*.tgz=3D01;=
31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=3D01;31:*.=
lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D01;31:*.t7z=
=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.dz=3D01;31:*.gz=3D01;31:*.lrz=3D01;31:=
*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D01;31:*.tzst=3D01;31:*.bz2=
=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31:*.tz=3D01;31:*.deb=3D01;=
31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=3D01;31:*.sar=3D01;31:*.=
rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01;31:*.cpio=3D01;31:*.7z=
=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.swm=3D01;31:*.dwm=3D01;=
31:*.esd=3D01;31:*.jpg=3D01;35:*.jpeg=3D01;35:*.mjpg=3D01;35:*.mjpeg=3D01;3=
5:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=3D01;35:*.ppm=3D01;35:*.t=
ga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35:*.png=
=3D01;35:*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.mov=3D0=
1;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=3D01;3=
5:*.webp=3D01;35:*.ogm=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;35:*=
=2Evob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=
=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*.flv=3D0=
1;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.=
cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.au=3D=
00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;=
36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;36:*.o=
ga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xspf=3D00;36:', 'XDG_CURRENT_DESK=
TOP': 'XFCE', 'VTE_VERSION': '6200', 'XDG_SEAT_PATH': '/org/freedesktop/Dis=
playManager/Seat0', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_SESSION_CL=
ASS': 'user', 'LC_IDENTIFICATION': 'cs_CZ.UTF-8', 'TERM': 'screen.xterm-256=
color', 'GTK_OVERLAY_SCROLLING': '0', 'LESSOPEN': '| /usr/bin/lesspipe %s',=
 'DISPLAY': ':0.0', 'SHLVL': '2', 'LC_TELEPHONE': 'cs_CZ.UTF-8', 'LC_MEASUR=
EMENT': 'cs_CZ.UTF-8', 'XDG_VTNR': '7', 'XDG_SESSION_ID': 'c2', 'LD_LIBRARY=
_PATH': '', 'XDG_RUNTIME_DIR': '/run/user/1000', 'LC_TIME': 'cs_CZ.UTF-8', =
'XDG_DATA_DIRS': '/usr/share/xubuntu:/usr/share/xfce4:/usr/local/share:/usr=
/share:/var/lib/snapd/desktop:/usr/share', 'STY': '5368.x', 'GDMSESSION': '=
xubuntu', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=3D/run/user/1000/bus', 'BU=
ILDDIR': '/OE/build/oe-core', 'LC_NUMERIC': 'cs_CZ.UTF-8', 'OLDPWD': '/OE/b=
uild/oe-core/meta-python2', '_': '/OE/build/oe-core/bitbake/bin/bitbake'}, =
['/OE/build/oe-core/bitbake/bin/bitbake', '-k', 'python-native']]
928962 12:43:08.559567 Command Completed
928962 12:43:08.559798 Running command ['getVariable', 'BBINCLUDELOGS']
928962 12:43:08.812911 Command Completed
928962 12:43:08.813560 Running command ['getVariable', 'BBINCLUDELOGS_LINES=
']
928962 12:43:08.813765 Command Completed
928962 12:43:08.813879 Running command ['getSetVariable', 'BB_CONSOLELOG']
928962 12:43:08.814115 Command Completed
928962 12:43:08.814236 Running command ['getSetVariable', 'BB_LOGCONFIG']
928962 12:43:08.816210 Command Completed
928962 12:43:08.816451 Running command ['getUIHandlerNum']
928962 12:43:08.816661 Command Completed
928962 12:43:08.816799 Running command ['setEventMask', 2, 20, {'BitBake.Ru=
nQueue.HashEquiv': 19, 'BitBake.SigGen.HashEquiv': 19}, ['bb.runqueue.runQu=
eueExitWait', 'bb.event.LogExecTTY', 'logging.LogRecord', 'bb.build.TaskFai=
led', 'bb.build.TaskBase', 'bb.event.ParseStarted', 'bb.event.ParseProgress=
', 'bb.event.ParseCompleted', 'bb.event.CacheLoadStarted', 'bb.event.CacheL=
oadProgress', 'bb.event.CacheLoadCompleted', 'bb.command.CommandFailed', 'b=
b.command.CommandExit', 'bb.command.CommandCompleted', 'bb.cooker.CookerExi=
t', 'bb.event.MultipleProviders', 'bb.event.NoProvider', 'bb.runqueue.scene=
QueueTaskStarted', 'bb.runqueue.runQueueTaskStarted', 'bb.runqueue.runQueue=
TaskFailed', 'bb.runqueue.sceneQueueTaskFailed', 'bb.event.BuildBase', 'bb.=
build.TaskStarted', 'bb.build.TaskSucceeded', 'bb.build.TaskFailedSilent', =
'bb.build.TaskProgress', 'bb.event.ProcessStarted', 'bb.event.ProcessProgre=
ss', 'bb.event.ProcessFinished']]
928962 12:43:08.816980 Command Completed
928962 12:43:08.817101 Running command ['getVariable', 'BB_DEFAULT_TASK']
928962 12:43:08.817293 Command Completed
928962 12:43:08.817418 Running command ['setConfig', 'cmd', 'build']
928962 12:43:08.817604 Command Completed
928962 12:43:08.817732 Running command ['buildTargets', ['python-native'], =
'build']
928962 12:43:08.820432 Command Completed
928962 12:43:18.569947 Processing Client
928962 12:43:18.570026 Disconnecting Client
928962 12:43:21.796010 Accepting [<socket.socket fd=3D6, family=3DAddressFa=
mily.AF_UNIX, type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3Dbitbake.soc=
k>] ([])
928962 12:43:21.812637 Processing Client
928962 12:43:21.812758 Connecting Client
928962 12:43:21.816670 Running command ['setFeatures', [2]]
928962 12:43:21.817252 Command Completed
928962 12:43:21.817987 Running command ['updateConfig', {'abort': False, 'f=
orce': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures'=
: [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfi=
le': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False=
, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': =
None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default=
_loglevel': 20, 'debug_domains': {}}, {'SHELL': '/bin/bash', 'SSH_AUTH_SOCK=
': '/run/user/1000/keyring/ssh', 'SSH_AGENT_PID': '3080', 'PWD': '/OE/build=
/oe-core', 'LOGNAME': 'martin', 'HOME': '/home/martin', 'MACHINE': 'qemux86=
-64', 'BB_ENV_EXTRAWHITE': 'MACHINE DISTRO http_proxy ftp_proxy https_proxy=
 all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY =
SDKMACHINE BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD=
', 'USER': 'martin', 'LC_ALL': 'en_US.UTF-8', 'PATH': '/OE/build/oe-core/op=
enembedded-core/scripts:/OE/build/oe-core/bitbake/bin:/home/martin/bin:/usr=
/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/lo=
cal/games:/snap/bin', 'SESSION_MANAGER': 'local/jama:@/tmp/.ICE-unix/2943,u=
nix/jama:/tmp/.ICE-unix/2943', 'WINDOWID': '79691779', 'QT_ACCESSIBILITY': =
'1', 'COLORTERM': 'truecolor', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-xubuntu:/et=
c/xdg:/etc/xdg', 'XDG_SESSION_PATH': '/org/freedesktop/DisplayManager/Sessi=
on0', 'XDG_MENU_PREFIX': 'xfce-', 'CLUTTER_BACKEND': 'x11', 'LANGUAGE': 'en=
_US', 'TERMCAP': 'SC|screen.xterm-256color|VT 100/ANSI X3.64 virtual termin=
al:DO=3D\\E[%dB:LE=3D\\E[%dD:RI=3D\\E[%dC:UP=3D\\E[%dA:bs:bt=3D\\E[Z:cd=3D\=
\E[J:ce=3D\\E[K:cl=3D\\E[H\\E[J:cm=3D\\E[%i%d;%dH:ct=3D\\E[3g:do=3D^J:nd=3D=
\\E[C:pt:rc=3D\\E8:rs=3D\\Ec:sc=3D\\E7:st=3D\\EH:up=3D\\EM:le=3D^H:bl=3D^G:=
cr=3D^M:it#8:ho=3D\\E[H:nw=3D\\EE:ta=3D^I:is=3D\\E)0:li#51:co#263:am:xn:xv:=
LP:sr=3D\\EM:al=3D\\E[L:AL=3D\\E[%dL:cs=3D\\E[%i%d;%dr:dl=3D\\E[M:DL=3D\\E[=
%dM:dc=3D\\E[P:DC=3D\\E[%dP:im=3D\\E[4h:ei=3D\\E[4l:mi:IC=3D\\E[%d@:ks=3D\\=
E[?1h\\E=3D:ke=3D\\E[?1l\\E>:vi=3D\\E[?25l:ve=3D\\E[34h\\E[?25h:vs=3D\\E[34=
l:ti=3D\\E[?1049h:te=3D\\E[?1049l:us=3D\\E[4m:ue=3D\\E[24m:so=3D\\E[3m:se=
=3D\\E[23m:mb=3D\\E[5m:md=3D\\E[1m:mh=3D\\E[2m:mr=3D\\E[7m:me=3D\\E[m:ms:Co=
#8:pa#64:AF=3D\\E[3%dm:AB=3D\\E[4%dm:op=3D\\E[39;49m:AX:vb=3D\\Eg:G0:as=3D\=
\E(0:ae=3D\\E(B:ac=3D\\140\\140aaffggjjkkllmmnnooppqqrrssttuuvvwwxxyyzz{{||=
}}~~..--++,,hhII00:po=3D\\E[5i:pf=3D\\E[4i:Km=3D\\E[<:k0=3D\\E[10~:k1=3D\\E=
OP:k2=3D\\EOQ:k3=3D\\EOR:k4=3D\\EOS:k5=3D\\E[15~:k6=3D\\E[17~:k7=3D\\E[18~:=
k8=3D\\E[19~:k9=3D\\E[20~:k;=3D\\E[21~:F1=3D\\E[23~:F2=3D\\E[24~:kB=3D\\E[Z=
:kh=3D\\E[1~:@1=3D\\E[1~:kH=3D\\E[4~:@7=3D\\E[4~:kN=3D\\E[6~:kP=3D\\E[5~:kI=
=3D\\E[2~:kD=3D\\E[3~:ku=3D\\EOA:kd=3D\\EOB:kr=3D\\EOC:kl=3D\\EOD:km:', 'LC=
_ADDRESS': 'cs_CZ.UTF-8', 'LC_NAME': 'cs_CZ.UTF-8', 'WINDOW': '6', 'DESKTOP=
_SESSION': 'xubuntu', 'LC_MONETARY': 'cs_CZ.UTF-8', 'EDITOR': 'vim', 'XDG_S=
EAT': 'seat0', 'XDG_SESSION_DESKTOP': 'xubuntu', 'QT_QPA_PLATFORMTHEME': 'g=
tk2', 'XDG_SESSION_TYPE': 'x11', 'PANEL_GDK_CORE_DEVICE_EVENTS': '0', 'GPG_=
AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'XAUTHORITY': '/home/m=
artin/.Xauthority', 'XDG_GREETER_DATA_DIR': '/var/lib/lightdm-data/martin',=
 'GDM_LANG': 'en_US', 'LANG': 'C', 'LC_PAPER': 'cs_CZ.UTF-8', 'LS_COLORS': =
'rs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=3D01;35:bd=
=3D40;33;01:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D30;43:ca=3D=
30;41:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:*.tgz=3D01;=
31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=3D01;31:*.=
lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D01;31:*.t7z=
=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.dz=3D01;31:*.gz=3D01;31:*.lrz=3D01;31:=
*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D01;31:*.tzst=3D01;31:*.bz2=
=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31:*.tz=3D01;31:*.deb=3D01;=
31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=3D01;31:*.sar=3D01;31:*.=
rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01;31:*.cpio=3D01;31:*.7z=
=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.swm=3D01;31:*.dwm=3D01;=
31:*.esd=3D01;31:*.jpg=3D01;35:*.jpeg=3D01;35:*.mjpg=3D01;35:*.mjpeg=3D01;3=
5:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=3D01;35:*.ppm=3D01;35:*.t=
ga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35:*.png=
=3D01;35:*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.mov=3D0=
1;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=3D01;3=
5:*.webp=3D01;35:*.ogm=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;35:*=
=2Evob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=
=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*.flv=3D0=
1;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.=
cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.au=3D=
00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;=
36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;36:*.o=
ga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xspf=3D00;36:', 'XDG_CURRENT_DESK=
TOP': 'XFCE', 'VTE_VERSION': '6200', 'XDG_SEAT_PATH': '/org/freedesktop/Dis=
playManager/Seat0', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_SESSION_CL=
ASS': 'user', 'LC_IDENTIFICATION': 'cs_CZ.UTF-8', 'TERM': 'screen.xterm-256=
color', 'GTK_OVERLAY_SCROLLING': '0', 'LESSOPEN': '| /usr/bin/lesspipe %s',=
 'DISPLAY': ':0.0', 'SHLVL': '2', 'LC_TELEPHONE': 'cs_CZ.UTF-8', 'LC_MEASUR=
EMENT': 'cs_CZ.UTF-8', 'XDG_VTNR': '7', 'XDG_SESSION_ID': 'c2', 'LD_LIBRARY=
_PATH': '', 'XDG_RUNTIME_DIR': '/run/user/1000', 'LC_TIME': 'cs_CZ.UTF-8', =
'XDG_DATA_DIRS': '/usr/share/xubuntu:/usr/share/xfce4:/usr/local/share:/usr=
/share:/var/lib/snapd/desktop:/usr/share', 'STY': '5368.x', 'GDMSESSION': '=
xubuntu', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=3D/run/user/1000/bus', 'BU=
ILDDIR': '/OE/build/oe-core', 'LC_NUMERIC': 'cs_CZ.UTF-8', 'OLDPWD': '/OE/b=
uild/oe-core/meta-python2', '_': '/OE/build/oe-core/bitbake/bin/bitbake'}, =
['/OE/build/oe-core/bitbake/bin/bitbake', '-k', 'python-native']]
928962 12:43:21.818533 Command Completed
928962 12:43:21.818721 Running command ['getVariable', 'BBINCLUDELOGS']
928962 12:43:22.255470 Command Completed
928962 12:43:22.255835 Running command ['getVariable', 'BBINCLUDELOGS_LINES=
']
928962 12:43:22.256018 Command Completed
928962 12:43:22.256172 Running command ['getSetVariable', 'BB_CONSOLELOG']
928962 12:43:22.256346 Command Completed
928962 12:43:22.256468 Running command ['getSetVariable', 'BB_LOGCONFIG']
928962 12:43:22.256618 Command Completed
928962 12:43:22.264356 Running command ['getUIHandlerNum']
928962 12:43:22.264922 Command Completed
928962 12:43:22.265103 Running command ['setEventMask', 3, 20, {'BitBake.Si=
gGen.HashEquiv': 19, 'BitBake.RunQueue.HashEquiv': 19}, ['bb.runqueue.runQu=
eueExitWait', 'bb.event.LogExecTTY', 'logging.LogRecord', 'bb.build.TaskFai=
led', 'bb.build.TaskBase', 'bb.event.ParseStarted', 'bb.event.ParseProgress=
', 'bb.event.ParseCompleted', 'bb.event.CacheLoadStarted', 'bb.event.CacheL=
oadProgress', 'bb.event.CacheLoadCompleted', 'bb.command.CommandFailed', 'b=
b.command.CommandExit', 'bb.command.CommandCompleted', 'bb.cooker.CookerExi=
t', 'bb.event.MultipleProviders', 'bb.event.NoProvider', 'bb.runqueue.scene=
QueueTaskStarted', 'bb.runqueue.runQueueTaskStarted', 'bb.runqueue.runQueue=
TaskFailed', 'bb.runqueue.sceneQueueTaskFailed', 'bb.event.BuildBase', 'bb.=
build.TaskStarted', 'bb.build.TaskSucceeded', 'bb.build.TaskFailedSilent', =
'bb.build.TaskProgress', 'bb.event.ProcessStarted', 'bb.event.ProcessProgre=
ss', 'bb.event.ProcessFinished']]
928962 12:43:22.265324 Command Completed
928962 12:43:22.265466 Running command ['getVariable', 'BB_DEFAULT_TASK']
928962 12:43:22.272249 Command Completed
928962 12:43:22.272677 Running command ['setConfig', 'cmd', 'build']
928962 12:43:22.273073 Command Completed
928962 12:43:22.273220 Running command ['buildTargets', ['python-native'], =
'build']
928962 12:43:22.275823 Command Completed

It was reproduced on builder with 64 cores.

After changing BB_NUMBER_PARSE_THREADS from default 64 to 10, I wasn't able=
 to get bitbake stuck again (in the same setup after cleaning cache, tmpdir=
, sstate again) by calling "bitbake python-native" 20+ times.

But after changing BB_NUMBER_PARSE_THREADS to 100 I wasn't able to reproduc=
e it again (so maybe 3rd try with the default value was just me being lucky=
 to reproduce it).

Then I've tried to change it to 1000, just to see what happens and it got s=
tuck (but probably from different reasons):

martin@jama:/OE/build/oe-core$ bitbake -k python-native
Loading cache: 100% |                                                      =
                                                                           =
                                                                           =
                      | ETA:  --:--:--
Loaded 0 entries from dependency cache.
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/python-native=
_2.7.18.bb: Error executing a python function in <code>:                   =
                                                                           =
                      | ETA:  --:--:--

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 14, function: <module>
     0010:__anon_35__OE_build_oe_core_openembedded_core_meta_classes_devshe=
ll_bbclass(d)
     0011:__anon_151__OE_build_oe_core_openembedded_core_meta_classes_sstat=
e_bbclass(d)
     0012:__anon_20__OE_build_oe_core_openembedded_core_meta_classes_blackl=
ist_bbclass(d)
     0013:__anon_177__OE_build_oe_core_openembedded_core_meta_classes_sitei=
nfo_bbclass(d)
 *** 0014:__anon_90__OE_build_oe_core_meta_python2_recipes_devtools_python_=
python_native_2_7_18_bb(d)
File: '/OE/build/oe-core/meta-python2/recipes-devtools/python/python-native=
_2.7.18.bb', lineno: 76, function: __anon_90__OE_build_oe_core_meta_python2=
_recipes_devtools_python_python_native_2_7_18_bb
     0072:        manifest_file.seek(json_start)
     0073:        manifest_str =3D manifest_file.read()
     0074:        python_manifest =3D json.loads(manifest_str)
     0075:
 *** 0076:    rprovides =3D d.getVar('RPROVIDES').split()
     0077:
     0078:    # Hardcoded since it cant be python-native-foo, should be pyt=
hon-foo-native
     0079:    pn =3D 'python'
     0080:
Exception: AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Command execution failed: Traceback (most recent call last):
  File "/OE/bitbake/lib/bb/command.py", line 114, in runAsyncCommand
  File "/OE/bitbake/lib/bb/cooker.py", line 1605, in updateCache
  File "/OE/bitbake/lib/bb/cooker.py", line 2087, in __init__
  File "/OE/bitbake/lib/bb/cooker.py", line 2113, in start
  File "/usr/lib/python3.8/multiprocessing/process.py", line 121, in start
  File "/usr/lib/python3.8/multiprocessing/context.py", line 224, in _Popen
  File "/usr/lib/python3.8/multiprocessing/context.py", line 277, in _Popen
  File "/usr/lib/python3.8/multiprocessing/popen_fork.py", line 19, in __in=
it__
  File "/usr/lib/python3.8/multiprocessing/popen_fork.py", line 69, in _lau=
nch
OSError: [Errno 24] Too many open files


Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
martin@jama:/OE/build/oe-core$ bitbake -k python-native
NOTE: Reconnecting to bitbake server...
NOTE: No reply from server in 30s
NOTE: Retrying server connection (#1)...

On this builder I was using:
BB_SERVER_TIMEOUT =3D "60"
but that doesn't seem to be required to reproduce as the other builds I've =
seen stuck on jenkins weren't setting BB_SERVER_TIMEOUT at all.

Let me know if there is something else I should try next time it gets stuck=
, but right now
I'm not able to reliably reproduce it again (even after switching back to d=
efault BB_NUMBER_PARSE_THREADS)

Cheers,
>=20
> Cheers,
>=20
> Richard
>=20

--oakhxkhbkbqq3tp4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYBasPgAKCRA3VSO3ZXaA
HISCAJ46g+BhdhSy/E+N4aeTznvEPsmfYACdEo3jw6Srhtbi4Nhda1CPDPtHxSs=
=Lkg/
-----END PGP SIGNATURE-----

--oakhxkhbkbqq3tp4--
