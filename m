Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SSuE2-00046u-Np
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 20:05:58 +0200
Received: by wgbds1 with SMTP id ds1so1685133wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 10:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=wI03x8dIADbStO3+u2Cb+NAKFNCs0RkzRlhckfAMDdo=;
	b=ZD4R2zDA2QLIUmdSRFMPOT++XthPhl9bHf9Tk6mEcnMm+Q8fnMDFEol0KkjSAbmv8r
	ZdFXQK9oGGgZE/FVSdGCZe0aSothkudha07Xb5fVYuGHOdh0CYUmbWqwLJyVqasSqhFz
	C6/HJIMNi4A3QghtPRRrp12Q65UomXdOMGBXhNJ00JqYCVxv2ZXO+nCkWfEuBrZuWnfI
	mLYBpFHJypyYIvS7yKUjjMjArr1yoYkab9tdH/zz6IjbD7+XUvN2wTv5JA0udUs9Xwti
	E/ueXbFOVUz1oXDT3EtEgrSfpsN0laxTqeKxVTXdkrJH+QJOyU0USnAFhBYoJ1cmjE99
	vVqw==
Received: by 10.216.131.97 with SMTP id l75mr2085813wei.21.1336758963142;
	Fri, 11 May 2012 10:56:03 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm19422399wib.9.2012.05.11.10.56.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 May 2012 10:56:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1336756650.git.sgw@linux.intel.com>
Date: Fri, 11 May 2012 19:56:00 +0200
Message-Id: <95CC9A64-5505-45A9-B63C-C6985A1A2A73@dominion.thruhere.net>
References: <cover.1336756650.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmaO8L5EC7gQ7sLKOVTtWL0z2JGaRFKAQ1xadrJvqXhev4psvA35F7xSeHBWWNqthsp9w6+
Subject: Re: [CONSOLIDATED PULL 0/4] QEMU Transition to xserver_xorg
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
X-List-Received-Date: Fri, 11 May 2012 18:05:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 mei 2012, om 19:21 heeft Saul Wold het volgende geschreven:

> Richard,
>=20
> This has been run thought the AB and I have ran QEMU locally with=20
> the new xserver change.
>=20
> There were a few issues noted and Khen and I have cleaned then up=20
> at this time.

Not really an oe-core bug, but worth spelling out: meta-intel has a =
greedy override for xf86-config, so if you machine has none it will end =
up with with the meta-intel xorg.conf=


