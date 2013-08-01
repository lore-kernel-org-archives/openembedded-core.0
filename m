Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id E41B26A39D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 04:32:46 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so1562297pde.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 21:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=n/Mx5TrIMNkNfMn/oVzik+zwZS1zf7QcADjQO+prPHc=;
	b=KMKDVBQUYIDG+1xKsylbx/4m6i/ozRA4kopjVe1Z0KFTLwBCOyaEOHeJ0nJ78pVjBk
	n6ZrTLOoOFLMtlQOo93gvkIFvZ+Qk6xCKdVjgxHTPZHwRglO80o0c3Hp2C4JvnYejUy/
	104VbC9SsN0oQZiD6zo8oqf/DkbRHWDv/k2uoFUId2SZmp1CSAQLvxRJo1OSqxuDquuG
	j3hb2tZzgjUz2aZ+oIrwNr+LPbUlojCYopgmoXSF5clk/yp8PR/C7+srhBYo0zHF3FLq
	bk7/H0yOJTE9rrGPQ2x/gMjdFMKMrZ2xIQBdB1srWoXN3Cr+cDS5q2qqsKayfx3U1eAL
	ZQ3w==
X-Received: by 10.68.164.225 with SMTP id yt1mr9386531pbb.195.1375331567384;
	Wed, 31 Jul 2013 21:32:47 -0700 (PDT)
Received: from sa-nc-spg-213.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id wr9sm1393127pbc.7.2013.07.31.21.32.45
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Jul 2013 21:32:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51F99839.4020003@linux.intel.com>
Date: Wed, 31 Jul 2013 21:32:45 -0700
Message-Id: <1883FC1F-8A5F-4FB4-B849-EF9BCE544A3C@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F97628.9040801@linux.intel.com>
	<7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
	<13A232F2-9B2C-427E-B5F0-26138984D099@gmail.com>
	<51F9948F.1000908@linux.intel.com>
	<08E217DF-FA59-4DAB-BB7F-0369A4BB3165@gmail.com>
	<51F99839.4020003@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Thu, 01 Aug 2013 04:32:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jul 31, 2013, at 4:05 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 07/31/2013 03:51 PM, Khem Raj wrote:
>>=20
>> On Jul 31, 2013, at 3:49 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>=20
>>>=20
>>> Still seems to failing in Jinja, I wonder if the dependencies are =
correctly sinec it's nooking for native bits and the python3-native had =
not been installed yet.
>>>=20
>>>=20
>>=20
>> in my build from scratch several times, I never had this issue. Did =
you do an incremental build to get to this issue ?
>>=20
>=20
> Yes, most of my builds are incremental until I throw them against the =
Autobuilder!

OK. I will try to cleansstate python3-native and rebuild python3-jinja =
and see if I can reproduce it

>=20
> It seems that I also got a do_package failure, seems like it might be =
a host contamination issue
>=20
>> NOTE: DO PACKAGE QA
>> ERROR: QA Issue: python3: The compile log indicates that host include =
and/or library paths were used.


That is known and  its because python machinery adds -L /usr/lib at link =
line it is harmless since nothing from that
path is picked up. To get this removed, I planned to work on it as =
follow up patch since this needs some deeper look


>>         Please check the log =
'/srv/hdd/builds/world/tmp/work/mips32-poky-linux/python3/3.3.2-r0.0/temp/=
log.do_compile' for more information.
>> NOTE: Checking Package: libpython3
>=20
> I attached my do_compile log.
>=20
> Sau!
>=20
> <log.do_compile>


