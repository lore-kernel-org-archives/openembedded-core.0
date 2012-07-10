Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sod78-0008Sg-8w
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 18:16:38 +0200
Received: by yenl13 with SMTP id l13so144518yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=cm4HZM/e9U9zkGEU69qdOyg2mlc0jjDGlnOPUBXemwk=;
	b=Yy69yf0RqDcqhDuDkYXUitONUxv8ZWOUVpajOv/8yDJ5sQzj7+RqMMNQ3vxy6ns6ho
	UhI5LrD6gHAzJAAlum0I6sONfthJgVNvcMZitAX73hhMAbrp8D/82axr0kOVPszYpZVd
	p+9WIGIdFKsd8XTd8fHDDO06WkZILbu0+g8k+iCFmAhEyI/LaCMHLflUoikoovH/aOmz
	OaZygcohNkA9io9QHmrfaE095BnGslFN3AqJTqWms3i1Px9vQG6yo9TOe+DRUktiMFQi
	HnQS/FTO0b1p8IOGi6m4hLBkWENZmtvzO3DXfjW1YbHkESHSGe1OlfkNwzn1eMubuw6t
	LCOQ==
Received: by 10.66.87.2 with SMTP id t2mr44444107paz.22.1341936326715;
	Tue, 10 Jul 2012 09:05:26 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id sy3sm30118903pbc.18.2012.07.10.09.05.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 09:05:26 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAJTo0LY0RrMY5FbSbyK4VQm67AHHs2wgFU9G=N6_a6eVkv+d8Q@mail.gmail.com>
Date: Tue, 10 Jul 2012 20:05:21 +0400
Message-Id: <FAE8DEEA-AADE-4B64-941E-D023E9237511@gmail.com>
References: <CAJTo0LZ1W6mD2mdadeqdvyVubgGSozcF_Nw8xbvr4fAsRgJK8A@mail.gmail.com>
	<CAMKF1spG4BHD6aHQ1WeSFt5hS0tWgoF2HHT6BFg3tbC_aFEpbA@mail.gmail.com>
	<4FFBEE58.7040101@communistcode.co.uk>
	<CAJTo0LY0RrMY5FbSbyK4VQm67AHHs2wgFU9G=N6_a6eVkv+d8Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
Subject: Re: The Mythical Sato Replacement
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
X-List-Received-Date: Tue, 10 Jul 2012 16:16:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
       How about adding a meta-android layer, and creating a =
core-image-minimal-android build?=20

The android kernels are available, they have a qemu target for android, =
and the android sdk will need a bbclass to download, build and create an =
android root filesystem. A couple of targets already are compatible, =
mostly the TI OMAP/AM series.=20

Elvis Dowson=


