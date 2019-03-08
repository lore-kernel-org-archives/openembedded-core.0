Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8C97B6D767
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 12:12:38 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id 10so16219833eds.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 04:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=u0vuawL+wy1ZIGJ/3Olw28Qki3Sx5R7nYuHuXSM4Qkk=;
	b=TXcv+fBBgfamwbnt84ZYbcymJvG6M8jj8dgA1UEFDAXMcFDEin3QttZ+o7b73p2yUm
	7oaoRt42zkKVQrCi97iuEGdKy0cnCXBBBf3Yg9/FS0xNZ/gI5WxdCUJyPngk8T7DYOtS
	pcmRXeABk5UttHatS4+RVdOe1HH4hX+gOMjNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=u0vuawL+wy1ZIGJ/3Olw28Qki3Sx5R7nYuHuXSM4Qkk=;
	b=drdQBHvOLXaWcYxD54oaiviDKwSxeRpgSeTmFl9sA8f41LTpy/y06VeND95z4edEJo
	qUeVAfFohF0Ek8UGQ+83Ywr7mSFJe5xLQhjyoySuJSKujnaoxlFys6q8fHTTT7sCOKxE
	MMOg6xdtvMyDC36k8N70HFj6tSz+fHa4PVOd/jhe2o/jNilhD30mZdtvzyg2xkvrLFoE
	YisQgQ9SgeXEjsGGixA6+TyRnHGHKRYCW1THnGx0UKyeY61ltdyLx9Jdla5TtOsYzxTN
	4HhCuGwC6CBD1DjmY/zF1BP7FIbUWbjLvWvhb5aya7Cl2nMbu5XkMAlH6kiTz+aCpU6R
	qOGg==
X-Gm-Message-State: APjAAAV5s+FS2T3qqD/TBPe3PB2+gu+0w0uT7Sl7sug4y2324EPdqh0N
	74lDG5cwDOLBDNzjRssvYu9r/g==
X-Google-Smtp-Source: APXvYqyMbhJMolUv28SY9/nmp4t1FjFVfIvbV98fJu1+JzNAp1/I0TW3otYtQv6dmLGnJ7zWYnlYxA==
X-Received: by 2002:a50:b35b:: with SMTP id r27mr32346070edd.144.1552047159011;
	Fri, 08 Mar 2019 04:12:39 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-606A-AF5B-88B1-B23A.dyn6.twc.com.
	[2606:a000:1401:880d:606a:af5b:88b1:b23a])
	by smtp.gmail.com with ESMTPSA id n3sm1383355ejc.32.2019.03.08.04.12.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 04:12:37 -0800 (PST)
Date: Fri, 8 Mar 2019 07:12:33 -0500
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190308121233.GB5026@bill-the-cat>
References: <1551882973-8710-1-git-send-email-trini@konsulko.com>
	<1551882973-8710-3-git-send-email-trini@konsulko.com>
	<c7b91b44ea5055df61ce39287342dbf7926d970d.camel@linuxfoundation.org>
	<20190308042042.GA5026@bill-the-cat>
	<eba93c1f-c398-8759-9660-8fecefcb8238@gmail.com>
MIME-Version: 1.0
In-Reply-To: <eba93c1f-c398-8759-9660-8fecefcb8238@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/4] inetutils: Import version 1.9.4
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
X-List-Received-Date: Fri, 08 Mar 2019 12:12:38 -0000
X-Groupsio-MsgNum: 122100
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JhMvOwMi9vhAgPY"
Content-Disposition: inline

