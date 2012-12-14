Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjWra-0001Ae-PS
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:07:49 +0100
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 06:53:08 -0800
Received: by mail-fa0-f69.google.com with SMTP id v1so2812177fav.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 06:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=+wleZXKsrIyHajd9JyRRDqDCKlu0OamPMJsmzAb9xao=;
	b=cohtIWCQAaK7SpdS2UR5FlEogU2USTsIbSkR5WzabEiFaP47LTisDdUUgXVs2wUj4y
	4mxb6h5UwnmXGPoFrFD7cQ+tEZxF3dIbunDBGfJysKHIMQeSbKYEVhpe25wCID2VcHtW
	XY+O0qX+5SP+5bJ11sfbMcZkT/GvPxkFnqk9yj85zX13SYbmZJvO59ETHFmodMHBXP97
	fln1XR+mCyDO4U+weVuqU8+2T6i9ZZdn6TrkxlhOYbT4DPg6vijfQgmK7n5aMvQ3UEbJ
	pgqu/fbRhnNbFKQvxd2339cvfG27HnSEQVn19qBqUkJZIxSKmSItItRI0Gwm4VEguWuV
	BsGg==
Received: by 10.194.88.166 with SMTP id bh6mr3959777wjb.37.1355496786510;
	Fri, 14 Dec 2012 06:53:06 -0800 (PST)
Received: by 10.194.88.166 with SMTP id bh6mr3959761wjb.37.1355496786342;
	Fri, 14 Dec 2012 06:53:06 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm12612555wib.9.2012.12.14.06.53.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 06:53:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 14:51:15 +0000
Message-Id: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQma0dVlTG+CnXWSyxlgFpowlyhiQobGc4G6WznpU0OIAilIQ0TL5/QrBkv+aQBj3ybDOuWpa2r7+Zup+WpnrtEp1hRlePIQLiro/b45NhzZd47i/zBewmaWwtY6ATEffCebc4hnzW3su2XxVvi93eW7zqKShEpWZr9mTQ/is7gfRcIQwgYbCoDfl2BqIsrwNSARdVso
Subject: [PATCH 0/9] Fix out-of-tree builds
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
X-List-Received-Date: Fri, 14 Dec 2012 15:07:50 -0000

Hi,

One glorious day it would be excellent to set $B to something other than $S for
everything using autotools (out-of-tree builds).  Sadly attempting this is a
recipe for disaster as there are as many broken recipes as there are broken
upstreams.

This series fixes the trivial issues in our recipes, which mostly involves
fixing assumptions that the current directory is $S.

Ross



