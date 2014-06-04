Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7B19E6FA73
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 01:28:08 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id i57so5793306yha.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 18:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=/xmzpBAQ0Nad5Hm82+eFN9sf/LrOwp0l5w6nZaYgcpk=;
	b=XFC38IjdK2fEUhLJEkfdiScjnON3H8JiWZQfrpMZ/td6XTaOYk1YDNo3PXAhC/CCBE
	3OsKb0FIlrVFAdMRmgUAIscUcOEQikPfAo7uwPnAo2OxSP0J4HEaAjvJ0lEVJGX4r9mu
	m7rIZO2YYfphrDg6Ws7Q1tElSBEhUH0kFI0ztedlEplmedXX+eBuQz6XqKOK44oLD0EH
	A31n12jJFl+FycULIB34UcJHlGqqqVqHzgxDfqCU4d53FXXseEshgjn5QYkhm/i0d05U
	TnCOiszEko6e97Frr7CuOSHVDFAfhRpM1lX24Li0cHXQjBLl9wDRieNx6x9cq9f3e3no
	1Nlg==
X-Received: by 10.236.15.102 with SMTP id e66mr68256000yhe.69.1401845289551;
	Tue, 03 Jun 2014 18:28:09 -0700 (PDT)
Received: from localhost.localdomain ([201.53.220.23])
	by mx.google.com with ESMTPSA id u5sm1540089yhg.25.2014.06.03.18.28.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Jun 2014 18:28:09 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jun 2014 22:28:01 -0300
Message-Id: <1401845283-7941-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 0/2] wic: small fixes to look in all layers and get plugins
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
X-List-Received-Date: Wed, 04 Jun 2014 01:28:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

As pointed by Adrian Calianu <Adrian.Calianu@enea.com>, these two
patches introduces no functional change. But fixes two points: 

Bad identation of 'for' statement and the case when wic is running 
as raw mode, so BBLAYERS is checked before use.

Thanks.

João Henrique Ferreira de Freitas (2):
  wic: default plugin type directory should be added only once
  wic: check if BBLAYERS is valid before use

 scripts/lib/image/engine.py |  7 ++++---
 scripts/lib/mic/plugin.py   | 11 ++++++-----
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
1.9.1


