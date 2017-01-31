Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9400860621
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:50:49 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id j18so130320695ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 04:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KR/twjsYWLW8grAYjfJsQxm7cUnF+O7FcQBBZOsRlOY=;
	b=0OurtxyN9Hsm7vSXmJl/DfkDsNX1jPVE6voq0GNQuKw7G7RmTebxt4Vech9FR6iYP3
	FmQV/OLPqe8ceFuw79KWwksavPkb9enj+vnsjOyjTY9djWL+OWoEiRCJ/3w3C8JqEs9V
	1h7IHt407cw1Aqu3p48Qz2k6DdYnwONF7hf2l9WC8XtcTF4kZK5abdlL+Xe+M8LZNS3y
	sINSQN+2oBE+f4tICEJqCMdrgOiK3EJiUXrJ5IUsKqDF+CnFShP+BH1sDrZYXvDhI4JK
	VmYZaQMnmZpf2mG67tgP9tI0CR5BFy4OorfcXLrTZz6x3BhSbLqSfA/6CCVDrDW4VXIl
	RjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KR/twjsYWLW8grAYjfJsQxm7cUnF+O7FcQBBZOsRlOY=;
	b=JG3DB+gue9XSyLs/TPCVIVUkBxyYqqOGDR1dQdAn8M4C9D/ILK9BuXLksw6WmdyAze
	spqvTvbjxsXgwanTqrvqKFvsXTKnMIn3PQ/v3Em7UdDSfDUpqqFhxq33SDxzwn+8grAS
	9FYVfER8nOG4Wixt5bhLmkIzlg5Lgnc0krWlcXqHuaxo9RkF34gWj6ymCL53u0K4pnML
	h6e8590YtWHzNMfZYFVXPmaQUASyWco+VlEX4y8GIjk+SMOoYMJFT8D0G7I7JyH9yFOP
	j2LcV+0Q0QbSmHcckJjeK0/pDzmqoBgFnBpvtb3DjIYyaZak/PYxLpbY+w1Ox8rHV9lG
	Ob3Q==
X-Gm-Message-State: AIkVDXIDhRsCrOopJZrZn3eVtu1ny9J+qyJ+CGTVh0XilbA0+8XH3XuqNgNMyFtuxHPGbPYg
X-Received: by 10.107.161.83 with SMTP id k80mr21806735ioe.47.1485867049598;
	Tue, 31 Jan 2017 04:50:49 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DFEB.dip0.t-ipconnect.de.
	[93.232.223.235]) by smtp.gmail.com with ESMTPSA id
	l31sm10051399iod.17.2017.01.31.04.50.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 04:50:48 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 13:50:28 +0100
Message-Id: <d20d08fc9249074f262c7de90da6150b5c0abd80.1485867027.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
References: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
Subject: [PATCH 3/8] verify-bashisms: explicitly shut down server
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
X-List-Received-Date: Tue, 31 Jan 2017 12:50:49 -0000

Current tinfoil2 requires manually shutting down the server.
Without that, the script hangs during exit. This might change
in the future.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/verify-bashisms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index 28795f4..ed0a563 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -114,3 +114,4 @@ if __name__=='__main__':
             for message,source in results:
                 print(" %s\n  %s" % (message, source))
             print()
+    tinfoil.shutdown()
-- 
git-series 0.9.1

