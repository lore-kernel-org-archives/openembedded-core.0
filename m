Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 37E607321C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 07:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4V7iSJR030008; Tue, 31 May 2016 08:44:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gP066gJWoByq; Tue, 31 May 2016 08:44:28 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4V7iNMm030004
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 May 2016 08:44:24 +0100
Message-ID: <1464680663.19134.116.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2016 08:44:23 +0100
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 00/45] Move recipes to use Python 3 whenever possible
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
X-List-Received-Date: Tue, 31 May 2016 07:44:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-05-24 at 14:53 +0300, Alexander Kanavin wrote:
> This patchset updates recipes to use Python 3 whenever possible. A
> few items
> cannot be moved at the moment for various reasons, here they are:

I put this through a round of testing on the autobuilder overnight.

I just replied to Maxin about the gst-plugins-bad/bluez issue, the
world build also is a bit of a mess:

https://autobuilder.yoctoproject.org/main/builders/nightly-world-lsb/bu
ilds/528/steps/BuildImages/logs/stdio

python3-numpy looks like it can't find various symbols it thinks it
should be able to.

There are more gdbus-codegen issues - perhaps that isn't bluez but
something else causing them? (triggered gtk3+ and libsecret to fail
too) Since various pieces did build is this a dependency issue?

python3-dbus doesn't build on x32:

https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/7
98/steps/BuildImages/logs/stdio

Cheers,

Richard




