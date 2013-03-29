Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>)
	id 1ULUhq-0008MD-TZ; Fri, 29 Mar 2013 09:30:39 +0100
Received: by mail-pa0-f54.google.com with SMTP id fa10so257581pad.41
	for <multiple recipients>; Fri, 29 Mar 2013 01:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=4FxG/uyBrzS15A/+zBTwfCpPe6DrJiT0zCHGtge1qHE=;
	b=S3jlP8dmNHeRPamKv+QOwsaOz1mofkrYOiuMosQK/gXtivcC/fWE36jSMVw8zpt5Pi
	8l5VZczIby5xlzV4IV00GWHC8PPmPhqZ7TxWi1T0hpfS8EcA9f6l1lBpCLXXO82YNUSO
	nG4MUhZ7cxuLNa6vfC57vTmoTIp7ktXTBQGMsPQffIQcqzs/OssZMVIzImqKs+3byNGv
	ZS8eciep/12b/l6Wcwilqq6qXBiY8dU6krnJLRKXM6IBWPmlFrMjfMG7CtdOgXZ5Gw66
	ou/VVe8OxyuyPHQNvNt3MLp/XYpwv0cyck+wUp1Cm45VxTbFHwWRHMqWZXm50wZrhEsy
	dT3A==
X-Received: by 10.68.197.133 with SMTP id iu5mr2289432pbc.195.1364544814420;
	Fri, 29 Mar 2013 01:13:34 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.105.6])
	by mx.google.com with ESMTPS id qb10sm1983766pbb.43.2013.03.29.01.13.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 01:13:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
Date: Fri, 29 Mar 2013 12:13:27 +0400
Message-Id: <44FDC966-90E8-43EC-9ED4-860384A085E6@gmail.com>
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 29 Mar 2013 08:30:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Mar 28, 2013, at 9:51 AM, Khem Raj <raj.khem@gmail.com> wrote:

> All,
>=20
> I have added gcc 4.8 recipes and the branch is here=20
>=20
> git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.8
>=20
> cgit
>=20
> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-4.=
8
>=20
> Please test it out on your respective environments if you can.
>=20
> To enable gcc 4.8 with OE-Core you would
>=20
> in local.conf set
>=20
> GCCVERSION =3D "4.8%"
>=20
> and if you use angstrom. Please checkout 'next' branch of =
setup-scripts
> and then in conf/local.conf
>=20
> set
>=20
> ANGSTROM_GCC_VERSION =3D "4.8%"
>=20
> My testing so far has been building systems-image for all qemu =
machines and they
> seem to boot as good as 4.7 did. But I am hoping for wider testing and =
finding issues
> or very least improve the existing recipes for now and once the 1.4 =
release is done
> we can then propose it for inclusion in OE-Core
>=20
> Thanks for your time

I've built and tested the new gcc-4.8.0 recipe for the Xilinx ZC702 =
Zynq-7020 platform
(dual ARM Cortex A9). The kernel (3.6) and corresponding rootfilesystem =
boots fine.

Best regards,

Elvis Dowson=


