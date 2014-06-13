Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 78A4A6FE5E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 17:59:46 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 5971AF811E2; Fri, 13 Jun 2014 11:59:47 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 3F795F811EE;
	Fri, 13 Jun 2014 11:59:41 -0600 (MDT)
Message-ID: <539B3C18.1090701@mlbassoc.com>
Date: Fri, 13 Jun 2014 11:59:52 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20140613163159.GO27324@denix.org>
In-Reply-To: <20140613163159.GO27324@denix.org>
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
X-List-Received-Date: Fri, 13 Jun 2014 17:59:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-06-13 10:32, Denys Dmytriyenko wrote:
> Hi,
>
> The recent texinfo change now breaks at least bison-native for me:
>
> | Traceback (most recent call last):
> |   File "/OE/tmp-eglibc/sysroots/x86_64-linux/usr/bin/texinfo-dummy-native/makeinfo", line 109, in <module>
> |     "-E option not yet supported" + stub_msg
> | AssertionError: -E option not yet supported
> | This stand-in version of makeinfo is not yet fully capable of emulating the real
> | version from the GNU texinfo suite. If you see this message, file a bug report
> | with details on the recipe that failed.
> |
> | mv: cannot move `.am14993/bison.info' to `.//OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/bison-2.7.1/doc/': No such file or directory
> | make[2]: *** [/OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/bison-2.7.1/doc/bison.info] Error 1
> | make[2]: Leaving directory `/OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/build/doc'
> | make[1]: *** [install-recursive] Error 1
> | make[1]: Leaving directory `/OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/build'
> | make: *** [install] Error 2
> | ERROR: oe_runmake failed
> | WARNING: /OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/temp/run.do_install.13309:1 exit 1 from
> |   exit 1
> | ERROR: Function failed: do_install (log file is located at /OE/tmp-eglibc/work/x86_64-linux/bison-native/2.7.1-r0/temp/log.do_install.13309)
> NOTE: recipe bison-native-2.7.1-r0: task do_install: Failed
> ERROR: Task 770 (virtual:native:/home/jenkins/distroless-build/sources/oe-core/meta/recipes-devtools/bison/bison_2.7.1.bb, do_install)
>

Odd - I just built it in a clean tree with Poky/Yocto master
rev 8e0c54cd0e82ffe120f84f495101cd29e6fd06bf.

What did you do to get that 'texinfo-dummy-native' version installed?
None of my builds end up with makeinfo in sysroots.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

