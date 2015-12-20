Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B7C4370016
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Dec 2015 17:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBKHA2Wk001147; Sun, 20 Dec 2015 17:10:02 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6hJdk0mm17Ea; Sun, 20 Dec 2015 17:10:02 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBKH9eVC001136
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 20 Dec 2015 17:09:57 GMT
Message-ID: <1450631380.8461.96.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Sun, 20 Dec 2015 17:09:40 +0000
In-Reply-To: <5675F69B.2050604@gmail.com>
References: <5675F69B.2050604@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: qemuarm update
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
X-List-Received-Date: Sun, 20 Dec 2015 17:10:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-12-19 at 19:30 -0500, Trevor Woerner wrote:
> Would it make sense, would it be possible, for the qemuarm machine to
> emulate ARMv7a instead of ARMv5?

It certainly is possible, I think there are even some "qemuarmv7"
machine files out there which do this.

The main reason we've stuck with qemuarm being v5 was to help the
testing matrix since armv7 gets good coverage on real hardware, if we
stop building v5 with qemuarm, I suspect it will bitrot...

Cheers,

Richard

