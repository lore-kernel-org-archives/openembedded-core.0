Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 99228771E3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 21:09:28 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l68so37302563wml.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 13:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=voi5WaSq7qlPqBlpW6TCFihz8WUcvBGn+PwkJBWP7KI=;
	b=hhWVjLRQerZ4/rzqwreeM++D/k7zbl9tm7/9O8xNDIIeTssCDBr40RDtoB5lAvv5RY
	xDkYRHQb1pR3PU/38MqKJpP5gncyUPxBdGD/0+3sHU9EQxPskDLYR9YYBF1WaKHla4lu
	JI1MAvLuF7BFwx1pbFh/LYc4rI3LNeRiE2UwH6OYT+pWzt25kO9ooUBHUSfiUYbC5OrR
	73UNpa6aJaAB0O6dOxj2jo5zzcijvCQgTg09brU7oqkVrclF/UTZCoOEQ4EC+XXrg+92
	kxip7PLW4VrhZclzHZo0RiQ2o0gcS1KNH4+YhBWsPjoRKJfXTdgZTosdIlLedbUAO7E+
	BcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=voi5WaSq7qlPqBlpW6TCFihz8WUcvBGn+PwkJBWP7KI=;
	b=lb6iqstcF6lKIVITcK1kXPhCDRJ0epIc4UxZJtgyfXo2CbZaHrdbFP4kjowVwL8NWG
	Lupvdgrj3aioL/MgUUu7/T1DGEpHxXG3lD5r9f2mtNqXlca7tc2IJ/a3+QwsWUun2iNA
	nK9ZaRoT9x1kH/YbQVsjs8aFy8xL/rdYA4QDOwS1ljJZQo4VuBcHZHkoOaIp4VbmZxrG
	GEMv0wtlUh0KTeMSYCD1vSw5GmsVLmdRQtEy2KSs54l1pjYtyhK0c3Mi1X9bjgxFkJ++
	PNaemRyrcmriGXqDLpzXzSc5M51b2l/aBAPRbynr0GbvxZvD2jkustggbi5s8wSDkSse
	VhzA==
X-Gm-Message-State: AD7BkJKW+bC/Ed6r9BCP/vNrxerkmzBUkgvbSTHOb+wW0LBNxAWzrVveZTs1kPv7w1QQdg==
X-Received: by 10.194.116.9 with SMTP id js9mr14138423wjb.112.1456693768687;
	Sun, 28 Feb 2016 13:09:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ka4sm22700632wjc.47.2016.02.28.13.09.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Feb 2016 13:09:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 28 Feb 2016 22:11:00 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160228211100.GA2607@jama>
References: <1456656801.11498.158.camel@linuxfoundation.org>
	<CALbNGRTTAz=UfaXLEOjzdc5K_v7R3=OL8abzQQXq=97YkcofUA@mail.gmail.com>
	<1456675182.11498.163.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1456675182.11498.163.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: Improve configuration upgrade capabilities (support meta-yocto -> poky transition)
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
X-List-Received-Date: Sun, 28 Feb 2016 21:09:29 -0000
X-Groupsio-MsgNum: 78861
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 28, 2016 at 03:59:42PM +0000, Richard Purdie wrote:
> On Sun, 2016-02-28 at 13:20 +0100, Andreas M=FCller wrote:
> > On Sun, Feb 28, 2016 at 11:53 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > Right now, only one configuration file can be processed
> > > (conf/bblayers.conf)
> > > and it can only have one version number. This is a cause of immense
> > > friction
> > > between OE-Core and Poky since if one needs a version change, it
> > > shouldn't
> > > be forced on the other.
> > >=20
> > > We'd like to rename the meta-yocto layer (within the meta-yocto
> > > repository)
> > > to meta-poky. To do this, we need to correct the bblayers.conf file
> > > and that
> > > means changing the sanity version. After the pain this caused the
> > > last time,
> > > Paul made me promise never to have them out of sync between OE-Core
> > > and Poky,
> > > equally, having every distro changing config update OE-Core isn't
> > > scalable
> > > either.
> > >=20
> > > This patch changes the sanity upgrade method to list a more generic
> > > format:
> > >=20
> > > <config file>:<current version variable name>:<required version
> > > variable name>:<upgrade function>
> > >=20
> > > This in theory allows us to support upgrades to any of the core
> > > configuration files, and allow layers to extend them as needed.
> > > Files
> > > with the same name can be handled in different layers by setting a
> > > unique
> > > version name variable in the file itself. The upgrade code is only
> > > called
> > > if the version variable is set.
> > >=20
> > > To allow us to make the poky name change and use a new
> > > configuration file
> > > name, one last version bump is included for poky to handle the
> > > transition.
> > >=20
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >=20
> > > diff --git a/meta/classes/sanity.bbclass
> > > b/meta/classes/sanity.bbclass
> > > index 49693e7..a0553ee 100644
> > > --- a/meta/classes/sanity.bbclass
> > > +++ b/meta/classes/sanity.bbclass
> >=20
> > I think this breaks parsing. Have reverted it and can build again.
>=20
> Sorry, I missed a version number change. I've pushed a fix.

Even with:
commit 933088c74870b8c3aa5077d57bc85fc66a652291
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Sun Feb 28 15:57:58 2016 +0000

    bblayers.conf.sample: Fix missing layer version bump

    The sanity.bbclass changes required the layer verison to increase,
    this adds that missing component.

I'm still seeing this exception:

