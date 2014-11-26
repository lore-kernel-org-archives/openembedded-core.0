Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 948726AFB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 12:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAQCDgKb015339; Wed, 26 Nov 2014 12:13:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AUs_Rr7x1KVB; Wed, 26 Nov 2014 12:13:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAQCDUI6015336
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 26 Nov 2014 12:13:41 GMT
Message-ID: <1417004047.12520.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 26 Nov 2014 12:14:07 +0000
In-Reply-To: <CANyK_8eZHwtww6AL7L5f34R5Nc7mhSQALaez1NCnHvmUpHWcXw@mail.gmail.com>
References: <CANyK_8eZHwtww6AL7L5f34R5Nc7mhSQALaez1NCnHvmUpHWcXw@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg, opkg-config-base and opkg-collateral
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
X-List-Received-Date: Wed, 26 Nov 2014 12:14:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-11-25 at 20:27 +0000, Paul Barker wrote:
> Hi all,
> 
> Does anyone know why the configuration files for opkg are split into
> opkg-config-base (containing just '/etc/opkg/arch.conf') and
> opkg-collateral (containing just '/etc/opkg/opkg.conf')? It looks like
> the split dates back to openembedded classic.
> 
> If there isn't a good reason for this perhaps now would be a good time
> to merge all this back into the 'opkg' recipe and package. I'm happy
> to put the patch together, just checking if it sounds like a good idea
> before I do the work.

I think at least one of the above was intended to allow distro specific
package feeds to be preconfigured as as such belonged as a standalone
config file.

The architecture file is also machine specific, we wouldn't want opkg
itself rebuilding for every machine so that is probably why its
separate.

Three different things on the other hand seems excessive. We probably
could survive with some merhing with opkg and the remainder being
machine specific.

Cheers,

Richard


