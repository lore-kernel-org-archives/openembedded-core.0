Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOHla-0006vD-D7
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 02:13:30 +0200
Received: by lbbgo4 with SMTP id go4so1238436lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2012 17:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=GOKe5loNO44taj/LcFLGy+EcBtbRNM/ikZ5/2ruPpX8=;
	b=H0NWDgCNGVPH3JxreX0YSuwUJA36c6P4n6MIox8zX5kJy9uxZ7v7rWRYnVI0ozgRPR
	N9q7ehIhuUrDCUW476D43ME+MtbU7+XuYY4sBf4IZzq3NEvxYWt+fCou8qyJIkm+aDae
	Ac1JyY2v4aEMCbJtd6VEEQmWhiPj/vtg1Ymm9mwTUiDLcj0hd1ba4kHBMAfubMa9rZ03
	AUiArfRmiJuX8fX6Z8lBkCrS9/eOIUOVDQ7C1k331hLWKe/43NKpcDhz/rB5lCa9pR4v
	F69mTpmSucrsTmHs2WTVTL42BTM4U32UG0xAkOEcZ8hNpCnN8sDCcc7rY6dCd8tFgF9t
	p2MQ==
Received: by 10.152.111.198 with SMTP id ik6mr15359949lab.38.1335657830390;
	Sat, 28 Apr 2012 17:03:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sat, 28 Apr 2012 17:03:20 -0700 (PDT)
In-Reply-To: <1335539400.20130.108.camel@ted>
References: <1335539400.20130.108.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Apr 2012 17:03:20 -0700
Message-ID: <CAMKF1srz89fv_D9vcjR23ThuOPPOCmOd_kmOH-tN3Zffu9nkeA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm: Only rebuild the indexes if the packages have changed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Apr 2012 00:13:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> + =C2=A0 =C2=A0if os.path.exists(path + "/solvedb.checksum") and open(pat=
h + "/solvedb.checksum", "r").read() =3D=3D checksum:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0open(path + "/solvedb.done", "w")
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0continue
> +
> + =C2=A0 =C2=A0if os.path.exists(path + "/solvedb"):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0os.system("rm -rf %s" % (path + "/solvedb"))

to be pythonic may be use shutils.rmtree() here

> + =C2=A0 =C2=A0os.mkdir(path + "/solvedb")
> + =C2=A0 =C2=A0m =3D open(path + "/solvedb/manifest", "w")
> + =C2=A0 =C2=A0m.write("# Dynamically generated solve manifest\n")
> + =C2=A0 =C2=A0for f in manifest:


