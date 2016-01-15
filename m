Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 056797318D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 14:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FETffM026238; Fri, 15 Jan 2016 14:29:41 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pMLFg1l07ixU; Fri, 15 Jan 2016 14:29:41 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FETZEq026225
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 15 Jan 2016 14:29:36 GMT
Message-ID: <1452868175.28375.165.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>, Christopher Larson
	<clarson@kergoth.com>, Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jan 2016 14:29:35 +0000
In-Reply-To: <56990180.9080407@dresearch-fe.de>
References: <5698E002.5090800@dresearch-fe.de>
	<1452863169.28375.161.camel@linuxfoundation.org>
	<5698F31E.1020905@dresearch-fe.de> <56990180.9080407@dresearch-fe.de>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: fido -> jethro switching problem
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
X-List-Received-Date: Fri, 15 Jan 2016 14:29:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-01-15 at 15:26 +0100, Steffen Sledz wrote:
> On 15.01.2016 14:24, Steffen Sledz wrote:
> > And I made another interesting discovery: The exception appears on
> > certain machine types only, e.g with qemuarm it appears, with
> > qemuarm64 or qemux86 not.
> 
> It seems that all machines based on armv5e are affected.

Which is a good data point to have and should help narrow it down.

I know that jethro OE-Core doesn't do this. Its unlikely to be machine
specific if all armv5e including qemuarm are affected. It therefore
sounds like there is something in your distro config related to armv5
is likely the cause...

Cheers,

Richard


