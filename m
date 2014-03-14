Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id E0F4C6EEEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 18:35:05 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id jz11so3058366veb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 11:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=44SwbvJy0G3FfR+d061a3x9lsObJ2fDojBgxw5Yq8aA=;
	b=w9F3Tx3BemBIlsjAsFQB+glSP6HC/RwEPkYhgCQxt5XAxDIm/T27jcuKqPtpvFX+8y
	6iCTu0BIpvuG2n1BhtzhGEyYsuzDB6ECIS2t9Lv4jCGb5NiQzASVM1S8tdK7IDipRG9W
	m0YrQ/KfPz1U2c3t9xsCx+alV0QYRDRNgVNSF73mygFOOq2Y+bGF0Mdbw0f0B0Mvg1Jr
	sx0FlPdulPqtTSe3m+ODuwRsDMadTLRvg1i7OOmUIcRB5qAZkMrQZ/U4Ndx0PtJsMR2X
	+C4HITF24rdndL/ow2pxbmkruzZ1Lff8yN14sun2Kd9FfWenLx5Q0ZRkMpIvMjWXHNSQ
	31ag==
X-Received: by 10.58.248.228 with SMTP id yp4mr1167857vec.35.1394822104289;
	Fri, 14 Mar 2014 11:35:04 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Fri, 14 Mar 2014 11:34:24 -0700 (PDT)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 14 Mar 2014 18:34:24 +0000
X-Google-Sender-Auth: L75JFYpiR6jnVLB-OF9w1xsBECM
Message-ID: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [dylan] Backport request
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
X-List-Received-Date: Fri, 14 Mar 2014 18:35:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm stuck using Dylan for a project as I need a 3.2 series kernel.
Building on my current development machine I ran into two failures:

eglibc-initial, do_configure: Make 4.0 isn't recognised

This can be fixed by backporting
a678243d6e4add90c1e9459da42de34d3724db5d (already in Dora).

linux-yocto_3.2: do_patch: Unsupported version of git (1.9.0)

I fixed this by removing git-native from ASSUME_PROVIDED in
meta/conf/bitbake.conf so that git-native-1.8.1.4 was built and used.
That isn't something we should commit in Dylan but may be useful for
others to know the solution if they run into the same problem.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

