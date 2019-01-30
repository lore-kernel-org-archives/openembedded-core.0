Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3CE7C2EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 15:16:45 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id t13so11162573ply.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 07:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=QoABz68CdgVzWkISA70yiyk4fOYYAZjNwmsak3nzPxw=;
	b=u11UDIjh+VsYhRQd5H3/J3hfrDS4BBzFG4mYcOJmZck6GAc46D2u0/JFfgtlGhHvDk
	zlmy1EYaKySR5WJ93lBLlyakRiWU+bi+krQRCpS8XIyXWhn5aK39G724lFL/Pf4A95L6
	hMtHhFfdTNK8+Cv1hcebUAGkiASVIqOV1A0geZ9FlM9Ztgl+UYgkPeFO7kriaT3kwCR4
	QI4Ls1Ucz/zwgmbr+Eu6l4VYnl3B4Vme0GpfV3bVjOaWtQOx3SAKOKsuGeGmgh+Dx8OT
	DPSOgLEWkh8Z96bJsk1P3NVQCQmHG1TfUtnU6J9oKhem3A/NQw+Ducuprs4fenhXOvgt
	fLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QoABz68CdgVzWkISA70yiyk4fOYYAZjNwmsak3nzPxw=;
	b=XoJWGh34g6kYgHwdI+VxczIS2YA/ilVskhWdr8YwMvCofSYrJWOLd47qas5wTerZ0h
	elK+MynGlI4uxPuLWGQAvqUzlk3YNwyBYt690fXd9+7okCqVE8XEw4PPSK/57XqDAH/J
	9L/oNP+Bkn1Rmy5ShwMoXQWGoqDmv275EplWkyWftDVK162GLrvoLLyw5N8vqVSto19E
	cO8+1kSI+bfgRasVQnm+oaC1LP6/6E7tXkrTUgFWYszJeXwHVck+eMtRekFqZT3Fxrdi
	U1VWiY9d1CYHX8NS3NQFyElMmTd6XmAtRWD13eLFPBOzOBsI52DCd2YMkHFyhb4dfeeB
	EYsQ==
X-Gm-Message-State: AJcUukdoK6CiitOyh+lKKCZvSCF7hBAaKwRl9dYdx8FNOI1Fat21s/JB
	4ut72TUz9ApStjMoykx9HbY=
X-Google-Smtp-Source: ALg8bN5VqUqF5xSbvwKLid20ygoHRNRTvQtTjOzaPpIc+VSCri5esA0kL5en4kmNtv+lyCOmdNOGww==
X-Received: by 2002:a17:902:22f:: with SMTP id
	44mr30625537plc.137.1548861406581; 
	Wed, 30 Jan 2019 07:16:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:a954:fb27:4e83:6750])
	by smtp.gmail.com with ESMTPSA id c7sm4961772pfh.18.2019.01.30.07.16.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Jan 2019 07:16:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 07:16:36 -0800
Message-Id: <1548861396-16977-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][thud][sumo][PATCH] perl: add testdepends for ssh
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
X-List-Received-Date: Wed, 30 Jan 2019 15:16:45 -0000

fixes:

 DEBUG: [Running]$ ssh -l root -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.4 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; perl -e '$_="Uryyb, jbeyq"; tr/a-zA-Z/n-za-mN-ZA-M/;print'
| DEBUG: time: 1548816904.4024463, endtime: 1548817204.397057
| DEBUG: Partial data from SSH call: ssh: connect to host 192.168.7.4 port 22: Connection refused

for master/thud/sumo

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/perl.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/perl.py b/meta/lib/oeqa/runtime/cases/perl.py
index afeeb18..be3287f 100644
--- a/meta/lib/oeqa/runtime/cases/perl.py
+++ b/meta/lib/oeqa/runtime/cases/perl.py
@@ -1,11 +1,13 @@
 import os
 
 from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class PerlTest(OERuntimeTestCase):
     @OETestID(208)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['perl'])
     def test_perl_works(self):
         status, output = self.target.run("perl -e '$_=\"Uryyb, jbeyq\"; tr/a-zA-Z/n-za-mN-ZA-M/;print'")
-- 
2.7.4


