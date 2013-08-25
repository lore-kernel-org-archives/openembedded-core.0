Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2A36010E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 18:31:22 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so2573943pdj.40
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=HKM244lladYLFsBUy10p/kJw0AK+pO91Bz2oW39/LSg=;
	b=Y072909RONaiUwLN3RGEJey80vw2Lbcx9KKLgN/o7zXXItEfYDi9Y9IILWKo7m3t+p
	tEOcCMYV0zFvKMKtbrrPEhBc2eYNtWR9bIKb5X7Sn/Fa7v35ucp9PvTR3cFyOAFId0se
	nHX1NhRlrhIsUhCBzF1KFvPX4thPybOf0vmsD4InZ3D7eUjGfyMsirF4eFvbmQJiIVh3
	UrzaCasSIa1KDQJFPcokqgDbkzKQgKD9T0wXjLgVXpzYc6a5Kc0WkTNn9AiGlaUcxzDL
	h5iGTZGlQSluw63dJ83iO/i6R8+UwlHJfUiQ9OLdcQKsyD1Yo7ncR8cycj6MMN9HZ8VC
	epag==
X-Received: by 10.68.179.36 with SMTP id dd4mr11281501pbc.64.1377455482629;
	Sun, 25 Aug 2013 11:31:22 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	ta10sm15043668pab.5.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 25 Aug 2013 11:31:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
Date: Sun, 25 Aug 2013 22:31:16 +0400
Message-Id: <092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1498)
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Sun, 25 Aug 2013 18:31:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 25, 2013, at 10:02 PM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:

> The thing is I don't see a defconfig anywhere, and I was wondering how =
the linux-yocto kernel picks up the defconfig from the standard/base =
branch.

I found the answer for this one:

=
http://www.yoctoproject.org/docs/1.4/ref-manual/ref-manual.html#var-KFEATU=
RE_DESCRIPTION

Now what do I do if the standard linux-yocto kernel doesn't have an ARM =
Cortex A9 processor based machine?=20

Elvis Dowson


