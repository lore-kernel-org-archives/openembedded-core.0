Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U09LT-0006Po-Lo
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 12:27:21 +0100
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 29 Jan 2013 03:11:38 -0800
Received: by mail-we0-f197.google.com with SMTP id t44so391685wey.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 03:11:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=ZyR8LAhgC0jkLMLwmt/ehtYNvU/+LP6kCM/POrnrcyw=;
	b=dSrIcT35HiXhdo2iU0jQT5JDq0+HX7iDg7/0QyD/oGvCc4Bf6qNOaKpo5YyNXdgxMR
	0mOtEfrzObuufeLQH3shCD+TLxWbBUG6N+Kodz2xvprwiLkyj2sVKcYLCXmVgqg4od1T
	dcozXVx5lPOxh/cWl73q/GH8ItrUOAzqpAZlwQG5h32Xso26RfQdzNWnjoCgGyFXhoYc
	ChTtBKfwzq/HSz0LAo/32wcMN0vHc4Kd2QhPmkKfs8+aDRIDfPfsmn48Sep9l5tPXSdF
	3T7Vd6Y2Hy0dQdxAXbGD7kW5dxLDsauCQ+DXwpKOhZqln93CsaeO0tcS/GkN3RD8kPf6
	OFNg==
X-Received: by 10.180.82.41 with SMTP id f9mr1584629wiy.25.1359457896276;
	Tue, 29 Jan 2013 03:11:36 -0800 (PST)
X-Received: by 10.180.82.41 with SMTP id f9mr1584539wiy.25.1359457895377;
	Tue, 29 Jan 2013 03:11:35 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fa15sm2576633wid.7.2013.01.29.03.11.33
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 03:11:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 11:09:29 +0000
Message-Id: <cover.1359457685.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQm6dAfg9KmTkdZ5EWf4g4VFNySncHpli+PRNIE+paOizZaguDFuW5j5Ncfi+FQ+V6vFiGRREaUkwLreeEt8AiwbzSwn3htDVxTZKCEE1UTc1WRs2AZ4nIwy4puHuIpPJjL7svjIYOtl/edAwXOqLEfzT7cCMs0WmloqugcJbFrr0XJPrVW/dAHITl0mnBvbQ7RwEQon
Subject: [PATCH 0/2] Remove metacity and libcanberra
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
X-List-Received-Date: Tue, 29 Jan 2013 11:27:21 -0000

Hi,

Metacity is the GNOME 2 window manager, so unused and untested in oe-core.  It's
now been moved to meta-gnome so remove it from oe-core.

libcanberra was in oe-core solely for metacity, so that's also been moved to
meta-gnome so remove it from oe-core.

Ross

The following changes since commit b2869b6810728a5f003ddad335fd7f6512181a57:

  ref-manual: Added a general reference and link to kernel-dev (2013-01-27 13:56:06 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/removes

for you to fetch changes up to 1f1304ac51438de46cd47c0fdeb9f7471c77f016:

  metacity: remove, migrated to meta-gnome (2013-01-29 11:05:31 +0000)

----------------------------------------------------------------
Ross Burton (2):
      libcanberra: remove, migrated to meta-gnome
      metacity: remove, migrated to meta-gnome

 .../metacity/remove-yelp-help-rules-var.patch      |   28 -----------------
 meta/recipes-gnome/gnome/metacity_2.34.13.bb       |   30 ------------------
 .../pulseaudio/libcanberra_0.29.bb                 |   32 --------------------
 3 files changed, 90 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch
 delete mode 100644 meta/recipes-gnome/gnome/metacity_2.34.13.bb
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb

Ross Burton (2):
  libcanberra: remove, migrated to meta-gnome
  metacity: remove, migrated to meta-gnome

 .../metacity/remove-yelp-help-rules-var.patch      |   28 -----------------
 meta/recipes-gnome/gnome/metacity_2.34.13.bb       |   30 ------------------
 .../pulseaudio/libcanberra_0.29.bb                 |   32 --------------------
 3 files changed, 90 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch
 delete mode 100644 meta/recipes-gnome/gnome/metacity_2.34.13.bb
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb

-- 
1.7.10.4



