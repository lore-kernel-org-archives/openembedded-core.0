Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 93E37796B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 11:01:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8BB14WU022009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 11 Sep 2018 12:01:05 +0100
Message-ID: <ab989d52f45bf82b397fac9a7efe58ebb19becfe.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrew Geissler <geissonator@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2018 12:01:04 +0100
In-Reply-To: <CALLMt=r-i5AhyYaXon9na0NSky3cvph9ZpbGx0ogeuzOh8pB=w@mail.gmail.com>
References: <CALLMt=r-i5AhyYaXon9na0NSky3cvph9ZpbGx0ogeuzOh8pB=w@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: python test files installed in image on purpose?
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
X-List-Received-Date: Tue, 11 Sep 2018 11:01:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-09-07 at 14:02 -0500, Andrew Geissler wrote:
> Hi,
> 
> We've been running into some flash space issues over in the openbmc
> project. I noticed the python.bb file (python_2.7.14.bb for us) is
> installing some test folders/files in our rootfs image.
> 
> # find /usr/lib/python2.7/ -name "test" -print
> /usr/lib/python2.7/ctypes/test
> /usr/lib/python2.7/email/test
> 
> I'm looking to see if there's any functional reason these tests are
> included in the image.
> 
> In our compressed filesystem we're talking about ~150KB of space but
> right now that's a pretty big deal for us. Would the community be
> interested in a patch to not install (or make it an option like is
> done with INCLUDE_PYCS) these test files?  Or is this something we
> should just handle in a .bbappend file for our distro?
> 
> Here's a complete list of test directories in the python package.
> ./Python-2.7.14/Lib/bsddb/test
> ./Python-2.7.14/Lib/sqlite3/test
> ./Python-2.7.14/Lib/ctypes/test
> ./Python-2.7.14/Lib/unittest/test
> ./Python-2.7.14/Lib/lib-tk/test
> ./Python-2.7.14/Lib/email/test

These definitely sound like they should be put into a different package
which is related to testing and not installed otherwise. 

So yes, in principle these are exactly the kinds of fixes which should
be going into core!

Cheers,

Richard

