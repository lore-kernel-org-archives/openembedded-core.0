Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (unknown [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id A3CA66FF30
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 14:06:27 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u28E6Kpk017586
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 8 Mar 2016 15:06:20 +0100
Received: from [139.16.79.50] (MD1FZU9C.ww002.siemens.net [139.16.79.50])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id u28E6JvL019945;
	Tue, 8 Mar 2016 15:06:19 +0100
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <56CC6832.90506@siemens.com>
	<1457090416.2804.19.camel@linuxfoundation.org>
	<CALbNGRQbfu45fM=kijvTnx4sY2SzjiVSCtGXhyt0xM+akP1sSQ@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <56DEDC5B.4050501@siemens.com>
Date: Tue, 8 Mar 2016 15:06:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQbfu45fM=kijvTnx4sY2SzjiVSCtGXhyt0xM+akP1sSQ@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Debugging using sysroots and GDB
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
X-List-Received-Date: Tue, 08 Mar 2016 14:06:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Andreas
> I am using sysroot for debugging too. I have no
>
> * INHERIT += "rm_work"
>
> and added
>
> INHIBIT_SYSROOT_STRIP = "1"
>
> to my local.conf
>
> I use this approach for very long time now and from my point of view
> it has one BIG advantage: I can use these settings for productive
> images and start remote debug within seconds without further
> rebuilding.
> OK - default compiler optimization sometimes causes headaches but it
> works for solving >80% of my cases. In case I want to debug software
> that I have developed setting optimization recipe wise helps or I
> debug that on PC or target itself.
How do you deal with the case where there is no source in your work dir because the package was taken from sstate?
The only solution I found so far is to build without sstate :(

Pascal

