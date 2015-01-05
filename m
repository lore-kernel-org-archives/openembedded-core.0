Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 741D971F59
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 13:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t05DfTSY002607; Mon, 5 Jan 2015 13:41:29 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uaQTKATQSE4Q; Mon,  5 Jan 2015 13:41:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t05DfDnW002604
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 5 Jan 2015 13:41:25 GMT
Message-ID: <1420465310.25779.29.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 05 Jan 2015 13:41:50 +0000
In-Reply-To: <alpine.LFD.2.11.1501050746100.9262@localhost>
References: <alpine.LFD.2.11.1501050746100.9262@localhost>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to share just the host tools among different builds?
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
X-List-Received-Date: Mon, 05 Jan 2015 13:42:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-01-05 at 07:53 -0500, Robert P. J. Day wrote:
>   i'm drawing a blank at the moment so this might be a trivial
> question -- is there a way to share the non-toolchain, host tools
> across different builds on my development host?
> 
>   if i'm doing closely-related builds (or even for totally different
> architectures), i can see the host tools that are built under
> tmp/sysroots/x86_64-linux/... and one would think that, theoretically,
> those tools are appropriate for all sorts of independent builds, even
> if the toolchain is different.
> 
>   is there a simple setting that allows me to take advantage of all
> those host tools that were built during an initial build, and continue
> to use them in subsequent builds?

Its called sstate ;-).

Just share the native parts between the builds. They're usually in a
distro specific directory.

Cheers,

Richard


