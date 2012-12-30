Received: from mail-bk0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tp883-0002Z3-BI
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Dec 2012 02:55:57 +0100
Received: by mail-bk0-f51.google.com with SMTP id ik5so5151262bkc.38
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Dec 2012 17:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=YD0ULWRCLiLwGcpGGSVWhJW5buPIOJD5Yq2MSwjEvpY=;
	b=p61UfSLPNvNWnrDdlmEdr79D4EuQUZ6nuit9UMID4feTu/kDjGcR9iWkMQFJYn+y9U
	Xkb4q5lxIe6wnXAW1Q7e8Vilbf492j3/N2v31TPRyn/vD3HH9rB8MoLf9h9kOMUIhk5X
	fMgvBTgUTgJKaf5CvO5orxA7uGuTnivQxNxb5LlXYkYLwEHBjV/aqvbCuYWzP2D/P7U+
	jyhmpZOfiZRaikeW8rebIjAjVqvD+8nJSO0KDyBFR7UP177utnRD4JpHft/TFf3VQA2D
	KKi2GrLH+7wal7Ai0T/hpe3WZMEpYbm7MxHWpLdcopGjMQFdU05U7VX/fqgrh2cEY5eE
	K6HA==
X-Received: by 10.204.152.149 with SMTP id g21mr17547115bkw.97.1356831657756; 
	Sat, 29 Dec 2012 17:40:57 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id o9sm25278009bko.15.2012.12.29.17.40.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Dec 2012 17:40:57 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1Tp7tX-0003Wx-At
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Dec 2012 03:40:55 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Dec 2012 03:40:52 +0200
Message-Id: <1356831654-22420-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: RFC: Adding HarfBuzz
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
X-List-Received-Date: Sun, 30 Dec 2012 01:55:57 -0000

HarfBuzz is OpenType text shaping engine that pango 1.32 depends on.
(Configure checks harfbuzz first, and if it's not available, number
of other checks are skipped as it considers freetype et al unusable
for pango without harfbuzz -> eventually it complained that there's
no single backend enabled)

I have problems getting (any) images to work properly at the moment
(I assume qemu bug/misconfiguration) so I have not yet seen if this
actually works at all. I only know that this harfbuzz + new pango
builds without problems for arm, x86, and mips.

The main known problem is handling of licenses. I've listed all the
right files in LIC_FILES_CHKSUM, and managed to get sensible LICENSE
entry for a couple of them (hb-ucdn -> UCDN, hb-icu-le -> ICU) but I'm
at loss what to make of remaining ones. COPYING states that it's
"so called Old MIT", so I didn't make it "MIT" but put "Old-MIT" as
placeholder. hb-old seems like unique license, which placeholder is
"HarfBuzz-old"

Building requires icu 50.1.1:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-December/033574.html


 - ML


