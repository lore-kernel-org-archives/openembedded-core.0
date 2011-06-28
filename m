Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qbi6l-0004pV-WD
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 01:54:20 +0200
Received: by pzk2 with SMTP id 2so518827pzk.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 16:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=HuuRGlD8GUGFOZFKFBdf3fdBBv1nMjVQzJSVuN08+iA=;
	b=rsQT6jAOh6CseT2/C4k4Aa9A0JertSPliJqyKL6srN2dw9n6EefHyc4KwcOKAYwniD
	qaQL4oih3gNOCFEODiFUW5+WOTCLyML6T6QrkLmU/7aUxOI2jaSSUXyoCqeShEvcYKIH
	j9d89thOv2I2QK2fg/f35tslCed45GxRkAezA=
Received: by 10.142.163.13 with SMTP id l13mr100170wfe.28.1309305037090;
	Tue, 28 Jun 2011 16:50:37 -0700 (PDT)
Received: from [10.0.0.151] ([96.24.72.190])
	by mx.google.com with ESMTPS id q5sm480257pbk.42.2011.06.28.16.50.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 16:50:36 -0700 (PDT)
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
	<4E0A5AE5.7000509@intel.com>
In-Reply-To: <4E0A5AE5.7000509@intel.com>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <256EDA37-7406-4E12-B095-12F7FFBA7C7F@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jun 2011 16:50:51 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Conflicting providers for ssh/sshd (dropbear and openssh)
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
X-List-Received-Date: Tue, 28 Jun 2011 23:54:20 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jun 28, 2011, at 3:51 PM, Scott Garman <scott.a.garman@intel.com> wrote:

> On 06/28/2011 03:41 PM, Khem Raj wrote:
>> ERROR: Multiple .bb files are due to be built which each provide ssh
>> (/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/dro=
pbear/dropbear_0.52.bb
>> /home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-connectiv=
ity/openssh/openssh_5.8p2.bb).
>>  This usually means one provides something the other doesn't and should.
>> ERROR: Multiple .bb files are due to be built which each provide sshd
>> (/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/dro=
pbear/dropbear_0.52.bb
>> /home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-connectiv=
ity/openssh/openssh_5.8p2.bb).
>>  This usually means one provides something the other doesn't and should.
>>=20
>> reason is that dropbear only provides ssh and sshd packages openssh
>> provides a few more e.g. openssh-sftp-server which is demanded by
>> some images and at same time wants dropbear to provide sshd and ssh
>>=20
>> Now both recipes are to be built but are in contention for providing
>> ssh and sshd
>>=20
>> How to solve this problem. ? Are other packages that openssh provides
>> strictly depending on ssh/sshd from openssh ? or will they work on
>> any ssh/sshd ?
>>=20
>> If they are independent then may be the openssh recipe should be
>> divided into openssh-ssh and openssh-rest so one can use openssh
>> provided daemon or dropbear provided as they wish
>=20
> I've run into that and have been wondering how to resolve it as well.
>=20
> If there are currently existing images which are pulling in dropbear's ssh=
 and sshd while using openssh's sftp-server, then that would imply they can w=
ork independently, even though that combo seems like an aggressive space opt=
imization that I would tend to avoid.

yes if you build console-image with angstrom you will see it wanting sftp-se=
rver and dr bear for rest of ssh needs
>=20
> Scott
>=20
> --=20
> Scott Garman
> Embedded Linux Engineer - Yocto Project
> Intel Open Source Technology Center
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


