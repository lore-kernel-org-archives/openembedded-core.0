Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.34519.1612189598288603697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 06:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Wjoo2vUS;
 spf=pass (domain: linaro.org, ip: 209.85.128.54, mailfrom: anibal.limon@linaro.org)
Received: by mail-wm1-f54.google.com with SMTP id u14so13352712wmq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 06:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ih4Nwlr/CG5TNFtxsL/mOQqVWi2tavxVF/WpX+RBamI=;
        b=Wjoo2vUSlghxEO8FeIXXcT1NnTmcSKLkgqwjvtYLFSKO3as/WLPImRfPogPj+vRwnG
         nd0AN7DGILTZNfL3xhxTxx8znJEIhTBqNbu5Asxr6c78nOVpjm7V+SyEaPF4H3XHUimy
         465f9IBV9ZAh7aMknb/7ATZ0Yxkwn9uSUkU9EXdb/GMMR7ybRZ1Q6LU5RT6MA3aInWUC
         iWP9s8XoEbwvFvsWoswkfdk/GIfkznSJmTkF5XsnNccwaWmrtFzVlCGSmHJyM1TzDLCh
         2zVZnSzK8f8nk7j25cSbF5QnZxCMo/xIjzLCnR9vZvmig1NGvK8xh82UApP3pXUgazdt
         Npvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ih4Nwlr/CG5TNFtxsL/mOQqVWi2tavxVF/WpX+RBamI=;
        b=aPXKjLFzV6txwWLfi8x+4nA4XRONBRgOs2uUmjpFlSFi3VuT2xtVNppH29AXU+6uQj
         JSB1To0EFKW5hBKqGuC3MnBYX17jXTlWF4D0xdLxyNhYSosTfGAzq92gyqWvwhPdeXjw
         DH3CD/a0HohY0+0xhKZrp/zDothYJfQ1b1YCtRyXvnqYR76BeY1nYDAmyyPOlMyGA5mi
         TnApATYqGjZMdnFWpbh9fnxcpebhgc8wvJIEaAuRX5M08UcAls7r204Cw1eWM4Ww2q3T
         QmOjImWaRrxNUPSVPUf+H7s1GSgSl5Er4s3P+V25t/sccQiwL3ryAhKzLAfdMGwJUyFX
         4SyQ==
X-Gm-Message-State: AOAM531uU3NZNIdTe99rziyk9ZErKwLq9ypJjOYb24NUo0nF7Y7McU0B
	CMPRZhiygy+5zyuUWmCL60Co/wWhEJtbmvna+cxYtg==
X-Google-Smtp-Source: ABdhPJwl9qcMgbm+Q58fX63t8i5oSLs+HO1APYSO+VcSX//tHzqX4DEwbDn3q4YM/TWEd/+GiWE9F9O+x8bZRIa9skY=
X-Received: by 2002:a1c:43c6:: with SMTP id q189mr3031329wma.119.1612189596233;
 Mon, 01 Feb 2021 06:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
 <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
 <CA+chaQdc7P6NsTno6oCcB4HmoseMziAXA57f646=YWWDPyEH8w@mail.gmail.com>
 <d29734c79a8d5712f4c2cc720e11071dedb68383.camel@linuxfoundation.org>
 <20210131095518.iqqi2lrx7n5b2csp@jama> <1af99424085f84d64915e6251cc809ac450b8b0f.camel@linuxfoundation.org>
 <20210131131023.2oor4o3nmhhg3gxi@jama>
In-Reply-To: <20210131131023.2oor4o3nmhhg3gxi@jama>
From: "Anibal Limon" <anibal.limon@linaro.org>
Date: Mon, 1 Feb 2021 08:26:25 -0600
Message-ID: <CA+_AqiuAaQ4jT2MnGt0puViRyyfSCxz-C0qGsSevWpp6kx7-9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/7] native: Stop clearing PACKAGES
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000031cc3a05ba4724ed"

--00000000000031cc3a05ba4724ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 31 Jan 2021 at 07:10, Martin Jansa <Martin.Jansa@gmail.com> wrote:

> On Sun, Jan 31, 2021 at 10:34:48AM +0000, Richard Purdie wrote:
> > On Sun, 2021-01-31 at 10:55 +0100, Martin Jansa wrote:
> > > On Sun, Jan 31, 2021 at 09:07:50AM +0000, Richard Purdie wrote:
> > > > On Sat, 2021-01-30 at 17:15 +0100, Martin Jansa wrote:
> > > > > I'm asking because meta-python2 has the same issue in:
> > > > >
> https://git.openembedded.org/meta-python2/tree/recipes-devtools/python/p=
ython-setuptools.inc#n49
> > > > >
> > > > > and my fix I was planing to send was to replace it with:
> > > > > RDEPENDS_${PN}_append_class-target =3D " ${PYTHON_PN}-pkg-resour=
ces"
> > > > > and drop the RPROVIDES, because it unfortunately causes bitbake =
to
> > > > > get stuck after reporting parsing error as:
> > > > >
> > > > > ERROR: meta-python2/recipes-devtools/python/python-
> > > > > setuptools_42.0.2.bb: QA Issue: meta-python2/recipes-
> > > > > devtools/python/python-setuptools_42.0.2.bb: Variable RPROVIDES =
is
> > > > > set as not being package specific, please fix this. [pkgvarcheck=
]
> > > > > ERROR: meta-python2/recipes-devtools/python/python-
> > > > > setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> > > > > ERROR: Failed to parse recipe: meta-python2/recipes-
> > > > > devtools/python/python-setuptools_42.0.2.bb
> > > >
> > > > Are you saying that it does that with the RPROVIDES removed? That
> seems
> > > > odd :/
> > >
> > > No, this was before removing RPROVIDES in meta-python2, I was just
> > > surprised that bitbake got stuck after reporting parsing failure, I'=
m
> > > seeing bitbake getting stuck in dunfell builds quite often, but don'=
t
> > > remember seeing it with gatesgarth and newer (and was believing that
> you
> > > have already fixed most if not all cases there). But it's also true
> that
> > > our jenkins runs 1000x more builds based on dunfell, so it's much mo=
re
> > > likely to happen there.
> >
> > Its the first time I've heard a report of that and it sounds a little
> > worrying. What you say stuck, bitbake hangs? Is it using cpu? A proces=
s
> > tree of what it looks like when stuck would be interesting if it is
> > hanging and maybe the last things in any running or just finished task
> > logs. It could be some issue with the way a failing task is handled?
> >
> > We've seen a lot of weird issues on the autobuilder but not that. Coul=
d
> > you have something enabled in your setup for logging/reporting whch
> > wouldn't be in ours and could be causing it?
>
> It doesn't seem to happen very often and I guess autobuilder doesn't
> include meta-python2 (which is currently the only reproducer in my list
> of layers).
>

Hi,

We have similar failure in the Linaro CI using meta-python2,

https://ci.linaro.org/job/lt-qcom-openembedded-rpb-master/437/DISTRO=3Drpb=
,MACHINE=3Ddragonboard-820c,label=3Ddocker-buster-amd64/console

Regards,
Anibal


