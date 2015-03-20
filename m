Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id A611B6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 18:36:50 +0000 (UTC)
Received: by pabxg6 with SMTP id xg6so103807774pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 11:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=T658+XAjyz+NWSVAIQT8ZHCu9KUDLbeOG00tNsfk9aM=;
	b=BQG27ALzOgH8Vc/1MqEDB/JpfcJNIJ2P/fMX9oJesC1yfrGOcFidiUDRLaC2mGd/YS
	BoVK8uoWZEhqi2h0AR2rR5GdBQn35XIzKrqKMTIb/lX0unv4khcGWpizX2+iPmvJAJnQ
	hbwDsmI9kzG+LsRyEY66M4KCKtXccXKp9aiJrJQbYjGlRjzqkj+Ut1Xda/FAxJSlNsPt
	m3tOTneSEZokv8o+fFFqGSfttyascmzpgVmTvPoj9V5rfk+NLfpG1WUMVztrj+eXvZxl
	UkAtNPw+Oo5+tfb5zQxlNVFmJEiITEdD1Z24fTAiUh9tMMpxRRPy/+N/FcCcNJ5+Rvns
	KwVQ==
X-Received: by 10.66.233.35 with SMTP id tt3mr117449339pac.36.1426876611464;
	Fri, 20 Mar 2015 11:36:51 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:51a7:8961:930d:8f0d?
	([2601:9:3580:84c:51a7:8961:930d:8f0d])
	by mx.google.com with ESMTPSA id mk1sm9245319pdb.71.2015.03.20.11.36.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Mar 2015 11:36:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAC1BbcR=K2mc7Z94+wpoWKCwzCzGqTfMuV2PQYU3u04TGZgmqQ@mail.gmail.com>
Date: Fri, 20 Mar 2015 11:36:49 -0700
Message-Id: <61B03CA5-4945-49E7-9463-87CEADB22C67@gmail.com>
References: <1347436503-17966-1-git-send-email-raj.khem@gmail.com>
	<CAC1BbcR=K2mc7Z94+wpoWKCwzCzGqTfMuV2PQYU3u04TGZgmqQ@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 3/3] uclibc: Revert systemd regressing patch from upsteam uclibc and uprev SRCREV
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
X-List-Received-Date: Fri, 20 Mar 2015 18:36:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 20, 2015, at 6:07 AM, Bernhard Reutner-Fischer =
<rep.dot.nop@gmail.com> wrote:
>=20
> On 12 September 2012 at 09:55, Khem Raj <raj.khem@gmail.com> wrote:
>> This patch is causing systemd based systemd to not boot
>=20
>> meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
>> ...nt.c-wtent.c-move-functions-from-utxent.c.patch |  321 =
++++++++++++++++++++
>> 2 files changed, 324 insertions(+), 2 deletions(-)
>> create mode 100644 =
meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-funct=
ions-from-utxent.c.patch
>=20
> Khem,
>=20
> Do you remember what exactly this was fixing?
>=20
> I don't immediately see how reverting it makes sense..
> Many thanks in advance for a hint or reproducer or instructions on how
> to reproduce!

just remove the patch. System use to hard lock during boot. you will not =
miss it.


