Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id DBAF06017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 16:38:40 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so5830806wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 09:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=ICmVOAfrUPLGbtsE1dVV+4QopjxWRfdXz/2n50Dnn88=;
	b=kafD/uVimXdcBoAUZnwLwUux/xuHmvw6ldx9NTvBF/wYKhXOIB2jWvQZ501u+c4P8J
	V30Q1nJXpwg2cyYUeM6mO164dUsjdtPDGiblH+xcY37qs3yFXh9i3E3gLV9MHgrgHU6A
	K4qqLvbnvhhEMi1/eLyKrUOhJpPdPkRMsZ+ytz5DhfnuJ7fdCufNEABVGfZCPMj0VRLn
	D9n8rg7jFiQdLSBxHtQyJ/Yplv2S7mH9+ehSgEaemJ8SCIr+hM+TBDfB3YKIfmEaa+nM
	L3L/q/oreK4cUceMZEJ0JbrQcGo/WmYp0CBaFN19wFqzJZJiuJ2uFL7+uQ3nBJNAqaUN
	RFhQ==
X-Received: by 10.194.6.229 with SMTP id e5mr33500308wja.158.1436459920379;
	Thu, 09 Jul 2015 09:38:40 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id js3sm9645321wjc.5.2015.07.09.09.38.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 Jul 2015 09:38:39 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <3EECF939-15F6-43A4-BE87-CC1D57121CD1@gmail.com>
Date: Thu, 9 Jul 2015 18:38:53 +0200
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Mailer: Apple Mail (2.2102)
Subject: Update rrdtool from 1.4.8 to 1.5.3
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
X-List-Received-Date: Thu, 09 Jul 2015 16:38:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

here is an update patch for meta-oe/recipes-extended/rrdtool:
=
https://github.com/rehsack/meta-openembedded/commit/6ed5b4489beb1233bd4b3c=
9f73064e973eeef2ad

This adds a the capability for native package, because RRDTool::OO from =
Michael Schili needs it to build without patching around (easier ^^).=20

Best regards
--=20
Jens Rehsack - rehsack@gmail.com


