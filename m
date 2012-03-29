Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SDMUR-0000my-Fk
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 23:02:39 +0200
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 4D6A1A610B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:53:33 +0200 (CEST)
Date: Thu, 29 Mar 2012 22:53:32 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120329225332.0e8cc2f4@eb-e6520>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Thu, 29 Mar 2012 21:02:39 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I noticed in from scratch builds for qemuarm that the longest time is
taken in fetching sources, especially those fetched using git
(linux-yocto for example) & svn (gcc, eglibc & co).

To reduce the fetch time would that make sense to 
- fetch gcc/glibc & co from the archive of a stable version and then
  apply patches on top of it (maybe patches stored in an archive
  fetched from oe's website and applied in bulk or patches stored in OE)
- do the same thing for the linux-yocto kernel or add a --reference
  option to the git fetcher so that we can provide a local tree as a
  reference ?

Do you have other ideas (appart from using a local mirror) to optimize
the fetch time ?

Thanks,
Eric


