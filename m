Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8F46013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 13:53:25 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so20249777igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 06:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GVyRwAN/xvbO1ZFDOcOk9GizL9AF5gPag/p7jnpTL/Y=;
	b=VsyIkbSoz5dG4VSeK5KcvuyM35Wi4VFAJd+kPs7TU+Fbib4gPLF7OEjkVsIVOhnscA
	uFWeQqILP9zyH+2fQXpU0E8/0eSft7v5QumsPdpKP46ZcJTd/PPGDv/HfKv/+PZIXIsC
	PXsSj7Di3m0e9iYmtrVnAEVov1WRMVLZQpEfJTN9CCIFHR3MTmQ2lUiSQ78RmWl4oG7B
	7jC4lhrLjPLtK9uetyD8CjeHd8PNhnRbgLndky7tbgbe2fzc5y8Jw1L4owGZ1X06UVrn
	7u34+EuwMpMDQ9jmkSSQ3h8b+MBPEbZd2gya0Gh8TWikiawdPdF3jGFUiv801V5R/Frv
	iuOQ==
X-Gm-Message-State: ALoCoQl+c/Cgw7omGb/zLUU0u+dUhq3XHOPbD6bLjxocz2v0GJaDcSq3DKvV9w2J54vjrYHcEQ07
X-Received: by 10.50.137.99 with SMTP id qh3mr45603985igb.9.1427464406237;
	Fri, 27 Mar 2015 06:53:26 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p57A56214.dip0.t-ipconnect.de.
	[87.165.98.20])
	by mx.google.com with ESMTPSA id k82sm1366606ioi.5.2015.03.27.06.53.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Mar 2015 06:53:24 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Mar 2015 14:53:09 +0100
Message-Id: <cover.1427463906.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] combo-layer + file_exclude
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
X-List-Received-Date: Fri, 27 Mar 2015 13:53:28 -0000

Applying the new feature to additional repos highlighted some issue.
Proposing for master, but would also be suitable for Fido.

The following changes since commit 2d923d6dfe9431dbc005f8ba39838eb4519c471c:

  python-pygobject: Disable parallel make install in native case (2015-03-25 12:38:44 +0000)

are available in the git repository at:

  git://github.com/pohly/openembedded-core combo-layer
  https://github.com/pohly/openembedded-core/tree/combo-layer

Patrick Ohly (3):
  combo-layer: clean up dest_dir checking
  combo-layer: fix file_exclude for dest_dir = .
  combo-layer: fix file_exclude for empty commits

 scripts/combo-layer | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

-- 
2.1.4


