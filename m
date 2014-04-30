Return-Path: <richard.purdie@linuxfoundation.org>
X-Greylist: delayed 477 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Apr 2014 15:54:44 UTC
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5058265DBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 15:54:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3UFscEh032695; Wed, 30 Apr 2014 16:54:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id A8d5-iuhba9j; Wed, 30 Apr 2014 16:54:38 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3UFsXhX032683
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Apr 2014 16:54:35 +0100
Message-ID: <1398873268.16672.529.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mirza Krak <mirza.krak@hostmobility.com>
Date: Wed, 30 Apr 2014 16:54:28 +0100
In-Reply-To: <535F4513.20407@hostmobility.com>
References: <535F3FFD.1080403@hostmobility.com>
	<535F4513.20407@hostmobility.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: quilt-native fails on tar version 1.27.1
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
X-List-Received-Date: Wed, 30 Apr 2014 15:54:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-29 at 08:22 +0200, Mirza Krak wrote:
> Hi.
> 
> I recently updated my Ubuntu PC to 14.04 LTS which broke yocto builds.
> 
>   From what I can see is that there seems to be an issue with the tar
> command and quilt-native recipe. But I am to newb to fix this. Do you
> guys have any ideas?

You're using an old release on a modern system which wasn't around when
the release was made.

It was fixed back in October, for example:

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/lib/oe/path.py?id=bf19a8617d05f17506dcb7154e19e2aa2b61838b

so those fixes are in master and the last release (daisy). Those fixes
are also in the dora (1.5) branch:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=dora&id=d3846f06d1e3faedcbc3c28e22c427bb0088683d

Cheers,

Richard


