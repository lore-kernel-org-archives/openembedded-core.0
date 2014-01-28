Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0A76A6E7EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 14:26:12 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so267128eek.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 06:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=vKDtehVVbfHCiJaOPiTrWXS1GHeIn1QpcQVq+QEb2lk=;
	b=f5U7A4oSBDCal1JsEXOP6I2BEXM2YqhgylPEDQYoDl6n17lIsf5IJD/62CF18sk3Jy
	kI4+S9yIjcSlg6nQAIAjHMs0gm6s+tSR8ygD/ds/JzyDmsB8GqMIyu/V7MHPxfa8QseH
	NOdxRU1v6NXetAQTbOYGi0PL/0aTOnL1Ts8ZNUQ6aH6VbQ2/zHbmCpX/Ph6Qe1CJGGkd
	XbWVkdxkwnFOrSj6hgIdc68WOK5Nr+kfp9fLH0oDc5m10cL3xn+vS90Dmv/UcXB/wGPB
	1jppX44ILVNARdzFG81Wiinc9jE3sYr0LQBUSELR7yEPamRlo3QMvLbm4to8k9jnAbJA
	HWyQ==
X-Received: by 10.14.127.72 with SMTP id c48mr2240881eei.16.1390919173311;
	Tue, 28 Jan 2014 06:26:13 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm34714735een.7.2014.01.28.06.26.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jan 2014 06:26:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 15:26:09 +0100
Message-Id: <cover.1390919033.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCHv3 0/3] shlibs providers improvements
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
X-List-Received-Date: Tue, 28 Jan 2014 14:26:14 -0000

v2->v3
changed the order of commits so that controversial SHLIBSSEARCHDIRS is last
fixed typo prividers -> providrs

The following changes since commit 091d395e43836575587112ee1696a18c401505bb:

  lib/oeqa: sshcontrol: Allow alternate port for SSHControl (2014-01-28 00:48:29 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/shlib-providers
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/shlib-providers

Martin Jansa (3):
  package.bbclass: Don't search for providers of PRIVATE_LIBS
  package.bbclass: Show which files require given dependency in debug
    output
  package.bbclass: add SHLIBSSEARCHDIRS to define where to search for
    shlib providers

 meta/classes/package.bbclass | 49 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 6 deletions(-)

-- 
1.8.5.3


