Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1ULUmM-00007y-Qd; Fri, 29 Mar 2013 09:35:24 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb10so260436pad.25
	for <multiple recipients>; Fri, 29 Mar 2013 01:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=qC3LjVKlY4UzZ3YK0VMWrz6c2cE7PZhPwuNJR75kwGs=;
	b=XPOGc6oDoyaxizBghPWA7zo1HgS/rUFUjHPCN81QvA1euGVyWcj+AW2UsOb6Qok7Jk
	fACe5o3xH6raVaqopE/c//Vm4AKEeMUVpO4CFFc4Ik8t8AEMnK3gpnoJps6ROoGpUuNH
	oFxKbvxHjFm1MT265Hk7DV3iqS6nVANdSVyW1nQf3FgaRQf23qs6usaMUrenbPWMNz9c
	f6aL7SIWQ4Al21P0xDHzEe5mxeQtQ90DKyF9EYSdoBoiHuo7NYdCyy0G5/GAsP8JZ9Jn
	EsEsvrC+JcAaLPr9ozdX8I04PyvajZ/P7eyH3So0Qh/m582AMqH7BwyyLUon3a/sfX5a
	FTrg==
X-Received: by 10.68.4.38 with SMTP id h6mr2515146pbh.5.1364545094238;
	Fri, 29 Mar 2013 01:18:14 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id yp2sm2581985pab.10.2013.03.29.01.18.12
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 01:18:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <44FDC966-90E8-43EC-9ED4-860384A085E6@gmail.com>
Date: Fri, 29 Mar 2013 01:18:11 -0700
Message-Id: <A9FC653E-2D41-4AD4-90B6-9898040EC6D8@gmail.com>
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
	<44FDC966-90E8-43EC-9ED4-860384A085E6@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 4.8 recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 08:35:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 29, 2013, at 1:13 AM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:

> Hi Khem,
>=20
> On Mar 28, 2013, at 9:51 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>> All,
>>=20
>> I have added gcc 4.8 recipes and the branch is here=20
>>=20
>> git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.8
>>=20
>> cgit
>>=20
>> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-4.=
8
>>=20
>> Please test it out on your respective environments if you can.
>>=20
>> To enable gcc 4.8 with OE-Core you would
>>=20
>> in local.conf set
>>=20
>> GCCVERSION =3D "4.8%"
>>=20
>> and if you use angstrom. Please checkout 'next' branch of =
setup-scripts
>> and then in conf/local.conf
>>=20
>> set
>>=20
>> ANGSTROM_GCC_VERSION =3D "4.8%"
>>=20
>> My testing so far has been building systems-image for all qemu =
machines and they
>> seem to boot as good as 4.7 did. But I am hoping for wider testing =
and finding issues
>> or very least improve the existing recipes for now and once the 1.4 =
release is done
>> we can then propose it for inclusion in OE-Core
>>=20
>> Thanks for your time
>=20
> I've built and tested the new gcc-4.8.0 recipe for the Xilinx ZC702 =
Zynq-7020 platform
> (dual ARM Cortex A9). The kernel (3.6) and corresponding =
rootfilesystem boots fine.
>=20

Thanks,=20

> Best regards,
>=20
> Elvis Dowson



