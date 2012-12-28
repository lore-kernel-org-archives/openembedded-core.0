Received: from mail-bk0-f49.google.com ([209.85.214.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1ToQAn-0003j8-NF
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 04:00:09 +0100
Received: by mail-bk0-f49.google.com with SMTP id jm19so4575966bkc.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 18:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=Xii8EmoSmhL3Vyd7BwUHFRgnnhluQZ4JupaAx49QOAY=;
	b=gC77LVUZk1M5B6twSslcgEmSE5H/kPWUAimOL6+mELeo9+vilbsn/vHUTfTQS01f8P
	O7xdKMYSZIniN9x3yW2d3SkC+w4w7oycPegb8Gk7Z8RdE5ISGZwuXZYT1CAbLJT/j+6s
	XbAnAjumkoMmts2j1VgNWdQf/u+n6SbSEHRywNCxjRleZme+FKzSAl3x+UYwgIL+mCBJ
	I7Qg19Vio7jejk6CUiLFwu6USALTHOTtLhzp8BJzR9djwB4ZwgMo7lOqqJtwLV5Gx+2O
	eWEu9ogkoa3o9VYkSuLU13fUjyP4jNCVdVPa7aonwd3CLvszkt/Ey+WHJ9KdQAxQBgu0
	TfWg==
X-Received: by 10.204.149.88 with SMTP id s24mr15909612bkv.14.1356662694811;
	Thu, 27 Dec 2012 18:44:54 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id c10sm21816443bkw.1.2012.12.27.18.44.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Dec 2012 18:44:53 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1ToPwJ-0007DU-To
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 04:44:51 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 04:44:49 +0200
Message-Id: <1356662690-16034-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: ICU update
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
X-List-Received-Date: Fri, 28 Dec 2012 03:00:09 -0000

I'm trying to update pango to 1.32.x
- It depends on HarfBuzz (new recipe)
- Latest HarfBuzz has linking problems against icu 50.1

Updating icu to 50.1.1 makes this whole chain to at least
build. Latter parts of the chain need more work, but here
is the icu update already.


 - ML


