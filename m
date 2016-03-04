Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 178147328A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 22:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24MpNBp019471 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 22:51:23 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id y_559z4h5BYr
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 22:51:23 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24MpHq9019467
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 22:51:18 GMT
Message-ID: <1457131877.2804.65.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Mar 2016 22:51:17 +0000
In-Reply-To: <1457014986.25131.69.camel@linuxfoundation.org>
References: <1457014986.25131.69.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Status of M3
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
X-List-Received-Date: Fri, 04 Mar 2016 22:51:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-03-03 at 14:23 +0000, Richard Purdie wrote:
> Things which still break:
> 
> * rpm upgrade causes smart remove to not function
> * gobject-introspection breaks on multilib with python-pygobject file
>   location issue
> * gobject-introspection fails on musl
> * createrepo has occasional failure with checksum mismatch
> * oe-selftest signing failure
> * sato application launch failures from glib issues due to prelink

Most of the above are still broken. In addition, I thought uninative
was going too well, turns out we broke its enablement on the
autobuilders. With that "fixed" we've seen some additional issues (and
some new 'random' race failures):

* a gcc4 verses gcc5 conflict in the libstdc++ ABI (uninative)
* a codepage issue with mcopy (uninative)
* an additional gobject-introspection dependency problem (simple?)
* parallel make race in ncurses make install
* parallel make race in openssl (borrow patches from other distro?)
* some xmlto execution issue

So work remains to get M3 into shape. Not sure how much of my weekend
I'm planning to spend in trying to sort this out...

Cheers,

Richard



