Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 394F96A467
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 10:30:09 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so1504774eek.22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 03:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CLujeYwxFo9ovc4hXs2IkuUgcGwkFuEDmtSiFjfM0l4=;
	b=VhUAKvI+P+WoyP+4dAaxWi6HKSFtPCTMSyBZcC5FC9eA013afMN8dJI0g9vm9AFyf8
	hM3pSJBIENQirUmSymE0fYIO3/WF5rDQ3h4ym7TnWtwdsJzDQYuxKiPSI7Z94FAqHUdA
	4n41qBt4aOMQQMGRgy+bB3q2fjrBZQ/u7oiXI2YFsW4qZwGBdRXhx23GjIi0kvYDSn54
	2n+05VsefyNK2gI+cptPlq0xQvjGZBPDIBHihc2NkacMifUV/lXXit+XuoIp5qgTaBHT
	GYvxJNVsmMYrInbP02ccAhMZmAtlLDiEsk2aeDhKPB4rW51i3XF0fbIyCL0QNDFURtog
	TSLg==
X-Received: by 10.14.29.69 with SMTP id h45mr16940849eea.127.1372588209488;
	Sun, 30 Jun 2013 03:30:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm22470268eew.1.2013.06.30.03.30.08 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 30 Jun 2013 03:30:08 -0700 (PDT)
Date: Sun, 30 Jun 2013 12:30:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130630103050.GZ3261@jama>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<16aa82db3cd5727a22d3688197fef330aaf2df59.1372456294.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <16aa82db3cd5727a22d3688197fef330aaf2df59.1372456294.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 21/24] python3-jinja: Recipe for python3 templating system
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
X-List-Received-Date: Sun, 30 Jun 2013 10:30:09 -0000
X-Groupsio-MsgNum: 41205
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qn4G1eBrv+t66M9q"
Content-Disposition: inline

--Qn4G1eBrv+t66M9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 28, 2013 at 03:04:06PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/python/python3-jinja_1.2.bb |   37 +++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-jinja_1.2.bb

throws couple of unpackaged docs files:

python3-jinja-1.2: python3-jinja: Files/directories were installed but
not shipped
  /usr/share
  /usr/share/docs
  /usr/share/docs/html
  /usr/share/docs/txt
  /usr/share/docs/html/watermark.png
  /usr/share/docs/html/translators.html
  /usr/share/docs/html/tests.html
  /usr/share/docs/html/templatei18n.html
  /usr/share/docs/html/style.css
  /usr/share/docs/html/streaming.html
  /usr/share/docs/html/scopes.html
  /usr/share/docs/html/recipies.html
  /usr/share/docs/html/objects.html
  /usr/share/docs/html/loaders.html
  /usr/share/docs/html/jinjalogo.png
  /usr/share/docs/html/jinjabanner.png
  /usr/share/docs/html/installation.html
  /usr/share/docs/html/inheritance.html
  /usr/share/docs/html/index.html
  /usr/share/docs/html/i18n.html
  /usr/share/docs/html/fromdjango.html
  /usr/share/docs/html/frameworks.html
  /usr/share/docs/html/filters.html
  /usr/share/docs/html/escaping.html
  /usr/share/docs/html/devrecipies.html
  /usr/share/docs/html/devintro.html
  /usr/share/docs/html/designerdoc.html
  /usr/share/docs/html/debugging.html
  /usr/share/docs/html/changelog.html
  /usr/share/docs/html/builtins.html
  /usr/share/docs/html/api.html
  /usr/share/docs/html/altsyntax.html
  /usr/share/docs/txt/translators.txt
  /usr/share/docs/txt/tests.txt
  /usr/share/docs/txt/templatei18n.txt
  /usr/share/docs/txt/streaming.txt
  /usr/share/docs/txt/scopes.txt
  /usr/share/docs/txt/recipies.txt
  /usr/share/docs/txt/objects.txt
  /usr/share/docs/txt/loaders.txt
  /usr/share/docs/txt/installation.txt
  /usr/share/docs/txt/inheritance.txt
  /usr/share/docs/txt/index.txt
  /usr/share/docs/txt/i18n.txt
  /usr/share/docs/txt/fromdjango.txt
  /usr/share/docs/txt/frameworks.txt
  /usr/share/docs/txt/filters.txt
  /usr/share/docs/txt/escaping.txt
  /usr/share/docs/txt/devrecipies.txt
  /usr/share/docs/txt/devintro.txt
  /usr/share/docs/txt/designerdoc.txt
  /usr/share/docs/txt/debugging.txt
  /usr/share/docs/txt/changelog.txt
  /usr/share/docs/txt/builtins.txt
  /usr/share/docs/txt/api.txt
  /usr/share/docs/txt/altsyntax.txt

--Qn4G1eBrv+t66M9q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHQCNoACgkQN1Ujt2V2gBwZSQCfVCIU6hmXsZbsABijBxRbgMrx
eVwAoJgjWP3+2waHgxrY+Rlix69FwlgT
=zRkf
-----END PGP SIGNATURE-----

--Qn4G1eBrv+t66M9q--
