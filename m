Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 86023609A7;
	Sat, 19 Apr 2014 10:51:43 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2258631eek.23
	for <multiple recipients>; Sat, 19 Apr 2014 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ocxS+n3ROFgxMOqzh0hdX1/0u5vCtLLgq8JRpR1X9bA=;
	b=Li7SzbU+9vNgxFJKVoVnbb6n861gL06grOBWWXX6OD5xkBkFgng01gfFusUDuxf5i3
	1dnZAr+mVAOP/f5nBXR/T7OybTIqch8RzaTNk0y5DPIwZ3v1LJQdbWqLTfjChP34XObq
	4VNpkoMdLmFmM9ZM/rcYaRimmGSgaig91P0JSk/MMmILXOqs0j44Em74McSS30v+qNHd
	n+K2bzpjWALbKEPgze7XDdqJ0LOw7Vv9eleezQfubQ7CKre/bCnvGNbNehUoP3tRBSbh
	r2YsD8adVegdVfLEAOZj4RfbH6zB4YsJKqG/0qmzpUtFqTBtQT8c1/12oa7UqDm6vK9X
	W1Qw==
X-Received: by 10.14.218.193 with SMTP id k41mr29871769eep.16.1397904704242;
	Sat, 19 Apr 2014 03:51:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	4sm84675427eeq.33.2014.04.19.03.51.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Apr 2014 03:51:42 -0700 (PDT)
Date: Sat, 19 Apr 2014 12:51:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20140419105146.GH2486@jama>
References: <20140418183632.GG2486@jama>
 <5351D1E5.2020302@linaro.org>
MIME-Version: 1.0
In-Reply-To: <5351D1E5.2020302@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, test-dependencies 2014-04-18
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
X-List-Received-Date: Sat, 19 Apr 2014 10:51:47 -0000
X-Groupsio-MsgNum: 52476
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="svZFHVx8/dhPCe52"
Content-Disposition: inline

--svZFHVx8/dhPCe52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2014 at 09:31:17PM -0400, Trevor Woerner wrote:
> Hi Martin,

Hi,

> Just to confirm... when we work on this, we should be working against
> master-next?

In most cases it shouldn't matter, but otherwise yes it would be better,
I plan to merge most of master-next in next few days (as soon as jenkins
builds are finished).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--svZFHVx8/dhPCe52
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEUEARECAAYFAlNSVUIACgkQN1Ujt2V2gBw0jwCXYU5HWatZcSD0w94zTIN1Oz5/
8QCgjI2w53OgILbeZzrFgTJnvLU+lcw=
=krGl
-----END PGP SIGNATURE-----

--svZFHVx8/dhPCe52--
