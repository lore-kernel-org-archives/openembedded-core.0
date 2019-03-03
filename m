Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7C27C86F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 14:15:47 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id q24so2106788otk.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 06:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MoG0u8NiYw1redsH5Go/GWWxtdLJBY8/kvus4FYOPxU=;
	b=kY3/A4HGHJPkkeTcRwgHNfZLcDsR7YgVonhGT0RzYPlsPd5iuegMLMsEzeSLxn2E5W
	IfYLKvG2Ss+RAKcwtoiRv3Lm0iECzpbFV6DMdtff1Xrk++NbDXXFgiU+V0k/d+IMwWJp
	XnWKiGInkZL22NKreOOuhVECCbiUG2m0zFo01Fmzb3Mp50fsZuK69pFGrjBKDinGpmUo
	3JA9UdkEvrl3GsnNXgM6D+19t4BZ64yBnTFLSOgE9dhD45sBxEgf0WQYwoc59V7iwm2t
	r+wdIt16e90aFisFNznj/oPLqxFA390rsvRXScyKfR5phdcvMB7aezvH9IKioSezNVtz
	4TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MoG0u8NiYw1redsH5Go/GWWxtdLJBY8/kvus4FYOPxU=;
	b=P6kyPq46r7vUc8rQyWJkcxwQIlJYJ50ac/bDsLgrkQ8frU1bfCZqn3Mbq34vsTrVM5
	j5DFtQjMS1bwsamK/5dRW8cGxTu6TDtimxwhkA9vAUUwyv2eJ4GYSqOOGRNqCIpLWh5a
	aK52ti51lnsc/wbRxGZBxAex4djAK06nJ3HkGcLFSpMZi9RR3YbkqUiuGH0LtcVzHGFF
	vsHd1go5UrpV1AfgXAn5LP4/cvYvSISBE8lVhlQCodndsSqvG8Kpy6DCN7h3Y2seNcJ4
	HCCVyBBS1+4zDpp1Fp9R9yDS6m7tszs/Hex7Z/BsGyAPMtjyFrka3L2c8oG4RPIdmDK9
	1mLw==
X-Gm-Message-State: APjAAAWmtHtlkiqM4Eq4YicvqKYuwSVIzjMqkjxld6JTmHl8I2iNU9KD
	NNen5NiZvVkicyjnEk9ZJwQoteYVGh05z5bdZhM=
X-Google-Smtp-Source: APXvYqz1+69GkuG+qXvvrLIKcMzJm1S49//MbYIqhh5eMdILR7fXo6ltgGBCilPrywyFnZf43R1ahjR1jLQHJoS+iqc=
X-Received: by 2002:a9d:630f:: with SMTP id q15mr9365098otk.153.1551622548201; 
	Sun, 03 Mar 2019 06:15:48 -0800 (PST)
MIME-Version: 1.0
References: <1551619978-3899-1-git-send-email-Aditya.Tayade@kpit.com>
	<C1BF35BF-4076-4FAF-8CDB-72512F93E8AC@gmail.com>
	<BMXPR01MB0854C651AA2C55AD8A6C221B91700@BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB0854C651AA2C55AD8A6C221B91700@BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 3 Mar 2019 15:15:36 +0100
Message-ID: <CANNYZj_B5SaHsHG5v+E7NtK2mYG==m9petArxbGYn-CdJ9C9tw@mail.gmail.com>
To: Aditya Tayade <Aditya.Tayade@kpit.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [meta][sumo][PATCH] lighttpd: added ptest
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
X-List-Received-Date: Sun, 03 Mar 2019 14:15:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think you need to actually re-send the patch there, not add the list
in a reply.

Alex

