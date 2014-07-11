Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 119DB70210
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 17:41:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6BHf0bq014409; Fri, 11 Jul 2014 18:41:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MJl9O4-Lvlon; Fri, 11 Jul 2014 18:41:00 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6BHersN014398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 11 Jul 2014 18:40:55 +0100
Message-ID: <1405100448.21289.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 11 Jul 2014 18:40:48 +0100
In-Reply-To: <CAP9ODKrwE-vNz=NcZ7pntPiCaqqdVNkMnOiNGy2yTCJnsNxUBA@mail.gmail.com>
References: <1404936934.15985.48.camel@ted>
	<CAP9ODKpd5-KkRZg7QMbaMS-zn=f6uephJObn3X44RNoEK8y76A@mail.gmail.com>
	<1405067225.15985.89.camel@ted>
	<CAP9ODKrWDP4OR4W3xxuKgCKzW7iqDZo5uc3DBEm43syYP=EA5A@mail.gmail.com>
	<1405084930.21289.7.camel@ted>
	<CAP9ODKrwE-vNz=NcZ7pntPiCaqqdVNkMnOiNGy2yTCJnsNxUBA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
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
X-List-Received-Date: Fri, 11 Jul 2014 17:41:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-07-11 at 13:46 -0300, Otavio Salvador wrote:
> On Fri, Jul 11, 2014 at 10:22 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2014-07-11 at 09:14 -0300, Otavio Salvador wrote:
> ...
> >> > I would not recommend setting variables in function prepends like this,
> >> > its ugly and error prone, as you've just found out.
> >>
> >> Any suggested better way of to do it?
> >
> > The anonymous python fragment should be fine, it sets the data at the
> > right level, the global recipe level rather than burying it in some
> > task.
> 
> and in case we need to do it for the packages split from the
> do_package_split? Use the hook mechanism?

That will not work, if you set data in the do_package task, the
do_package_q task cannot see it.

You'd probably have to add a prefunc to do_package_qa to set the right
skip variables if you needed to that since the package names wouldn't be
known until then.

Cheers,

Richard




