Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pv2Qb-0007vM-IE
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 07:54:26 +0100
Received: by gyg13 with SMTP id 13so307857gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 22:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=fL0dheEkox8hkXhOHH//Iq+wgi/IL9Ijke3n5GiZDKo=;
	b=Dwmc941U2B4LtHsli4JoHNu9vMgQqZKvsOuGT+Vsd2i+c3kFf6aJU4X8Nm/fE4CnxR
	4kkvT96U/Bo/JH7YNDitcyYyipNE3VSiVkJOqZinMH8KAw3gCDvM/po+Jhv5d2qFbwK8
	xmF2AY2dOgwjyQ5J82Ooz+uYM1tT17ma1/NmE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Pt18ZV9To8qz2gP0wJdLkkOPWbwpp3EpyAwoXTzxLfY7a99SgjtkSdot+TIEBq4c+G
	oDoSlcqrXRwOL2n/uyJ5b0qjbYvhQ1Lv1FIQdWFCA413vYQ7cqIhnfmBdyyZXMZLHzyc
	5AxtdmGb9zipNYPc7MV/lycPIls2RFGXY+gAE=
Received: by 10.151.39.21 with SMTP id r21mr1358690ybj.296.1299135174205;
	Wed, 02 Mar 2011 22:52:54 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g27sm595767yhc.8.2011.03.02.22.52.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 22:52:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 22:52:41 -0800
Message-Id: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH V2 0/6] Fixes to get oe-core building
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
X-List-Received-Date: Thu, 03 Mar 2011 06:54:26 -0000

Hi


The attached patches are needed to get the OE core to build
Please provide feedback I have already incorporated the changes
requested thus far.

V2: Fix the sanity test case to check for new limit
    Add patch to link gcc cross statically with prerequisite libs
    Remove do_compile_prepend from sqlite3 upgrade

v3: Drop spurious dependency on ncurses-native for sqlite3 recipe
    Check if /proc/sys/vm/mmap_min_addr is readable
    Fix rpm-native build issue encountered on ubuntu natty
    LINUXLIBCVERSION bump to 2.6.37.2

Thanks

-Khem



