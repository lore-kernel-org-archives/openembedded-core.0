Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1TY1S2-0004cw-Sy
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 22:21:51 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B316EF81201; Mon, 12 Nov 2012 14:07:58 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id F0DD3F81200;
	Mon, 12 Nov 2012 14:07:57 -0700 (MST)
Message-ID: <50A16539.30405@mlbassoc.com>
Date: Mon, 12 Nov 2012 14:08:09 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAKmrg8OVpDG58t_jARYGvjBSenbdL7S0C077b7+ivHmpfveeDA@mail.gmail.com>
	<CAKmrg8MS91e7tQK2HWr7SogsNpXhw+oyGS_rbROcQDm+u6aPQQ@mail.gmail.com>
In-Reply-To: <CAKmrg8MS91e7tQK2HWr7SogsNpXhw+oyGS_rbROcQDm+u6aPQQ@mail.gmail.com>
Subject: Re: device node creation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2012 21:21:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-11-12 10:42, anton@angri.ru wrote:
> Hello,
>
> I'm trying to create a device node in the generated rootfs image: /dev/net/tun. It is required for openvpn to work. Adding it in the living system is as trivial as "mkdir /dev/net;
> mknod /dev/net/tun c 10 200", but I want it to be there with no manual intrusion required.
>
> I tried several ways:
>
> * IMAGE_DEVICE_TABLES
> * IMAGE_DEVICE_TABLE
> * adding /dev/net/tun file to the package
> * adding a node file to the IMAGE_ROOTFS in rootfs postprocess script
> * using postinst script that creates the node
>
> None of it worked.
>
> What is the way /dev is populated? Where do all those 256 (why so many btw?) pty* nodes come from? How do I create the new node?

Your kernel needs to be built with CONFIG_TUN (not common, you'll
probably need to rebuild it with this option).  Once this option
is in place, udev will automatically create that device for you.

Note: if you add this as an module (CONFIG_TUN=m) the device will
be created when you install the module.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


