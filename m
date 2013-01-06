Received: from mail-la0-f49.google.com ([209.85.215.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrxAS-0002J8-1b
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 21:50:06 +0100
Received: by mail-la0-f49.google.com with SMTP id fk20so13375059lab.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 12:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=knLDOQY6gOuD+i5K6pW1smmM/XJDETkLxdFaF9jc8Fw=;
	b=erTFHjHAhLiGqzyI1QTP3jcn3CpoJdfmp6gAOgN2yeRn5x2qd7SePAjtgphO/Q15JP
	9hFy0dtq09v4HDrg+eH2U+JS1FaMkvqkss9D9FPUuGAYGxzLgZYC0DLGqtYQVtIhnGHH
	r//6yfFRTBzQCbJ4fZi6pIsBiCrNtGDBcXFf26mKnnu2UcQqKpLe387nmZ2RCL+Bvfb2
	7ZlA44fymLFlQvjBdYugoQMtzaA22xce4EPLCT3OGhMv3gwCq4XzGDOS+Hv2StOjqkwi
	ItR9YqywLSG31CWlGzk4RTimZTfZUkdYWmC0M9QDEmDJMhOAV1aSh1AStZXlhuo5We03
	SWDQ==
X-Received: by 10.152.131.168 with SMTP id on8mr56127097lab.38.1357504495829; 
	Sun, 06 Jan 2013 12:34:55 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id sv4sm3289653lab.0.2013.01.06.12.34.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 12:34:54 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1Trwvk-0000lA-R7
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 22:34:52 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Jan 2013 22:34:50 +0200
Message-Id: <1357504491-2878-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: Introduce HarfBuzz recipe. v2
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
X-List-Received-Date: Sun, 06 Jan 2013 20:50:08 -0000

Added glib-2.0 to dependencies. HarfBuzz configure silently disables
some necessary parts if glib is not available.


 - ML


