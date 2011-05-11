Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QK2yQ-0007rc-NF
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 08:32:42 +0200
Received: by pzk36 with SMTP id 36so105547pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=OG8P/agJ6r7b9KY7U/nkuaxyhZ7jc1VMMnD+e8PDfSo=;
	b=Vb5ZPNebbu7nvNa0iQypDZIqpoMuCPsM/Epvj92uYFBh9OlflUz1xvUUd+dpAjrJSK
	OF20KCPlmt9BMpEzE3k2Y5xYM+SEiIZaIUuGCK11I3SIGJntVhRRplac1RayI4kP8KMQ
	Hepwtl/bm/RSCf3AYIwmjtY2A3FLw7dGX21Hs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=KKqYuaTQxwIEjUiA5YGlayfoEkfLEefPmkJDu8t44Om/Rt2id6t9JLEFTIt++sRDfJ
	sOq8td7bfILmDOza77LstlTEM0lzqkTwTyo4QJ8o337KEOLlPFZx5IXY8d/YJMJwm1kV
	b7R1bQy6m9jP1SMFrAnzmctaMRTKwIBIAX7Ms=
Received: by 10.68.15.71 with SMTP id v7mr8149404pbc.116.1305095395690;
	Tue, 10 May 2011 23:29:55 -0700 (PDT)
Received: from localhost.localdomain ([99.57.141.118])
	by mx.google.com with ESMTPS id z7sm5312204pbm.53.2011.05.10.23.29.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 23:29:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2011 23:29:51 -0700
Message-Id: <cover.1305095232.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3] Do not depend on BBFILES to compute scm dirs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 May 2011 06:32:43 -0000

This fixes the problem that I described in
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/001966.html

Additionally we do not need directories with */packages/* in BBFILES
anymore

use --no-check-certificate for wget otherwise tar downloads from
github.com end up giving certificate errors

HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-0.7.5.tar.gz [following]
--2011-05-10 23:16:17--  https://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-0.7.5.tar.gz
Connecting to github.com|207.97.227.239|:443... connected.
ERROR: certificate common name `*.github.com' doesn't match requested host name `github.com'.
To connect to github.com insecurely, use `--no-check-certificate'.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/misc-fixes
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (2):
  metadata_scm.bbclass: Use COREBASE to grok for SCM operations
  meta/conf/layer.conf: Remove packages/*bb from BBFILES

Otavio Salvador (1):
  conf/bitbake.conf: use --no-check-certificate to avoid errors when
    wgetting from https

 meta/classes/metadata_scm.bbclass |    5 +----
 meta/conf/bitbake.conf            |    8 ++++----
 meta/conf/layer.conf              |    2 +-
 3 files changed, 6 insertions(+), 9 deletions(-)

-- 
1.7.4.1



