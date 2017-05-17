Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id F2BA971B86
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 07:59:02 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id g126so4438449ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 00:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XfBQ4AkNpRpbZqRq/PPctwP1xwQFWH6lgnrGXUmGsrA=;
	b=jAOilu8yFjt3dsgIgBMBpfscKvZZZjBqG4Jhkt9nDveelaBrfGyVBj3JiI+NxFufLS
	iTFD8P+Pzls2LQeuF79g6Oi4vPtQ2tpgmH8jXj2j0IPMOBykgLYdZaevOe1BHZyaS5+p
	x2pv4i1f9lA/dRX8l7WwkDZf4gseHoaK4YhYZoghw5KNRKgfKVTX6Pzfz/Pa/L6AoSbO
	YuqyVmfdWX0wjIaQ7OJtcg+X34aPRMICJuGCm46X6M9d9C7FIzeroKrp7+SkWeo93j0k
	5I35iwvVCmjGrDUOMF0WHPHgfQiX4lD6bwVwWrdWa2G7zOCeh008sIkAinKnGu/fwLxx
	AGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XfBQ4AkNpRpbZqRq/PPctwP1xwQFWH6lgnrGXUmGsrA=;
	b=quT0X0/9B9hoXlDm7Ef1M75CyGYDN5UfsJ+kwFYkMoca+u/syOpNu0J/9IdCDSxr4y
	re9Az47eVKueExkUT87tq4r2Fr2wn/U4cgS5BPtCSGQaAHwlS/gnorchjWx3WkzFUfsx
	sukfEk1dmy8Ip1eA5QNvqvQ5o48qh1VtNS3p02+y3gZMl2RRnfwH/GFqM432rdMDbi5J
	vH3q7uElNWWfHTsw222uRyteFKGGHWq3cXcSGk3Gf4xIy+KVMvIjPBd1s4/w/CaH/h1b
	lG8fVh2VHme3lAKvicivhsuRJp0uXg2xA10PhALwgnq+2fWfWG51NF0wovxlE1veQn8s
	krRg==
X-Gm-Message-State: AODbwcBk4mtZlFGcW1o3O7Xdj2kRSEE2kXCNl20CvD8UE3gmgfeBY9Th
	YWSm0XI9yJUqG/77
X-Received: by 10.36.48.144 with SMTP id q138mr2877832itq.14.1495007943923;
	Wed, 17 May 2017 00:59:03 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F2FD.dip0.t-ipconnect.de.
	[93.232.242.253])
	by smtp.gmail.com with ESMTPSA id i74sm7109100itb.5.2017.05.17.00.59.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 May 2017 00:59:02 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 09:58:56 +0200
Message-Id: <cover.eea09064b94ca036ef2177896c19070d316ee965.1495007905.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <1494922650.1179.301.camel@intel.com>
References: <1494922650.1179.301.camel@intel.com>
Subject: [PATCH v2 0/1] development vs. production builds
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
X-List-Received-Date: Wed, 17 May 2017 07:59:03 -0000

The previous revision of this patch series showed what could be done
at a distro level and image level. It was not suitable for OE-core
because it encoded too specific use-cases and the usefulness of a
distro-level switch is questionable.

The image-level mode switching however seems useful. This revision
focuses on just that aspect. Instead of pre-defining certain modes and
their meaning, only the generic infrastructure is left.

It's still a separate class for reasons given in the commit
message. That could be changed.

Changes in V2:
- dropped "build-mode" DISTRO_FEATURES
- moved "development/debug/production" modes from actual code into
  comments

Patrick Ohly (1):
  image-mode.bbclass: common infrastructure for choosing image defaults

 meta/classes/image-mode.bbclass | 66 ++++++++++++++++++++++++++++++++++-
 meta/classes/image.bbclass      |  2 +-
 2 files changed, 68 insertions(+)
 create mode 100644 meta/classes/image-mode.bbclass

base-commit: c59fa3bd71b42410bf032846ee8fdb6e6eb1b95c
-- 
git-series 0.9.1

