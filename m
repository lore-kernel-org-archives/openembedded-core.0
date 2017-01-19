Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 506 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Jan 2017 09:25:09 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC11719DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 09:25:09 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v0J9GhRf004385
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 10:16:43 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.79.32])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v0J9Gh1L024495
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 10:16:43 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 10:16:36 +0100
Message-Id: <1484817397-7308-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: Passing additional data from packages to be used during image creation
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
X-List-Received-Date: Thu, 19 Jan 2017 09:25:10 -0000

I would like to pass some additional data generated during the creation of a package to the image creation step.
The idea is to use this data to generate a more detailed manifest of what is included in the image. In the concrete case
I would like to pass a list of required copyright files that need to be checked for during image creation.

My current approach is to add this list as a new variable COPYRIGHTS to the pkgdata of each package.
Using the image manifest to determine the package this allows me to compile a list of all required copyrights.

The following patch allows to add extra variables to pkgdata and thus allows to pass additional data

- [PATCH] package.bbclass: allow additional variables to be added to

Is this a valid approach or did a miss a simpler way to access any package data during image creation?

Pascal

