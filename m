Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECCA6ED34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 11:31:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2HBVPTF031884; Mon, 17 Mar 2014 11:31:25 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2ZbAS0z0jdUj; Mon, 17 Mar 2014 11:31:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2HBVLi9031869
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 17 Mar 2014 11:31:22 GMT
Message-ID: <1395055876.3808.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Mar 2014 11:31:16 +0000
In-Reply-To: <cover.1394948105.git.raj.khem@gmail.com>
References: <cover.1394948105.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] systemd-211 upgrade and uclibc fixes
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
X-List-Received-Date: Mon, 17 Mar 2014 11:31:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-03-15 at 22:42 -0700, Khem Raj wrote:
> Finally, managed to get systemd 211 to boot on uclibc and eglibc
> on all supported qemu machines, this should fix bug #5940
> 
> Additional functionality in uclibc is needed to support this
> systemd
> 
> gnutls, glib-2.0, intltool fixes are uclibc specific and are needed
> to get uclibc images going
> 
> util-linux fix is moulded to support uclibc
> 
> I have been testing this fix on the qemuarm/qemuppc/qemumips/qemux86/qemux86-64
> on both uclibc/eglibc images and its been working good.
> 
> The following changes since commit 58aae40bbf8edd9c5ca70b2094eeb724391f1993:
> 
>   eglibc: Update SRC_URI to point to final download location (2014-03-13 20:44:48 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib kraj/systemd-211
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/systemd-211
> 
> Khem Raj (7):
>   uclibc: Implement clock_adjtime()
>   uclibc: Remove iconv.h
>   gnutls: Link in pthread explicitly for uclibc
>   glib-2.0: Fix localedir expectations for uclibc
>   util-linux: scanf_cv_alloc_modifier changed from 'as' -> 'ms'
>   intltool: Define DATADIRNAME=share for uclibc based systems
>   Upgrade to systemd 211+

I tried this on the autobuilder, with and without the pulseaudio 4->5
upgrade. The result was:

http://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/111
http://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/112

so I'm afraid I can't take the systemd part of this series. Its getting
late in the cycle for a pulseaudio 4->5 upgrade too :/

Does anyone have any strong opinions on this?

Cheers,

Richard



