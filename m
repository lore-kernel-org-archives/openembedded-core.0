Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1T1SnS-0000qA-JG
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 03:53:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7F1fM5x004778
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 18:41:23 -0700 (PDT)
Received: from e6410-2 (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 14 Aug 2012 18:41:21 -0700
Date: Tue, 14 Aug 2012 20:41:16 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "openembedded-core@"
	<lists.openembedded.org.openembedded-core@lists.openembedded.org>
Message-ID: <20120814204116.6ba1ff3d@e6410-2>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: RFC: Move PSEUDO_LOCALSTATEDIR for filesystems outside the filesystem
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
X-List-Received-Date: Wed, 15 Aug 2012 01:53:23 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Got a bug related to this that probably only affects our build
environment, but it caused me to note:

When we're using export/dist as a user-mode NFS root (under pseudo),
the PSEUDO_LOCALSTATEDIR is export/dist/var/pseudo.

This seems a bit weird to me -- I don't think pseudo's db should be
part of the filesystem it's maintaining. And I'm wondering whether
there is a historical reason for this that I need to be aware of,
before I propose moving it to something like export/pseudo.

... And if not, I propose we move it to something like export/pseudo.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


