Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrNO0-0004c2-P1
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 07:37:40 +0100
Received: by mail-la0-f43.google.com with SMTP id eg20so10743855lab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 22:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=VVfRv4Lg/JfTXR+Xz/+yiV1q76ZJYUV/GwdI98PEjG8=;
	b=f2cQSDuUTP4GhxOjqmw4Hvh5CJx7vFJ2rxVNlsOtspEAM+N6SwvLThejKvL2dPx6RU
	qpKXCuGc3FT/Ap/+RiOim4KQ7RtgOAlu4heEPOUokxsedbE/NE4Ejvw0UrSQ8jOgv1Ml
	cJ2l+dpmiAGXcTD45Hu1oisB6rZBHeBCtLdnXb5LrfVSDwiiebHX57qMP9WO+iFt15xl
	OxO2ZyKl7Mi552TVI7YEkiLRHGGBQcNzL1VqHvXVqrVv7sLP6zcPj1wjhFXHjrEQbG/Y
	yrwpijmWrtrJJVIbH9JkAsB5gNVNy50tlblNAAsIcphaN7/BjIZRbv5KJ2YhrXhVQxQO
	M3NQ==
X-Received: by 10.152.105.134 with SMTP id gm6mr52506419lab.31.1357366954733; 
	Fri, 04 Jan 2013 22:22:34 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id iw6sm277285lab.2.2013.01.04.22.22.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 22:22:33 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TrN9E-00081u-R8
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 08:22:24 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Jan 2013 08:22:21 +0200
Message-Id: <1357366942-30816-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: polkit SRC_URI update
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
X-List-Received-Date: Sat, 05 Jan 2013 06:37:40 -0000

Updating polkit requires new dependency recipes to be created,
so it's a bit more involved process than I anticipated. Postponing
that for a while is not a reason to hold back already existing
first patch - updating SRC_URI - from the series.


 - ML


