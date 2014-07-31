Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 35F5F70478
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 21:38:12 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so327081wib.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 14:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=J4DxR6lcpDmjZYCn/DTCyq5W3z905X/27qQd3GCLxco=;
	b=y/68FseyhUSdomgw6u4viaADV4n/X8ywm9PaGKkhDBlKT8lo9uJzMZQkd9YozrKgSX
	Z6V0cFKOK4hbqMRUE1VW8P4qAaQVEa7KqsrbL1LXqiN+vCI5TE/adxx6RNaWaEkrUU6X
	j67FOXfIYO6hgtxrN78S1YcDV3b5VJg1WvPQWaY0GFS+cNCHDLBBpnKu6fjI6HOjIuDA
	EwvoI4Q+PTS4QZT1MsZAzhOAzZnGa7a0OTk0BnaJKbV5zGuwPYhYZiMs6KU8txEhMEXr
	fjj6NThZpMD9SmRh16GHoDTENNPVQhFkTP/KrkHDujF11Vl3thaAnYcKxw9lXWpXZKiH
	4NjA==
X-Received: by 10.180.221.172 with SMTP id qf12mr762705wic.18.1406842693057;
	Thu, 31 Jul 2014 14:38:13 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	wu6sm16048465wjb.46.2014.07.31.14.38.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Jul 2014 14:38:12 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jul 2014 21:38:00 +0000
Message-Id: <1406842681-21669-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.0.3
Subject: [PATCH] opkg-utils: Update SRCREV
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
X-List-Received-Date: Thu, 31 Jul 2014 21:38:22 -0000

This update is needed so that the patch for opkg-utils sent by Tom Ingleby at
the beginning of June takes effect in OpenEmbedded. Sorry I lost this and forgot
to push the SRCREV update, many thanks to Saul for reminding me!

Paul Barker (1):
  opkg-utils: Update SRCREV

 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.0.3


