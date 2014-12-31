Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1049860097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 10:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBVAQ11c008207; Wed, 31 Dec 2014 10:26:01 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9pNgwamiy6fN; Wed, 31 Dec 2014 10:26:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBVAPmRj008200
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 31 Dec 2014 10:25:59 GMT
Message-ID: <1420021585.25779.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>
Date: Wed, 31 Dec 2014 10:26:25 +0000
In-Reply-To: <cover.1418663308.git.akuster808@gmail.com>
References: <cover.1418663308.git.akuster808@gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Dizzy Merging
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
X-List-Received-Date: Wed, 31 Dec 2014 10:26:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Armin,

I've taken a look at the dizzy_1_7_1 branch and have merged a lot of
things. For bitbake, I took the patches into the 1.24 branch. There was
a patch missing for the PR server sync changes so I added that too,
otherwise the others didn't make sense.

For the OE-Core patches, the gcc sysroot poison one should not go in.
I'd also question the udev changes and the gcc shared work changes since
those were fairly significant changes with a lot more risk.

I've put the things I didn't take into
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/dizzy-next just so we can discuss them. We also need the other changes fror the buildtools change, those should go in together, I believe you already talked with Paul about that. We did manage a fairly green build on the autobuilder recently.

As you mentioned, we do need to sort out which changes make sense for
linux-yocto, I'm hoping Bruce can help advise on that. We may be cutting
things tight to have a build this weekend if we don't have those (so QA
could look at this next week).

Cheers,

Richard


