Return-Path: <lemagoup@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id AC3767EF34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 11:17:28 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id g20so3782271ioc.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 04:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9ueAgka/hqr1vw1YoUj8Iq9WmIQOurwWvqvgHzJTZvs=;
	b=n1BmkVqwYTfYW90qY7sClZdVrQBjYQ+5xJUprHCEopEVU6f+msVAiy7l/m3/Bk7ZVQ
	8jkvgkpgm3wR0bS0yjDrppSpxnwUJKp8xT0dmL3MzUE7w46gnGmMcyzuri62gNuIN0+f
	TXYxfT3kBm+2FJ6VUVYabtheLP9FSorsg/c4jEV5no4UkkChGB0Y1sIp3ijTB5+EoKoh
	r6rTo8CbKUTVQd6j1IMK3URtql7qeWi+x1zvyOdgAiw18sgiTx2ReUBpIsTGNmSBm8vo
	ciX+HgT6Nn2EtrtycOr2rVFqzf7T+YLfY0Flmkb5rLTNVOL9ZEu9GLUn/LKxo0K7cgEF
	2TVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9ueAgka/hqr1vw1YoUj8Iq9WmIQOurwWvqvgHzJTZvs=;
	b=OGe4TqVJ5c+H27POnOnGI5FYAFj0Kw/RsOmHFO5/LfS162h64Lp9pYt/+Ip1FnE1vL
	AusISQWsy6te5vfb2aFBYGmeOOBT2iyV8FiSvMFKECrbg7Zkl2b+x+ptwMqlUN2GV6BL
	nk97g9YCZsaEE2MYAgpzGshSOKsM0d3X5JkJ67T0QFb2fieSN7mArSleGPPDCmGwJLSb
	Ax7S5XMqpjhWejLCg65SS2yxsRdQ1wAfE8U2INqmczucmoWojiVNA1sx4kuzlVtXq7om
	JhkKiBb2SudaOn9POAM7DFPz42F0KWFnAkZj7C/ufnXQfkDN898vlawb2PfSCmT8fkDI
	RnCw==
X-Gm-Message-State: APjAAAV14DCRd6X3CKE9iFT66dDx1r/3kUXu8GMKzC6opC1bDVfXLyl5
	gt9TyPP8dRlSARUbYPgzXekXrzmB9Pw9hlqhNlk=
X-Google-Smtp-Source: APXvYqypf9YrV0rQIyb8qPZxVXvJwvzvQvj2uEY+AZj71POj9UP/nb4f6yGClSOwfZ5jAKitB3gveZoazeTpZJO1nqI=
X-Received: by 2002:a5e:de4d:: with SMTP id e13mr976173ioq.272.1562757449652; 
	Wed, 10 Jul 2019 04:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <DM5PR2101MB09676734C5E89ADA88372B358DF10@DM5PR2101MB0967.namprd21.prod.outlook.com>
In-Reply-To: <DM5PR2101MB09676734C5E89ADA88372B358DF10@DM5PR2101MB0967.namprd21.prod.outlook.com>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Wed, 10 Jul 2019 13:17:18 +0200
Message-ID: <CAEz4NHp-v2+xapjeJULXZiHpM=V1JiC2rCGmEuo7+fHBzN5Csg@mail.gmail.com>
To: Kevin Weng <t-keweng@microsoft.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Wed, 10 Jul 2019 11:17:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kevin,

> I found that the hash function is causing collisions in the generated dat=
abase such that some CVEs are being overwritten because of the UNIQUE const=
raint on the HASH column. For example, CVE-2018-1000873 has the same hash o=
f 623198722 as CVE-2018-18338. This results in one of the two CVEs not appe=
aring in the database.

This is problematic. I kept using djb2 hash function, because it was
the one used in the previous cve-check-tool and it was fast. But it
might not be the right hash function to use. Do you have a better hash
function in mind ?
I can also drop hash function, remove everything from the database and
recreate all entries at each update but it will increase database
update time.

I don't have the same hash as you for CVE-2018-1000873 and
CVE-2018-18338, do you use my latest patches from master ? I did
several changes recently.

Pierre Le Magourou