On Sun, 3 Mar 2019 at 15:12, Aditya Tayade <Aditya.Tayade@kpit.com> wrote:
>
> Added correct mailing list.
>
>
> Thaks Alexander!!
>
>
> Regards,
> Aditya Tayade
>
>
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Sunday, March 3, 2019 7:26:37 PM
> To: Aditya Tayade
> Cc: poky@yoctoproject.org
> Subject: Re: [poky] [meta][sumo][PATCH] lighttpd: added ptest
>
> Thanks, this should be sent to openembedded-core mailing list.
>
> Alex
>
> > On 3 Mar 2019, at 14.33, Aditya Tayade <Aditya.Tayade@kpit.com> wrote:
> >
> > Reused lighttpd internal tests and did minimal patching to fix paths.
> >
> > Upstream-Status: Pending
> >
> > Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
> > ---
> > ...-use-standard-sbin-and-lib-path-for-ptest.patch | 37 ++++++++++++
> > meta/recipes-extended/lighttpd/lighttpd/run-ptest  |  4 ++
> > meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb  | 66 +++++++++++++++=
++++++-
> > 3 files changed, 106 insertions(+), 1 deletion(-)
> > create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0002-use-sta=
ndard-sbin-and-lib-path-for-ptest.patch
> > create mode 100644 meta/recipes-extended/lighttpd/lighttpd/run-ptest
> >
> > diff --git a/meta/recipes-extended/lighttpd/lighttpd/0002-use-standard-=
sbin-and-lib-path-for-ptest.patch b/meta/recipes-extended/lighttpd/lighttpd=
/0002-use-standard-sbin-and-lib-path-for-ptest.patch
> > new file mode 100644
> > index 0000000..cd4b2b3
> > --- /dev/null
> > +++ b/meta/recipes-extended/lighttpd/lighttpd/0002-use-standard-sbin-an=
d-lib-path-for-ptest.patch
> > @@ -0,0 +1,37 @@
> > +lighttpd-ptest: use standard installation path
> > +
> > +ptest should do testing against installed library or executable
> > +at standard installation path, hence using standard installation
> > +path for MODULES_PATH and LIGHTTPD_PATH variables.
> > +
> > +Upsteam-Status: Pending
> > +
> > +Signed-off-by: Aditya Tayade <aditya.tayade@kpit.com>
> > +
> > +diff --git a/tests/LightyTest.pm b/tests/LightyTest.pm
> > +index 74caea1..2de02d0 100644
> > +--- a/tests/LightyTest.pm
> > ++++ b/tests/LightyTest.pm
> > +@@ -65,19 +65,10 @@ sub new {
> > + $lpath =3D (defined $ENV{'srcdir'} ? $ENV{'srcdir'} : '.');
> > + $self->{SRCDIR} =3D abs_path($lpath);
> > +
> > ++$self->{SBINDIR} =3D '/usr/sbin';
> > ++$self->{MODULES_PATH} =3D '/usr/lib';
> > +
> > +-if (mtime($self->{BASEDIR}.'/src/lighttpd') > mtime($self->{BASEDIR}.=
'/build/lighttpd')) {
> > +-$self->{BINDIR} =3D $self->{BASEDIR}.'/src';
> > +-if (mtime($self->{BASEDIR}.'/src/.libs')) {
> > +-$self->{MODULES_PATH} =3D $self->{BASEDIR}.'/src/.libs';
> > +-} else {
> > +-$self->{MODULES_PATH} =3D $self->{BASEDIR}.'/src';
> > +-}
> > +-} else {
> > +-$self->{BINDIR} =3D $self->{BASEDIR}.'/build';
> > +-$self->{MODULES_PATH} =3D $self->{BASEDIR}.'/build';
> > +-}
> > +-$self->{LIGHTTPD_PATH} =3D $self->{BINDIR}.'/lighttpd';
> > ++$self->{LIGHTTPD_PATH} =3D $self->{SBINDIR}.'/lighttpd';
> > + $self->{PORT} =3D 2048;
> > +
> > + my ($name, $aliases, $addrtype, $net) =3D gethostbyaddr(inet_aton("12=
7.0.0.1"), AF_INET);
> > diff --git a/meta/recipes-extended/lighttpd/lighttpd/run-ptest b/meta/r=
ecipes-extended/lighttpd/lighttpd/run-ptest
> > new file mode 100644
> > index 0000000..b6781c0
> > --- /dev/null
> > +++ b/meta/recipes-extended/lighttpd/lighttpd/run-ptest
> > @@ -0,0 +1,4 @@
> > +#!/bin/bash
> > +
> > +make -C tests -k check-TESTS
> > +make -C src -k runtest-TESTS
> > diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb b/meta/r=
ecipes-extended/lighttpd/lighttpd_1.4.48.bb
> > index 3c4444c..6a9677e 100644
> > --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb
> > +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb
> > @@ -9,6 +9,42 @@ SECTION =3D "net"
> > RDEPENDS_${PN} =3D "lighttpd-module-dirlisting \
> >                   lighttpd-module-indexfile \
> >                   lighttpd-module-staticfile"
> > +
> > +RDEPENDS_${PN}-ptest +=3D "bash \
> > +                         ${PN} \
> > +                         ${PN}-module-compress \
> > +                         ${PN}-module-simple-vhost \
> > +                         ${PN}-module-rewrite \
> > +                         ${PN}-module-cgi \
> > +                         ${PN}-module-evhost \
> > +                         ${PN}-module-redirect \
> > +                         ${PN}-module-fastcgi \
> > +                         ${PN}-module-setenv \
> > +                         ${PN}-module-extforward \
> > +                         ${PN}-module-secdownload \
> > +                         ${PN}-module-auth \
> > +                         ${PN}-module-authn-file \
> > +                         ${PN}-module-status \
> > +                         ${PN}-module-expire \
> > +                         ${PN}-module-userdir \
> > +                         ${PN}-module-ssi \
> > +                         ${PN}-module-proxy \
> > +                         perl-module-tap-base \
> > +                         perl-module-tap-parser-sourcehandler-executab=
le \
> > +                         perl-module-tap-formatter-file \
> > +                         perl-module-tap-formatter-file-session \
> > +                         perl-module-tap-formatter-base \
> > +                         perl-module-tap-formatter-session \
> > +                         perl-module-tap-formatter-console-session \
> > +                         perl-module-tap-parser-scheduler \
> > +                         perl-module-tap-parser \
> > +                         perl-module-io-socket \
> > +                         perl-module-test-more \
> > +                         perl-module-test-harness \
> > +                         perl-module-tap-object \
> > +                         perl-module-tap-formatter-console \
> > +                        "
> > +
> > RRECOMMENDS_${PN} =3D "lighttpd-module-access \
> >                      lighttpd-module-accesslog"
> >
> > @@ -18,6 +54,8 @@ SRC_URI =3D "https://apac01.safelinks.protection.outl=
ook.com/?url=3Dhttp%3A%2F%2Fdownload.lighttpd.net%2Flighttpd%2Freleases-1.4=
.x%2Flighttpd-%24&amp;data=3D02%7C01%7CAditya.Tayade%40kpit.com%7Cf6cf4561b=
35e4c2d55f308d69fe010a0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C636872=
182049287622&amp;sdata=3D8mRYNuBZzRQSz43kxNXcszwRQN1MB5qDw5BQFxsbT7Q%3D&amp=
;reserved=3D0{PV}.t
> >         file://lighttpd \
> >         file://lighttpd.service \
> >         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-confi=
g.patch \
> > +        file://run-ptest \
> > +        file://0002-use-standard-sbin-and-lib-path-for-ptest.patch \
> >         "
> >
> > SRC_URI[md5sum] =3D "1e3a9eb5078f481e3a8a1d0aaac8c3c8"
> > @@ -49,7 +87,7 @@ PACKAGECONFIG[lua] =3D "--with-lua,--without-lua,lua5=
.1"
> >
> > EXTRA_OECONF +=3D "--enable-lfs"
> >
> > -inherit autotools pkgconfig update-rc.d gettext systemd
> > +inherit autotools pkgconfig update-rc.d gettext systemd ptest
> >
> > INITSCRIPT_NAME =3D "lighttpd"
> > INITSCRIPT_PARAMS =3D "defaults 70"
> > @@ -73,6 +111,32 @@ do_install_append() {
> > ln -sf ${localstatedir}/tmp ${D}/www/var
> > }
> >
> > +do_install_ptest() {
> > +    t=3D"${D}${PTEST_PATH}"
> > +    for i in tests src
> > +    do
> > +        cp -r "${S}/${i}" "${t}"
> > +        cp -r "${B}/${i}"/* "${t}/${i}"
> > +        rm -rf "${t}/${i}"/*.lo "${t}/${i}"/*.la "${t}/${i}"/*.c "${t}=
/${i}"/*.o "${t}/${i}"/*.h
> > +    done
> > +
> > +    install -D "${B}/${TARGET_PREFIX}libtool" "${t}/${TARGET_PREFIX}li=
btool"
> > +
> > +    # Remove build host references...
> > +    find "${t}" -name "Makefile" | xargs \
> > +    sed -i -e "s/^srcdir =3D \(.*\)/srcdir =3D ./" \
> > +           -e "s/^Makefile/_Makefile/" \
> > +           -e "s,--sysroot=3D${STAGING_DIR_TARGET},,g" \
> > +           -e "s/^abs_builddir =3D \(.*\)/abs_builddir =3D ./" \
> > +           -e "s/^abs_srcdir =3D \(.*\)/abs_srcdir =3D ./" \
> > +           -e "s/^top_srcdir =3D \(.*\)/abs_srcdir =3D ../" \
> > +           -e "s,${TARGET_PREFIX}gcc,gcc,g" \
> > +           -e "s/^abs_top_srcdir =3D \(.*\)/abs_top_srcdir =3D ./" \
> > +           -e "s,${S},,g" \
> > +           -e "s,${B},,g" \
> > +           -e "s,${STAGING_DIR_NATIVE},,g"
> > +}
> > +
> > FILES_${PN} +=3D "${sysconfdir} /www"
> >
> > CONFFILES_${PN} =3D "${sysconfdir}/lighttpd.conf"
> > --
> > 2.7.4
> >
> > This message contains information that may be privileged or confidentia=
l and is the property of the KPIT Technologies Ltd. It is intended only for=
 the person to whom it is addressed. If you are not the intended recipient,=
 you are not authorized to read, print, retain copy, disseminate, distribut=
e, or use this message or any part thereof. If you receive this message in =
error, please notify the sender immediately and delete all copies of this m=
essage. KPIT Technologies Ltd. does not accept any liability for virus infe=
cted mails.
> > --
> > _______________________________________________
> > poky mailing list
> > poky@yoctoproject.org
> > https://apac01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli=
sts.yoctoproject.org%2Flistinfo%2Fpoky&amp;data=3D02%7C01%7CAditya.Tayade%4=
0kpit.com%7Cf6cf4561b35e4c2d55f308d69fe010a0%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C636872182049287622&amp;sdata=3D59N8%2FG1iGOB%2FCS5mSS04Lsw%2=
Bp2QTGG0NS3jDOzJwZ2o%3D&amp;reserved=3D0
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.

