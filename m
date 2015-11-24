Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A09176011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 18:58:14 +0000 (UTC)
Received: by wmec201 with SMTP id c201so40046786wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 10:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ZBhEPtYp3f5kzRN/U/bj0xA6dsqn6jHMRlvJOXPw47c=;
	b=0d4JUqIu1WPlFs80PgYz+eAwKdniiprs2SeJxvJXBBSFkP3hGp1p6rvd5DaTLUrtFz
	tLvnqtC/oSnQQCN5O8s0ZakOu9DoKKVCLufXkgMdE1fNIsO7N9hdRQhSQqwA1EKVisN0
	rvOgZc2zIUSZ3aCWK9sl3TNUK2KQCK/U2KdLxcIjSOmCJa7I8TlfLZDbcS6VnupRLfXk
	83YJ1NDo5+s0xONm9l3SMzrHg2slXH/GnW5WL/V2+WHtnH/XGKafyuVUg+8GYeIl/19j
	zMO+Nbr9ToS+BFlzby//v9bwUixT5gnJVsiV43KW7/61QOPJLX5esSTBmoYGOuX1pCwB
	TkIQ==
MIME-Version: 1.0
X-Received: by 10.28.46.137 with SMTP id u131mr26486844wmu.61.1448391494484;
	Tue, 24 Nov 2015 10:58:14 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Tue, 24 Nov 2015 10:58:14 -0800 (PST)
Date: Tue, 24 Nov 2015 10:58:14 -0800
Message-ID: <CAJ86T=VBh-TsnaSyNVSxmbEJz7TbFcDmNBVP4_4PhXB=YMrm5w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: vmdk images with musl libc
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
X-List-Received-Date: Tue, 24 Nov 2015 18:58:15 -0000
Content-Type: text/plain; charset=UTF-8

It's currently not possible to build a vmdk image when TCLIBC = "musl"
due to the following dependencies:

  do_bootdirectdisk -> syslinux -> mtools -> glibc-gconv-ibm850

Creating an mtools .bbappend containing:

  RDEPENDS_${PN}_libc-musl = ""
  RRECOMMENDS_${PN}_libc-musl = ""

seems to be a workaround.

Does anyone see a better solution?

