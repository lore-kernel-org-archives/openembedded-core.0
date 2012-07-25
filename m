Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Stye4-0005Km-3C
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 12:16:44 +0200
Received: by weyr6 with SMTP id r6so362333wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 03:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=6hesYpmpmue2ssGEO8AUsR4/jKacb3xJA6cpWZkdlJI=;
	b=PvB/dCHbcxp/uLRKoxSiwjwg5leU3XJCt6DJ37EqyndPf0AJlJfsKodlVAwPf+JS9K
	yBEVTHBiH6IT5AyetgS/ugfwMQgdyEPfCuUFJcMc5LRIzAvj9kTL6t1OOhYQNjBJ8SJm
	5d9hzvuLffkN9ttlCLi+gvZW6inKwgPamWVIpvWFwpeXPW2ugx00wC42Zn+UodYQng4Z
	tHvT56Q96x+G57SsRNUzT4CIgWBQiMqcr3sH2e8H5HCs8xHHxNMRayetwKOPOumeq6LO
	8PrRTwQkc01ut3kpmSYyhfxgaAAQYjAdhLVZIKgh/qLfp33mJk8JoWNe29Sb3VqRzn3k
	gdZQ==
Received: by 10.216.235.102 with SMTP id t80mr1827726weq.87.1343210714608;
	Wed, 25 Jul 2012 03:05:14 -0700 (PDT)
Received: from [172.20.3.201] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w7sm1830146wiz.0.2012.07.25.03.05.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 03:05:11 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16174E03@IRSMSX102.ger.corp.intel.com>
Date: Wed, 25 Jul 2012 12:05:08 +0200
Message-Id: <51ACE010-87F2-46BA-831B-44925D4C73FC@dominion.thruhere.net>
References: <cover.1343199345.git.Xin.Ouyang@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB16174E03@IRSMSX102.ger.corp.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQm7lxdiTe0UfE2KEzgQBySfNS0OnpnqIr+wxGs//8qtPHJNIHu4A+bVjDpMZgTg4NlKECdl
Subject: Re: Package recipes change proposal (system-wide) - name wise
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
X-List-Received-Date: Wed, 25 Jul 2012 10:16:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 jul. 2012, om 09:23 heeft Iorga, Cristian het volgende geschreven:

>=20
> Hello all,
>=20
> For me, having the version number contained in the name of package =
recipe is a little bit puzzling.
> For example: libpcre/libpcre_8.31.bb
>=20
> Is there a solid technical reason to not have it like this?
>=20
> libpcre/libpcre.bb
> and inside the recipe to have a PV variable defined:
> PV=3D"8.31"
>=20
> In that case, the upgrade/update process would not involve performing =
a "git move" operation.
> In my opinion, this "git move" operation is something to be avoided, =
as it puzzles a little bit the versioning system and complicates the =
review process.

git format-patch -M=


