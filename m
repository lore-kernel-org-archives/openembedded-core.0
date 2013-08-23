Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 493FF6A5A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:38:52 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id uo5so926585pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mvVBLcoxIefhnk9LFw8fz09SUsMp70mqaXO2YPajvXA=;
	b=Wt24qJ0fCwgzU+9l1TxQfPMN/hNay7Ef1WaUtqBJzmgpvlXzl1qn1BkRY+zB26Vs/m
	ve8yHPJyVMQ5EfnoUO6HFj9ITL+2BB+eu6jnVW6twJWzfH+XQ4seNQcMDMO7fSxmB+Jx
	BO8tuN0U0gEYxkMxc/cangT2ehvBEEYRNw5c39HsYEPe+dq6zaGBZialT0ZCOy1LvX6L
	nWdfUBf5/BQ/er8M/EqMOtUzhOo/ipK9sYSfoohyF5A+fcdKUTvNHHmBAzDyWk1m8sJk
	+iXcTF677h079dvwAbftWMPpBbMS3mYIsZArdRwe1reN6ynCMkXqA7iEsWUyZEx038+c
	i9xw==
X-Received: by 10.67.1.41 with SMTP id bd9mr103154pad.116.1377279533193;
	Fri, 23 Aug 2013 10:38:53 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id pu5sm2322877pac.21.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 10:38:52 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 10:38:55 -0700
Message-Id: <cover.1377279474.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 0/2] Add ca-certificates recipe
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
X-List-Received-Date: Fri, 23 Aug 2013 17:38:52 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is based on the meta-oe recipe, with enhancements, and prepopulates the
certificates for the nativesdk version, for later use in the
buildtools-tarball.

The following changes since commit 9b05c65450526522d7358d0c0901b594de546748:

  sstate: Fix the relative symlink replacement code (2013-08-23 16:59:04 +0100)

are available in the git repository at:

  https://github.com/kergoth/oe-core.git ca-certificates

Christopher Larson (2):
  ca-certificates: add recipe (version 20130610)
  nativesdk-ca-certificates: prepopulate ca-certificates.crt

 ...01-update-ca-certificates-remove-c-rehash.patch | 46 +++++++++++++++
 .../0002-update-ca-certificates-use-SYSROOT.patch  | 55 +++++++++++++++++
 .../ca-certificates/default-sysroot.patch          | 55 +++++++++++++++++
 .../ca-certificates/ca-certificates/sbindir.patch  | 20 +++++++
 .../ca-certificates/ca-certificates_20130610.bb    | 69 ++++++++++++++++++++++
 5 files changed, 245 insertions(+)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates_20130610.bb

-- 
1.8.3.4


