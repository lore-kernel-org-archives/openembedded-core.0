Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 497EE776F9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 11:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v28BY99C006987; Wed, 8 Mar 2017 11:34:41 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Kayt4t70zwEk; Wed,  8 Mar 2017 11:34:41 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v28BYaIS007109
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Mar 2017 11:34:37 GMT
Message-ID: <1488972876.22968.67.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Wed, 08 Mar 2017 11:34:36 +0000
In-Reply-To: <CA+chaQeHLtqAW3mK1-Y_yQZYBwrtDfEcsHocz8fMW8e8W4OCjg@mail.gmail.com>
References: <1488542096-23389-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAMKF1soCXsibCK37Az9MV1HMUpAK2dtWoijOxoBW25RoMhU+8g@mail.gmail.com>
	<CAJTo0LYPwxx18CtjJ_Rng28UhQAmJbMCw5=ebW2WkZmcALznUQ@mail.gmail.com>
	<CAMKF1sqB7A9m2osnv9bwywRF5hT4-oNgKU+rLNyA8SD70n8Mbg@mail.gmail.com>
	<1488624869.22968.8.camel@linuxfoundation.org>
	<CAMKF1sqth8gmzS6k13EA2Sz6r-mfextxWXxB=2rfCHw6-gfFQQ@mail.gmail.com>
	<CA+chaQeHLtqAW3mK1-Y_yQZYBwrtDfEcsHocz8fMW8e8W4OCjg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Add libmpx supprt for x86
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
X-List-Received-Date: Wed, 08 Mar 2017 11:34:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-08 at 01:00 +0100, Martin Jansa wrote:
> Seems to cause following QA issue for DISTROs which don't
> inherit remove-libtool.bbclass
> 
> ERROR: gcc-runtime-6.3.0-r0 do_package: QA Issue: gcc-runtime:
> Files/directories were installed but not shipped in any package:
>   /usr/lib/libmpxwrappers.la
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
> gcc-runtime: 1 installed and not shipped files. [installed-vs-
> shipped]

Sorry, thanks for the fix.

Cheers,

Richard

