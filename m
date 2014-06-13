Return-Path: <denis@denix.org>
X-Greylist: delayed 3606 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 13 Jun 2014 20:11:48 UTC
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 42F436FE92
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 20:11:48 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N74000AIFYQ95C0@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 13 Jun 2014 14:11:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6EA4B202AA; Fri,
	13 Jun 2014 15:11:13 -0400 (EDT)
Date: Fri, 13 Jun 2014 15:11:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Gary Thomas <gary@mlbassoc.com>
Message-id: <20140613191113.GQ27324@denix.org>
References: <20140613163159.GO27324@denix.org> <539B3C18.1090701@mlbassoc.com>
MIME-version: 1.0
In-reply-to: <539B3C18.1090701@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: textinfo failure
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
X-List-Received-Date: Fri, 13 Jun 2014 20:12:01 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jun 13, 2014 at 11:59:52AM -0600, Gary Thomas wrote:
> On 2014-06-13 10:32, Denys Dmytriyenko wrote:
> >Hi,
> >
> >The recent texinfo change now breaks at least bison-native for me:
> >
> >| Traceback (most recent call last):
> >|   File "/OE/tmp-eglibc/sysroots/x86_64-linux/usr/bin/texinfo-dummy-native/makeinfo", line 109, in <module>
> >|     "-E option not yet supported" + stub_msg
> >| AssertionError: -E option not yet supported
> >| This stand-in version of makeinfo is not yet fully capable of emulating the real
> >| version from the GNU texinfo suite. If you see this message, file a bug report
> >| with details on the recipe that failed.
> >|
> >| mv: cannot move `.am14993/bison.info' to `.//OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/bison-2.7.1/doc/': No such file or directory
> >| make[2]: *** [/OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/bison-2.7.1/doc/bison.info] Error 1
> >| make[2]: Leaving directory `/OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/build/doc'
> >| make[1]: *** [install-recursive] Error 1
> >| make[1]: Leaving directory `/OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/build'
> >| make: *** [install] Error 2
> >| ERROR: oe_runmake failed
> >| WARNING: /OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/temp/run.do_install.13309:1 exit 1 from
> >|   exit 1
> >| ERROR: Function failed: do_install (log file is located at /OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/temp/log.do_install.13309)
> >NOTE: recipe bison-native-2.7.1-r0: task do_install: Failed
> >ERROR: Task 770 (virtual:native:/home/jenkins/distroless-build/sources/oe-core/meta/recipes-devtools/bison/bison_2.7.1.bb, do_install)
> >
> 
> Odd - I just built it in a clean tree with Poky/Yocto master
> rev 8e0c54cd0e82ffe120f84f495101cd29e6fd06bf.
> 
> What did you do to get that 'texinfo-dummy-native' version installed?
> None of my builds end up with makeinfo in sysroots.

That was a very recent change in oe-core (at the time of my failure it was 
about 4 hours old commit):

http://cgit.openembedded.org/openembedded-core/commit/?id=0d8d5a2d44988d32a5c8b995202a12ac106ba93c

-- 
Denys

