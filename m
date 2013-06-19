Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 006F0608CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 15:20:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JFQRWC029476; Wed, 19 Jun 2013 16:26:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ci9sQKMyPVB4; Wed, 19 Jun 2013 16:26:27 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JFQNc0029456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 19 Jun 2013 16:26:25 +0100
Message-ID: <1371655204.20823.195.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe MacDonald <joe@deserted.net>
Date: Wed, 19 Jun 2013 16:20:04 +0100
In-Reply-To: <CANBf+V00HqZe5u94jvQ278DS7pDzNE5Fg5iRGQyqNQ7QhRO6fg@mail.gmail.com>
References: <1371650216-31735-1-git-send-email-joe@deserted.net>
	<1371651046.20823.189.camel@ted>
	<CANBf+V3L7MBU3U9vZTqVtgv8GYPfoV9aeqyNA6C2QjMpentXOQ@mail.gmail.com>
	<1371652646.20823.192.camel@ted>
	<CANBf+V2sThoGM4-U=XfeGgG3kOdZonXx=pgz61LX_83msLbjSg@mail.gmail.com>
	<1371654124.20823.194.camel@ted>
	<CANBf+V00HqZe5u94jvQ278DS7pDzNE5Fg5iRGQyqNQ7QhRO6fg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bdwgc: support configure on autoconf <2.69
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
X-List-Received-Date: Wed, 19 Jun 2013 15:20:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-06-19 at 11:09 -0400, Joe MacDonald wrote:
> On Wed, Jun 19, 2013 at 11:02 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:

>         I have a reproducer:
>         
>         bitbake bdwgc-native pkgconfig-native -c clean; bitbake
>         bdwgc-native
>         
>         Pretty sure its a missing pkgconfig dependency.
> 
> 
> Confirmed on the failing machine here too.  You've got this, then?  Or
> do you want me to send a new patch? 
> 
> 
I can take it from here, thanks for the confirmation.

Cheers,

Richard