NOTE: Started PRServer with DBfile: /home/jenkins/oe/world/shr-core/cache/p=
rserv.sqlite3, IP: 127.0.0.1, PORT: 42730, PID: 10040
ERROR: Error executing a python function in exec_python_func() autogenerate=
d:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:oecore_update_bblayers(d)
     0003:
File: '/home/jenkins/oe/world/shr-core/openembedded-core/meta/classes/sanit=
y.bbclass', lineno: 151, function: oecore_update_bblayers
     0147:            with open(bblayers_fn, "w") as f:
     0148:                f.write(''.join(lines))
     0149:            return
     0150:
 *** 0151:        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', "=
7")
     0152:        return
     0153:
     0154:    raise NotImplementedError(failmsg)
     0155:}
File: '/home/jenkins/oe/world/shr-core/openembedded-core/meta/classes/sanit=
y.bbclass', lineno: 24, function: sanity_conf_update
     0020:        if re.search(pattern, line)), (None, None))
     0021:
     0022:def sanity_conf_update(fn, lines, version_var_name, new_version):
     0023:    index, line =3D sanity_conf_find_line(version_var_name, lines)
 *** 0024:    lines[index] =3D '%s =3D "%d"\n' % (version_var_name, new_ver=
sion)
     0025:    with open(fn, "w") as f:
     0026:        f.write(''.join(lines))
     0027:
     0028:# Functions added to this variable MUST throw a NotImplementedErr=
or exception unless
Exception: TypeError: %d format: a number is required, not str

ERROR: Execution of event handler 'check_sanity_eventhandler' failed
Traceback (most recent call last):
  File "/home/jenkins/oe/world/shr-core/openembedded-core/meta/classes/sani=
ty.bbclass", line 954, in check_sanity(sanity_data=3D<bb.data_smart.DataSma=
rt object at 0x7fb069f71110>):
    =20
    >    check_sanity_everybuild(status, sanity_data)
        =20
  File "/home/jenkins/oe/world/shr-core/openembedded-core/meta/classes/sani=
ty.bbclass", line 768, in check_sanity_everybuild(status=3D<SanityStatus ob=
ject at 0x7fb069f71090>, d=3D<bb.data_smart.DataSmart object at 0x7fb069f71=
110>):
    =20
    >    sanity_check_conffiles(status, d)
    =20
  File "/home/jenkins/oe/world/shr-core/openembedded-core/meta/classes/sani=
ty.bbclass", line 548, in sanity_check_conffiles(status=3D<SanityStatus obj=
ect at 0x7fb069f71090>, d=3D<bb.data_smart.DataSmart object at 0x7fb069f711=
10>):
                 try:
    >                bb.build.exec_func(func, d)
                 except NotImplementedError as e:
  File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/build.py", line 227,=
 in exec_func(func=3D'oecore_update_bblayers', d=3D<bb.data_smart.DataSmart=
 object at 0x7fb069f71110>, dirs=3DNone):
             if ispython:
    >            exec_func_python(func, d, runfile, cwd=3Dadir)
             else:
  File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/build.py", line 263,=
 in exec_func_python(func=3D'oecore_update_bblayers', d=3D<bb.data_smart.Da=
taSmart object at 0x7fb069f71110>, runfile=3D'/home/jenkins/oe/world/shr-co=
re/tmp-glibc/work/i586-oe-linux/defaultpkgname/1.0-r0/temp/run.oecore_updat=
e_bblayers.10038', cwd=3D'/home/jenkins/oe/world/shr-core/tmp-glibc/work/i5=
86-oe-linux/defaultpkgname/1.0-r0/defaultpkgname-1.0'):
         except:
    >        raise FuncFailed(func, None)
         finally:
FuncFailed: Function failed: oecore_update_bblayers

ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/command.py", line 10=
1, in runAsyncCommand
    self.cooker.updateCache()
  File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/cooker.py", line 158=
6, in updateCache
    bb.event.fire(bb.event.SanityCheck(False), self.data)
  File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py", line 171,=
 in fire
    fire_class_handlers(event, d)
  File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py", line 110,=
 in fire_class_handlers
    execute_handler(name, handler, event, d)
  File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py", line 82, =
in execute_handler
    ret =3D handler(event)
  File "/home/jenkins/oe/world/shr-core/openembedded-core/meta/classes/sani=
ty.bbclass", line 991, in check_sanity_eventhandler
    reparse =3D check_sanity(sanity_data)
  File "/home/jenkins/oe/world/shr-core/openembedded-core/meta/classes/sani=
ty.bbclass", line 954, in check_sanity
    check_sanity_everybuild(status, sanity_data)
  File "/home/jenkins/oe/world/shr-core/openembedded-core/meta/classes/sani=
ty.bbclass", line 768, in check_sanity_everybuild
    sanity_check_conffiles(status, d)
  File "/home/jenkins/oe/world/shr-core/openembedded-core/meta/classes/sani=
ty.bbclass", line 548, in sanity_check_conffiles
    bb.build.exec_func(func, d)
  File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/build.py", line 227,=
 in exec_func
    exec_func_python(func, d, runfile, cwd=3Dadir)
  File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/build.py", line 263,=
 in exec_func_python
    raise FuncFailed(func, None)
FuncFailed: Function failed: oecore_update_bblayers


Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbTYmIACgkQN1Ujt2V2gBxPPwCfUk0jx2zppLmXkX1Z/B8OajGr
XHIAoLkZIZ6VqezttY1H7C5+IYwatO2c
=TCRy
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
