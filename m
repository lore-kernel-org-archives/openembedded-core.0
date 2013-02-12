Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U5O2J-0005wz-Dz
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 23:09:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1CLrATf007907
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 13:53:10 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 13:53:09 -0800
Date: Tue, 12 Feb 2013 15:53:01 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20130212155301.75a8e76d@e6410-2>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: heads up, pseudo-1.4.3 has one buggy use case...
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
X-List-Received-Date: Tue, 12 Feb 2013 22:09:12 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

link() calls inside a chroot tend to fail. Conveniently, nearly
everyone uses linkat() so this doesn't affect most builds, but we found
a test case where it was really easy to trigger.

Symptom: RPM installs saying somehing like:

pseudo: Fatal: Tried to stat
'/home/seebs/pseudo/r/home/seebs/pseudo/r/usr/share/terminfo/a/adm1178;511ab539'
after linking it, but failed: No such file or directory.

Note the double presence of the chroot path. Patch is done in the
pseudo tree, I'll try to get a 1.4.4 out today. Sorry for any
inconvenience!

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


