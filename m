Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TCI03-00084W-4p
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 00:35:07 +0200
Received: by daks35 with SMTP id s35so1882621dak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 15:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=qBkv1qAP2fZzbzGV341HOJs0qKoAc4E2+HL28ARhjLU=;
	b=OK0Qc5u7XR+IpvV8fxejZxC10crz35GW6vsKIiMFAdAxNI8Da/wbnO/2o2VCK+sQYc
	vcjVcvBDpOqBdxHxkaWYrvHzXUP/wWxVetoqHUSmo7eRFvNZ2kyicJppX34rbWocHZTf
	KsGAkygjSQ09uzVQ3d2qgYNvEG1gy7ozeObWsDGCWIl3x3klfhcrqbeYtLo15HpdXLwN
	wWvdSR7pY36ZVPo/z+xMZ+bZl06WdBW23iHasScHG6Hec4UDsjAUA3Ijo5KvluN3OhB+
	Kfd1EAXume07ry/REHQM3NWq08+FwwhgM7LAeWITtYtUeQ99hTvUseKlDzhlZvXMKaNQ
	j6DA==
Received: by 10.68.130.67 with SMTP id oc3mr1679849pbb.18.1347574943419;
	Thu, 13 Sep 2012 15:22:23 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id io1sm13753784pbc.43.2012.09.13.15.22.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Sep 2012 15:22:22 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2012 01:22:12 +0300
Message-Id: <cover.1347574891.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkTsrlVi092tnL/lO3gEWLAbAP5yWXAkBXpblTTOx/3j2d3GstcQK5+bqwopFaJ3tRssmSR
Subject: [PATCH 0/1] Update to taglib v1.8
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
X-List-Received-Date: Thu, 13 Sep 2012 22:35:07 -0000

The following changes since commit 7401ed019196313a7ae7cab0b9f3820356cfee29:

  Update to upstream_tracking.inc (2012-09-12 17:56:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/taglib
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/taglib

Andrei Gherzan (1):
  taglib: Update to v1.8

 .../taglib/taglib-1.6.3/configuretweak.patch       |   73 -
 .../taglib/taglib-1.6.3/nolibtool.patch            | 5916 --------------------
 .../taglib/{taglib_1.6.3.bb => taglib_1.8.bb}      |   17 +-
 3 files changed, 8 insertions(+), 5998 deletions(-)
 delete mode 100644 meta/recipes-support/taglib/taglib-1.6.3/configuretweak.patch
 delete mode 100644 meta/recipes-support/taglib/taglib-1.6.3/nolibtool.patch
 rename meta/recipes-support/taglib/{taglib_1.6.3.bb => taglib_1.8.bb} (56%)

-- 
1.7.9.5