--2JhMvOwMi9vhAgPY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2019 at 08:31:01PM -0800, Khem Raj wrote:
>=20
>=20
> On 3/7/19 8:20 PM, Tom Rini wrote:
> >On Thu, Mar 07, 2019 at 09:50:51PM +0000, Richard Purdie wrote:
> >>On Wed, 2019-03-06 at 09:36 -0500, Tom Rini wrote:
> >>>In order to have more robust stand-alone network tools in oe-core,
> >>>bring
> >>>in inetutils from meta-openembedded/meta-networking.  This imports
> >>>the
> >>>recipes as of git commit:
> >>>commit 408204073e6bdcd8ac586e05d5b75213417673f2
> >>>Author: Martin Jansa <martin.jansa@gmail.com>
> >>>Date:   Thu Aug 16 20:39:15 2018 +0000
> >>>
> >>>     inetutils: fix build with glibc-2.28
> >>>
> >>>Signed-off-by: Tom Rini <trini@konsulko.com>
> >>
> >>Somehow in all the noise from other failures we missed:
> >>
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (=
/usr/bin/rcp or /usr/bin/rcp.inetutils) does not exist, skipping...
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (=
/usr/bin/rlogin or /usr/bin/rlogin.inetutils) does not exist, skipping...
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (=
/usr/bin/rsh or /usr/bin/rsh.inetutils) does not exist, skipping...
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (=
/usr/bin/talk or /usr/bin/talk.inetutils) does not exist, skipping...
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternati=
ve provide /usr/bin/rcp: /usr/bin/rcp.inetutils does not exist
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternati=
ve provide /usr/bin/rlogin: /usr/bin/rlogin.inetutils does not exist
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternati=
ve provide /usr/bin/rsh: /usr/bin/rsh.inetutils does not exist
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternati=
ve provide /usr/sbin/rshd: /usr/sbin/in.rshd does not exist
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternati=
ve provide /usr/sbin/rlogind: /usr/sbin/in.rlogind does not exist
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternati=
ve provide /usr/bin/talk: /usr/bin/talk.inetutils does not exist
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link =3D=3D alt_=
target: /usr/bin/rcp =3D=3D /usr/bin/rcp
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link =3D=3D alt_=
target: /usr/bin/rlogin =3D=3D /usr/bin/rlogin
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link =3D=3D alt_=
target: /usr/bin/rsh =3D=3D /usr/bin/rsh
> >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link =3D=3D alt_=
target: /usr/bin/talk =3D=3D /usr/bin/talk
> >>
> >>https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/374
> >>https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/375
> >>
> >
> >Hurk.   Which self-test do I need to run to see that?
> >
>=20
> I see these errors in build logs when I use poky distro or yoe distro, I
> guess you need to enable additional QA errors +  warnings e.g. see
>=20
> https://github.com/YoeDistro/meta-yoe/blob/master/conf/distro/yoe.inc#L53=
-L58

Ah, yes.  I only build with oe-core.  I'll toss that in my site.conf for
now, thanks!

--=20
Tom

--2JhMvOwMi9vhAgPY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcglwxAAoJEIf59jXTHXZSAWoQAKxEs0//jxyBxU+cKezftq/C
dV5IurDJ9/C0PvhvPBTDnWsXgQkufOv/WlZclm4PdyInunzMCmu6tKaOvrckiD++
R0kYQv8kOO4o7ws8cqL8uYfwizON/7Q3O0eLaCAmY7Q9XrqgITqSZK4pfhZINw/F
U7AsWjyd3+t/9V7GAzh9qxEoaf351lo5sB6UvNs0SLKpL4UF9hpXFO4JkC5MYNZ3
CP0FHc/WqoiZFCHgpvkQ1rMwR33SkxR/cM1iSCxK5JnhUA0ahjQv17i8K2Jq6SZ8
jHN00ddGMakccTgWvQ2/0r/syc1ZuBZLUZH88RxMn9ru5kTDGBZT3fNi6g4y5XNS
mD+h2HOHdbxH3CN8TKYiWpnMQSAWxbc1ETX+76I6o7fmEzLPucmvrYLo5prQaeCZ
et1j1UkqkAfGSor3jGxfrujWmEoiL0oylitzAc3tWMyM0rRAaWJuxUFvyhQbr5Fa
Ou4zvc5mWQDAZYwcwk7v/VUcv4pve/pxjBIpRU0edtGPmcyoUzrg6f+PnQjwHSiV
kPVBZC2F1j/fzxX6FH0Z/L1oDqQcqgDfXNpJ+K0gStNRKlZYM4caBdEs5mdMV/pT
1QDxwzWA+J5XwjpBEd+iFeArsH9C0JTTV0SpgoXXnp9R+dDnCBftod8N36pcPeBx
25YgdunMiWAxB/uiu1Ps
=i59H
-----END PGP SIGNATURE-----

--2JhMvOwMi9vhAgPY--
