Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF9DC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 12:36:09 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.86465.1738586163202099660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 04:36:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=leQCqlK5;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d92e457230so39157016d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 04:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586162; x=1739190962; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V1OZNAP+ULRj45CVxQWFaOSWiuy8THd2kRFkc58Pvdw=;
        b=leQCqlK55gzxqtgJUfbXqd7b4h9eKFnPqqOKMIG8AJ+k+qLaIGdxE/QAr1UdjkkGag
         l4zRjTpmsnCJcvRAkOsW6U7+GBRs3wLsSw+2xbe3KyEs8Zxq7DWJtH7rx9fizLOWAPBc
         5/bdttDo07Ni6oV1W2t13LWfA36dN6k5ukpVWYWGEKdA4t7rXEqm8/726UFgR0k8g2al
         MBUHZ/vx/2oMe3H/qs+Dmw0Ipb2Uszw+hbgWgEZEinguajrwT9aG90DRm5/2/eBQ/+js
         JNnVdnf8/oy9wgh8ve9kSE750vdZ9Pqs4idIf6RWkLHXyOPRf9v5Wa6NhEd2satZqb7p
         E8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586162; x=1739190962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1OZNAP+ULRj45CVxQWFaOSWiuy8THd2kRFkc58Pvdw=;
        b=V+nwvEvySYZ1TKGXXOrk+N9t53jcxjt3km07tScvuPmY0SBWC42Yl/GSLRJkKB0zzr
         aybRMmEJRyVeVlybykWbh9g9Gp/0YkC/KhkFWaF2LwuEexiJsj0TeEImB/vetpIrk7fm
         d8qdLqSUafMWnbqvamIYx7N2RadBKCBFSMsTNBrlpjB+9ql7087isLjUHNZScrzxtqxD
         AnbOvzJrsajrYG9rt5c+QsrIrNfLAz4pDm9QV/k9ADUPtjhhum3//hhB9dcwf99Tb4hB
         5xySL3YaNEBH5RKNqU1+3QyJp44HiVY7TpZ8PWiwihS0v1Z3HrDQG/cHJVB2qdofaQKb
         532A==
X-Forwarded-Encrypted: i=1; AJvYcCWQIZyuepuoZmOpW/1LwHxj0IDijgMWL1H1yFTz/tgolCXntwJQyB54BsvbsbHlhVqyVg75hW3Uu1W932YUCF3b8Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxtSA0gVzdOFFsw0uWROQJ5bLfBHJSfMkNW9e+dFcSr9aE00psh
	0LvNNyD81f6S7ckE/bIoIcmQGDn5VPXjq4s27K6+/88vxQuiZQznmKe8nTq2PldplyfIRZbCV/Z
	isxMI35ilcbzxN5bfk2AM0vQWyMc=
X-Gm-Gg: ASbGncuQH22U03hRTc9LrQxG7pqvBLdJ47lCH7qjlgXnLheWDYkgxB0PHY6GfisuZoI
	8SGTibSQlB+pkyDWyeB/3g5sX/aXpsu0wKzYVIMmNdoUepnz/43VKJg5bNhw7kcJ1OYEoiAFdPX
	oJpKZll/HcMl/uNEkHWnPQMqbETbW6
X-Google-Smtp-Source: AGHT+IFy0wWWyHblHKu6a0/dw14XoanyCt8IbgrDktXZZfGtLjZNZm5GWp2fJvBo0hsWOpv3gJB9cluU5lzZyC06odc=
X-Received: by 2002:a05:6214:c88:b0:6d8:8b9d:1500 with SMTP id
 6a1803df08f44-6e243c647edmr393924256d6.36.1738586162114; Mon, 03 Feb 2025
 04:36:02 -0800 (PST)
MIME-Version: 1.0
References: <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com> <20250131064352.2613105-1-zboszor@gmail.com>
 <20250131064352.2613105-2-zboszor@gmail.com> <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com>
 <182057ACF258490B.1760@lists.openembedded.org> <e75d75e4-2b55-4199-b2ee-e9eb26abafca@gmail.com>
 <3bf14d26684e308ed7fa7c1e1448be109a2efa61.camel@linuxfoundation.org>
In-Reply-To: <3bf14d26684e308ed7fa7c1e1448be109a2efa61.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Feb 2025 13:35:51 +0100
X-Gm-Features: AWEUYZmCPi_fkHdWHbcJ8zl-cxWCIEoOP5N4bM8oy7l7nD_e9NLtH8TomdIGjos
Message-ID: <CANNYZj8uF5XOti1WF6CyCysDa0B7uToW0OofpMOKxyH2jetioQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 2/2] oeqa/selftest/cases/signing.py: Re-enable self-test
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: zboszor@gmail.com, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009ab6db062d3c22b0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 12:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210652

