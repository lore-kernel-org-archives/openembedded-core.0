Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id E2B3F7C377
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 21:47:04 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id d12so33852edp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 13:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7ozpfiFsIr6WAKOZMWxS9908/ng7OYhLC12s8ZGWDR0=;
	b=e7zX11whNJvf3167KT5nty7lg+RiWA5cvOVKimnz7la+mE22pqKFagWgbXi/MCVLv0
	k/3WbkAUJep7OM3t6INtUS0vzecLbuW1PzdtcaRsEjCCSwJcvJBskH0SpSvvBQ/ALfBP
	owKsQN7ouDiQWxSjIgL0dtTzUaLYP/icsD2PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7ozpfiFsIr6WAKOZMWxS9908/ng7OYhLC12s8ZGWDR0=;
	b=Icsq7bWNzxxCWR2d9pno5VXecDFjifjyt22bOkUPoWhef1kf+GSG4BX/7Zb++lHbsO
	Oj6vycdEKtczrAnaU33f62re/vpKdJsZvaFC7tQ4OBMjBtyUmOdR3HUmGpKqroRYB24o
	255fqftNPRjftpPsI3RZnQKcMVyY8EYLbmtHqBDZW5aihs2V1y4ozSebO8/sqFKMLhdH
	Tewld+qWClgHLeD8TDFsbXpgbj9PQRCEmFJrtdv6DyVjsY66eDMDPUT8LPxkABjBcIm4
	6SrZyy+0U3ueTxVXbzpwuuRJ7OU7LjIWWFywVjNX/SrUiUstbwI4jyOOErkz/7zRkyjx
	FA9w==
X-Gm-Message-State: APjAAAUYRMh26ieGGzjzKHnNm6JrELUHouzBQ2YfJXTP1wByqrhY2zoS
	zJPnF6qX4C6c6YpY1gSPVCUTlg==
X-Google-Smtp-Source: APXvYqynX1HrB/ZDrlyZpfuNd2WF6Vr6JTqc7BGxmWDcH2TLQQg7lxs4saG7gONkTp0EJqhZ9tsCSA==
X-Received: by 2002:a17:906:5849:: with SMTP id
	h9mr13115897ejs.118.1552081625252; 
	Fri, 08 Mar 2019 13:47:05 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-7CB9-B9A6-302C-FF10.dyn6.twc.com.
	[2606:a000:1401:880d:7cb9:b9a6:302c:ff10])
	by smtp.gmail.com with ESMTPSA id 57sm2518241eds.14.2019.03.08.13.47.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 13:47:03 -0800 (PST)
Date: Fri, 8 Mar 2019 16:46:59 -0500
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190308214659.GL5026@bill-the-cat>
References: <1551882973-8710-1-git-send-email-trini@konsulko.com>
	<1551882973-8710-3-git-send-email-trini@konsulko.com>
	<c7b91b44ea5055df61ce39287342dbf7926d970d.camel@linuxfoundation.org>
	<20190308042042.GA5026@bill-the-cat>
	<eba93c1f-c398-8759-9660-8fecefcb8238@gmail.com>
	<20190308121233.GB5026@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20190308121233.GB5026@bill-the-cat>
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
X-List-Received-Date: Fri, 08 Mar 2019 21:47:05 -0000
X-Groupsio-MsgNum: 122121
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="heQF7/FOvX7GgW47"
Content-Disposition: inline

