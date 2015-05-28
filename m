Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A6F4D75669
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 09:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4S9mTxe005907; Thu, 28 May 2015 10:48:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IpRjbJqhRuqG; Thu, 28 May 2015 10:48:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4S9mGjV005890
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 28 May 2015 10:48:27 +0100
Message-ID: <1432806496.404.103.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Thu, 28 May 2015 10:48:16 +0100
In-Reply-To: <5566E259.3000001@dresearch-fe.de>
References: <5566E259.3000001@dresearch-fe.de>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5][fido] commit 699e1570e6 breaks build
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
X-List-Received-Date: Thu, 28 May 2015 09:48:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-05-28 at 11:39 +0200, Steffen Sledz wrote:
> Commit 699e1570e66cb28e4bfd0eb15d41f3af2bed5b62 (autotools: Fix find
> races on source directory) in fido branch of openembedded-core breaks
> build (do_configure) of qtbase-native from meta-qt5 fido branch. :(

I'm struggling to see exactly how this commit could result in this kind
of failure. How did you deduce that this was the problem?

Is the problem not that qtbase-native doesn't rebuild cleanly if
configure is re-executed? Have you tried cleaning qtbase-native and
rebuilding it?

Cheers,

Richard




