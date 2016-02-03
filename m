Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B376C771B8;
	Wed,  3 Feb 2016 14:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u13EoE9B019254; Wed, 3 Feb 2016 14:50:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AbPKqVv6cUnY; Wed,  3 Feb 2016 14:50:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u13EoC5R019246
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 3 Feb 2016 14:50:13 GMT
Message-ID: <1454511012.27087.183.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Feb 2016 14:50:12 +0000
In-Reply-To: <CALbNGRRmD=4QUi=+_fx48M4GDB9VwTX5m5wH12j4ed1OK6SW6Q@mail.gmail.com>
References: <CALbNGRRmD=4QUi=+_fx48M4GDB9VwTX5m5wH12j4ed1OK6SW6Q@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Language settings GTK (glibc?) problem
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
X-List-Received-Date: Wed, 03 Feb 2016 14:50:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-02-03 at 12:49 +0100, Andreas Müller wrote:
> Hi,
> 
> while testing libreoffice language packets I found that language
> settings for GTK based apps are broken. Interestingly QT based
> applications (tested with qtcreator and lxqt) and libreoffice are
> working fine.
> 
> I did some research and hope for some expert with helping hints.
> Details are:
> 
> * I am testing with jethro environment

I did wonder about http://git.yoctoproject.org/cgit.cgi/poky/commit/?id
=3b5288f0a28205289063424afc474675cbaa05b8

or possibly:

https://github.com/rehsack/poky/commit/46ac36953e2e76ba716c7ba42ddfe41c
9a19a11d

but I haven't looked into this much and don't have experience in this
area.

Cheers,

Richard

