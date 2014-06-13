Return-Path: <denis@denix.org>
X-Greylist: delayed 3610 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 13 Jun 2014 17:32:16 UTC
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 87F566FE7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 17:32:16 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7400CY58LC3Q50@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 13 Jun 2014 11:32:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0C3992009D; Fri,
	13 Jun 2014 12:32:00 -0400 (EDT)
Date: Fri, 13 Jun 2014 12:32:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20140613163159.GO27324@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: textinfo failure
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
X-List-Received-Date: Fri, 13 Jun 2014 17:32:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

The recent texinfo change now breaks at least bison-native for me:

| Traceback (most recent call last):
|   File "/OE/tmp-eglibc/sysroots/x86_64-linux/usr/bin/texinfo-dummy-native/makeinfo", line 109, in <module>
|     "-E option not yet supported" + stub_msg
| AssertionError: -E option not yet supported
| This stand-in version of makeinfo is not yet fully capable of emulating the real
| version from the GNU texinfo suite. If you see this message, file a bug report
| with details on the recipe that failed.
| 
| mv: cannot move `.am14993/bison.info' to `.//OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/bison-2.7.1/doc/': No such file or directory
| make[2]: *** [/OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/bison-2.7.1/doc/bison.info] Error 1
| make[2]: Leaving directory `/OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/build/doc'
| make[1]: *** [install-recursive] Error 1
| make[1]: Leaving directory `/OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/build'
| make: *** [install] Error 2
| ERROR: oe_runmake failed
| WARNING: /OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/temp/run.do_install.13309:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_install (log file is located at /OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/temp/log.do_install.13309)
NOTE: recipe bison-native-2.7.1-r0: task do_install: Failed
ERROR: Task 770 (virtual:native:/home/jenkins/distroless-build/sources/oe-core/meta/recipes-devtools/bison/bison_2.7.1.bb, do_install)

-- 
Denys

