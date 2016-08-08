Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9A81F77187;
	Mon,  8 Aug 2016 06:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u786STX7018968; Mon, 8 Aug 2016 07:28:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9kyqI4jYGk4J; Mon,  8 Aug 2016 07:28:29 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u786SPFw018965
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 8 Aug 2016 07:28:26 +0100
Message-ID: <1470637705.8166.29.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>, Yocto Discussion Mailing List
	<yocto@yoctoproject.org>
Date: Mon, 08 Aug 2016 07:28:25 +0100
In-Reply-To: <CC61EFE1-5F39-4848-AD71-8E9C8DEC43C8@gmail.com>
References: <CC61EFE1-5F39-4848-AD71-8E9C8DEC43C8@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [RFT] binutils 2.27
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
X-List-Received-Date: Mon, 08 Aug 2016 06:28:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-08-07 at 01:39 -0700, Khem Raj wrote:
> I have put together upgrade for binutils 2.27 here ( kraj/master
> branch )
> 
> https://github.com/kraj/openembedded-core/commit/b98f5761d2285ffd773e
> c6ecb901b799302ebd6b
> 
> I have started bunch of test builds. but I would appreciate any help
> in testing it out in your
> environments and report any issues you see.

I ran this through the autobuilder:

bitbake world shows issues in libunwind (from gold?):

https://autobuilder.yoctoproject.org/main/builders/nightly-world/builds
/889/steps/BuildImages/logs/stdio

bitbake world with no x11 also shows it:

https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/build
s/231/steps/BuildImages/logs/stdio

Other than that, things don't seem too bad though.

Cheers,

Richard



