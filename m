Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsArE-0003aE-85
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 12:27:10 +0100
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 03:11:57 -0800
Received: by mail-we0-f197.google.com with SMTP id t11so16535130wey.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 03:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=e/4iy6BPJ4CcgE/5xb3GZ+HXsM4kC38v4bVkDARyOOk=;
	b=cFxR4Pse+UtCc8YMP/5o8A2U86xM93387m3bpPa1RiQjWccaB0r3Uvn+C9ER5g79/c
	XFV99U8ubx/OIl+0KoPS/ZgZefm2uuviKUQK25ZK6aJDY+095E7ZCUpoJNaT0m9WJCBH
	5hxkko/Jxy1f0I6AFZQZt9sBi/LeLl4dEu9BlHpguKcdDG+mRiyVc2FtC/ZVJ4m4e/lG
	jsON6p3J34lvb4eyMVSJ19leTevwUhTTiwMrq+p2e+ekP2s4dGsbK8d42zzD/TbZ0Zmh
	lPLxDx1/1rKV5worcqUtCz2WMfZGUuJAC1dpomLLre52FyJzPFnFMJJCmw3BfEdhorwX
	+aXw==
X-Received: by 10.180.87.102 with SMTP id w6mr8520893wiz.19.1357557115747;
	Mon, 07 Jan 2013 03:11:55 -0800 (PST)
X-Received: by 10.180.87.102 with SMTP id w6mr8520865wiz.19.1357557115560;
	Mon, 07 Jan 2013 03:11:55 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm12993779wia.10.2013.01.07.03.11.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 03:11:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 11:09:55 +0000
Message-Id: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmOJm6fpb3eFANfSKlRTYCWnimTdOFOHjS58yDUhNhJdY7tsN1agNQioxw02vP3fpnllqLaNjs/TS1PVltInynr4BaGSOkCeawneDTazj7/3sRoqxTCXWjghp6nhYeNGZaGUGWve2bS/AdZVZVvFPLNAkTOE/YdWDgRfK0q6d2uCYwETl7UAACMeyDjyEHbHL3YOp3Z
Subject: [danny] Consolidated Pull Request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 11:27:12 -0000

Hi,

This short series is mainly to fix a udev booting regression on hddimg and
brings in a number of CVE fixes, with two other good fixing coming along.

d88bdd6 librsvg: CVE-2011-3146
c30e7e5 cups CVE-2011-3170
b91e5f6 cups - CVE-2011-2896
6f966f8 cups: CVE-2012-5519
d25e356 libnss-mdns: fix mDNS resolving speed
002ef4a Revert "initrdscripts: fix udevd in the live boot init scripts"
774b05e bootimg: Use FAT 32 for images larger than 512MB

Ross



