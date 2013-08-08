Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id D93146AF12
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 12:21:34 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id o6so5252629oag.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 05:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=u5VXQE/TxwW2vN07cdIDV5N1cE7wq9GeDOgD9a5fB3k=;
	b=O2YuLn0xGBT2XdU6ZvCCRaIQhq92qafFge2twWep7tGGjJgrwTbm/6zh5L3TzjSJff
	duSjCESoO0tcVjf8s9/ZYdl+IOCe9VjvOLrzKaiO2GumfcdFtqew4nyaMalMnge0D+ZX
	t7e/1KL4sot2RXLmf8ta3WMVPBqy+wUXlZUYU0fg9WAgV7AcCDWVEGyJMoSNbGtIuDoP
	69S1HOgUzcqplApHNxYJMKkT9fNdnw0DBYsc3zhlosoX+GvgrCMQimrBTu40VQVFDNIp
	WeVqJD2kxT0dkJlVry/GvbPddjjRKOsnBSz7740/ZY397scvw+XS9/5D6r1pEka53aE5
	Q8iA==
X-Received: by 10.182.29.198 with SMTP id m6mr6043869obh.105.1375964494981;
	Thu, 08 Aug 2013 05:21:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.37.65 with HTTP; Thu, 8 Aug 2013 05:21:14 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Thu, 8 Aug 2013 14:21:14 +0200
Message-ID: <CAGiJk9eZGqhJ4SKiJ_ivW94Ug9ine1P4UdftNdrg_E0wfV1mLA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Unhandled exception with BB_SIGNATURE_HANDLER="noop"
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
X-List-Received-Date: Thu, 08 Aug 2013 12:21:35 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

on the autobuilder I use, this error is currently blocking all nightly
builds for some time:
http://pastebin.com/RN6nJyPh

The build is a normal nightly world build (these srcrevs are from 2013/08/01)
$ bitbake -k world

meta-angstrom     = "master:bed0c8c6abbf90aaaa730617a465839fde4374d2"
meta-oe         = "master:246bedc1c6b3e2830ca0a8fae8c30b8624f46ab2"
meta-ti           = "master:3f3f05eea39d0f13bc140747984e202e9288b2fe"
meta-gumstix-community = "master:75dba51592cba66ff42c287d88b670852b767336"
meta              = "master:f192c444c2d88c49738bea4ff4c3af0cc72916de"


In the local.conf these settings are used:
# Disable shared state creation
SSTATE_CREATE_PKG = "0"
BB_SIGNATURE_HANDLER = "noop"


In siggen.py the "noop" object has no variable file_checksum_values.

What is the preferred way to resolve this?


-- 
Regards
Samuel

