Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8B4E873D44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 15:44:36 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so68090058ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 08:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ig38998dh++GWOd4VlCxlgOSW/7XAf1ArtoiPkLbGks=;
	b=hxC2FBYaRZH7l0FWY8t94H9ElpKNZD4mGAkgNHQbHWfZoS6A9A1A13ylBfxx3F/oJs
	CtZrR8oLR4rmOTNsyU/F97QVjq/HpKVeXlnWFnoWEFEGEtuRzwyCKEvH3Ap6AqTY8L6p
	Gm6oevH/O/vUYX3XcLqrhzLgQxl7Xeg9XGdxlsA1mfughIs0jiuCMZLtsmmJm0Miuhns
	LeJK6zMhDHPA2tqLWu3/s+Cw8//hcP9ys3iuvyvlRdJgUTfCsI31pvF4ymO7yorwH3+O
	kyGjlvT7Ooe3cpNbjBsYwZOd5bTWFdlylFqYdlCNXBfi4NM5+XE2KLCd0rWQkf3ur0lQ
	j4NQ==
X-Gm-Message-State: ALoCoQmFH90LARU7QqOB+RkDW0hzvuMcYfIn098lkW/Iv1rU+3zn/1DpEvJrR6gVhBpuiCTDPx8o
X-Received: by 10.50.64.244 with SMTP id r20mr17690026igs.48.1428939877366;
	Mon, 13 Apr 2015 08:44:37 -0700 (PDT)
Received: from syncev.vlan14.01.org (p5DE8EF5F.dip0.t-ipconnect.de.
	[93.232.239.95]) by mx.google.com with ESMTPSA id
	g187sm5132324ioe.30.2015.04.13.08.44.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 08:44:36 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Apr 2015 08:44:29 -0700
Message-Id: <cover.1428939671.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/1] ssh host key
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
X-List-Received-Date: Mon, 13 Apr 2015 15:44:37 -0000

I had problems under qemu with getting the ssh host key generated (not enough
entropy). That problem still persists, but perhaps is less severe on real
hardware and for me. Having the same ssh host key for the qemu test machine
was good enough for me and potentially also others, so here's an utility
class which helps achieving that.

The following changes since commit a7d8eaef04c9dd6ede8d4efd8c4b776efbe3c767:

  shadow: split files needed for PAM use into separate package (2015-04-09 19:48:04 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core master
  https://github.com/pohly/openembedded-core/tree/master

Patrick Ohly (1):
  rootfsdebugfiles.bbclass: quick-and-dirty installation of additional
    files

 meta/classes/rootfsdebugfiles.bbclass | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/classes/rootfsdebugfiles.bbclass

-- 
1.8.4.5


