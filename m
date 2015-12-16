Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C9D4B6FFEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 09:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBG9uCqS010169; Wed, 16 Dec 2015 09:56:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CYPx_ncS62qQ; Wed, 16 Dec 2015 09:56:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBG9u8xi010164
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 16 Dec 2015 09:56:09 GMT
Message-ID: <1450259768.13505.99.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Wed, 16 Dec 2015 09:56:08 +0000
In-Reply-To: <CAP9ODKpCU+5tM0UzjmxyARRCqP_VSQ0X1nnF3mDNYCtFoVjwuQ@mail.gmail.com>
References: <1450218466.13505.95.camel@linuxfoundation.org>
	<CAP9ODKpCU+5tM0UzjmxyARRCqP_VSQ0X1nnF3mDNYCtFoVjwuQ@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] m4: Drop unused/unreferenced patch
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
X-List-Received-Date: Wed, 16 Dec 2015 09:56:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-12-15 at 22:13 -0200, Otavio Salvador wrote:
> On Tue, Dec 15, 2015 at 8:27 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Is there a way to have a task, like fetchall, which checks for
> non-referenced metadata files? This would help to avoid this to
> happen
> in future.

Its a nice idea, the complexity is we have patches which can be native
specific, libc specific, machine specific and so on.

I guess if there were some bitbake API to pull out 'all possible
overrides', we might be able to come up with a definitive list and do
some checks based on that. Its not a simple problem and its also not a 
top priority issue right now with available resources. Might be an idea
to open an enhancement bug for it though?

Cheers,

Richard


