Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id F33A773C48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 15:42:35 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so31666355pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 08:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=mTv2Fb9H81jNAQNBzJIvIDwbBHXEGrXCYH6RKDzb+FI=;
	b=sq4YNMJ09uWotchg3jL7iH0B9dtBVDWqecGWgqTk/7kSSCeqB8KHxoF0/NlKKe2jmk
	vW/oA9rwgxsTBbfLVyZdo0O5ZYRwg4gjjGxRtwaWY0wQyDlyJOPhoQ6ObfN3cbEAcfoz
	3EE4iOfNXDuCnfNIrTv07Iwrr8nNtNmNa3QLRwR+CeR13uHk+wmsRKCLJUY+tNdRSDuQ
	9nym618xAxtkvbHiML2wR9oLzKGn9NZTMx0vqJpuxwTcZdZm4iSMPOufFmllnqZVE03D
	lgsvaiNmHOYiqnOKvbNk2d6h13cq5RZBkf4IyaZEwxnroMBDsCG3+3KzC4T4FvpXJtN1
	kBJA==
X-Received: by 10.69.17.68 with SMTP id gc4mr42591633pbd.7.1430322156539;
	Wed, 29 Apr 2015 08:42:36 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id j9sm25831292pdm.53.2015.04.29.08.42.35
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 Apr 2015 08:42:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1430313794.19130.15.camel@linuxfoundation.org>
Date: Wed, 29 Apr 2015 08:42:34 -0700
Message-Id: <2202A5A2-8787-4BD5-83BB-E5C0039D43DC@gmail.com>
References: <1430313794.19130.15.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package: Fix license exclusion packaging errors
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
X-List-Received-Date: Wed, 29 Apr 2015 15:42:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 29, 2015, at 6:23 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> Currently the license exclusion code removes packages from PACKAGES
> pre population of the package directories. This means that the FILES
> entries for some packages are not seen and invariably results in
> packaging errors.
>=20
> Instead, remove the packages from PACKAGES post population of the =
packages
> so the usual FILES entries work as expected but the file are not =
placed
> into any packages and no packages containing embargoed licenses are =
generated.
>=20
> This avoids errors from gcc-runtime with GPLv3 exclusion like:
>=20
> ERROR: QA Issue: gcc-runtime: Files/directories were installed but not =
shipped in any package:
>  /usr/share
>  /usr/src
>  /usr/share/gcc-4.9.2
>  /usr/share/gcc-4.9.2/python
> Please set FILES such that these items are packaged. Alternatively if =
they are unneeded, avoid installing them or delete them within =
do_install. [installed-vs-shipped]
>=20

I am seeing exact issues with cairo as well. This seems to fix it so =
looks ok