--heQF7/FOvX7GgW47
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2019 at 07:12:33AM -0500, Tom Rini wrote:
> On Thu, Mar 07, 2019 at 08:31:01PM -0800, Khem Raj wrote:
> >=20
> >=20
> > On 3/7/19 8:20 PM, Tom Rini wrote:
> > >On Thu, Mar 07, 2019 at 09:50:51PM +0000, Richard Purdie wrote:
> > >>On Wed, 2019-03-06 at 09:36 -0500, Tom Rini wrote:
> > >>>In order to have more robust stand-alone network tools in oe-core,
> > >>>bring
> > >>>in inetutils from meta-openembedded/meta-networking.  This imports
> > >>>the
> > >>>recipes as of git commit:
> > >>>commit 408204073e6bdcd8ac586e05d5b75213417673f2
> > >>>Author: Martin Jansa <martin.jansa@gmail.com>
> > >>>Date:   Thu Aug 16 20:39:15 2018 +0000
> > >>>
> > >>>     inetutils: fix build with glibc-2.28
> > >>>
> > >>>Signed-off-by: Tom Rini <trini@konsulko.com>
> > >>
> > >>Somehow in all the noise from other failures we missed:
> > >>
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target=
 (/usr/bin/rcp or /usr/bin/rcp.inetutils) does not exist, skipping...
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target=
 (/usr/bin/rlogin or /usr/bin/rlogin.inetutils) does not exist, skipping...
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target=
 (/usr/bin/rsh or /usr/bin/rsh.inetutils) does not exist, skipping...
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target=
 (/usr/bin/talk or /usr/bin/talk.inetutils) does not exist, skipping...
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alterna=
tive provide /usr/bin/rcp: /usr/bin/rcp.inetutils does not exist
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alterna=
tive provide /usr/bin/rlogin: /usr/bin/rlogin.inetutils does not exist
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alterna=
tive provide /usr/bin/rsh: /usr/bin/rsh.inetutils does not exist
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alterna=
tive provide /usr/sbin/rshd: /usr/sbin/in.rshd does not exist
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alterna=
tive provide /usr/sbin/rlogind: /usr/sbin/in.rlogind does not exist
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alterna=
tive provide /usr/bin/talk: /usr/bin/talk.inetutils does not exist
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link =3D=3D al=
t_target: /usr/bin/rcp =3D=3D /usr/bin/rcp
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link =3D=3D al=
t_target: /usr/bin/rlogin =3D=3D /usr/bin/rlogin
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link =3D=3D al=
t_target: /usr/bin/rsh =3D=3D /usr/bin/rsh
> > >>WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link =3D=3D al=
t_target: /usr/bin/talk =3D=3D /usr/bin/talk
> > >>
> > >>https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/374
> > >>https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/375
> > >>
> > >
> > >Hurk.   Which self-test do I need to run to see that?
> > >
> >=20
> > I see these errors in build logs when I use poky distro or yoe distro, I
> > guess you need to enable additional QA errors +  warnings e.g. see
> >=20
> > https://github.com/YoeDistro/meta-yoe/blob/master/conf/distro/yoe.inc#L=
53-L58
>=20
> Ah, yes.  I only build with oe-core.  I'll toss that in my site.conf for
> now, thanks!

OK, I had to do a bit more to make it happen.  It's not just adding the
classes, it only seems to happen on musl too.  Now that I've reproduced
it, I'll take a look, thanks!

--=20
Tom

--heQF7/FOvX7GgW47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcguLTAAoJEIf59jXTHXZSHNYP/0O3D5hjDP8ebK+UnEbzSqGj
eQofYlk4jkiSBZf/EoZu5xDBh9rWONTNAJ9TrBoW4x/RO9sRNj7GW9dtDIZRsMjc
8jwskOuGbWXO1oV/y9ubcj3EDPy0Kr1BYZcBRLM+XjB5S5LgDP+bUULSTydH1wCN
KG8HbU5qzqDUJdZEyHUc2pI4DxGI0HsDNq4htYS8lziJUV7mZ6/nnThCKCG7PPGL
Rbr8A4xm1N1df78MLeOkkZSLh6ZbhbH/IB6FGHheqgYDZM2gWAX/7aaTdhfJFp85
VorrB7kdU9qB+O7GrMUXHr6/y2S8cXxgjCXOXyEbyK2uTokwN2Ap5DYlya/an2D5
LunvQjUrWlf8lrqcxO+KSptRr9bQGQRfaZ9LJTfSGg9fPOZIAO5nlf9LOyXao6q7
GChQwLnIIDzo3Pim9Xk9VnhNyaS7Hj4zcFt44oph78asrkIdMqgN1tNFfeQlIYsq
+EiqB2nAlibP4Y9dVBIXitioS9nMTV/05MHoxYo237ufacLrmKWCnmL+JTdnpWhd
VZE19NcLr39lQwKbdIXBYcsjXyY0uWiDp3nKMsP1xhSPbWc9RdoJFydRZj1SAX/G
l3wgdwadIX1RgTXUZdJgRi/nkwktWLQlpldSAIVfcd+8UsXhg3A6PZX4POkRXW4B
s8dwCVEslN4g4Rby0L6B
=K3cq
-----END PGP SIGNATURE-----

--heQF7/FOvX7GgW47--
