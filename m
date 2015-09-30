Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8FB77065
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 15:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UFvCOj015886; Wed, 30 Sep 2015 16:57:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id djsIZfMrlcvR; Wed, 30 Sep 2015 16:57:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UFuuxE015868
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Sep 2015 16:57:07 +0100
Message-ID: <1443628616.5162.119.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Sep 2015 16:56:56 +0100
In-Reply-To: <CAJTo0Lb+sOMG0ovH9+u6Xa7R+qQ2UWOc__MCxh8iUzJiD9R9oA@mail.gmail.com>
References: <1443621275.5162.95.camel@linuxfoundation.org>
	<20150930144303.GC2405@jama>
	<CAJTo0Lb+sOMG0ovH9+u6Xa7R+qQ2UWOc__MCxh8iUzJiD9R9oA@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distutils3: Avoid MACHINE specific checksums
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
X-List-Received-Date: Wed, 30 Sep 2015 15:57:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-30 at 16:01 +0100, Burton, Ross wrote:
> On 30 September 2015 at 15:43, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>         I'm still using that patch and still haven't found any issues
>         caused by
>         that, but I'm not using python3 recipes (except building them
>         in world),
>         so it's possible I've just overlooked them.
>
> It's possible that you're installing eg python3-pip into a totally
> wrong directory though, but I'm having a look at this right now and
> have a funny feeling that a lot of this can actually be deleted.

Agreed. I will likely take the patch I've proposed, since it deals with
a real issue but if we can then clean all this up I'd be all in favour.

At the back of my mind was a plan to figure out the various python
module types that maximally stress distutils.bbclass and
setuptools.bbclass and then make sure we have an example of each in
OE-Core so we can put some better regression testing around this too.

Cheers,

Richard