--0000000000009ab6db062d3c22b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also we need to set it where the signing actually happens, not only in the
test.


Alex

On Mon 3. Feb 2025 at 13.29, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2025-02-03 at 11:11 +0100, Zoltan Boszormenyi via
> lists.openembedded.org wrote:
> > 2025. 02. 02. 9:44 keltez=C3=A9ssel, Zoltan Boszormenyi via
> lists.openembedded.org =C3=ADrta:
> > > 2025. 02. 01. 15:37 keltez=C3=A9ssel, Mathieu Dubois-Briand =C3=ADrta=
:
> > > > On Fri Jan 31, 2025 at 7:43 AM CET, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=
=C3=A9nyi wrote:
> > > > > Enable building rpm with rpm-seqouia for the test.
> > > > >
> > > > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gm=
ail.com>
> > > > > ---
> > > > Sorry, I still get some errors while building:
> > > >
> > > > 2025-02-01 14:28:32,979 - oe-selftest - INFO - 9: 40/54 602/618
> (56.20s) (0 failed)
> > > > (signing.Signing.test_signing_packages)
> > > > 2025-02-01 14:28:32,979 - oe-selftest - INFO -
> > > > testtools.testresult.real._StringException: Traceback (most recent
> call last):
> > > >    File
> > > >
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selft=
est/cases/signing.py",
>
> > > > line 113, in test_signing_packages
> > > >      runCmd('%s/rpmkeys --define "_dbpath %s" --import %s' %
> > > >    File
> > > >
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils=
/commands.py",
>
> > > > line 214, in runCmd
> > > >      raise AssertionError("Command '%s' returned non-zero exit
> status %d:\n%s" %
> > > > (command, result.status, exc_output))
> > > > AssertionError: Command
> > > >
> '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/tm=
p/work/core2-64-poky-linux/ed/1.20.2/recipe-sysroot-native/usr/bin/rpmkeys
>
> > > > --define "_dbpath /tmp/oeqa-rpmdbsj05eco3" --import
> > > >
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/met=
a-selftest/files/signing/key.pub'
>
> > > > returned non-zero exit status 1:
> > > > error: Certificate 7B31316B5D64AD52:
> > > >    Policy rejects 7B31316B5D64AD52: No binding signature at time
> 2025-02-01T14:28:26Z
> > > > error:
> > > >
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/met=
a-selftest/files/signing/key.pub:
>
> > > > key 1 import failed.
> > > >
> > > >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/893/st=
eps/14/logs/stdio
> > > >
> > > > Do you mind having a look at this ?
> > >
> > > I have run the self test on a Fedora 41 host and it succeeded there.
> > >
> > > Probably you need to fix the crypto policy to allow such a cert with =
a
> > > "no binding signature" or replace the cert.
> > >
> > > This github issue may have some useful pointers:
> > > https://github.com/rpm-software-management/rpm-sequoia/issues/46
> >
> > Can you please try this below?
> >
> > Setting the envvar SEQUOIA_CRYPTO_POLICY to an empty string
> > will use the built-in default policy. See
> >
> https://github.com/rpm-software-management/rpm-sequoia/blob/main/src/lib.=
rs#L54
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/meta/lib/oeqa/selftest/cases/signing.py
> b/meta/lib/oeqa/selftest/cases/signing.py
> > index 51d1c3fa64..9a820ebc72 100644
> > --- a/meta/lib/oeqa/selftest/cases/signing.py
> > +++ b/meta/lib/oeqa/selftest/cases/signing.py
> > @@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
> >           """
> >           import oe.packagedata
> >
> > -        self.skipTest('This test requires rpm-sequoia support in rpm')
> >           self.setup_gpg()
> >
> >           package_classes =3D get_bb_var('PACKAGE_CLASSES')
> > @@ -84,9 +83,14 @@ class Signing(OESelftestTestCase):
> >           feature +=3D 'RPM_GPG_PASSPHRASE =3D "test123"\n'
> >           feature +=3D 'RPM_GPG_NAME =3D "testuser"\n'
> >           feature +=3D 'GPG_PATH =3D "%s"\n' % self.gpg_dir
> > +        feature +=3D 'PACKAGECONFIG:append:pn-rpm-native =3D " sequoia=
"\n'
> > +        feature +=3D 'PACKAGECONFIG:append:pn-rpm =3D " sequoia"\n'
> >
> >           self.write_config(feature)
> >
> > +        # Test rpm-sequoia's default built-in policy
> > +        os.environ['SEQUOIA_CRYPTO_POLICY'] =3D ''
> > +
> >           bitbake('-c clean %s' % test_recipe)
> >           bitbake('-f -c package_write_rpm %s' % test_recipe)
> >
> > @@ -152,6 +156,9 @@ class Signing(OESelftestTestCase):
> >
> >           self.write_config(feature)
> >
> > +        # Test rpm-sequoia's default built-in policy
> > +        os.environ['SEQUOIA_CRYPTO_POLICY'] =3D ''
> > +
> >           with self.create_new_builddir(os.environ['BUILDDIR'],
> builddir):
> >
> >               os.environ["PATH"] =3D nsysroot + ":" + os.environ["PATH"=
]
> > @@ -198,6 +205,9 @@ class LockedSignatures(OESelftestTestCase):
> >           feature +=3D 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK =3D "warn"\n'
> >           self.write_config(feature)
> >
> > +        # Test rpm-sequoia's default built-in policy
> > +        os.environ['SEQUOIA_CRYPTO_POLICY'] =3D ''
> > +
> >           # Build a locked recipe
> >           bitbake(test_recipe)
>
> Given the way bitbake clears the environment except for allowed
> variables, will that setting make it to where it needs to?
>
> I've not looked at the specific test so it is possible it can work but
> it looks a bit unusual to me.
>
> Cheers,
>
> Richard
>

--0000000000009ab6db062d3c22b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Also we need to set it where the signing actually happens=
, not only in the test.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 3. Feb 20=
25 at 13.29, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)">On Mon, 2025-02-03 at 11:11 +0100, Zoltan Boszormenyi via <a hr=
ef=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">l=
ists.openembedded.org</a> wrote:<br>
&gt; 2025. 02. 02. 9:44 keltez=C3=A9ssel, Zoltan Boszormenyi via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> =C3=ADrta:<br>
&gt; &gt; 2025. 02. 01. 15:37 keltez=C3=A9ssel, Mathieu Dubois-Briand =C3=
=ADrta:<br>
&gt; &gt; &gt; On Fri Jan 31, 2025 at 7:43 AM CET, Zolt=C3=A1n B=C3=B6sz=C3=
=B6rm=C3=A9nyi wrote:<br>
&gt; &gt; &gt; &gt; Enable building rpm with rpm-seqouia for the test.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &=
lt;<a href=3D"mailto:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com=
</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; Sorry, I still get some errors while building:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; 2025-02-01 14:28:32,979 - oe-selftest - INFO - 9: 40/54 602/=
618 (56.20s) (0 failed) <br>
&gt; &gt; &gt; (signing.Signing.test_signing_packages)<br>
&gt; &gt; &gt; 2025-02-01 14:28:32,979 - oe-selftest - INFO - <br>
&gt; &gt; &gt; testtools.testresult.real._StringException: Traceback (most =
recent call last):<br>
&gt; &gt; &gt; =C2=A0=C2=A0 File <br>
&gt; &gt; &gt; &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/m=
eta/lib/oeqa/selftest/cases/signing.py&quot;, <br>
&gt; &gt; &gt; line 113, in test_signing_packages<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 runCmd(&#39;%s/rpmkeys --define &qu=
ot;_dbpath %s&quot; --import %s&#39; %<br>
&gt; &gt; &gt; =C2=A0=C2=A0 File <br>
&gt; &gt; &gt; &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/m=
eta/lib/oeqa/utils/commands.py&quot;, <br>
&gt; &gt; &gt; line 214, in runCmd<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 raise AssertionError(&quot;Command =
&#39;%s&#39; returned non-zero exit status %d:\n%s&quot; % <br>
&gt; &gt; &gt; (command, result.status, exc_output))<br>
&gt; &gt; &gt; AssertionError: Command <br>
&gt; &gt; &gt; &#39;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/bu=
ild-st-3250811/tmp/work/core2-64-poky-linux/ed/1.20.2/recipe-sysroot-native=
/usr/bin/rpmkeys <br>
&gt; &gt; &gt; --define &quot;_dbpath /tmp/oeqa-rpmdbsj05eco3&quot; --impor=
t <br>
&gt; &gt; &gt; /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-s=
t-3250811/meta-selftest/files/signing/key.pub&#39; <br>
&gt; &gt; &gt; returned non-zero exit status 1:<br>
&gt; &gt; &gt; error: Certificate 7B31316B5D64AD52:<br>
&gt; &gt; &gt; =C2=A0=C2=A0 Policy rejects 7B31316B5D64AD52: No binding sig=
nature at time 2025-02-01T14:28:26Z<br>
&gt; &gt; &gt; error: <br>
&gt; &gt; &gt; /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-s=
t-3250811/meta-selftest/files/signing/key.pub: <br>
&gt; &gt; &gt; key 1 import failed.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/b=
uilders/35/builds/893/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_bl=
ank">https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/893=
/steps/14/logs/stdio</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Do you mind having a look at this ?<br>
&gt; &gt; <br>
&gt; &gt; I have run the self test on a Fedora 41 host and it succeeded the=
re.<br>
&gt; &gt; <br>
&gt; &gt; Probably you need to fix the crypto policy to allow such a cert w=
ith a<br>
&gt; &gt; &quot;no binding signature&quot; or replace the cert.<br>
&gt; &gt; <br>
&gt; &gt; This github issue may have some useful pointers:<br>
&gt; &gt; <a href=3D"https://github.com/rpm-software-management/rpm-sequoia=
/issues/46" rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-sof=
tware-management/rpm-sequoia/issues/46</a><br>
&gt; <br>
&gt; Can you please try this below?<br>
&gt; <br>
&gt; Setting the envvar SEQUOIA_CRYPTO_POLICY to an empty string<br>
&gt; will use the built-in default policy. See<br>
&gt; <a href=3D"https://github.com/rpm-software-management/rpm-sequoia/blob=
/main/src/lib.rs#L54" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/rpm-software-management/rpm-sequoia/blob/main/src/lib.rs#L54</a><br>
&gt; <br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/s=
elftest/cases/signing.py<br>
&gt; index 51d1c3fa64..9a820ebc72 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/signing.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/signing.py<br>
&gt; @@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;&quot;&qu=
ot;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 import oe.packa=
gedata<br>
&gt; <br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.skipTest(&#39;This te=
st requires rpm-sequoia support in rpm&#39;)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.setup_gpg(=
)<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 package_classes=
 =3D get_bb_var(&#39;PACKAGE_CLASSES&#39;)<br>
&gt; @@ -84,9 +83,14 @@ class Signing(OESelftestTestCase):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature +=3D &#=
39;RPM_GPG_PASSPHRASE =3D &quot;test123&quot;\n&#39;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature +=3D &#=
39;RPM_GPG_NAME =3D &quot;testuser&quot;\n&#39;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature +=3D &#=
39;GPG_PATH =3D &quot;%s&quot;\n&#39; % self.gpg_dir<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature +=3D &#39;PACKAGEC=
ONFIG:append:pn-rpm-native =3D &quot; sequoia&quot;\n&#39;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature +=3D &#39;PACKAGEC=
ONFIG:append:pn-rpm =3D &quot; sequoia&quot;\n&#39;<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_conf=
ig(feature)<br>
&gt; <br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Test rpm-sequoia&#39;s d=
efault built-in policy<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.environ[&#39;SEQUOIA_CR=
YPTO_POLICY&#39;] =3D &#39;&#39;<br>
&gt; +<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake(&#39;-c=
 clean %s&#39; % test_recipe)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake(&#39;-f=
 -c package_write_rpm %s&#39; % test_recipe)<br>
&gt; <br>
&gt; @@ -152,6 +156,9 @@ class Signing(OESelftestTestCase):<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_conf=
ig(feature)<br>
&gt; <br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Test rpm-sequoia&#39;s d=
efault built-in policy<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.environ[&#39;SEQUOIA_CR=
YPTO_POLICY&#39;] =3D &#39;&#39;<br>
&gt; +<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with self.creat=
e_new_builddir(os.environ[&#39;BUILDDIR&#39;], builddir):<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 os.environ[&quot;PATH&quot;] =3D nsysroot + &quot;:&quot; + os.en=
viron[&quot;PATH&quot;]<br>
&gt; @@ -198,6 +205,9 @@ class LockedSignatures(OESelftestTestCase):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature +=3D &#=
39;SIGGEN_LOCKEDSIGS_TASKSIG_CHECK =3D &quot;warn&quot;\n&#39;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_conf=
ig(feature)<br>
&gt; <br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Test rpm-sequoia&#39;s d=
efault built-in policy<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.environ[&#39;SEQUOIA_CR=
YPTO_POLICY&#39;] =3D &#39;&#39;<br>
&gt; +<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Build a locke=
d recipe<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake(test_re=
cipe)<br>
<br>
Given the way bitbake clears the environment except for allowed<br>
variables, will that setting make it to where it needs to?<br>
<br>
I&#39;ve not looked at the specific test so it is possible it can work but<=
br>
it looks a bit unusual to me.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000009ab6db062d3c22b0--