>
> I've tried to reproduce it with just 3 layers included:
> BBLAYERS =3D " \
>   /OE/build/oe-core/meta-python2 \
>   /OE/build/oe-core/meta-openembedded/meta-oe \
>   /OE/build/oe-core/openembedded-core/meta \
> "
>
> and it happened on 3rd try (cache, tmpdir, sstate-cache were removed
> only before 1st try)
>
> martin@jama:/OE/build/oe-core$ bitbake -k python-native
> Loading cache: 100% |
>
>
>                     | ETA:  --:--:--
> Loaded 0 entries from dependency cache.
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: QA Issue:
> /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being
> package specific, please fix this. [pkgvarcheck]
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> ERROR: Failed to parse recipe:
> /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb
>
>              | ETA:  0:00:14
>
> Summary: There were 3 ERROR messages shown, returning a non-zero exit co=
de.
> martin@jama:/OE/build/oe-core$ bitbake -k python-native
> NOTE: Reconnecting to bitbake server...
> Loading cache: 100%
> |#######################################################################=
###########################################################################=
###########################################################################=
######|
> Time: 0:00:00
> Loaded 845 entries from dependency cache.
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-native_2.7.18.bb: Error executing a python function in <code>:
>
>                                      | ETA:  0:01:10
>
> The stack trace of python calls that resulted in this exception/failure
> was:
> File: '<code>', lineno: 14, function: <module>
>
>  0010:__anon_35__OE_build_oe_core_openembedded_core_meta_classes_devshel=
l_bbclass(d)
>
>  0011:__anon_151__OE_build_oe_core_openembedded_core_meta_classes_sstate=
_bbclass(d)
>
>  0012:__anon_20__OE_build_oe_core_openembedded_core_meta_classes_blackli=
st_bbclass(d)
>
>  0013:__anon_177__OE_build_oe_core_openembedded_core_meta_classes_sitein=
fo_bbclass(d)
>  ***
> 0014:__anon_90__OE_build_oe_core_meta_python2_recipes_devtools_python_py=
thon_native_2_7_18_bb(d)
> File: '/OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-native_2.7.18.bb', lineno: 76, function:
> __anon_90__OE_build_oe_core_meta_python2_recipes_devtools_python_python_=
native_2_7_18_bb
>      0072:        manifest_file.seek(json_start)
>      0073:        manifest_str =3D manifest_file.read()
>      0074:        python_manifest =3D json.loads(manifest_str)
>      0075:
>  *** 0076:    rprovides =3D d.getVar('RPROVIDES').split()
>      0077:
>      0078:    # Hardcoded since it cant be python-native-foo, should be
> python-foo-native
>      0079:    pn =3D 'python'
>      0080:
> Exception: AttributeError: 'NoneType' object has no attribute 'split'
>
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: QA Issue:
> /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being
> package specific, please fix this. [pkgvarcheck]
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> ERROR: Failed to parse recipe:
> /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-native_2.7.18.bb
>
>              | ETA:  0:00:30
>
> Summary: There were 4 ERROR messages shown, returning a non-zero exit co=
de.
> martin@jama:/OE/build/oe-core$ bitbake -k python-native
> NOTE: Reconnecting to bitbake server...
> Loading cache: 100%
> |#######################################################################=
###########################################################################=
###########################################################################=
######|
> Time: 0:00:00
> Loaded 1289 entries from dependency cache.
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: QA Issue:
> /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being
> package specific, please fix this. [pkgvarcheck]
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> ERROR: Failed to parse recipe:
> /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb
>
> and here it's stuck for around 1 hour, bitbake using very little cpu.
>
> martin@jama:~$ ps aux | grep bitbake
> martin    372784  0.0  0.0  11552   884 pts/1    S+   13:43   0:00 grep
> --color=3Dauto bitbake
> martin    928962  0.1  0.1 219204 133704 ?       Sl   12:42   0:04
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    943698  0.0  0.0 119900 29928 pts/8    Sl+  12:43   0:01 pytho=
n3
> /OE/build/oe-core/bitbake/bin/bitbake -k python-native
> martin    945507  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945528  0.0  0.0 214364 124740 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945532  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945563  0.0  0.0 214364 124732 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945577  0.0  0.0 214364 124740 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945621  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945632  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945643  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945653  0.0  0.0 214364 124740 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945669  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945685  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945703  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945736  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945753  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945774  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945778  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945819  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945839  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945860  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945878  0.0  0.0 214364 124740 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945894  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945909  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945915  0.0  0.0 214364 124804 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945929  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945950  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945953  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945964  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945966  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    945989  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946005  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946016  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946037  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946038  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946064  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946068  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946080  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946103  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946109  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946122  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946135  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946137  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946152  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946167  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946168  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946185  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946197  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946214  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946228  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946243  0.0  0.0 214364 124728 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946249  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946265  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946298  0.0  0.0 214364 124740 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946345  0.0  0.0 214364 124736 ?       Sl   12:43   0:01
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946364  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946386  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946389  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946405  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946410  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946442  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946458  0.0  0.0 214364 124612 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946463  0.0  0.0 214364 124652 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946481  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946501  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin    946518  0.0  0.0 214364 124736 ?       Sl   12:43   0:00
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
>
> martin@jama:~$ sudo strace -p 928962
> strace: Process 928962 attached
> wait4(945507,
>
> martin@jama:~$ kill 928962
>
> adds an warning to the stuck build:
>
> martin@jama:/OE/build/oe-core$ bitbake -k python-native
> NOTE: Reconnecting to bitbake server...
> Loading cache: 100%
> |#######################################################################=
###########################################################################=
###########################################################################=
######|
> Time: 0:00:00
> Loaded 1289 entries from dependency cache.
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: QA Issue:
> /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being
> package specific, please fix this. [pkgvarcheck]
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> ERROR: Failed to parse recipe:
> /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb
>
>              | ETA:  0:00:50
> WARNING: Cooker received SIGTERM, shutting down...
>
> killing the main process:
> martin@jama:~$ kill 943698
>
> terminates the stuck build, but all bitbake-server processes are left
> behind.
>
> If I try to kill all remaining bitbake-server processes, then only one i=
s
> left behind:
> martin    928962  0.1  0.1 285004 137688 ?       S    12:42   0:05
> bitbake-server /OE/bitbake/bin/bitbake-server decafbad 3 5
> /OE/build/oe-core/bitbake-cookerdaemon.log /OE/build/oe-core/bitbake.loc=
k
> /OE/build/oe-core/bitbake.sock None None 0
> martin@jama:/OE/build/oe-core$ sudo strace -p 928962
> strace: Process 928962 attached
> select(7, [6], [], [], {tv_sec=3D0, tv_usec=3D40768}) =3D 0 (Timeout)
> poll([{fd=3D7, events=3DPOLLIN}], 1, 0)     =3D 0 (Timeout)
> poll([{fd=3D8, events=3DPOLLIN}], 1, 0)     =3D 0 (Timeout)
> select(7, [6], [], [], {tv_sec=3D0, tv_usec=3D100000}) =3D 0 (Timeout)
> poll([{fd=3D7, events=3DPOLLIN}], 1, 0)     =3D 0 (Timeout)
> poll([{fd=3D8, events=3DPOLLIN}], 1, 0)     =3D 0 (Timeout)
>
> and then it dies as well after a while.
>
> Here is bitbake-cookerdaemon.log, but doesn't look very interesting to m=
e:
>
> 928962 12:42:56.099747 --- Starting bitbake server pid 928962 at
> 2021-01-31 12:42:56.099713 ---
> 928962 12:42:56.110782 Started bitbake server pid 928962
> 928962 12:42:56.111010 Entering server connection loop
> 928962 12:42:56.111833 Accepting [<socket.socket fd=3D6,
> family=3DAddressFamily.AF_UNIX, type=3DSocketKind.SOCK_STREAM, proto=3D0=
,
> laddr=3Dbitbake.sock>] ([])
> 928962 12:42:56.112382 Processing Client
> 928962 12:42:56.112428 Connecting Client
> 928962 12:42:56.112733 Running command ['setFeatures', [2]]
> 928962 12:42:56.113448 Command Completed
> 928962 12:42:56.113566 Running command ['updateConfig', {'abort': False,
> 'force': False, 'invalidate_stamp': None, 'dry_run': False,
> 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False,
> 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': Fal=
se,
> 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly':
> None, 'writeeventlog': None, 'build_verbose_shell': False,
> 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains':
> {}}, {'SHELL': '/bin/bash', 'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh=
',
> 'SSH_AGENT_PID': '3080', 'PWD': '/OE/build/oe-core', 'LOGNAME': 'martin'=
,
> 'HOME': '/home/martin', 'MACHINE': 'qemux86-64', 'BB_ENV_EXTRAWHITE':
> 'MACHINE DISTRO http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY
> no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE
> BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD', 'USER=
':
> 'martin', 'LC_ALL': 'en_US.UTF-8', 'PATH':
> '/OE/build/oe-core/openembedded-core/scripts:/OE/build/oe-core/bitbake/b=
in:/home/martin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin=
:/bin:/usr/games:/usr/local/games:/snap/bin',
> 'SESSION_MANAGER': 'local/jama:@/tmp/.ICE-unix/2943,unix/jama:/tmp/.ICE-=
unix/2943',
> 'WINDOWID': '79691779', 'QT_ACCESSIBILITY': '1', 'COLORTERM': 'truecolor=
',
> 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-xubuntu:/etc/xdg:/etc/xdg',
> 'XDG_SESSION_PATH': '/org/freedesktop/DisplayManager/Session0',
> 'XDG_MENU_PREFIX': 'xfce-', 'CLUTTER_BACKEND': 'x11', 'LANGUAGE': 'en_US=
',
> 'TERMCAP': 'SC|screen.xterm-256color|VT 100/ANSI X3.64 virtual
> terminal:DO=3D\\E[%dB:LE=3D\\E[%dD:RI=3D\\E[%dC:UP=3D\\E[%dA:bs:bt=3D\\E=
[Z:cd=3D\\E[J:ce=3D\\E[K:cl=3D\\E[H\\E[J:cm=3D\\E[%i%d;%dH:ct=3D\\E[3g:do=
=3D^J:nd=3D\\E[C:pt:rc=3D\\E8:rs=3D\\Ec:sc=3D\\E7:st=3D\\EH:up=3D\\EM:le=
=3D^H:bl=3D^G:cr=3D^M:it#8:ho=3D\\E[H:nw=3D\\EE:ta=3D^I:is=3D\\E)0:li#51:c=
o#263:am:xn:xv:LP:sr=3D\\EM:al=3D\\E[L:AL=3D\\E[%dL:cs=3D\\E[%i%d;%dr:dl=3D=
\\E[M:DL=3D\\E[%dM:dc=3D\\E[P:DC=3D\\E[%dP:im=3D\\E[4h:ei=3D\\E[4l:mi:IC=3D=
\\E[%d@:ks=3D\\E[?1h\\E=3D:ke=3D\\E[?1l\\E>:vi=3D\\E[?25l:ve=3D\\E[34h\\E[?=
25h:vs=3D\\E[34l:ti=3D\\E[?1049h:te=3D\\E[?1049l:us=3D\\E[4m:ue=3D\\E[24m:s=
o=3D\\E[3m:se=3D\\E[23m:mb=3D\\E[5m:md=3D\\E[1m:mh=3D\\E[2m:mr=3D\\E[7m:me=
=3D\\E[m:ms:Co#8:pa#64:AF=3D\\E[3%dm:AB=3D\\E[4%dm:op=3D\\E[39;49m:AX:vb=
=3D\\Eg:G0:as=3D\\E(0:ae=3D\\E(B:ac=3D\\140\\140aaffggjjkkllmmnnooppqqrrss=
ttuuvvwwxxyyzz{{||}}~~..--++,,hhII00:po=3D\\E[5i:pf=3D\\E[4i:Km=3D\\E[<:k0=
=3D\\E[10~:k1=3D\\EOP:k2=3D\\EOQ:k3=3D\\EOR:k4=3D\\EOS:k5=3D\\E[15~:k6=3D\=
\E[17~:k7=3D\\E[18~:k8=3D\\E[19~:k9=3D\\E[20~:k;=3D\\E[21~:F1=3D\\E[23~:F2=
=3D\\E[24~:kB=3D\\E[Z:kh=3D\\E[1~:@1=3D\\E[1~:kH=3D\\E[4~:@7=3D\\E[4~:kN=
=3D\\E[6~:kP=3D\\E[5~:kI=3D\\E[2~:kD=3D\\E[3~:ku=3D\\EOA:kd=3D\\EOB:kr=3D\=
\EOC:kl=3D\\EOD:km:',
> 'LC_ADDRESS': 'cs_CZ.UTF-8', 'LC_NAME': 'cs_CZ.UTF-8', 'WINDOW': '6',
> 'DESKTOP_SESSION': 'xubuntu', 'LC_MONETARY': 'cs_CZ.UTF-8', 'EDITOR':
> 'vim', 'XDG_SEAT': 'seat0', 'XDG_SESSION_DESKTOP': 'xubuntu',
> 'QT_QPA_PLATFORMTHEME': 'gtk2', 'XDG_SESSION_TYPE': 'x11',
> 'PANEL_GDK_CORE_DEVICE_EVENTS': '0', 'GPG_AGENT_INFO':
> '/run/user/1000/gnupg/S.gpg-agent:0:1', 'XAUTHORITY':
> '/home/martin/.Xauthority', 'XDG_GREETER_DATA_DIR':
> '/var/lib/lightdm-data/martin', 'GDM_LANG': 'en_US', 'LANG': 'C',
> 'LC_PAPER': 'cs_CZ.UTF-8', 'LS_COLORS':
> 'rs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=3D01;35:b=
d=3D40;33;01:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D30;43:ca=
=3D30;41:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:*.tgz=
=3D01;31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=3D0=
1;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D01;31=
:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.dz=3D01;31:*.gz=3D01;31:*.lrz=3D=
01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D01;31:*.tzst=3D01;31:=
*.bz2=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31:*.tz=3D01;31:*.deb=
=3D01;31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=3D01;31:*.sar=3D0=
1;31:*.rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01;31:*.cpio=3D01;31=
:*.7z=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.swm=3D01;31:*.dwm=
=3D01;31:*.esd=3D01;31:*.jpg=3D01;35:*.jpeg=3D01;35:*.mjpg=3D01;35:*.mjpeg=
=
=3D01;35:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=3D01;35:*.ppm=3D0=
1;35:*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35=
:*.png=3D01;35:*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.m=
ov=3D01;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=
=3D01;35:*.webp=3D01;35:*.ogm=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=
=3D01;35:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01=
;35:*.rm=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*=
.flv=3D01;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D=
01;35:*.cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36=
:*.au=3D00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.m=
ka=3D00;36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D0=
0;36:*.oga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xspf=3D00;36:',
> 'XDG_CURRENT_DESKTOP': 'XFCE', 'VTE_VERSION': '6200', 'XDG_SEAT_PATH':
> '/org/freedesktop/DisplayManager/Seat0', 'LESSCLOSE': '/usr/bin/lesspipe=
 %s
> %s', 'XDG_SESSION_CLASS': 'user', 'LC_IDENTIFICATION': 'cs_CZ.UTF-8',
> 'TERM': 'screen.xterm-256color', 'GTK_OVERLAY_SCROLLING': '0', 'LESSOPEN=
':
> '| /usr/bin/lesspipe %s', 'DISPLAY': ':0.0', 'SHLVL': '2', 'LC_TELEPHONE=
':
> 'cs_CZ.UTF-8', 'LC_MEASUREMENT': 'cs_CZ.UTF-8', 'XDG_VTNR': '7',
> 'XDG_SESSION_ID': 'c2', 'LD_LIBRARY_PATH': '', 'XDG_RUNTIME_DIR':
> '/run/user/1000', 'LC_TIME': 'cs_CZ.UTF-8', 'XDG_DATA_DIRS':
> '/usr/share/xubuntu:/usr/share/xfce4:/usr/local/share:/usr/share:/var/li=
b/snapd/desktop:/usr/share',
> 'STY': '5368.x', 'GDMSESSION': 'xubuntu', 'DBUS_SESSION_BUS_ADDRESS':
> 'unix:path=3D/run/user/1000/bus', 'BUILDDIR': '/OE/build/oe-core',
> 'LC_NUMERIC': 'cs_CZ.UTF-8', 'OLDPWD': '/OE/build/oe-core/meta-python2',
> '_': '/OE/build/oe-core/bitbake/bin/bitbake'},
> ['/OE/build/oe-core/bitbake/bin/bitbake', '-k', 'python-native']]
> 928962 12:42:56.450688 Command Completed
> 928962 12:42:56.450996 Running command ['getVariable', 'BBINCLUDELOGS']
> 928962 12:42:56.451159 Command Completed
> 928962 12:42:56.451239 Running command ['getVariable',
> 'BBINCLUDELOGS_LINES']
> 928962 12:42:56.451360 Command Completed
> 928962 12:42:56.451436 Running command ['getSetVariable', 'BB_CONSOLELOG=
']
> 928962 12:42:56.451656 Command Completed
> 928962 12:42:56.451740 Running command ['getSetVariable', 'BB_LOGCONFIG'=
]
> 928962 12:42:56.453927 Command Completed
> 928962 12:42:56.454122 Running command ['getUIHandlerNum']
> 928962 12:42:56.454289 Command Completed
> 928962 12:42:56.454392 Running command ['setEventMask', 1, 20,
> {'BitBake.RunQueue.HashEquiv': 19, 'BitBake.SigGen.HashEquiv': 19},
> ['bb.runqueue.runQueueExitWait', 'bb.event.LogExecTTY',
> 'logging.LogRecord', 'bb.build.TaskFailed', 'bb.build.TaskBase',
> 'bb.event.ParseStarted', 'bb.event.ParseProgress',
> 'bb.event.ParseCompleted', 'bb.event.CacheLoadStarted',
> 'bb.event.CacheLoadProgress', 'bb.event.CacheLoadCompleted',
> 'bb.command.CommandFailed', 'bb.command.CommandExit',
> 'bb.command.CommandCompleted', 'bb.cooker.CookerExit',
> 'bb.event.MultipleProviders', 'bb.event.NoProvider',
> 'bb.runqueue.sceneQueueTaskStarted', 'bb.runqueue.runQueueTaskStarted',
> 'bb.runqueue.runQueueTaskFailed', 'bb.runqueue.sceneQueueTaskFailed',
> 'bb.event.BuildBase', 'bb.build.TaskStarted', 'bb.build.TaskSucceeded',
> 'bb.build.TaskFailedSilent', 'bb.build.TaskProgress',
> 'bb.event.ProcessStarted', 'bb.event.ProcessProgress',
> 'bb.event.ProcessFinished']]
> 928962 12:42:56.454523 Command Completed
> 928962 12:42:56.454599 Running command ['getVariable', 'BB_DEFAULT_TASK'=
]
> 928962 12:42:56.454741 Command Completed
> 928962 12:42:56.454816 Running command ['setConfig', 'cmd', 'build']
> 928962 12:42:56.454947 Command Completed
> 928962 12:42:56.455022 Running command ['buildTargets', ['python-native'=
],
> 'build']
> 928962 12:42:56.457778 Command Completed
> 928962 12:43:04.560968 Processing Client
> 928962 12:43:04.561063 Disconnecting Client
> 928962 12:43:08.544918 Accepting [<socket.socket fd=3D6,
> family=3DAddressFamily.AF_UNIX, type=3DSocketKind.SOCK_STREAM, proto=3D0=
,
> laddr=3Dbitbake.sock>] ([])
> 928962 12:43:08.557050 Processing Client
> 928962 12:43:08.557154 Connecting Client
> 928962 12:43:08.557787 Running command ['setFeatures', [2]]
> 928962 12:43:08.558183 Command Completed
> 928962 12:43:08.558952 Running command ['updateConfig', {'abort': False,
> 'force': False, 'invalidate_stamp': None, 'dry_run': False,
> 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False,
> 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': Fal=
se,
> 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly':
> None, 'writeeventlog': None, 'build_verbose_shell': False,
> 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains':
> {}}, {'SHELL': '/bin/bash', 'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh=
',
> 'SSH_AGENT_PID': '3080', 'PWD': '/OE/build/oe-core', 'LOGNAME': 'martin'=
,
> 'HOME': '/home/martin', 'MACHINE': 'qemux86-64', 'BB_ENV_EXTRAWHITE':
> 'MACHINE DISTRO http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY
> no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE
> BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD', 'USER=
':
> 'martin', 'LC_ALL': 'en_US.UTF-8', 'PATH':
> '/OE/build/oe-core/openembedded-core/scripts:/OE/build/oe-core/bitbake/b=
in:/home/martin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin=
:/bin:/usr/games:/usr/local/games:/snap/bin',
> 'SESSION_MANAGER': 'local/jama:@/tmp/.ICE-unix/2943,unix/jama:/tmp/.ICE-=
unix/2943',
> 'WINDOWID': '79691779', 'QT_ACCESSIBILITY': '1', 'COLORTERM': 'truecolor=
',
> 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-xubuntu:/etc/xdg:/etc/xdg',
> 'XDG_SESSION_PATH': '/org/freedesktop/DisplayManager/Session0',
> 'XDG_MENU_PREFIX': 'xfce-', 'CLUTTER_BACKEND': 'x11', 'LANGUAGE': 'en_US=
',
> 'TERMCAP': 'SC|screen.xterm-256color|VT 100/ANSI X3.64 virtual
> terminal:DO=3D\\E[%dB:LE=3D\\E[%dD:RI=3D\\E[%dC:UP=3D\\E[%dA:bs:bt=3D\\E=
[Z:cd=3D\\E[J:ce=3D\\E[K:cl=3D\\E[H\\E[J:cm=3D\\E[%i%d;%dH:ct=3D\\E[3g:do=
=3D^J:nd=3D\\E[C:pt:rc=3D\\E8:rs=3D\\Ec:sc=3D\\E7:st=3D\\EH:up=3D\\EM:le=
=3D^H:bl=3D^G:cr=3D^M:it#8:ho=3D\\E[H:nw=3D\\EE:ta=3D^I:is=3D\\E)0:li#51:c=
o#263:am:xn:xv:LP:sr=3D\\EM:al=3D\\E[L:AL=3D\\E[%dL:cs=3D\\E[%i%d;%dr:dl=3D=
\\E[M:DL=3D\\E[%dM:dc=3D\\E[P:DC=3D\\E[%dP:im=3D\\E[4h:ei=3D\\E[4l:mi:IC=3D=
\\E[%d@:ks=3D\\E[?1h\\E=3D:ke=3D\\E[?1l\\E>:vi=3D\\E[?25l:ve=3D\\E[34h\\E[?=
25h:vs=3D\\E[34l:ti=3D\\E[?1049h:te=3D\\E[?1049l:us=3D\\E[4m:ue=3D\\E[24m:s=
o=3D\\E[3m:se=3D\\E[23m:mb=3D\\E[5m:md=3D\\E[1m:mh=3D\\E[2m:mr=3D\\E[7m:me=
=3D\\E[m:ms:Co#8:pa#64:AF=3D\\E[3%dm:AB=3D\\E[4%dm:op=3D\\E[39;49m:AX:vb=
=3D\\Eg:G0:as=3D\\E(0:ae=3D\\E(B:ac=3D\\140\\140aaffggjjkkllmmnnooppqqrrss=
ttuuvvwwxxyyzz{{||}}~~..--++,,hhII00:po=3D\\E[5i:pf=3D\\E[4i:Km=3D\\E[<:k0=
=3D\\E[10~:k1=3D\\EOP:k2=3D\\EOQ:k3=3D\\EOR:k4=3D\\EOS:k5=3D\\E[15~:k6=3D\=
\E[17~:k7=3D\\E[18~:k8=3D\\E[19~:k9=3D\\E[20~:k;=3D\\E[21~:F1=3D\\E[23~:F2=
=3D\\E[24~:kB=3D\\E[Z:kh=3D\\E[1~:@1=3D\\E[1~:kH=3D\\E[4~:@7=3D\\E[4~:kN=
=3D\\E[6~:kP=3D\\E[5~:kI=3D\\E[2~:kD=3D\\E[3~:ku=3D\\EOA:kd=3D\\EOB:kr=3D\=
\EOC:kl=3D\\EOD:km:',
> 'LC_ADDRESS': 'cs_CZ.UTF-8', 'LC_NAME': 'cs_CZ.UTF-8', 'WINDOW': '6',
> 'DESKTOP_SESSION': 'xubuntu', 'LC_MONETARY': 'cs_CZ.UTF-8', 'EDITOR':
> 'vim', 'XDG_SEAT': 'seat0', 'XDG_SESSION_DESKTOP': 'xubuntu',
> 'QT_QPA_PLATFORMTHEME': 'gtk2', 'XDG_SESSION_TYPE': 'x11',
> 'PANEL_GDK_CORE_DEVICE_EVENTS': '0', 'GPG_AGENT_INFO':
> '/run/user/1000/gnupg/S.gpg-agent:0:1', 'XAUTHORITY':
> '/home/martin/.Xauthority', 'XDG_GREETER_DATA_DIR':
> '/var/lib/lightdm-data/martin', 'GDM_LANG': 'en_US', 'LANG': 'C',
> 'LC_PAPER': 'cs_CZ.UTF-8', 'LS_COLORS':
> 'rs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=3D01;35:b=
d=3D40;33;01:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D30;43:ca=
=3D30;41:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:*.tgz=
=3D01;31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=3D0=
1;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D01;31=
:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.dz=3D01;31:*.gz=3D01;31:*.lrz=3D=
01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D01;31:*.tzst=3D01;31:=
*.bz2=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31:*.tz=3D01;31:*.deb=
=3D01;31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=3D01;31:*.sar=3D0=
1;31:*.rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01;31:*.cpio=3D01;31=
:*.7z=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.swm=3D01;31:*.dwm=
=3D01;31:*.esd=3D01;31:*.jpg=3D01;35:*.jpeg=3D01;35:*.mjpg=3D01;35:*.mjpeg=
=
=3D01;35:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=3D01;35:*.ppm=3D0=
1;35:*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35=
:*.png=3D01;35:*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.m=
ov=3D01;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=
=3D01;35:*.webp=3D01;35:*.ogm=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=
=3D01;35:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01=
;35:*.rm=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*=
.flv=3D01;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D=
01;35:*.cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36=
:*.au=3D00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.m=
ka=3D00;36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D0=
0;36:*.oga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xspf=3D00;36:',
> 'XDG_CURRENT_DESKTOP': 'XFCE', 'VTE_VERSION': '6200', 'XDG_SEAT_PATH':
> '/org/freedesktop/DisplayManager/Seat0', 'LESSCLOSE': '/usr/bin/lesspipe=
 %s
> %s', 'XDG_SESSION_CLASS': 'user', 'LC_IDENTIFICATION': 'cs_CZ.UTF-8',
> 'TERM': 'screen.xterm-256color', 'GTK_OVERLAY_SCROLLING': '0', 'LESSOPEN=
':
> '| /usr/bin/lesspipe %s', 'DISPLAY': ':0.0', 'SHLVL': '2', 'LC_TELEPHONE=
':
> 'cs_CZ.UTF-8', 'LC_MEASUREMENT': 'cs_CZ.UTF-8', 'XDG_VTNR': '7',
> 'XDG_SESSION_ID': 'c2', 'LD_LIBRARY_PATH': '', 'XDG_RUNTIME_DIR':
> '/run/user/1000', 'LC_TIME': 'cs_CZ.UTF-8', 'XDG_DATA_DIRS':
> '/usr/share/xubuntu:/usr/share/xfce4:/usr/local/share:/usr/share:/var/li=
b/snapd/desktop:/usr/share',
> 'STY': '5368.x', 'GDMSESSION': 'xubuntu', 'DBUS_SESSION_BUS_ADDRESS':
> 'unix:path=3D/run/user/1000/bus', 'BUILDDIR': '/OE/build/oe-core',
> 'LC_NUMERIC': 'cs_CZ.UTF-8', 'OLDPWD': '/OE/build/oe-core/meta-python2',
> '_': '/OE/build/oe-core/bitbake/bin/bitbake'},
> ['/OE/build/oe-core/bitbake/bin/bitbake', '-k', 'python-native']]
> 928962 12:43:08.559567 Command Completed
> 928962 12:43:08.559798 Running command ['getVariable', 'BBINCLUDELOGS']
> 928962 12:43:08.812911 Command Completed
> 928962 12:43:08.813560 Running command ['getVariable',
> 'BBINCLUDELOGS_LINES']
> 928962 12:43:08.813765 Command Completed
> 928962 12:43:08.813879 Running command ['getSetVariable', 'BB_CONSOLELOG=
']
> 928962 12:43:08.814115 Command Completed
> 928962 12:43:08.814236 Running command ['getSetVariable', 'BB_LOGCONFIG'=
]
> 928962 12:43:08.816210 Command Completed
> 928962 12:43:08.816451 Running command ['getUIHandlerNum']
> 928962 12:43:08.816661 Command Completed
> 928962 12:43:08.816799 Running command ['setEventMask', 2, 20,
> {'BitBake.RunQueue.HashEquiv': 19, 'BitBake.SigGen.HashEquiv': 19},
> ['bb.runqueue.runQueueExitWait', 'bb.event.LogExecTTY',
> 'logging.LogRecord', 'bb.build.TaskFailed', 'bb.build.TaskBase',
> 'bb.event.ParseStarted', 'bb.event.ParseProgress',
> 'bb.event.ParseCompleted', 'bb.event.CacheLoadStarted',
> 'bb.event.CacheLoadProgress', 'bb.event.CacheLoadCompleted',
> 'bb.command.CommandFailed', 'bb.command.CommandExit',
> 'bb.command.CommandCompleted', 'bb.cooker.CookerExit',
> 'bb.event.MultipleProviders', 'bb.event.NoProvider',
> 'bb.runqueue.sceneQueueTaskStarted', 'bb.runqueue.runQueueTaskStarted',
> 'bb.runqueue.runQueueTaskFailed', 'bb.runqueue.sceneQueueTaskFailed',
> 'bb.event.BuildBase', 'bb.build.TaskStarted', 'bb.build.TaskSucceeded',
> 'bb.build.TaskFailedSilent', 'bb.build.TaskProgress',
> 'bb.event.ProcessStarted', 'bb.event.ProcessProgress',
> 'bb.event.ProcessFinished']]
> 928962 12:43:08.816980 Command Completed
> 928962 12:43:08.817101 Running command ['getVariable', 'BB_DEFAULT_TASK'=
]
> 928962 12:43:08.817293 Command Completed
> 928962 12:43:08.817418 Running command ['setConfig', 'cmd', 'build']
> 928962 12:43:08.817604 Command Completed
> 928962 12:43:08.817732 Running command ['buildTargets', ['python-native'=
],
> 'build']
> 928962 12:43:08.820432 Command Completed
> 928962 12:43:18.569947 Processing Client
> 928962 12:43:18.570026 Disconnecting Client
> 928962 12:43:21.796010 Accepting [<socket.socket fd=3D6,
> family=3DAddressFamily.AF_UNIX, type=3DSocketKind.SOCK_STREAM, proto=3D0=
,
> laddr=3Dbitbake.sock>] ([])
> 928962 12:43:21.812637 Processing Client
> 928962 12:43:21.812758 Connecting Client
> 928962 12:43:21.816670 Running command ['setFeatures', [2]]
> 928962 12:43:21.817252 Command Completed
> 928962 12:43:21.817987 Running command ['updateConfig', {'abort': False,
> 'force': False, 'invalidate_stamp': None, 'dry_run': False,
> 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False,
> 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': Fal=
se,
> 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly':
> None, 'writeeventlog': None, 'build_verbose_shell': False,
> 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains':
> {}}, {'SHELL': '/bin/bash', 'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh=
',
> 'SSH_AGENT_PID': '3080', 'PWD': '/OE/build/oe-core', 'LOGNAME': 'martin'=
,
> 'HOME': '/home/martin', 'MACHINE': 'qemux86-64', 'BB_ENV_EXTRAWHITE':
> 'MACHINE DISTRO http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY
> no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE
> BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD', 'USER=
':
> 'martin', 'LC_ALL': 'en_US.UTF-8', 'PATH':
> '/OE/build/oe-core/openembedded-core/scripts:/OE/build/oe-core/bitbake/b=
in:/home/martin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin=
:/bin:/usr/games:/usr/local/games:/snap/bin',
> 'SESSION_MANAGER': 'local/jama:@/tmp/.ICE-unix/2943,unix/jama:/tmp/.ICE-=
unix/2943',
> 'WINDOWID': '79691779', 'QT_ACCESSIBILITY': '1', 'COLORTERM': 'truecolor=
',
> 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-xubuntu:/etc/xdg:/etc/xdg',
> 'XDG_SESSION_PATH': '/org/freedesktop/DisplayManager/Session0',
> 'XDG_MENU_PREFIX': 'xfce-', 'CLUTTER_BACKEND': 'x11', 'LANGUAGE': 'en_US=
',
> 'TERMCAP': 'SC|screen.xterm-256color|VT 100/ANSI X3.64 virtual
> terminal:DO=3D\\E[%dB:LE=3D\\E[%dD:RI=3D\\E[%dC:UP=3D\\E[%dA:bs:bt=3D\\E=
[Z:cd=3D\\E[J:ce=3D\\E[K:cl=3D\\E[H\\E[J:cm=3D\\E[%i%d;%dH:ct=3D\\E[3g:do=
=3D^J:nd=3D\\E[C:pt:rc=3D\\E8:rs=3D\\Ec:sc=3D\\E7:st=3D\\EH:up=3D\\EM:le=
=3D^H:bl=3D^G:cr=3D^M:it#8:ho=3D\\E[H:nw=3D\\EE:ta=3D^I:is=3D\\E)0:li#51:c=
o#263:am:xn:xv:LP:sr=3D\\EM:al=3D\\E[L:AL=3D\\E[%dL:cs=3D\\E[%i%d;%dr:dl=3D=
\\E[M:DL=3D\\E[%dM:dc=3D\\E[P:DC=3D\\E[%dP:im=3D\\E[4h:ei=3D\\E[4l:mi:IC=3D=
\\E[%d@:ks=3D\\E[?1h\\E=3D:ke=3D\\E[?1l\\E>:vi=3D\\E[?25l:ve=3D\\E[34h\\E[?=
25h:vs=3D\\E[34l:ti=3D\\E[?1049h:te=3D\\E[?1049l:us=3D\\E[4m:ue=3D\\E[24m:s=
o=3D\\E[3m:se=3D\\E[23m:mb=3D\\E[5m:md=3D\\E[1m:mh=3D\\E[2m:mr=3D\\E[7m:me=
=3D\\E[m:ms:Co#8:pa#64:AF=3D\\E[3%dm:AB=3D\\E[4%dm:op=3D\\E[39;49m:AX:vb=
=3D\\Eg:G0:as=3D\\E(0:ae=3D\\E(B:ac=3D\\140\\140aaffggjjkkllmmnnooppqqrrss=
ttuuvvwwxxyyzz{{||}}~~..--++,,hhII00:po=3D\\E[5i:pf=3D\\E[4i:Km=3D\\E[<:k0=
=3D\\E[10~:k1=3D\\EOP:k2=3D\\EOQ:k3=3D\\EOR:k4=3D\\EOS:k5=3D\\E[15~:k6=3D\=
\E[17~:k7=3D\\E[18~:k8=3D\\E[19~:k9=3D\\E[20~:k;=3D\\E[21~:F1=3D\\E[23~:F2=
=3D\\E[24~:kB=3D\\E[Z:kh=3D\\E[1~:@1=3D\\E[1~:kH=3D\\E[4~:@7=3D\\E[4~:kN=
=3D\\E[6~:kP=3D\\E[5~:kI=3D\\E[2~:kD=3D\\E[3~:ku=3D\\EOA:kd=3D\\EOB:kr=3D\=
\EOC:kl=3D\\EOD:km:',
> 'LC_ADDRESS': 'cs_CZ.UTF-8', 'LC_NAME': 'cs_CZ.UTF-8', 'WINDOW': '6',
> 'DESKTOP_SESSION': 'xubuntu', 'LC_MONETARY': 'cs_CZ.UTF-8', 'EDITOR':
> 'vim', 'XDG_SEAT': 'seat0', 'XDG_SESSION_DESKTOP': 'xubuntu',
> 'QT_QPA_PLATFORMTHEME': 'gtk2', 'XDG_SESSION_TYPE': 'x11',
> 'PANEL_GDK_CORE_DEVICE_EVENTS': '0', 'GPG_AGENT_INFO':
> '/run/user/1000/gnupg/S.gpg-agent:0:1', 'XAUTHORITY':
> '/home/martin/.Xauthority', 'XDG_GREETER_DATA_DIR':
> '/var/lib/lightdm-data/martin', 'GDM_LANG': 'en_US', 'LANG': 'C',
> 'LC_PAPER': 'cs_CZ.UTF-8', 'LS_COLORS':
> 'rs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=3D01;35:b=
d=3D40;33;01:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D30;43:ca=
=3D30;41:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:*.tgz=
=3D01;31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=3D0=
1;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D01;31=
:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.dz=3D01;31:*.gz=3D01;31:*.lrz=3D=
01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D01;31:*.tzst=3D01;31:=
*.bz2=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31:*.tz=3D01;31:*.deb=
=3D01;31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=3D01;31:*.sar=3D0=
1;31:*.rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01;31:*.cpio=3D01;31=
:*.7z=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.swm=3D01;31:*.dwm=
=3D01;31:*.esd=3D01;31:*.jpg=3D01;35:*.jpeg=3D01;35:*.mjpg=3D01;35:*.mjpeg=
=
=3D01;35:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=3D01;35:*.ppm=3D0=
1;35:*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35=
:*.png=3D01;35:*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.m=
ov=3D01;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=
=3D01;35:*.webp=3D01;35:*.ogm=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=
=3D01;35:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01=
;35:*.rm=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*=
.flv=3D01;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D=
01;35:*.cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36=
:*.au=3D00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.m=
ka=3D00;36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D0=
0;36:*.oga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xspf=3D00;36:',
> 'XDG_CURRENT_DESKTOP': 'XFCE', 'VTE_VERSION': '6200', 'XDG_SEAT_PATH':
> '/org/freedesktop/DisplayManager/Seat0', 'LESSCLOSE': '/usr/bin/lesspipe=
 %s
> %s', 'XDG_SESSION_CLASS': 'user', 'LC_IDENTIFICATION': 'cs_CZ.UTF-8',
> 'TERM': 'screen.xterm-256color', 'GTK_OVERLAY_SCROLLING': '0', 'LESSOPEN=
':
> '| /usr/bin/lesspipe %s', 'DISPLAY': ':0.0', 'SHLVL': '2', 'LC_TELEPHONE=
':
> 'cs_CZ.UTF-8', 'LC_MEASUREMENT': 'cs_CZ.UTF-8', 'XDG_VTNR': '7',
> 'XDG_SESSION_ID': 'c2', 'LD_LIBRARY_PATH': '', 'XDG_RUNTIME_DIR':
> '/run/user/1000', 'LC_TIME': 'cs_CZ.UTF-8', 'XDG_DATA_DIRS':
> '/usr/share/xubuntu:/usr/share/xfce4:/usr/local/share:/usr/share:/var/li=
b/snapd/desktop:/usr/share',
> 'STY': '5368.x', 'GDMSESSION': 'xubuntu', 'DBUS_SESSION_BUS_ADDRESS':
> 'unix:path=3D/run/user/1000/bus', 'BUILDDIR': '/OE/build/oe-core',
> 'LC_NUMERIC': 'cs_CZ.UTF-8', 'OLDPWD': '/OE/build/oe-core/meta-python2',
> '_': '/OE/build/oe-core/bitbake/bin/bitbake'},
> ['/OE/build/oe-core/bitbake/bin/bitbake', '-k', 'python-native']]
> 928962 12:43:21.818533 Command Completed
> 928962 12:43:21.818721 Running command ['getVariable', 'BBINCLUDELOGS']
> 928962 12:43:22.255470 Command Completed
> 928962 12:43:22.255835 Running command ['getVariable',
> 'BBINCLUDELOGS_LINES']
> 928962 12:43:22.256018 Command Completed
> 928962 12:43:22.256172 Running command ['getSetVariable', 'BB_CONSOLELOG=
']
> 928962 12:43:22.256346 Command Completed
> 928962 12:43:22.256468 Running command ['getSetVariable', 'BB_LOGCONFIG'=
]
> 928962 12:43:22.256618 Command Completed
> 928962 12:43:22.264356 Running command ['getUIHandlerNum']
> 928962 12:43:22.264922 Command Completed
> 928962 12:43:22.265103 Running command ['setEventMask', 3, 20,
> {'BitBake.SigGen.HashEquiv': 19, 'BitBake.RunQueue.HashEquiv': 19},
> ['bb.runqueue.runQueueExitWait', 'bb.event.LogExecTTY',
> 'logging.LogRecord', 'bb.build.TaskFailed', 'bb.build.TaskBase',
> 'bb.event.ParseStarted', 'bb.event.ParseProgress',
> 'bb.event.ParseCompleted', 'bb.event.CacheLoadStarted',
> 'bb.event.CacheLoadProgress', 'bb.event.CacheLoadCompleted',
> 'bb.command.CommandFailed', 'bb.command.CommandExit',
> 'bb.command.CommandCompleted', 'bb.cooker.CookerExit',
> 'bb.event.MultipleProviders', 'bb.event.NoProvider',
> 'bb.runqueue.sceneQueueTaskStarted', 'bb.runqueue.runQueueTaskStarted',
> 'bb.runqueue.runQueueTaskFailed', 'bb.runqueue.sceneQueueTaskFailed',
> 'bb.event.BuildBase', 'bb.build.TaskStarted', 'bb.build.TaskSucceeded',
> 'bb.build.TaskFailedSilent', 'bb.build.TaskProgress',
> 'bb.event.ProcessStarted', 'bb.event.ProcessProgress',
> 'bb.event.ProcessFinished']]
> 928962 12:43:22.265324 Command Completed
> 928962 12:43:22.265466 Running command ['getVariable', 'BB_DEFAULT_TASK'=
]
> 928962 12:43:22.272249 Command Completed
> 928962 12:43:22.272677 Running command ['setConfig', 'cmd', 'build']
> 928962 12:43:22.273073 Command Completed
> 928962 12:43:22.273220 Running command ['buildTargets', ['python-native'=
],
> 'build']
> 928962 12:43:22.275823 Command Completed
>
> It was reproduced on builder with 64 cores.
>
> After changing BB_NUMBER_PARSE_THREADS from default 64 to 10, I wasn't
> able to get bitbake stuck again (in the same setup after cleaning cache,
> tmpdir, sstate again) by calling "bitbake python-native" 20+ times.
>
> But after changing BB_NUMBER_PARSE_THREADS to 100 I wasn't able to
> reproduce it again (so maybe 3rd try with the default value was just me
> being lucky to reproduce it).
>
> Then I've tried to change it to 1000, just to see what happens and it go=
t
> stuck (but probably from different reasons):
>
> martin@jama:/OE/build/oe-core$ bitbake -k python-native
> Loading cache: 100% |
>
>
>                     | ETA:  --:--:--
> Loaded 0 entries from dependency cache.
> ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-native_2.7.18.bb: Error executing a python function in <code>:
>
>                                     | ETA:  --:--:--
>
> The stack trace of python calls that resulted in this exception/failure
> was:
> File: '<code>', lineno: 14, function: <module>
>
>  0010:__anon_35__OE_build_oe_core_openembedded_core_meta_classes_devshel=
l_bbclass(d)
>
>  0011:__anon_151__OE_build_oe_core_openembedded_core_meta_classes_sstate=
_bbclass(d)
>
>  0012:__anon_20__OE_build_oe_core_openembedded_core_meta_classes_blackli=
st_bbclass(d)
>
>  0013:__anon_177__OE_build_oe_core_openembedded_core_meta_classes_sitein=
fo_bbclass(d)
>  ***
> 0014:__anon_90__OE_build_oe_core_meta_python2_recipes_devtools_python_py=
thon_native_2_7_18_bb(d)
> File: '/OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-native_2.7.18.bb', lineno: 76, function:
> __anon_90__OE_build_oe_core_meta_python2_recipes_devtools_python_python_=
native_2_7_18_bb
>      0072:        manifest_file.seek(json_start)
>      0073:        manifest_str =3D manifest_file.read()
>      0074:        python_manifest =3D json.loads(manifest_str)
>      0075:
>  *** 0076:    rprovides =3D d.getVar('RPROVIDES').split()
>      0077:
>      0078:    # Hardcoded since it cant be python-native-foo, should be
> python-foo-native
>      0079:    pn =3D 'python'
>      0080:
> Exception: AttributeError: 'NoneType' object has no attribute 'split'
>
> ERROR: Command execution failed: Traceback (most recent call last):
>   File "/OE/bitbake/lib/bb/command.py", line 114, in runAsyncCommand
>   File "/OE/bitbake/lib/bb/cooker.py", line 1605, in updateCache
>   File "/OE/bitbake/lib/bb/cooker.py", line 2087, in __init__
>   File "/OE/bitbake/lib/bb/cooker.py", line 2113, in start
>   File "/usr/lib/python3.8/multiprocessing/process.py", line 121, in sta=
rt
>   File "/usr/lib/python3.8/multiprocessing/context.py", line 224, in _Po=
pen
>   File "/usr/lib/python3.8/multiprocessing/context.py", line 277, in _Po=
pen
>   File "/usr/lib/python3.8/multiprocessing/popen_fork.py", line 19, in
> __init__
>   File "/usr/lib/python3.8/multiprocessing/popen_fork.py", line 69, in
> _launch
> OSError: [Errno 24] Too many open files
>
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit co=
de.
> martin@jama:/OE/build/oe-core$ bitbake -k python-native
> NOTE: Reconnecting to bitbake server...
> NOTE: No reply from server in 30s
> NOTE: Retrying server connection (#1)...
>
> On this builder I was using:
> BB_SERVER_TIMEOUT =3D "60"
> but that doesn't seem to be required to reproduce as the other builds I'=
ve
> seen stuck on jenkins weren't setting BB_SERVER_TIMEOUT at all.
>
> Let me know if there is something else I should try next time it gets
> stuck, but right now
> I'm not able to reliably reproduce it again (even after switching back t=
o
> default BB_NUMBER_PARSE_THREADS)
>
> Cheers,
> >
> > Cheers,
> >
> > Richard
> >
>
>=20
>
>

--00000000000031cc3a05ba4724ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, 31 Jan 2021 at 07:10, Martin =
Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Sun, Jan 31, 2021 at 10:34:48AM +0000, Richard Purdie wrote:<br>
&gt; On Sun, 2021-01-31 at 10:55 +0100, Martin Jansa wrote:<br>
&gt; &gt; On Sun, Jan 31, 2021 at 09:07:50AM +0000, Richard Purdie wrote:<=
br>
&gt; &gt; &gt; On Sat, 2021-01-30 at 17:15 +0100, Martin Jansa wrote:<br>
&gt; &gt; &gt; &gt; I&#39;m asking because meta-python2 has the same issue=
 in:<br>
&gt; &gt; &gt; &gt; <a href=3D"https://git.openembedded.org/meta-python2/t=
ree/recipes-devtools/python/python-setuptools.inc#n49" rel=3D"noreferrer" t=
arget=3D"_blank">https://git.openembedded.org/meta-python2/tree/recipes-dev=
tools/python/python-setuptools.inc#n49</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; and my fix I was planing to send was to replace it wit=
h:<br>
&gt; &gt; &gt; &gt; RDEPENDS_${PN}_append_class-target =3D &quot; ${PYTHON=
_PN}-pkg-resources&quot;<br>
&gt; &gt; &gt; &gt; and drop the RPROVIDES, because it unfortunately cause=
s bitbake to<br>
&gt; &gt; &gt; &gt; get stuck after reporting parsing error as:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; ERROR: meta-python2/recipes-devtools/python/python-<br=
>
&gt; &gt; &gt; &gt; <a href=3D"http://setuptools_42.0.2.bb" rel=3D"norefer=
rer" target=3D"_blank">setuptools_42.0.2.bb</a>: QA Issue: meta-python2/rec=
ipes-<br>
&gt; &gt; &gt; &gt; devtools/python/<a href=3D"http://python-setuptools_42=
.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python-setuptools_42.0.2.bb</=
a>: Variable RPROVIDES is<br>
&gt; &gt; &gt; &gt; set as not being package specific, please fix this. [p=
kgvarcheck]<br>
&gt; &gt; &gt; &gt; ERROR: meta-python2/recipes-devtools/python/python-<br=
>
&gt; &gt; &gt; &gt; <a href=3D"http://setuptools_42.0.2.bb" rel=3D"norefer=
rer" target=3D"_blank">setuptools_42.0.2.bb</a>: Fatal QA errors found, fai=
ling task.<br>
&gt; &gt; &gt; &gt; ERROR: Failed to parse recipe: meta-python2/recipes-<b=
r>
&gt; &gt; &gt; &gt; devtools/python/<a href=3D"http://python-setuptools_42=
.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python-setuptools_42.0.2.bb</=
a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Are you saying that it does that with the RPROVIDES removed=
? That seems<br>
&gt; &gt; &gt; odd :/<br>
&gt; &gt; <br>
&gt; &gt; No, this was before removing RPROVIDES in meta-python2, I was ju=
st<br>
&gt; &gt; surprised that bitbake got stuck after reporting parsing failure=
, I&#39;m<br>
&gt; &gt; seeing bitbake getting stuck in dunfell builds quite often, but =
don&#39;t<br>
&gt; &gt; remember seeing it with gatesgarth and newer (and was believing =
that you<br>
&gt; &gt; have already fixed most if not all cases there). But it&#39;s al=
so true that<br>
&gt; &gt; our jenkins runs 1000x more builds based on dunfell, so it&#39;s=
 much more<br>
&gt; &gt; likely to happen there.<br>
&gt; <br>
&gt; Its the first time I&#39;ve heard a report of that and it sounds a li=
ttle<br>
&gt; worrying. What you say stuck, bitbake hangs? Is it using cpu? A proce=
ss<br>
&gt; tree of what it looks like when stuck would be interesting if it is<b=
r>
&gt; hanging and maybe the last things in any running or just finished tas=
k<br>
&gt; logs. It could be some issue with the way a failing task is handled?<=
br>
&gt; <br>
&gt; We&#39;ve seen a lot of weird issues on the autobuilder but not that.=
 Could<br>
&gt; you have something enabled in your setup for logging/reporting whch<b=
r>
&gt; wouldn&#39;t be in ours and could be causing it?<br>
<br>
It doesn&#39;t seem to happen very often and I guess autobuilder doesn&#39=
;t<br>
include meta-python2 (which is currently the only reproducer in my list<br=
>
of layers).<br></blockquote><div><br></div><div>Hi,</div><div><br></div><d=
iv>We have similar failure in the Linaro CI using meta-python2,</div><div><=
br></div><div><a href=3D"https://ci.linaro.org/job/lt-qcom-openembedded-rpb=
-master/437/DISTRO=3Drpb,MACHINE=3Ddragonboard-820c,label=3Ddocker-buster-a=
md64/console">https://ci.linaro.org/job/lt-qcom-openembedded-rpb-master/437=
/DISTRO=3Drpb,MACHINE=3Ddragonboard-820c,label=3Ddocker-buster-amd64/consol=
e</a><br></div><div><br></div><div>Regards,</div><div>Anibal</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;ve tried to reproduce it with just 3 layers included:<br>
BBLAYERS =3D &quot; \<br>
=C2=A0 /OE/build/oe-core/meta-python2 \<br>
=C2=A0 /OE/build/oe-core/meta-openembedded/meta-oe \<br>
=C2=A0 /OE/build/oe-core/openembedded-core/meta \<br>
&quot;<br>
<br>
and it happened on 3rd try (cache, tmpdir, sstate-cache were removed<br>
only before 1st try)<br>
<br>
martin@jama:/OE/build/oe-core$ bitbake -k python-native<br>
Loading cache: 100% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | ETA:=C2=A0 --:--:--<br>
Loaded 0 entries from dependency cache.<br>
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"h=
ttp://python-setuptools_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon-setuptools_42.0.2.bb</a>: QA Issue: /OE/build/oe-core/meta-python2/reci=
pes-devtools/python/<a href=3D"http://python-setuptools_42.0.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python-setuptools_42.0.2.bb</a>: Variable RPRO=
VIDES is set as not being package specific, please fix this. [pkgvarcheck]<=
br>
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"h=
ttp://python-setuptools_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon-setuptools_42.0.2.bb</a>: Fatal QA errors found, failing task.<br>
ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-devt=
ools/python/<a href=3D"http://python-setuptools_42.0.2.bb" rel=3D"noreferre=
r" target=3D"_blank">python-setuptools_42.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| ETA:=C2=A0 0:00:14<br>
<br>
Summary: There were 3 ERROR messages shown, returning a non-zero exit code=
.<br>
martin@jama:/OE/build/oe-core$ bitbake -k python-native<br>
NOTE: Reconnecting to bitbake server...<br>
Loading cache: 100% |#####################################################=
###########################################################################=
###########################################################################=
########################| Time: 0:00:00<br>
Loaded 845 entries from dependency cache.<br>
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"h=
ttp://python-native_2.7.18.bb" rel=3D"noreferrer" target=3D"_blank">python-=
native_2.7.18.bb</a>: Error executing a python function in &lt;code&gt;:=C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:01:10<br>
<br>
The stack trace of python calls that resulted in this exception/failure wa=
s:<br>
File: &#39;&lt;code&gt;&#39;, lineno: 14, function: &lt;module&gt;<br>
=C2=A0 =C2=A0 =C2=A00010:__anon_35__OE_build_oe_core_openembedded_core_met=
a_classes_devshell_bbclass(d)<br>
=C2=A0 =C2=A0 =C2=A00011:__anon_151__OE_build_oe_core_openembedded_core_me=
ta_classes_sstate_bbclass(d)<br>
=C2=A0 =C2=A0 =C2=A00012:__anon_20__OE_build_oe_core_openembedded_core_met=
a_classes_blacklist_bbclass(d)<br>
=C2=A0 =C2=A0 =C2=A00013:__anon_177__OE_build_oe_core_openembedded_core_me=
ta_classes_siteinfo_bbclass(d)<br>
=C2=A0*** 0014:__anon_90__OE_build_oe_core_meta_python2_recipes_devtools_p=
ython_python_native_2_7_18_bb(d)<br>
File: &#39;/OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=
=3D"http://python-native_2.7.18.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-native_2.7.18.bb</a>&#39;, lineno: 76, function: __anon_90__OE_build_=
oe_core_meta_python2_recipes_devtools_python_python_native_2_7_18_bb<br>
=C2=A0 =C2=A0 =C2=A00072:=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest_file.seek(js=
on_start)<br>
=C2=A0 =C2=A0 =C2=A00073:=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest_str =3D mani=
fest_file.read()<br>
=C2=A0 =C2=A0 =C2=A00074:=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_manifest =3D j=
son.loads(manifest_str)<br>
=C2=A0 =C2=A0 =C2=A00075:<br>
=C2=A0*** 0076:=C2=A0 =C2=A0 rprovides =3D d.getVar(&#39;RPROVIDES&#39;).s=
plit()<br>
=C2=A0 =C2=A0 =C2=A00077:<br>
=C2=A0 =C2=A0 =C2=A00078:=C2=A0 =C2=A0 # Hardcoded since it cant be python=
-native-foo, should be python-foo-native<br>
=C2=A0 =C2=A0 =C2=A00079:=C2=A0 =C2=A0 pn =3D &#39;python&#39;<br>
=C2=A0 =C2=A0 =C2=A00080:<br>
Exception: AttributeError: &#39;NoneType&#39; object has no attribute &#39=
;split&#39;<br>
<br>
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"h=
ttp://python-setuptools_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon-setuptools_42.0.2.bb</a>: QA Issue: /OE/build/oe-core/meta-python2/reci=
pes-devtools/python/<a href=3D"http://python-setuptools_42.0.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python-setuptools_42.0.2.bb</a>: Variable RPRO=
VIDES is set as not being package specific, please fix this. [pkgvarcheck]<=
br>
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"h=
ttp://python-setuptools_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon-setuptools_42.0.2.bb</a>: Fatal QA errors found, failing task.<br>
ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-devt=
ools/python/<a href=3D"http://python-native_2.7.18.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python-native_2.7.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:30<br>
<br>
Summary: There were 4 ERROR messages shown, returning a non-zero exit code=
.<br>
martin@jama:/OE/build/oe-core$ bitbake -k python-native<br>
NOTE: Reconnecting to bitbake server...<br>
Loading cache: 100% |#####################################################=
###########################################################################=
###########################################################################=
########################| Time: 0:00:00<br>
Loaded 1289 entries from dependency cache.<br>
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"h=
ttp://python-setuptools_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon-setuptools_42.0.2.bb</a>: QA Issue: /OE/build/oe-core/meta-python2/reci=
pes-devtools/python/<a href=3D"http://python-setuptools_42.0.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python-setuptools_42.0.2.bb</a>: Variable RPRO=
VIDES is set as not being package specific, please fix this. [pkgvarcheck]<=
br>
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"h=
ttp://python-setuptools_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon-setuptools_42.0.2.bb</a>: Fatal QA errors found, failing task.<br>
ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-devt=
ools/python/<a href=3D"http://python-setuptools_42.0.2.bb" rel=3D"noreferre=
r" target=3D"_blank">python-setuptools_42.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
<br>
and here it&#39;s stuck for around 1 hour, bitbake using very little cpu.<=
br>
<br>
martin@jama:~$ ps aux | grep bitbake<br>
martin=C2=A0 =C2=A0 372784=C2=A0 0.0=C2=A0 0.0=C2=A0 11552=C2=A0 =C2=A0884=
 pts/1=C2=A0 =C2=A0 S+=C2=A0 =C2=A013:43=C2=A0 =C2=A00:00 grep --color=3Dau=
to bitbake<br>
martin=C2=A0 =C2=A0 928962=C2=A0 0.1=C2=A0 0.1 219204 133704 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:42=C2=A0 =C2=A00:04 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 943698=C2=A0 0.0=C2=A0 0.0 119900 29928 pts/8=C2=A0 =
=C2=A0 Sl+=C2=A0 12:43=C2=A0 =C2=A00:01 python3 /OE/build/oe-core/bitbake/=
bin/bitbake -k python-native<br>
martin=C2=A0 =C2=A0 945507=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945528=C2=A0 0.0=C2=A0 0.0 214364 124740 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945532=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945563=C2=A0 0.0=C2=A0 0.0 214364 124732 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945577=C2=A0 0.0=C2=A0 0.0 214364 124740 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945621=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945632=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945643=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945653=C2=A0 0.0=C2=A0 0.0 214364 124740 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945669=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945685=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945703=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945736=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945753=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945774=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945778=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945819=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945839=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945860=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945878=C2=A0 0.0=C2=A0 0.0 214364 124740 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945894=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945909=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945915=C2=A0 0.0=C2=A0 0.0 214364 124804 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945929=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945950=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945953=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945964=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945966=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 945989=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946005=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946016=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946037=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946038=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946064=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946068=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946080=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946103=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946109=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946122=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946135=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946137=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946152=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946167=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946168=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946185=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946197=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946214=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946228=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946243=C2=A0 0.0=C2=A0 0.0 214364 124728 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946249=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946265=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946298=C2=A0 0.0=C2=A0 0.0 214364 124740 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946345=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:01 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946364=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946386=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946389=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946405=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946410=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946442=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946458=C2=A0 0.0=C2=A0 0.0 214364 124612 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946463=C2=A0 0.0=C2=A0 0.0 214364 124652 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946481=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946501=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin=C2=A0 =C2=A0 946518=C2=A0 0.0=C2=A0 0.0 214364 124736 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sl=C2=A0 =C2=A012:43=C2=A0 =C2=A00:00 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
<br>
martin@jama:~$ sudo strace -p 928962<br>
strace: Process 928962 attached<br>
wait4(945507, <br>
<br>
martin@jama:~$ kill 928962<br>
<br>
adds an warning to the stuck build:<br>
<br>
martin@jama:/OE/build/oe-core$ bitbake -k python-native<br>
NOTE: Reconnecting to bitbake server...<br>
Loading cache: 100% |#####################################################=
###########################################################################=
###########################################################################=
########################| Time: 0:00:00<br>
Loaded 1289 entries from dependency cache.<br>
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"h=
ttp://python-setuptools_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon-setuptools_42.0.2.bb</a>: QA Issue: /OE/build/oe-core/meta-python2/reci=
pes-devtools/python/<a href=3D"http://python-setuptools_42.0.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python-setuptools_42.0.2.bb</a>: Variable RPRO=
VIDES is set as not being package specific, please fix this. [pkgvarcheck]<=
br>
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"h=
ttp://python-setuptools_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon-setuptools_42.0.2.bb</a>: Fatal QA errors found, failing task.<br>
ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-devt=
ools/python/<a href=3D"http://python-setuptools_42.0.2.bb" rel=3D"noreferre=
r" target=3D"_blank">python-setuptools_42.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| ETA:=C2=A0 0:00:50<br>
WARNING: Cooker received SIGTERM, shutting down...<br>
<br>
killing the main process:<br>
martin@jama:~$ kill 943698<br>
<br>
terminates the stuck build, but all bitbake-server processes are left behi=
nd.<br>
<br>
If I try to kill all remaining bitbake-server processes, then only one is =
left behind:<br>
martin=C2=A0 =C2=A0 928962=C2=A0 0.1=C2=A0 0.1 285004 137688 ?=C2=A0 =C2=
=A0 =C2=A0 =C2=A0S=C2=A0 =C2=A0 12:42=C2=A0 =C2=A00:05 bitbake-server /OE/=
bitbake/bin/bitbake-server decafbad 3 5 /OE/build/oe-core/bitbake-cookerdae=
mon.log /OE/build/oe-core/bitbake.lock /OE/build/oe-core/bitbake.sock None =
None 0<br>
martin@jama:/OE/build/oe-core$ sudo strace -p 928962<br>
strace: Process 928962 attached<br>
select(7, [6], [], [], {tv_sec=3D0, tv_usec=3D40768}) =3D 0 (Timeout)<br>
poll([{fd=3D7, events=3DPOLLIN}], 1, 0)=C2=A0 =C2=A0 =C2=A0=3D 0 (Timeout)=
<br>
poll([{fd=3D8, events=3DPOLLIN}], 1, 0)=C2=A0 =C2=A0 =C2=A0=3D 0 (Timeout)=
<br>
select(7, [6], [], [], {tv_sec=3D0, tv_usec=3D100000}) =3D 0 (Timeout)<br>
poll([{fd=3D7, events=3DPOLLIN}], 1, 0)=C2=A0 =C2=A0 =C2=A0=3D 0 (Timeout)=
<br>
poll([{fd=3D8, events=3DPOLLIN}], 1, 0)=C2=A0 =C2=A0 =C2=A0=3D 0 (Timeout)=
<br>
<br>
and then it dies as well after a while.<br>
<br>
Here is bitbake-cookerdaemon.log, but doesn&#39;t look very interesting to=
 me:<br>
<br>
928962 12:42:56.099747 --- Starting bitbake server pid 928962 at 2021-01-3=
1 12:42:56.099713 ---<br>
928962 12:42:56.110782 Started bitbake server pid 928962<br>
928962 12:42:56.111010 Entering server connection loop<br>
928962 12:42:56.111833 Accepting [&lt;socket.socket fd=3D6, family=3DAddre=
ssFamily.AF_UNIX, type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3Dbitbake=
.sock&gt;] ([])<br>
928962 12:42:56.112382 Processing Client<br>
928962 12:42:56.112428 Connecting Client<br>
928962 12:42:56.112733 Running command [&#39;setFeatures&#39;, [2]]<br>
928962 12:42:56.113448 Command Completed<br>
928962 12:42:56.113566 Running command [&#39;updateConfig&#39;, {&#39;abor=
t&#39;: False, &#39;force&#39;: False, &#39;invalidate_stamp&#39;: None, &#=
39;dry_run&#39;: False, &#39;dump_signatures&#39;: [], &#39;extra_assume_pr=
ovided&#39;: [], &#39;profile&#39;: False, &#39;prefile&#39;: [], &#39;post=
file&#39;: [], &#39;server_timeout&#39;: None, &#39;nosetscene&#39;: False,=
 &#39;setsceneonly&#39;: False, &#39;skipsetscene&#39;: False, &#39;runall&=
#39;: None, &#39;runonly&#39;: None, &#39;writeeventlog&#39;: None, &#39;bu=
ild_verbose_shell&#39;: False, &#39;build_verbose_stdout&#39;: False, &#39;=
default_loglevel&#39;: 20, &#39;debug_domains&#39;: {}}, {&#39;SHELL&#39;: =
&#39;/bin/bash&#39;, &#39;SSH_AUTH_SOCK&#39;: &#39;/run/user/1000/keyring/s=
sh&#39;, &#39;SSH_AGENT_PID&#39;: &#39;3080&#39;, &#39;PWD&#39;: &#39;/OE/b=
uild/oe-core&#39;, &#39;LOGNAME&#39;: &#39;martin&#39;, &#39;HOME&#39;: &#3=
9;/home/martin&#39;, &#39;MACHINE&#39;: &#39;qemux86-64&#39;, &#39;BB_ENV_E=
XTRAWHITE&#39;: &#39;MACHINE DISTRO http_proxy ftp_proxy https_proxy all_pr=
oxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACH=
INE BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD&#39;, =
&#39;USER&#39;: &#39;martin&#39;, &#39;LC_ALL&#39;: &#39;en_US.UTF-8&#39;, =
&#39;PATH&#39;: &#39;/OE/build/oe-core/openembedded-core/scripts:/OE/build/=
oe-core/bitbake/bin:/home/martin/bin:/usr/local/sbin:/usr/local/bin:/usr/sb=
in:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin&#39;, &#39;SES=
SION_MANAGER&#39;: &#39;local/jama:@/tmp/.ICE-unix/2943,unix/jama:/tmp/.ICE=
-unix/2943&#39;, &#39;WINDOWID&#39;: &#39;79691779&#39;, &#39;QT_ACCESSIBIL=
ITY&#39;: &#39;1&#39;, &#39;COLORTERM&#39;: &#39;truecolor&#39;, &#39;XDG_C=
ONFIG_DIRS&#39;: &#39;/etc/xdg/xdg-xubuntu:/etc/xdg:/etc/xdg&#39;, &#39;XDG=
_SESSION_PATH&#39;: &#39;/org/freedesktop/DisplayManager/Session0&#39;, &#3=
9;XDG_MENU_PREFIX&#39;: &#39;xfce-&#39;, &#39;CLUTTER_BACKEND&#39;: &#39;x1=
1&#39;, &#39;LANGUAGE&#39;: &#39;en_US&#39;, &#39;TERMCAP&#39;: &#39;SC|scr=
een.xterm-256color|VT 100/ANSI X3.64 virtual terminal:DO=3D\\E[%dB:LE=3D\\E=
[%dD:RI=3D\\E[%dC:UP=3D\\E[%dA:bs:bt=3D\\E[Z:cd=3D\\E[J:ce=3D\\E[K:cl=3D\\E=
[H\\E[J:cm=3D\\E[%i%d;%dH:ct=3D\\E[3g:do=3D^J:nd=3D\\E[C:pt:rc=3D\\E8:rs=3D=
\\Ec:sc=3D\\E7:st=3D\\EH:up=3D\\EM:le=3D^H:bl=3D^G:cr=3D^M:it#8:ho=3D\\E[H:=
nw=3D\\EE:ta=3D^I:is=3D\\E)0:li#51:co#263:am:xn:xv:LP:sr=3D\\EM:al=3D\\E[L:=
AL=3D\\E[%dL:cs=3D\\E[%i%d;%dr:dl=3D\\E[M:DL=3D\\E[%dM:dc=3D\\E[P:DC=3D\\E[=
%dP:im=3D\\E[4h:ei=3D\\E[4l:mi:IC=3D\\E[%d@:ks=3D\\E[?1h\\E=3D:ke=3D\\E[?1l=
\\E&gt;:vi=3D\\E[?25l:ve=3D\\E[34h\\E[?25h:vs=3D\\E[34l:ti=3D\\E[?1049h:te=
=3D\\E[?1049l:us=3D\\E[4m:ue=3D\\E[24m:so=3D\\E[3m:se=3D\\E[23m:mb=3D\\E[5=
m:md=3D\\E[1m:mh=3D\\E[2m:mr=3D\\E[7m:me=3D\\E[m:ms:Co#8:pa#64:AF=3D\\E[3%d=
m:AB=3D\\E[4%dm:op=3D\\E[39;49m:AX:vb=3D\\Eg:G0:as=3D\\E(0:ae=3D\\E(B:ac=3D=
\\140\\140aaffggjjkkllmmnnooppqqrrssttuuvvwwxxyyzz{{||}}~~..--++,,hhII00:po=
=
=3D\\E[5i:pf=3D\\E[4i:Km=3D\\E[&lt;:k0=3D\\E[10~:k1=3D\\EOP:k2=3D\\EOQ:k3=
=3D\\EOR:k4=3D\\EOS:k5=3D\\E[15~:k6=3D\\E[17~:k7=3D\\E[18~:k8=3D\\E[19~:k9=
=
=3D\\E[20~:k;=3D\\E[21~:F1=3D\\E[23~:F2=3D\\E[24~:kB=3D\\E[Z:kh=3D\\E[1~:@=
1=3D\\E[1~:kH=3D\\E[4~:@7=3D\\E[4~:kN=3D\\E[6~:kP=3D\\E[5~:kI=3D\\E[2~:kD=
=3D\\E[3~:ku=3D\\EOA:kd=3D\\EOB:kr=3D\\EOC:kl=3D\\EOD:km:&#39;, &#39;LC_AD=
DRESS&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;LC_NAME&#39;: &#39;cs_CZ.UTF-8&#39;=
, &#39;WINDOW&#39;: &#39;6&#39;, &#39;DESKTOP_SESSION&#39;: &#39;xubuntu&#3=
9;, &#39;LC_MONETARY&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;EDITOR&#39;: &#39;vi=
m&#39;, &#39;XDG_SEAT&#39;: &#39;seat0&#39;, &#39;XDG_SESSION_DESKTOP&#39;:=
 &#39;xubuntu&#39;, &#39;QT_QPA_PLATFORMTHEME&#39;: &#39;gtk2&#39;, &#39;XD=
G_SESSION_TYPE&#39;: &#39;x11&#39;, &#39;PANEL_GDK_CORE_DEVICE_EVENTS&#39;:=
 &#39;0&#39;, &#39;GPG_AGENT_INFO&#39;: &#39;/run/user/1000/gnupg/S.gpg-age=
nt:0:1&#39;, &#39;XAUTHORITY&#39;: &#39;/home/martin/.Xauthority&#39;, &#39=
;XDG_GREETER_DATA_DIR&#39;: &#39;/var/lib/lightdm-data/martin&#39;, &#39;GD=
M_LANG&#39;: &#39;en_US&#39;, &#39;LANG&#39;: &#39;C&#39;, &#39;LC_PAPER&#3=
9;: &#39;cs_CZ.UTF-8&#39;, &#39;LS_COLORS&#39;: &#39;rs=3D0:di=3D01;34:ln=
=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=3D01;35:bd=3D40;33;01:cd=3D40;33=
;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D30;43:ca=3D30;41:tw=3D30;42:ow=3D=
34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:*.tgz=3D01;31:*.arc=3D01;31:*.arj=
=
=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=3D01;31:*.lzh=3D01;31:*.lzma=3D=
01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D01;31:*.t7z=3D01;31:*.zip=3D01;31=
:*.z=3D01;31:*.dz=3D01;31:*.gz=3D01;31:*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D0=
1;31:*.xz=3D01;31:*.zst=3D01;31:*.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D01;31:*=
.tbz=3D01;31:*.tbz2=3D01;31:*.tz=3D01;31:*.deb=3D01;31:*.rpm=3D01;31:*.jar=
=3D01;31:*.war=3D01;31:*.ear=3D01;31:*.sar=3D01;31:*.rar=3D01;31:*.alz=3D0=
1;31:*.ace=3D01;31:*.zoo=3D01;31:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;31:*=
.cab=3D01;31:*.wim=3D01;31:*.swm=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.jpg=
=3D01;35:*.jpeg=3D01;35:*.mjpg=3D01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=
=
=3D01;35:*.pbm=3D01;35:*.pgm=3D01;35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D0=
1;35:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35:*.png=3D01;35:*.svg=3D01;35=
:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.m=
peg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=3D01;35:*.webp=3D01;35:*.ogm=
=
=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;35:*.vob=3D01;35:*.qt=3D0=
1;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=3D01;35:*.rmvb=3D01;35:=
*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*.flv=3D01;35:*.gl=3D01;35:*.dl=
=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.cgm=3D01;35:*.emf=3D0=
1;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.au=3D00;36:*.flac=3D00;36:=
*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;36:*.mp3=3D00;36:*.mp=
c=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;36:*.oga=3D00;36:*.opus=3D0=
0;36:*.spx=3D00;36:*.xspf=3D00;36:&#39;, &#39;XDG_CURRENT_DESKTOP&#39;: &#3=
9;XFCE&#39;, &#39;VTE_VERSION&#39;: &#39;6200&#39;, &#39;XDG_SEAT_PATH&#39;=
: &#39;/org/freedesktop/DisplayManager/Seat0&#39;, &#39;LESSCLOSE&#39;: &#3=
9;/usr/bin/lesspipe %s %s&#39;, &#39;XDG_SESSION_CLASS&#39;: &#39;user&#39;=
, &#39;LC_IDENTIFICATION&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;TERM&#39;: &#39;=
screen.xterm-256color&#39;, &#39;GTK_OVERLAY_SCROLLING&#39;: &#39;0&#39;, &=
#39;LESSOPEN&#39;: &#39;| /usr/bin/lesspipe %s&#39;, &#39;DISPLAY&#39;: &#3=
9;:0.0&#39;, &#39;SHLVL&#39;: &#39;2&#39;, &#39;LC_TELEPHONE&#39;: &#39;cs_=
CZ.UTF-8&#39;, &#39;LC_MEASUREMENT&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;XDG_VT=
NR&#39;: &#39;7&#39;, &#39;XDG_SESSION_ID&#39;: &#39;c2&#39;, &#39;LD_LIBRA=
RY_PATH&#39;: &#39;&#39;, &#39;XDG_RUNTIME_DIR&#39;: &#39;/run/user/1000&#3=
9;, &#39;LC_TIME&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;XDG_DATA_DIRS&#39;: &#39=
;/usr/share/xubuntu:/usr/share/xfce4:/usr/local/share:/usr/share:/var/lib/s=
napd/desktop:/usr/share&#39;, &#39;STY&#39;: &#39;5368.x&#39;, &#39;GDMSESS=
ION&#39;: &#39;xubuntu&#39;, &#39;DBUS_SESSION_BUS_ADDRESS&#39;: &#39;unix:=
path=3D/run/user/1000/bus&#39;, &#39;BUILDDIR&#39;: &#39;/OE/build/oe-core&=
#39;, &#39;LC_NUMERIC&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;OLDPWD&#39;: &#39;/=
OE/build/oe-core/meta-python2&#39;, &#39;_&#39;: &#39;/OE/build/oe-core/bit=
bake/bin/bitbake&#39;}, [&#39;/OE/build/oe-core/bitbake/bin/bitbake&#39;, &=
#39;-k&#39;, &#39;python-native&#39;]]<br>
928962 12:42:56.450688 Command Completed<br>
928962 12:42:56.450996 Running command [&#39;getVariable&#39;, &#39;BBINCL=
UDELOGS&#39;]<br>
928962 12:42:56.451159 Command Completed<br>
928962 12:42:56.451239 Running command [&#39;getVariable&#39;, &#39;BBINCL=
UDELOGS_LINES&#39;]<br>
928962 12:42:56.451360 Command Completed<br>
928962 12:42:56.451436 Running command [&#39;getSetVariable&#39;, &#39;BB_=
CONSOLELOG&#39;]<br>
928962 12:42:56.451656 Command Completed<br>
928962 12:42:56.451740 Running command [&#39;getSetVariable&#39;, &#39;BB_=
LOGCONFIG&#39;]<br>
928962 12:42:56.453927 Command Completed<br>
928962 12:42:56.454122 Running command [&#39;getUIHandlerNum&#39;]<br>
928962 12:42:56.454289 Command Completed<br>
928962 12:42:56.454392 Running command [&#39;setEventMask&#39;, 1, 20, {&#=
39;BitBake.RunQueue.HashEquiv&#39;: 19, &#39;BitBake.SigGen.HashEquiv&#39;:=
 19}, [&#39;bb.runqueue.runQueueExitWait&#39;, &#39;bb.event.LogExecTTY&#39=
;, &#39;logging.LogRecord&#39;, &#39;bb.build.TaskFailed&#39;, &#39;bb.buil=
d.TaskBase&#39;, &#39;bb.event.ParseStarted&#39;, &#39;bb.event.ParseProgre=
ss&#39;, &#39;bb.event.ParseCompleted&#39;, &#39;bb.event.CacheLoadStarted&=
#39;, &#39;bb.event.CacheLoadProgress&#39;, &#39;bb.event.CacheLoadComplete=
d&#39;, &#39;bb.command.CommandFailed&#39;, &#39;bb.command.CommandExit&#39=
;, &#39;bb.command.CommandCompleted&#39;, &#39;bb.cooker.CookerExit&#39;, &=
#39;bb.event.MultipleProviders&#39;, &#39;bb.event.NoProvider&#39;, &#39;bb=
.runqueue.sceneQueueTaskStarted&#39;, &#39;bb.runqueue.runQueueTaskStarted&=
#39;, &#39;bb.runqueue.runQueueTaskFailed&#39;, &#39;bb.runqueue.sceneQueue=
TaskFailed&#39;, &#39;bb.event.BuildBase&#39;, &#39;bb.build.TaskStarted&#3=
9;, &#39;bb.build.TaskSucceeded&#39;, &#39;bb.build.TaskFailedSilent&#39;, =
&#39;bb.build.TaskProgress&#39;, &#39;bb.event.ProcessStarted&#39;, &#39;bb=
.event.ProcessProgress&#39;, &#39;bb.event.ProcessFinished&#39;]]<br>
928962 12:42:56.454523 Command Completed<br>
928962 12:42:56.454599 Running command [&#39;getVariable&#39;, &#39;BB_DEF=
AULT_TASK&#39;]<br>
928962 12:42:56.454741 Command Completed<br>
928962 12:42:56.454816 Running command [&#39;setConfig&#39;, &#39;cmd&#39;=
, &#39;build&#39;]<br>
928962 12:42:56.454947 Command Completed<br>
928962 12:42:56.455022 Running command [&#39;buildTargets&#39;, [&#39;pyth=
on-native&#39;], &#39;build&#39;]<br>
928962 12:42:56.457778 Command Completed<br>
928962 12:43:04.560968 Processing Client<br>
928962 12:43:04.561063 Disconnecting Client<br>
928962 12:43:08.544918 Accepting [&lt;socket.socket fd=3D6, family=3DAddre=
ssFamily.AF_UNIX, type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3Dbitbake=
.sock&gt;] ([])<br>
928962 12:43:08.557050 Processing Client<br>
928962 12:43:08.557154 Connecting Client<br>
928962 12:43:08.557787 Running command [&#39;setFeatures&#39;, [2]]<br>
928962 12:43:08.558183 Command Completed<br>
928962 12:43:08.558952 Running command [&#39;updateConfig&#39;, {&#39;abor=
t&#39;: False, &#39;force&#39;: False, &#39;invalidate_stamp&#39;: None, &#=
39;dry_run&#39;: False, &#39;dump_signatures&#39;: [], &#39;extra_assume_pr=
ovided&#39;: [], &#39;profile&#39;: False, &#39;prefile&#39;: [], &#39;post=
file&#39;: [], &#39;server_timeout&#39;: None, &#39;nosetscene&#39;: False,=
 &#39;setsceneonly&#39;: False, &#39;skipsetscene&#39;: False, &#39;runall&=
#39;: None, &#39;runonly&#39;: None, &#39;writeeventlog&#39;: None, &#39;bu=
ild_verbose_shell&#39;: False, &#39;build_verbose_stdout&#39;: False, &#39;=
default_loglevel&#39;: 20, &#39;debug_domains&#39;: {}}, {&#39;SHELL&#39;: =
&#39;/bin/bash&#39;, &#39;SSH_AUTH_SOCK&#39;: &#39;/run/user/1000/keyring/s=
sh&#39;, &#39;SSH_AGENT_PID&#39;: &#39;3080&#39;, &#39;PWD&#39;: &#39;/OE/b=
uild/oe-core&#39;, &#39;LOGNAME&#39;: &#39;martin&#39;, &#39;HOME&#39;: &#3=
9;/home/martin&#39;, &#39;MACHINE&#39;: &#39;qemux86-64&#39;, &#39;BB_ENV_E=
XTRAWHITE&#39;: &#39;MACHINE DISTRO http_proxy ftp_proxy https_proxy all_pr=
oxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACH=
INE BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD&#39;, =
&#39;USER&#39;: &#39;martin&#39;, &#39;LC_ALL&#39;: &#39;en_US.UTF-8&#39;, =
&#39;PATH&#39;: &#39;/OE/build/oe-core/openembedded-core/scripts:/OE/build/=
oe-core/bitbake/bin:/home/martin/bin:/usr/local/sbin:/usr/local/bin:/usr/sb=
in:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin&#39;, &#39;SES=
SION_MANAGER&#39;: &#39;local/jama:@/tmp/.ICE-unix/2943,unix/jama:/tmp/.ICE=
-unix/2943&#39;, &#39;WINDOWID&#39;: &#39;79691779&#39;, &#39;QT_ACCESSIBIL=
ITY&#39;: &#39;1&#39;, &#39;COLORTERM&#39;: &#39;truecolor&#39;, &#39;XDG_C=
ONFIG_DIRS&#39;: &#39;/etc/xdg/xdg-xubuntu:/etc/xdg:/etc/xdg&#39;, &#39;XDG=
_SESSION_PATH&#39;: &#39;/org/freedesktop/DisplayManager/Session0&#39;, &#3=
9;XDG_MENU_PREFIX&#39;: &#39;xfce-&#39;, &#39;CLUTTER_BACKEND&#39;: &#39;x1=
1&#39;, &#39;LANGUAGE&#39;: &#39;en_US&#39;, &#39;TERMCAP&#39;: &#39;SC|scr=
een.xterm-256color|VT 100/ANSI X3.64 virtual terminal:DO=3D\\E[%dB:LE=3D\\E=
[%dD:RI=3D\\E[%dC:UP=3D\\E[%dA:bs:bt=3D\\E[Z:cd=3D\\E[J:ce=3D\\E[K:cl=3D\\E=
[H\\E[J:cm=3D\\E[%i%d;%dH:ct=3D\\E[3g:do=3D^J:nd=3D\\E[C:pt:rc=3D\\E8:rs=3D=
\\Ec:sc=3D\\E7:st=3D\\EH:up=3D\\EM:le=3D^H:bl=3D^G:cr=3D^M:it#8:ho=3D\\E[H:=
nw=3D\\EE:ta=3D^I:is=3D\\E)0:li#51:co#263:am:xn:xv:LP:sr=3D\\EM:al=3D\\E[L:=
AL=3D\\E[%dL:cs=3D\\E[%i%d;%dr:dl=3D\\E[M:DL=3D\\E[%dM:dc=3D\\E[P:DC=3D\\E[=
%dP:im=3D\\E[4h:ei=3D\\E[4l:mi:IC=3D\\E[%d@:ks=3D\\E[?1h\\E=3D:ke=3D\\E[?1l=
\\E&gt;:vi=3D\\E[?25l:ve=3D\\E[34h\\E[?25h:vs=3D\\E[34l:ti=3D\\E[?1049h:te=
=3D\\E[?1049l:us=3D\\E[4m:ue=3D\\E[24m:so=3D\\E[3m:se=3D\\E[23m:mb=3D\\E[5=
m:md=3D\\E[1m:mh=3D\\E[2m:mr=3D\\E[7m:me=3D\\E[m:ms:Co#8:pa#64:AF=3D\\E[3%d=
m:AB=3D\\E[4%dm:op=3D\\E[39;49m:AX:vb=3D\\Eg:G0:as=3D\\E(0:ae=3D\\E(B:ac=3D=
\\140\\140aaffggjjkkllmmnnooppqqrrssttuuvvwwxxyyzz{{||}}~~..--++,,hhII00:po=
=
=3D\\E[5i:pf=3D\\E[4i:Km=3D\\E[&lt;:k0=3D\\E[10~:k1=3D\\EOP:k2=3D\\EOQ:k3=
=3D\\EOR:k4=3D\\EOS:k5=3D\\E[15~:k6=3D\\E[17~:k7=3D\\E[18~:k8=3D\\E[19~:k9=
=
=3D\\E[20~:k;=3D\\E[21~:F1=3D\\E[23~:F2=3D\\E[24~:kB=3D\\E[Z:kh=3D\\E[1~:@=
1=3D\\E[1~:kH=3D\\E[4~:@7=3D\\E[4~:kN=3D\\E[6~:kP=3D\\E[5~:kI=3D\\E[2~:kD=
=3D\\E[3~:ku=3D\\EOA:kd=3D\\EOB:kr=3D\\EOC:kl=3D\\EOD:km:&#39;, &#39;LC_AD=
DRESS&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;LC_NAME&#39;: &#39;cs_CZ.UTF-8&#39;=
, &#39;WINDOW&#39;: &#39;6&#39;, &#39;DESKTOP_SESSION&#39;: &#39;xubuntu&#3=
9;, &#39;LC_MONETARY&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;EDITOR&#39;: &#39;vi=
m&#39;, &#39;XDG_SEAT&#39;: &#39;seat0&#39;, &#39;XDG_SESSION_DESKTOP&#39;:=
 &#39;xubuntu&#39;, &#39;QT_QPA_PLATFORMTHEME&#39;: &#39;gtk2&#39;, &#39;XD=
G_SESSION_TYPE&#39;: &#39;x11&#39;, &#39;PANEL_GDK_CORE_DEVICE_EVENTS&#39;:=
 &#39;0&#39;, &#39;GPG_AGENT_INFO&#39;: &#39;/run/user/1000/gnupg/S.gpg-age=
nt:0:1&#39;, &#39;XAUTHORITY&#39;: &#39;/home/martin/.Xauthority&#39;, &#39=
;XDG_GREETER_DATA_DIR&#39;: &#39;/var/lib/lightdm-data/martin&#39;, &#39;GD=
M_LANG&#39;: &#39;en_US&#39;, &#39;LANG&#39;: &#39;C&#39;, &#39;LC_PAPER&#3=
9;: &#39;cs_CZ.UTF-8&#39;, &#39;LS_COLORS&#39;: &#39;rs=3D0:di=3D01;34:ln=
=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=3D01;35:bd=3D40;33;01:cd=3D40;33=
;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D30;43:ca=3D30;41:tw=3D30;42:ow=3D=
34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:*.tgz=3D01;31:*.arc=3D01;31:*.arj=
=
=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=3D01;31:*.lzh=3D01;31:*.lzma=3D=
01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D01;31:*.t7z=3D01;31:*.zip=3D01;31=
:*.z=3D01;31:*.dz=3D01;31:*.gz=3D01;31:*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D0=
1;31:*.xz=3D01;31:*.zst=3D01;31:*.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D01;31:*=
.tbz=3D01;31:*.tbz2=3D01;31:*.tz=3D01;31:*.deb=3D01;31:*.rpm=3D01;31:*.jar=
=3D01;31:*.war=3D01;31:*.ear=3D01;31:*.sar=3D01;31:*.rar=3D01;31:*.alz=3D0=
1;31:*.ace=3D01;31:*.zoo=3D01;31:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;31:*=
.cab=3D01;31:*.wim=3D01;31:*.swm=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.jpg=
=3D01;35:*.jpeg=3D01;35:*.mjpg=3D01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=
=
=3D01;35:*.pbm=3D01;35:*.pgm=3D01;35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D0=
1;35:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35:*.png=3D01;35:*.svg=3D01;35=
:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.m=
peg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=3D01;35:*.webp=3D01;35:*.ogm=
=
=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;35:*.vob=3D01;35:*.qt=3D0=
1;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=3D01;35:*.rmvb=3D01;35:=
*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*.flv=3D01;35:*.gl=3D01;35:*.dl=
=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.cgm=3D01;35:*.emf=3D0=
1;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.au=3D00;36:*.flac=3D00;36:=
*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;36:*.mp3=3D00;36:*.mp=
c=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;36:*.oga=3D00;36:*.opus=3D0=
0;36:*.spx=3D00;36:*.xspf=3D00;36:&#39;, &#39;XDG_CURRENT_DESKTOP&#39;: &#3=
9;XFCE&#39;, &#39;VTE_VERSION&#39;: &#39;6200&#39;, &#39;XDG_SEAT_PATH&#39;=
: &#39;/org/freedesktop/DisplayManager/Seat0&#39;, &#39;LESSCLOSE&#39;: &#3=
9;/usr/bin/lesspipe %s %s&#39;, &#39;XDG_SESSION_CLASS&#39;: &#39;user&#39;=
, &#39;LC_IDENTIFICATION&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;TERM&#39;: &#39;=
screen.xterm-256color&#39;, &#39;GTK_OVERLAY_SCROLLING&#39;: &#39;0&#39;, &=
#39;LESSOPEN&#39;: &#39;| /usr/bin/lesspipe %s&#39;, &#39;DISPLAY&#39;: &#3=
9;:0.0&#39;, &#39;SHLVL&#39;: &#39;2&#39;, &#39;LC_TELEPHONE&#39;: &#39;cs_=
CZ.UTF-8&#39;, &#39;LC_MEASUREMENT&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;XDG_VT=
NR&#39;: &#39;7&#39;, &#39;XDG_SESSION_ID&#39;: &#39;c2&#39;, &#39;LD_LIBRA=
RY_PATH&#39;: &#39;&#39;, &#39;XDG_RUNTIME_DIR&#39;: &#39;/run/user/1000&#3=
9;, &#39;LC_TIME&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;XDG_DATA_DIRS&#39;: &#39=
;/usr/share/xubuntu:/usr/share/xfce4:/usr/local/share:/usr/share:/var/lib/s=
napd/desktop:/usr/share&#39;, &#39;STY&#39;: &#39;5368.x&#39;, &#39;GDMSESS=
ION&#39;: &#39;xubuntu&#39;, &#39;DBUS_SESSION_BUS_ADDRESS&#39;: &#39;unix:=
path=3D/run/user/1000/bus&#39;, &#39;BUILDDIR&#39;: &#39;/OE/build/oe-core&=
#39;, &#39;LC_NUMERIC&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;OLDPWD&#39;: &#39;/=
OE/build/oe-core/meta-python2&#39;, &#39;_&#39;: &#39;/OE/build/oe-core/bit=
bake/bin/bitbake&#39;}, [&#39;/OE/build/oe-core/bitbake/bin/bitbake&#39;, &=
#39;-k&#39;, &#39;python-native&#39;]]<br>
928962 12:43:08.559567 Command Completed<br>
928962 12:43:08.559798 Running command [&#39;getVariable&#39;, &#39;BBINCL=
UDELOGS&#39;]<br>
928962 12:43:08.812911 Command Completed<br>
928962 12:43:08.813560 Running command [&#39;getVariable&#39;, &#39;BBINCL=
UDELOGS_LINES&#39;]<br>
928962 12:43:08.813765 Command Completed<br>
928962 12:43:08.813879 Running command [&#39;getSetVariable&#39;, &#39;BB_=
CONSOLELOG&#39;]<br>
928962 12:43:08.814115 Command Completed<br>
928962 12:43:08.814236 Running command [&#39;getSetVariable&#39;, &#39;BB_=
LOGCONFIG&#39;]<br>
928962 12:43:08.816210 Command Completed<br>
928962 12:43:08.816451 Running command [&#39;getUIHandlerNum&#39;]<br>
928962 12:43:08.816661 Command Completed<br>
928962 12:43:08.816799 Running command [&#39;setEventMask&#39;, 2, 20, {&#=
39;BitBake.RunQueue.HashEquiv&#39;: 19, &#39;BitBake.SigGen.HashEquiv&#39;:=
 19}, [&#39;bb.runqueue.runQueueExitWait&#39;, &#39;bb.event.LogExecTTY&#39=
;, &#39;logging.LogRecord&#39;, &#39;bb.build.TaskFailed&#39;, &#39;bb.buil=
d.TaskBase&#39;, &#39;bb.event.ParseStarted&#39;, &#39;bb.event.ParseProgre=
ss&#39;, &#39;bb.event.ParseCompleted&#39;, &#39;bb.event.CacheLoadStarted&=
#39;, &#39;bb.event.CacheLoadProgress&#39;, &#39;bb.event.CacheLoadComplete=
d&#39;, &#39;bb.command.CommandFailed&#39;, &#39;bb.command.CommandExit&#39=
;, &#39;bb.command.CommandCompleted&#39;, &#39;bb.cooker.CookerExit&#39;, &=
#39;bb.event.MultipleProviders&#39;, &#39;bb.event.NoProvider&#39;, &#39;bb=
.runqueue.sceneQueueTaskStarted&#39;, &#39;bb.runqueue.runQueueTaskStarted&=
#39;, &#39;bb.runqueue.runQueueTaskFailed&#39;, &#39;bb.runqueue.sceneQueue=
TaskFailed&#39;, &#39;bb.event.BuildBase&#39;, &#39;bb.build.TaskStarted&#3=
9;, &#39;bb.build.TaskSucceeded&#39;, &#39;bb.build.TaskFailedSilent&#39;, =
&#39;bb.build.TaskProgress&#39;, &#39;bb.event.ProcessStarted&#39;, &#39;bb=
.event.ProcessProgress&#39;, &#39;bb.event.ProcessFinished&#39;]]<br>
928962 12:43:08.816980 Command Completed<br>
928962 12:43:08.817101 Running command [&#39;getVariable&#39;, &#39;BB_DEF=
AULT_TASK&#39;]<br>
928962 12:43:08.817293 Command Completed<br>
928962 12:43:08.817418 Running command [&#39;setConfig&#39;, &#39;cmd&#39;=
, &#39;build&#39;]<br>
928962 12:43:08.817604 Command Completed<br>
928962 12:43:08.817732 Running command [&#39;buildTargets&#39;, [&#39;pyth=
on-native&#39;], &#39;build&#39;]<br>
928962 12:43:08.820432 Command Completed<br>
928962 12:43:18.569947 Processing Client<br>
928962 12:43:18.570026 Disconnecting Client<br>
928962 12:43:21.796010 Accepting [&lt;socket.socket fd=3D6, family=3DAddre=
ssFamily.AF_UNIX, type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3Dbitbake=
.sock&gt;] ([])<br>
928962 12:43:21.812637 Processing Client<br>
928962 12:43:21.812758 Connecting Client<br>
928962 12:43:21.816670 Running command [&#39;setFeatures&#39;, [2]]<br>
928962 12:43:21.817252 Command Completed<br>
928962 12:43:21.817987 Running command [&#39;updateConfig&#39;, {&#39;abor=
t&#39;: False, &#39;force&#39;: False, &#39;invalidate_stamp&#39;: None, &#=
39;dry_run&#39;: False, &#39;dump_signatures&#39;: [], &#39;extra_assume_pr=
ovided&#39;: [], &#39;profile&#39;: False, &#39;prefile&#39;: [], &#39;post=
file&#39;: [], &#39;server_timeout&#39;: None, &#39;nosetscene&#39;: False,=
 &#39;setsceneonly&#39;: False, &#39;skipsetscene&#39;: False, &#39;runall&=
#39;: None, &#39;runonly&#39;: None, &#39;writeeventlog&#39;: None, &#39;bu=
ild_verbose_shell&#39;: False, &#39;build_verbose_stdout&#39;: False, &#39;=
default_loglevel&#39;: 20, &#39;debug_domains&#39;: {}}, {&#39;SHELL&#39;: =
&#39;/bin/bash&#39;, &#39;SSH_AUTH_SOCK&#39;: &#39;/run/user/1000/keyring/s=
sh&#39;, &#39;SSH_AGENT_PID&#39;: &#39;3080&#39;, &#39;PWD&#39;: &#39;/OE/b=
uild/oe-core&#39;, &#39;LOGNAME&#39;: &#39;martin&#39;, &#39;HOME&#39;: &#3=
9;/home/martin&#39;, &#39;MACHINE&#39;: &#39;qemux86-64&#39;, &#39;BB_ENV_E=
XTRAWHITE&#39;: &#39;MACHINE DISTRO http_proxy ftp_proxy https_proxy all_pr=
oxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACH=
INE BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD&#39;, =
&#39;USER&#39;: &#39;martin&#39;, &#39;LC_ALL&#39;: &#39;en_US.UTF-8&#39;, =
&#39;PATH&#39;: &#39;/OE/build/oe-core/openembedded-core/scripts:/OE/build/=
oe-core/bitbake/bin:/home/martin/bin:/usr/local/sbin:/usr/local/bin:/usr/sb=
in:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin&#39;, &#39;SES=
SION_MANAGER&#39;: &#39;local/jama:@/tmp/.ICE-unix/2943,unix/jama:/tmp/.ICE=
-unix/2943&#39;, &#39;WINDOWID&#39;: &#39;79691779&#39;, &#39;QT_ACCESSIBIL=
ITY&#39;: &#39;1&#39;, &#39;COLORTERM&#39;: &#39;truecolor&#39;, &#39;XDG_C=
ONFIG_DIRS&#39;: &#39;/etc/xdg/xdg-xubuntu:/etc/xdg:/etc/xdg&#39;, &#39;XDG=
_SESSION_PATH&#39;: &#39;/org/freedesktop/DisplayManager/Session0&#39;, &#3=
9;XDG_MENU_PREFIX&#39;: &#39;xfce-&#39;, &#39;CLUTTER_BACKEND&#39;: &#39;x1=
1&#39;, &#39;LANGUAGE&#39;: &#39;en_US&#39;, &#39;TERMCAP&#39;: &#39;SC|scr=
een.xterm-256color|VT 100/ANSI X3.64 virtual terminal:DO=3D\\E[%dB:LE=3D\\E=
[%dD:RI=3D\\E[%dC:UP=3D\\E[%dA:bs:bt=3D\\E[Z:cd=3D\\E[J:ce=3D\\E[K:cl=3D\\E=
[H\\E[J:cm=3D\\E[%i%d;%dH:ct=3D\\E[3g:do=3D^J:nd=3D\\E[C:pt:rc=3D\\E8:rs=3D=
\\Ec:sc=3D\\E7:st=3D\\EH:up=3D\\EM:le=3D^H:bl=3D^G:cr=3D^M:it#8:ho=3D\\E[H:=
nw=3D\\EE:ta=3D^I:is=3D\\E)0:li#51:co#263:am:xn:xv:LP:sr=3D\\EM:al=3D\\E[L:=
AL=3D\\E[%dL:cs=3D\\E[%i%d;%dr:dl=3D\\E[M:DL=3D\\E[%dM:dc=3D\\E[P:DC=3D\\E[=
%dP:im=3D\\E[4h:ei=3D\\E[4l:mi:IC=3D\\E[%d@:ks=3D\\E[?1h\\E=3D:ke=3D\\E[?1l=
\\E&gt;:vi=3D\\E[?25l:ve=3D\\E[34h\\E[?25h:vs=3D\\E[34l:ti=3D\\E[?1049h:te=
=3D\\E[?1049l:us=3D\\E[4m:ue=3D\\E[24m:so=3D\\E[3m:se=3D\\E[23m:mb=3D\\E[5=
m:md=3D\\E[1m:mh=3D\\E[2m:mr=3D\\E[7m:me=3D\\E[m:ms:Co#8:pa#64:AF=3D\\E[3%d=
m:AB=3D\\E[4%dm:op=3D\\E[39;49m:AX:vb=3D\\Eg:G0:as=3D\\E(0:ae=3D\\E(B:ac=3D=
\\140\\140aaffggjjkkllmmnnooppqqrrssttuuvvwwxxyyzz{{||}}~~..--++,,hhII00:po=
=
=3D\\E[5i:pf=3D\\E[4i:Km=3D\\E[&lt;:k0=3D\\E[10~:k1=3D\\EOP:k2=3D\\EOQ:k3=
=3D\\EOR:k4=3D\\EOS:k5=3D\\E[15~:k6=3D\\E[17~:k7=3D\\E[18~:k8=3D\\E[19~:k9=
=
=3D\\E[20~:k;=3D\\E[21~:F1=3D\\E[23~:F2=3D\\E[24~:kB=3D\\E[Z:kh=3D\\E[1~:@=
1=3D\\E[1~:kH=3D\\E[4~:@7=3D\\E[4~:kN=3D\\E[6~:kP=3D\\E[5~:kI=3D\\E[2~:kD=
=3D\\E[3~:ku=3D\\EOA:kd=3D\\EOB:kr=3D\\EOC:kl=3D\\EOD:km:&#39;, &#39;LC_AD=
DRESS&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;LC_NAME&#39;: &#39;cs_CZ.UTF-8&#39;=
, &#39;WINDOW&#39;: &#39;6&#39;, &#39;DESKTOP_SESSION&#39;: &#39;xubuntu&#3=
9;, &#39;LC_MONETARY&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;EDITOR&#39;: &#39;vi=
m&#39;, &#39;XDG_SEAT&#39;: &#39;seat0&#39;, &#39;XDG_SESSION_DESKTOP&#39;:=
 &#39;xubuntu&#39;, &#39;QT_QPA_PLATFORMTHEME&#39;: &#39;gtk2&#39;, &#39;XD=
G_SESSION_TYPE&#39;: &#39;x11&#39;, &#39;PANEL_GDK_CORE_DEVICE_EVENTS&#39;:=
 &#39;0&#39;, &#39;GPG_AGENT_INFO&#39;: &#39;/run/user/1000/gnupg/S.gpg-age=
nt:0:1&#39;, &#39;XAUTHORITY&#39;: &#39;/home/martin/.Xauthority&#39;, &#39=
;XDG_GREETER_DATA_DIR&#39;: &#39;/var/lib/lightdm-data/martin&#39;, &#39;GD=
M_LANG&#39;: &#39;en_US&#39;, &#39;LANG&#39;: &#39;C&#39;, &#39;LC_PAPER&#3=
9;: &#39;cs_CZ.UTF-8&#39;, &#39;LS_COLORS&#39;: &#39;rs=3D0:di=3D01;34:ln=
=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=3D01;35:bd=3D40;33;01:cd=3D40;33=
;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D30;43:ca=3D30;41:tw=3D30;42:ow=3D=
34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:*.tgz=3D01;31:*.arc=3D01;31:*.arj=
=
=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=3D01;31:*.lzh=3D01;31:*.lzma=3D=
01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D01;31:*.t7z=3D01;31:*.zip=3D01;31=
:*.z=3D01;31:*.dz=3D01;31:*.gz=3D01;31:*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D0=
1;31:*.xz=3D01;31:*.zst=3D01;31:*.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D01;31:*=
.tbz=3D01;31:*.tbz2=3D01;31:*.tz=3D01;31:*.deb=3D01;31:*.rpm=3D01;31:*.jar=
=3D01;31:*.war=3D01;31:*.ear=3D01;31:*.sar=3D01;31:*.rar=3D01;31:*.alz=3D0=
1;31:*.ace=3D01;31:*.zoo=3D01;31:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;31:*=
.cab=3D01;31:*.wim=3D01;31:*.swm=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.jpg=
=3D01;35:*.jpeg=3D01;35:*.mjpg=3D01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=
=
=3D01;35:*.pbm=3D01;35:*.pgm=3D01;35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D0=
1;35:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35:*.png=3D01;35:*.svg=3D01;35=
:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.m=
peg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=3D01;35:*.webp=3D01;35:*.ogm=
=
=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;35:*.vob=3D01;35:*.qt=3D0=
1;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=3D01;35:*.rmvb=3D01;35:=
*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*.flv=3D01;35:*.gl=3D01;35:*.dl=
=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.cgm=3D01;35:*.emf=3D0=
1;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.au=3D00;36:*.flac=3D00;36:=
*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;36:*.mp3=3D00;36:*.mp=
c=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;36:*.oga=3D00;36:*.opus=3D0=
0;36:*.spx=3D00;36:*.xspf=3D00;36:&#39;, &#39;XDG_CURRENT_DESKTOP&#39;: &#3=
9;XFCE&#39;, &#39;VTE_VERSION&#39;: &#39;6200&#39;, &#39;XDG_SEAT_PATH&#39;=
: &#39;/org/freedesktop/DisplayManager/Seat0&#39;, &#39;LESSCLOSE&#39;: &#3=
9;/usr/bin/lesspipe %s %s&#39;, &#39;XDG_SESSION_CLASS&#39;: &#39;user&#39;=
, &#39;LC_IDENTIFICATION&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;TERM&#39;: &#39;=
screen.xterm-256color&#39;, &#39;GTK_OVERLAY_SCROLLING&#39;: &#39;0&#39;, &=
#39;LESSOPEN&#39;: &#39;| /usr/bin/lesspipe %s&#39;, &#39;DISPLAY&#39;: &#3=
9;:0.0&#39;, &#39;SHLVL&#39;: &#39;2&#39;, &#39;LC_TELEPHONE&#39;: &#39;cs_=
CZ.UTF-8&#39;, &#39;LC_MEASUREMENT&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;XDG_VT=
NR&#39;: &#39;7&#39;, &#39;XDG_SESSION_ID&#39;: &#39;c2&#39;, &#39;LD_LIBRA=
RY_PATH&#39;: &#39;&#39;, &#39;XDG_RUNTIME_DIR&#39;: &#39;/run/user/1000&#3=
9;, &#39;LC_TIME&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;XDG_DATA_DIRS&#39;: &#39=
;/usr/share/xubuntu:/usr/share/xfce4:/usr/local/share:/usr/share:/var/lib/s=
napd/desktop:/usr/share&#39;, &#39;STY&#39;: &#39;5368.x&#39;, &#39;GDMSESS=
ION&#39;: &#39;xubuntu&#39;, &#39;DBUS_SESSION_BUS_ADDRESS&#39;: &#39;unix:=
path=3D/run/user/1000/bus&#39;, &#39;BUILDDIR&#39;: &#39;/OE/build/oe-core&=
#39;, &#39;LC_NUMERIC&#39;: &#39;cs_CZ.UTF-8&#39;, &#39;OLDPWD&#39;: &#39;/=
OE/build/oe-core/meta-python2&#39;, &#39;_&#39;: &#39;/OE/build/oe-core/bit=
bake/bin/bitbake&#39;}, [&#39;/OE/build/oe-core/bitbake/bin/bitbake&#39;, &=
#39;-k&#39;, &#39;python-native&#39;]]<br>
928962 12:43:21.818533 Command Completed<br>
928962 12:43:21.818721 Running command [&#39;getVariable&#39;, &#39;BBINCL=
UDELOGS&#39;]<br>
928962 12:43:22.255470 Command Completed<br>
928962 12:43:22.255835 Running command [&#39;getVariable&#39;, &#39;BBINCL=
UDELOGS_LINES&#39;]<br>
928962 12:43:22.256018 Command Completed<br>
928962 12:43:22.256172 Running command [&#39;getSetVariable&#39;, &#39;BB_=
CONSOLELOG&#39;]<br>
928962 12:43:22.256346 Command Completed<br>
928962 12:43:22.256468 Running command [&#39;getSetVariable&#39;, &#39;BB_=
LOGCONFIG&#39;]<br>
928962 12:43:22.256618 Command Completed<br>
928962 12:43:22.264356 Running command [&#39;getUIHandlerNum&#39;]<br>
928962 12:43:22.264922 Command Completed<br>
928962 12:43:22.265103 Running command [&#39;setEventMask&#39;, 3, 20, {&#=
39;BitBake.SigGen.HashEquiv&#39;: 19, &#39;BitBake.RunQueue.HashEquiv&#39;:=
 19}, [&#39;bb.runqueue.runQueueExitWait&#39;, &#39;bb.event.LogExecTTY&#39=
;, &#39;logging.LogRecord&#39;, &#39;bb.build.TaskFailed&#39;, &#39;bb.buil=
d.TaskBase&#39;, &#39;bb.event.ParseStarted&#39;, &#39;bb.event.ParseProgre=
ss&#39;, &#39;bb.event.ParseCompleted&#39;, &#39;bb.event.CacheLoadStarted&=
#39;, &#39;bb.event.CacheLoadProgress&#39;, &#39;bb.event.CacheLoadComplete=
d&#39;, &#39;bb.command.CommandFailed&#39;, &#39;bb.command.CommandExit&#39=
;, &#39;bb.command.CommandCompleted&#39;, &#39;bb.cooker.CookerExit&#39;, &=
#39;bb.event.MultipleProviders&#39;, &#39;bb.event.NoProvider&#39;, &#39;bb=
.runqueue.sceneQueueTaskStarted&#39;, &#39;bb.runqueue.runQueueTaskStarted&=
#39;, &#39;bb.runqueue.runQueueTaskFailed&#39;, &#39;bb.runqueue.sceneQueue=
TaskFailed&#39;, &#39;bb.event.BuildBase&#39;, &#39;bb.build.TaskStarted&#3=
9;, &#39;bb.build.TaskSucceeded&#39;, &#39;bb.build.TaskFailedSilent&#39;, =
&#39;bb.build.TaskProgress&#39;, &#39;bb.event.ProcessStarted&#39;, &#39;bb=
.event.ProcessProgress&#39;, &#39;bb.event.ProcessFinished&#39;]]<br>
928962 12:43:22.265324 Command Completed<br>
928962 12:43:22.265466 Running command [&#39;getVariable&#39;, &#39;BB_DEF=
AULT_TASK&#39;]<br>
928962 12:43:22.272249 Command Completed<br>
928962 12:43:22.272677 Running command [&#39;setConfig&#39;, &#39;cmd&#39;=
, &#39;build&#39;]<br>
928962 12:43:22.273073 Command Completed<br>
928962 12:43:22.273220 Running command [&#39;buildTargets&#39;, [&#39;pyth=
on-native&#39;], &#39;build&#39;]<br>
928962 12:43:22.275823 Command Completed<br>
<br>
It was reproduced on builder with 64 cores.<br>
<br>
After changing BB_NUMBER_PARSE_THREADS from default 64 to 10, I wasn&#39;t=
 able to get bitbake stuck again (in the same setup after cleaning cache, t=
mpdir, sstate again) by calling &quot;bitbake python-native&quot; 20+ times=
.<br>
<br>
But after changing BB_NUMBER_PARSE_THREADS to 100 I wasn&#39;t able to rep=
roduce it again (so maybe 3rd try with the default value was just me being =
lucky to reproduce it).<br>
<br>
Then I&#39;ve tried to change it to 1000, just to see what happens and it =
got stuck (but probably from different reasons):<br>
<br>
martin@jama:/OE/build/oe-core$ bitbake -k python-native<br>
Loading cache: 100% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | ETA:=C2=A0 --:--:--<br>
Loaded 0 entries from dependency cache.<br>
ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"h=
ttp://python-native_2.7.18.bb" rel=3D"noreferrer" target=3D"_blank">python-=
native_2.7.18.bb</a>: Error executing a python function in &lt;code&gt;:=C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 --:--:--<br>
<br>
The stack trace of python calls that resulted in this exception/failure wa=
s:<br>
File: &#39;&lt;code&gt;&#39;, lineno: 14, function: &lt;module&gt;<br>
=C2=A0 =C2=A0 =C2=A00010:__anon_35__OE_build_oe_core_openembedded_core_met=
a_classes_devshell_bbclass(d)<br>
=C2=A0 =C2=A0 =C2=A00011:__anon_151__OE_build_oe_core_openembedded_core_me=
ta_classes_sstate_bbclass(d)<br>
=C2=A0 =C2=A0 =C2=A00012:__anon_20__OE_build_oe_core_openembedded_core_met=
a_classes_blacklist_bbclass(d)<br>
=C2=A0 =C2=A0 =C2=A00013:__anon_177__OE_build_oe_core_openembedded_core_me=
ta_classes_siteinfo_bbclass(d)<br>
=C2=A0*** 0014:__anon_90__OE_build_oe_core_meta_python2_recipes_devtools_p=
ython_python_native_2_7_18_bb(d)<br>
File: &#39;/OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=
=3D"http://python-native_2.7.18.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-native_2.7.18.bb</a>&#39;, lineno: 76, function: __anon_90__OE_build_=
oe_core_meta_python2_recipes_devtools_python_python_native_2_7_18_bb<br>
=C2=A0 =C2=A0 =C2=A00072:=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest_file.seek(js=
on_start)<br>
=C2=A0 =C2=A0 =C2=A00073:=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest_str =3D mani=
fest_file.read()<br>
=C2=A0 =C2=A0 =C2=A00074:=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_manifest =3D j=
son.loads(manifest_str)<br>
=C2=A0 =C2=A0 =C2=A00075:<br>
=C2=A0*** 0076:=C2=A0 =C2=A0 rprovides =3D d.getVar(&#39;RPROVIDES&#39;).s=
plit()<br>
=C2=A0 =C2=A0 =C2=A00077:<br>
=C2=A0 =C2=A0 =C2=A00078:=C2=A0 =C2=A0 # Hardcoded since it cant be python=
-native-foo, should be python-foo-native<br>
=C2=A0 =C2=A0 =C2=A00079:=C2=A0 =C2=A0 pn =3D &#39;python&#39;<br>
=C2=A0 =C2=A0 =C2=A00080:<br>
Exception: AttributeError: &#39;NoneType&#39; object has no attribute &#39=
;split&#39;<br>
<br>
ERROR: Command execution failed: Traceback (most recent call last):<br>
=C2=A0 File &quot;/OE/bitbake/lib/bb/command.py&quot;, line 114, in runAsy=
ncCommand<br>
=C2=A0 File &quot;/OE/bitbake/lib/bb/cooker.py&quot;, line 1605, in update=
Cache<br>
=C2=A0 File &quot;/OE/bitbake/lib/bb/cooker.py&quot;, line 2087, in __init=
__<br>
=C2=A0 File &quot;/OE/bitbake/lib/bb/cooker.py&quot;, line 2113, in start<=
br>
=C2=A0 File &quot;/usr/lib/python3.8/multiprocessing/process.py&quot;, lin=
e 121, in start<br>
=C2=A0 File &quot;/usr/lib/python3.8/multiprocessing/context.py&quot;, lin=
e 224, in _Popen<br>
=C2=A0 File &quot;/usr/lib/python3.8/multiprocessing/context.py&quot;, lin=
e 277, in _Popen<br>
=C2=A0 File &quot;/usr/lib/python3.8/multiprocessing/popen_fork.py&quot;, =
line 19, in __init__<br>
=C2=A0 File &quot;/usr/lib/python3.8/multiprocessing/popen_fork.py&quot;, =
line 69, in _launch<br>
OSError: [Errno 24] Too many open files<br>
<br>
<br>
Summary: There were 2 ERROR messages shown, returning a non-zero exit code=
.<br>
martin@jama:/OE/build/oe-core$ bitbake -k python-native<br>
NOTE: Reconnecting to bitbake server...<br>
NOTE: No reply from server in 30s<br>
NOTE: Retrying server connection (#1)...<br>
<br>
On this builder I was using:<br>
BB_SERVER_TIMEOUT =3D &quot;60&quot;<br>
but that doesn&#39;t seem to be required to reproduce as the other builds =
I&#39;ve seen stuck on jenkins weren&#39;t setting BB_SERVER_TIMEOUT at all=
.<br>
<br>
Let me know if there is something else I should try next time it gets stuc=
k, but right now<br>
I&#39;m not able to reliably reproduce it again (even after switching back=
 to default BB_NUMBER_PARSE_THREADS)<br>
<br>
Cheers,<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000031cc3a05ba4724ed--
