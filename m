Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7373C607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 16:21:48 +0000 (UTC)
Received: by wiga1 with SMTP id a1so317579842wig.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 09:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=IhM39m8N1QQmoPfX3zdjI8VKw8bvLpBFpanZyo9KgAs=;
	b=WH+wUWMUTOeV0qkpGXPb8v9wubEDVFyXquBLXF2othoPVrRvnO3tw++iXxMUdI30Ic
	mOOoLf+GTWyzufFIyBk3dviy6dvB1dm8TRILgiV0aSUTxb1i1JpReWA1hoIv00JyMUbX
	DDzlOYg+zXvyWncEA27VmbWsY7dXQ3/9BuYlvLGMfOyk2h8jbIVTC1RMxlaun7ZuwD3Y
	sn419Aw8h/8tw3ueSBGotfyHJR4uxohKmgjK5s+fwS7nWU8hEPKKIxB4uYLrLQQburtn
	UNJKXJJvh3JtdHQyB5giBT9bifWkyR4gbBYjkvmEfrXcwgy3/2gDujIeBb6CXYFYLC7/
	JjgA==
X-Received: by 10.194.85.130 with SMTP id h2mr26517456wjz.2.1436458908281;
	Thu, 09 Jul 2015 09:21:48 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id qq1sm9588919wjc.0.2015.07.09.09.21.47
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 Jul 2015 09:21:47 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Thu, 9 Jul 2015 18:22:01 +0200
Message-Id: <A7F547A4-FD07-4674-8DAB-A09FA32921E3@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Mailer: Apple Mail (2.2102)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Perl recipe fixes and some updates
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
X-List-Received-Date: Thu, 09 Jul 2015 16:21:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

the one or other might already know my meta-cpan approach where I try to =
get some useful modules from CPAN packaged for Yocto.
However, there were some quirks required I never brought into a suitable =
format to submit them.

With my client's update to fido I grabbed the tuit and did some patches: =
https://github.com/rehsack/poky/commits/fido

The patches for Perl and CPAN modules are 2cc5172 and c6a4f0e.
d4cbf52 is a patch which is required to build v8 in Yocto (Z-Way needs =
v8, so we provide it =
(https://github.com/rehsack/meta-jens/tree/fido/recipes-www/v8)
d99fa58 fixes the build of mesa when no drm is available
The remaining one dbccad0 updates sqlite3 ... which is used for =
DBD::SQLite perl module in meta-cpan :)

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


