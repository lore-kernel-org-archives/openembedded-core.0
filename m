Received: from mail-bk0-f45.google.com ([209.85.214.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tys3v-0008Rz-Mg
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 23:47:56 +0100
Received: by mail-bk0-f45.google.com with SMTP id i18so529986bkv.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 14:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=VZV5I8y3GSSJS8sot/HdPGRQlhgTrrkNsPYwL1EtV/4=;
	b=HBDFRV3+lL5URJpQwqCCrSKWydUxB/nimJ4MjhfNNIq2OU2pevKEQoXB6upl7GegRO
	Gwqf8TmIkvHB81NIBrqoRxUL59E6gWq7O6ioDx9L6R5MX6GblMunYOHEzv4hbKxyAsAD
	J1OPLyNcbHbKyVEcQtk7ZD5pgVW1mPYCsEBsZlPD/jAeTRIgBYG2eM7VRVSB5gj/WPIt
	RN+t+HUskQ4UD6BPuf+JTmyFxtVaC6ih1iSdB6+R1vKQMYGxPmjw8AoaqVDp4jDljltm
	nadWbN8oOEJbxrLy2lMwiv7Gv++hqjSntc/s9ODpOQ2ZnuoD5Ss7TmViJS30RlcTpVwE
	Eyow==
X-Received: by 10.204.157.26 with SMTP id z26mr2242391bkw.101.1359153140961;
	Fri, 25 Jan 2013 14:32:20 -0800 (PST)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPS id y11sm2303232bkw.8.2013.01.25.14.32.18
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 14:32:19 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tyron-0004Ot-Is; Sat, 26 Jan 2013 00:32:17 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Jan 2013 00:32:15 +0200
Message-Id: <cover.1359152961.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] Fix harfbuzz make install error
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
X-List-Received-Date: Fri, 25 Jan 2013 22:47:56 -0000

I've not managed to reproduce harfbuzz make install error reported
from autobuilder, but there seems to be rather obvious error in
harfbuzz that this patch works around.


 - ML

The following changes since commit cc490d76aba0a778409ca1a3d0e1f2c308684c9b:

  valgrind: explicitly disable MPI2 support (2013-01-25 16:40:25 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/misc

Marko Lindqvist (1):
  harfbuzz: fix install of version.h

 .../harfbuzz-0.9.10/avoid_double_version_h.patch         |   14 ++++++++++++++
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.10.bb        |    3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz-0.9.10/avoid_double_version_h.patch

-- 
1.7.10.4



