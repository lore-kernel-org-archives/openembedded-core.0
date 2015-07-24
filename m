Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9B47A60962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 07:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6O7YxRB003241; Fri, 24 Jul 2015 08:34:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MVeqW3TZET5B; Fri, 24 Jul 2015 08:34:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6O7Yiu2003230
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Jul 2015 08:34:56 +0100
Message-ID: <1437723284.821.143.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>
Date: Fri, 24 Jul 2015 08:34:44 +0100
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/25] Dizzy next for .3
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
X-List-Received-Date: Fri, 24 Jul 2015 07:35:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-07-18 at 08:16 -0700, Armin Kuster wrote:
> Please consider these for the 1.7.3 release
> 
> The following changes since commit 5f0d25152bac2d3798663a4ebfdd2df24060f153:
> 
>   openssl: upgrade to 1.0.1p (2015-07-15 15:25:43 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>   http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-nex

We ran dizzy through the autobuilder as we have an opportunity to roll a
1.7.3 release soon. The result was:

https://autobuilder.yoctoproject.org/main/tgrid
or more specifically:
http://errors.yoctoproject.org/Errors/Search/?items=10&query=1b492dfcdd692fe9440a1711812a1bb60ac741e5

which looks to me to largely be gcc5 issues on the host, particularly
Fedora22. There was also a bug occurred in build-appliance which has
been resolved in master/fido.

We therefore need to decide whether to backport the gcc5 host fixes back
to 1.7.3 or whether we have to disable autobuilders in order to be able
to build it...

Cheers,

Richard


