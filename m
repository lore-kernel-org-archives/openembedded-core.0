Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9D42E71957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 00:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1H03EZf017010; Wed, 17 Feb 2016 00:03:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ICew3YR1LI2Z; Wed, 17 Feb 2016 00:03:47 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1H03jUK017028
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Feb 2016 00:03:46 GMT
Message-ID: <1455667425.28376.34.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2016 00:03:45 +0000
In-Reply-To: <CABcZANku1BbE61_CF5vduOwLjnoutDaeqPQEFdbrLOFCNiHfTg@mail.gmail.com>
References: <1455666592.28376.31.camel@linuxfoundation.org>
	<CABcZANku1BbE61_CF5vduOwLjnoutDaeqPQEFdbrLOFCNiHfTg@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] rng-tools: Fix underquoted m4 and libgcrypt floating dependency
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
X-List-Received-Date: Wed, 17 Feb 2016 00:03:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-16 at 23:52 +0000, Christopher Larson wrote:
> > -PACKAGECONFIG = ""
> > +PACKAGECONFIG = "libgcrypt"
> >  PACKAGECONFIG_libc-musl = "libargp"
> >  PACKAGECONFIG_libc-uclibc = "libargp"
> I'm not sure how well musl/uclibc support libgcrypt, but this does
> end up not including gcrypt support for those libcs, unless we switch
> it to _append_libc-.

I shouldn't have pulled the original patch without testing. The M2 rc2
build then failed due to this so I've merged my fix since I *really*
want to get that build done tonight, finally.

The dependency was already there really from the RDEPENDS which is why
I opted to do this. I'll take follow up patches to resolve any
musl/uclibc issues.

Cheers,

Richard

