Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 109E26FF78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:41:45 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yl2so4055388pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=DLihP1i7vvF1q2UisFOSDDaO9NYDGE1cztR8BvVsdbk=;
	b=nh41fEnQto8JHIosZKH3B6nvmaBEV/mrqo9iZsAFfTraSJYTlKSQaLPO+tgWRuDSMX
	/QKbxSYCunO8HFIl2vGKJP++5mR6tgEmjhe4H5kcgny0EVVOwzbO0t49p+D9kdJF6xri
	8bXJxFu2ORU2NhIk1JugBMMRg+Eikoz0640xXfdQF5p12gUVd8TJ9dz6hYZPBCsXHPMs
	dSd5HP3ZpGpzB5dr3VD8elwiG6NowZX64FMTTLhKmt6fyRF9vZZQapAB9v/ssqEw/NFc
	6CjXLukYrOtberYi8NI5YYv9Z+ekIjHkHiCslVQucX3wuDEc5sXvZY+hQ64KaQUAqmwM
	jeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=DLihP1i7vvF1q2UisFOSDDaO9NYDGE1cztR8BvVsdbk=;
	b=jnAoFHrGDFjX30FHJH15IN8ZrA83jySDLu0mEsO9ngU9ybZEfYJGBdjiwcB3XAZjIP
	e5JyDvWVAS3sV6xNQ7pR5rEHXTOvte8dqvRb64SSAac9ifjNq/nHxl4qNZPWymqkpFFF
	2dMLg3ulC8kNbdFjLkDFdaBvZhPURlVmr5Wb5nr3ehhDDMDB4qbDOSVMqPyOzWF2NI7u
	JpLwojw4LzkzLtLl8dhrBrl8nrXVXWy98YkODrXAqcgIrcYDNQLLlNzqOCwdi0jUXnIf
	JkSnEtSvX1pi+fCKjuG30UXv89sMFfZXnlpElBwJykpGSHBrFUhLLWDLypFZyNS9OFeL
	UAUQ==
X-Gm-Message-State: AOPr4FXalkF8KB7p0Zly3T3hXMoQoYDB813clREliLZieQI6w1Mm3v3LeN9tQ70oiC0XTQ==
X-Received: by 10.66.76.74 with SMTP id i10mr6829107paw.31.1462988506245;
	Wed, 11 May 2016 10:41:46 -0700 (PDT)
Received: from [192.168.0.76] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e184sm13695207pfe.14.2016.05.11.10.41.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2016 10:41:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <a8409df2464eab600c31aad9ab849703304d8a23.1462987863.git.raj.khem@gmail.com>
Date: Wed, 11 May 2016 10:42:02 -0700
Message-Id: <07B3E086-2999-4D73-A834-6ED08AFA9992@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
	<cover.1462987863.git.raj.khem@gmail.com>
	<a8409df2464eab600c31aad9ab849703304d8a23.1462987863.git.raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH 26/42] strace: Remove pipe.expected
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
X-List-Received-Date: Wed, 11 May 2016 17:41:47 -0000
X-Groupsio-MsgNum: 81929
Content-Type: multipart/signed;
	boundary="Apple-Mail=_63034EDE-AA9A-441E-8E07-AC23B976DADF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_63034EDE-AA9A-441E-8E07-AC23B976DADF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 11, 2016, at 10:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> file utility on some OSes e.g. archlinux'like
> which use file 5.26 can not recognise a file
> in strace testsuite e.g.
>=20


> file ./strace-4.11/tests/pipe.expected
> ./strace-4.11/tests/pipe.expected: ERROR: EOF computing DER offset
>=20


this is due to a bug in archlinux file utility, please drop it. I have =
also removed it from pull branch


> This ends up in QA errors
> ERROR: strace-4.11-r0 do_populate_sysroot: split_and_strip_files: =
'file =
/a/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/strace/4.11=
-r0/sysroot-destdir/usr/lib/strace/ptest/tests/pipe.expected' failed
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-devtools/strace/strace_4.11.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/strace/strace_4.11.bb =
b/meta/recipes-devtools/strace/strace_4.11.bb
> index 7391388..a787df2 100644
> --- a/meta/recipes-devtools/strace/strace_4.11.bb
> +++ b/meta/recipes-devtools/strace/strace_4.11.bb
> @@ -46,6 +46,7 @@ do_compile_ptest() {
> do_install_ptest() {
> 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=3D${B} =
DESTDIR=3D${D}${PTEST_PATH} TESTDIR=3D${TESTDIR}
> 	sed -i -e '/^src/s/strace.*[1-9]/ptest/' =
${D}/${PTEST_PATH}/${TESTDIR}/Makefile
> +	rm -rf ${D}${libdir}/strace/ptest/tests/pipe.expected
> }
>=20
> BBCLASSEXTEND =3D "native"
> --
> 2.8.2
>=20


--Apple-Mail=_63034EDE-AA9A-441E-8E07-AC23B976DADF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlczbu4ACgkQuwUzVZGdMxQkfwCfTY+lA/dqDAdL5jUQo29TsboO
4TsAn3q5ujphsgoOUGDM8FEcivkjpmBH
=w7sX
-----END PGP SIGNATURE-----

--Apple-Mail=_63034EDE-AA9A-441E-8E07-AC23B976DADF--
