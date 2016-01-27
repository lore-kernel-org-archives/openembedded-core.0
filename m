Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6E077187
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 23:28:43 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 66so658295pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=q5Cy3GTMhU1unRXWi8a7QUfzu4htTigddZX1C5DD72w=;
	b=Rfz4CA+JPeIQZoQiOIx4FvWBXxWO2ppSh+pRSXi2lNoghGsWDjcs5iesAmmjUat+Zt
	apVMLnoUGwTM1aFrhKRLmBN9WbAoC89FB5Kf6xAD+DhlMPaJOKN+U8PceOQ5AcU0dpNW
	hRBO5MHOa9KMBqgoXkvJheH++FgI/BQnRAKwRGqMINWmZ3nYyZH8S7M7/dl3ew5ewsmd
	kIm2vOz29LwWv6lZah8T6HYuqwqvL/MgPy928eKRdHIhtqkPzPzcNIZ/e0DGExqBQCIn
	DFeZjIuGxATlrFYuumzmR0KL3R8e1/9bbNXhxrHCtaCgVklRHTgrHisnonMGUliEe/uI
	RvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q5Cy3GTMhU1unRXWi8a7QUfzu4htTigddZX1C5DD72w=;
	b=bWCJSDoE7QIgivoOfbJg1krXVtg9eoO93fERGfk/agK1gnyEsj/JCC0ufeZEbmHJoN
	esKiJI0E60OdjxKqaLndJP3hAKNSRy/Nq6K4DssFgp9LtREp1t/E+A331FVMBF7JLXLC
	PgKo3T9RvXG9KMFHQqcD7N0+4DbygJVFSVeFDz/j05lDqFV8yt40GvikEv53dWUDhDJD
	d+rU7frUn4P6mtNh6yxaT6ce/CajyCNsOdwPQJJAWQH0kSYZHKE/tG6AHzXvrAHVKGYu
	knwRoWUFMgXOMjLqxnliENy1sKU86s9EeP/LYuLjzw2wyC+daah3X/lBMMILfh4KgTLu
	0PkQ==
X-Gm-Message-State: AG10YOS7mnrSH3SYKfvucFaAqguQWHz6paiRlksL9H/km6GwspdtEQb622ZPuE99sUhlWA==
X-Received: by 10.98.16.72 with SMTP id y69mr46260544pfi.95.1453937324600;
	Wed, 27 Jan 2016 15:28:44 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	h66sm11422372pfj.52.2016.01.27.15.28.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 15:28:43 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 15:28:33 -0800
Message-Id: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] glib-2.0: minor fixes and updates
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
X-List-Received-Date: Wed, 27 Jan 2016 23:28:45 -0000

Andre McCurdy (3):
  glib-2.0: refresh configure-libtool.patch
  glib-2.0: drop add-march-i486-into-CFLAGS-automatically.patch
  glib.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5

 .../add-march-i486-into-CFLAGS-automatically.patch | 39 ----------------------
 .../glib-2.0/glib-2.0/configure-libtool.patch      | 22 +++++++-----
 meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb      |  1 -
 meta/recipes-core/glib-2.0/glib.inc                |  4 ++-
 4 files changed, 17 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/add-march-i486-into-CFLAGS-automatically.patch

-- 
1.9.1


