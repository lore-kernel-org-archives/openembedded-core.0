Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tjb1f-0002AR-AN
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 20:34:28 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1821266bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 11:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=Y2OjdG+koLUZk2vsBJqg8tCn5GPODBbzioVL7aCLPr0=;
	b=OCC+M2Y1rSFEA5Y316QRJI3IrK0B7qeJSA9Rkgu6p3gGdiYekfvfL5cNZKnFjEnOEO
	6/bDa9kQMm2na+Cxr74v61wXVj92EVX5SZYhmukJc76u4PsVcymMf0oAOjve4rFZ6GNG
	NyjwcXQ5ohP5Hsw0/lqKl/Ol7CywosRwkFSHH90JRozD9A3e02Tq6vDmbI8JGDzpmxpQ
	tCjMLSvLdmdTgMrElqkYPnL9YfWvr6cQ4DZZNZnIeyRF/R9x8C/uQhQb4HD3NDbUlUt+
	E1MWg5trjkh+gWbJ99fzvDgKX6BbvV13VIjdL7/VJdGkiVO1BpupUJW7VZ5pC/RdD9Gx
	0h+A==
Received: by 10.204.131.74 with SMTP id w10mr3198057bks.4.1355512790632;
	Fri, 14 Dec 2012 11:19:50 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id o9sm5512566bko.15.2012.12.14.11.19.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 11:19:49 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TjanT-0001dr-G1
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 21:19:47 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 21:19:43 +0200
Message-Id: <1355512785-6255-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: help2man update
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
X-List-Received-Date: Fri, 14 Dec 2012 19:34:28 -0000


As part of systematic check for newer versions of GNU packages
I noticed this one, and it turned out to build as trivial
update (change version number, PR, checksums). But is help2man
actually used for anything? Many components that use it in
their upstream have patch to disable it in oe builds.


 - ML


