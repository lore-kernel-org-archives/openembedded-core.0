Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC1C601B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 08:30:42 +0000 (UTC)
Received: by igvg19 with SMTP id g19so112818669igv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 00:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=E09LuFKlChOaIeDeV54R9v1frBRhKoqz7CSWn7DKWzk=;
	b=pAIrLlxit1anwwW8tVCSt3mIKYtoqXxE76eWwWDqbTTerQuTBqgwy6MwKz82sia038
	LjtTLPC9GLqGgg2lW+LWaAS0+NPs/hor7usq5ijqeO2/hDjxHvAmHyZAdcLsF1NaNWnp
	Sh4y9ED2EWkEXmh9MnjvGYlYcsbeNFchemq6BI0Ja/B/J0+a4RNuezfNTZ9QW4ZRCVg3
	PQ2MIda3LJj7eGdBJcJRSXNAoIvtE65PhXF40tbIGVu1nd5R1lHF8YEiZqJTi8Ru7i9O
	B8wp2MK+bE4nSawZnUvqPvO5GdEzgEiS9A3RKG2AduOvh+OcCLEKPslkS5WUJlhesoBN
	ik1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E09LuFKlChOaIeDeV54R9v1frBRhKoqz7CSWn7DKWzk=;
	b=JHZVTvubEJGCWa0Uz0GSdE/T2HMFgrcAKxZBO6jA/Y7OYn+bbNKuLZ2Qg4RrOqonFF
	BoDDSrVYIkO1BaQ+5++ZAbsVmq6RlD5njixPUGRdHHApcs8/VGEiKAy3jrFilrKScO4i
	vC2Pfyz354UYq03Nj4RMhmRxsGrtYc6NXcop3d03nQBsXLNReXVtmWDXPhJXVPZ+DEH/
	9RWc33YI+yyW7g2HmHfExmqvtltdsqH9sq/9woAq18lZyFpW1Wqhuswr707LGLQtrmEX
	LPJs5EQrpW9VH269BNMe2gOF0QVNOXXaq/qDB3PdXtyVGlzGO8QKT7ewo3V4HNooE8co
	No9g==
X-Gm-Message-State: ALoCoQkIByICnvzqgxYN5wK+WQjemEp3ePaEwoKJ4fdHjOd54Q6nd42wqyI8mNEwQmRo6ab8vMQC
X-Received: by 10.50.20.36 with SMTP id k4mr2839655ige.87.1448440243569;
	Wed, 25 Nov 2015 00:30:43 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56CC0.dip0.t-ipconnect.de.
	[87.165.108.192]) by smtp.gmail.com with ESMTPSA id
	i69sm8398302iod.27.2015.11.25.00.30.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Nov 2015 00:30:43 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 10:30:28 +0100
Message-Id: <cover.1448442869.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: paul.eggleton@linux.intel.com, alexander.kanevskiy@intel.com
Subject: [PATCH 0/4] extend buildhistory
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
X-List-Received-Date: Wed, 25 Nov 2015 08:30:43 -0000

The initial implementation of YOCTO #8138
("buildhistory-extra.bbclass: store more information about a build")
had some issues ("kconfig" file not preserved) but more importantly,
additional changes are needed to support also gathering information
about native recipes.

I am proposing to include only the "buildhistory.bbclass: support
extending the content of the build history" patch into OE-core.

The original buildhistory-extra.bbclass and the modifications made to
it are included here merely to provide the context for that change and
to publish the modifications.

The following changes since commit d0f3f3a294d509560bd12b93b26eeec65cfee314:

  package_manager.py: Delete installed_pkgs.txt file (2015-11-24 15:55:33 +0000)

are available in the git repository at:

  git://github.com/pohly/openembedded-core buildhistory-extra
  https://github.com/pohly/openembedded-core/tree/buildhistory-extra

Ismo Puustinen (1):
  buildhistory-extra.bbclass: simplify usage

Patrick Ohly (2):
  buildhistory.bbclass: support extending the content of the build
    history
  buildhistory-extra.bbclass: more complete and reliable data gathering

Paul Eggleton (1):
  buildhistory-extra.bbclass: store more information about a build

 meta/classes/buildhistory-extra.bbclass | 127 ++++++++++++++++++++++++++++++++
 meta/classes/buildhistory.bbclass       |  13 +++-
 2 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/buildhistory-extra.bbclass

-- 
2.1.4


