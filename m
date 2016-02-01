Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AF64F771D5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 14:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u11E9tjB005152; Mon, 1 Feb 2016 14:09:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id K33kUIKBfO84; Mon,  1 Feb 2016 14:09:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u11E9pCr005149
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 1 Feb 2016 14:09:53 GMT
Message-ID: <1454335791.27087.35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>, Khem Raj <raj.khem@gmail.com>
Date: Mon, 01 Feb 2016 14:09:51 +0000
In-Reply-To: <56AF6538.9010000@windriver.com>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
	<bb6291a740fc7e41120072e45fc2c5d8d93a0b5f.1454088695.git.hongxu.jia@windriver.com>
	<718c652c42b84c58a04e9c33261b30ba@XBOX02.axis.com>
	<56AC1101.70209@windriver.com>
	<B88596E1-A5F6-4199-89D8-194E48A06742@gmail.com>
	<1454151423.10340.84.camel@linuxfoundation.org>
	<56AF6538.9010000@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] gcc-5.3.inc/base.bbclass: add gcc option to not record -fdebug-prefix-map to debugging info
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
X-List-Received-Date: Mon, 01 Feb 2016 14:10:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-01 at 22:01 +0800, Hongxu Jia wrote:
> On 01/30/2016 06:57 PM, Richard Purdie wrote:
> > On Fri, 2016-01-29 at 18:36 -0800, Khem Raj wrote:
> > > > On Jan 29, 2016, at 5:25 PM, Hongxu Jia <
> > > > hongxu.jia@windriver.com>
> > > > wrote:
> > > > 
> > > > On 01/30/2016 01:47 AM, Peter Kjellerstedt wrote:
> > > > > Wouldn't it be better to swap the first and second commit and
> > > > > then
> > > > > move the addition of -gno-record-debug-prefix-map to the
> > > > > other
> > > > > commit
> > > > > where -fdebug-prefix-map are added.
> > > > OK
> > > > 
> > > > > You must also remember that not all use the compiler provided
> > > > > by
> > > > > OE-Core, so adding -gno-record-debug-prefix-map
> > > > > unconditionally
> > > > > to
> > > > > DEBUG_CFLAGS will break with unpatched compilers... (This
> > > > > also
> > > > > indicates that "Upstream-Status: Inappropriate [oe specific]"
> > > > > may
> > > > > not be quite right if you want this to be supported by other
> > > > > compiler versions).
> > > > Agree, we should conditionally add -gno-record-debug-prefix-map
> > > > to
> > > > support other compiler. Thank you for pointing it out.
> > > its not only non gcc compilers, we also have gcc 4.9 still.
> > I think we do likely need to patch 4.9. For other compilers than
> > that,
> > or other compilers, I'd suggest that people can either define a set
> > of
> > DEBUG_CFLAGS, or set:
> > 
> > DEBUG_CFLAGS_remove = "-gno-record-debug-prefix-map"
> > 
> > to avoid problems. I'm not sure making it conditional in some way
> > is
> > any better than just using the above line.
> 
> Got it, I will do it in V4.

I think we should try and see if the the gcc patch would be accepted
upstream. Meanwhile, if we default to turning this on in our compilers,
much of this issue goes away as Phil mentions.

Cheers,

Richard




