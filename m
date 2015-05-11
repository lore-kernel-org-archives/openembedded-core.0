Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AA3C26013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 13:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4BDL9E4019608; Mon, 11 May 2015 14:21:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RSfBl50U48zv; Mon, 11 May 2015 14:21:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4BDKkZj019510
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 May 2015 14:21:05 +0100
Message-ID: <1431350446.30971.56.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>
Date: Mon, 11 May 2015 14:20:46 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: linux-yocto and gcc 5.x
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
X-List-Received-Date: Mon, 11 May 2015 13:21:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce,

One of the things we're looking at in 1.9 is gcc 5.x support by default.
One of the areas this has significant impact is on the kernels,
linux-yocto in particular. I'm starting to see a potential problem here
since the kernels don't appear to work well with gcc 5.x:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=1426e31f0bcd19f066931d2ecbdec3752b14e88e&limit=150&order_by=RECIPE

(this is a test build I ran just to see how bad things were).

Are we going to be in a position to get 5.x support backported into 3.14
(and maybe 3.10)? Or was we going to have to wait for later versions?

Cheers,

Richard




