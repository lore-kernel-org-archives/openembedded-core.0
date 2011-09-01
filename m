Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QzDt6-0002Jd-7v
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 22:29:24 +0200
Received: (qmail invoked by alias); 01 Sep 2011 20:24:25 -0000
Received: from p4FDF1E49.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.30.73]
	by mail.gmx.net (mp029) with SMTP; 01 Sep 2011 22:24:25 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX188E2Z77HA8P/rjXAtpx2nDku9DnVokVHuZKbbY82
	ZAGhUdhHKhT84Z
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 1 Sep 2011 22:27:49 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-95.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201109012227.49280.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: dropbear build build fails
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
X-List-Received-Date: Thu, 01 Sep 2011 20:29:24 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

build after fresh git pull & fresh tmpdir fails for dropbear:

NOTE: package dropbear-0.52-r3: task do_fetch: Started
ERROR: Function 'Fetcher failure for URL: 'file://dropbear-configuration-
file.patch'. Unable to fetch URL file://dropbear-configuration-file.patch from any 
source.' failed
ERROR: Logfile of failure stored in: /home/Superandy/tmp/oe-core-
eglibc/work/armv7a-angstrom-linux-gnueabi/dropbear-0.52-
r3/temp/log.do_fetch.12169
Log data follows:
| DEBUG: Trying PREMIRRORS
| DEBUG: Trying Upstream
| ERROR: Function 'Fetcher failure for URL: 'file://dropbear-configuration-
file.patch'. Unable to fetch URL file://dropbear-configuration-file.patch from any 
source.' failed
NOTE: package dropbear-0.52-r3: task do_fetch: Failed

There was a change yesterday

commit 48dcb8fc7b669b27160dde33079f40551853702b
Author: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Date:   Wed Aug 31 10:48:11 2011 +0800

    dropbear: Change the path to find configuration file and add a configuration file 
for dropbear
...

In folder dropbear-0.52 is a file configure.patch. Is that a typo or is it me?

Andreas


