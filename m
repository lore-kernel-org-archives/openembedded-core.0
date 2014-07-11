Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 305E16FA41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 21:12:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6BLBoJt022741; Fri, 11 Jul 2014 22:11:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id n7oXbdxH2Tk1; Fri, 11 Jul 2014 22:11:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6BLBg1F022732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 11 Jul 2014 22:11:44 +0100
Message-ID: <1405113097.21289.93.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Jul 2014 22:11:37 +0100
In-Reply-To: <CAJTo0LZ0BD76LshHyfBMwKU0tgqS+3_QT1LZpLxbX4n03ZCmWA@mail.gmail.com>
References: <1404936934.15985.48.camel@ted>
	<CAP9ODKpd5-KkRZg7QMbaMS-zn=f6uephJObn3X44RNoEK8y76A@mail.gmail.com>
	<1405067225.15985.89.camel@ted>
	<CAP9ODKrWDP4OR4W3xxuKgCKzW7iqDZo5uc3DBEm43syYP=EA5A@mail.gmail.com>
	<1405084930.21289.7.camel@ted>
	<CAJTo0LZ0BD76LshHyfBMwKU0tgqS+3_QT1LZpLxbX4n03ZCmWA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC 1/3] insane: Split do_package_qa into a separate task (from do_package)
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
X-List-Received-Date: Fri, 11 Jul 2014 21:12:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-07-11 at 20:37 +0100, Burton, Ross wrote:
> On 11 July 2014 14:22, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The anonymous python fragment should be fine, it sets the data at the
> > right level, the global recipe level rather than burying it in some
> > task.
> 
> FWIW this broke the X drivers as they inject dependencies in
> populate_packages_prepend().  It's probably worth reviewing all
> instances of populate_packages_prepend() in oe-core at least as I
> clearly copied using that hook from someone else...

It shouldn't have broken the dependencies, you can still inject things
there and that has not changed.  If that has stopped working, there is
something else wrong.

What you can't now do is change the package QA process through
populate_packages but that makes much less sense.

Cheers,

Richard


