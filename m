Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 282A3706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 10:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1NAMJRN021240; Mon, 23 Feb 2015 10:22:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PGgewPNo_5QL; Mon, 23 Feb 2015 10:22:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1NAM4k0021222
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Feb 2015 10:22:15 GMT
Message-ID: <1424686924.11836.78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 23 Feb 2015 10:22:04 +0000
In-Reply-To: <1424686123.11836.76.camel@linuxfoundation.org>
References: <1424610251.11836.74.camel@linuxfoundation.org>
	<54EAB6E3.5010804@windriver.com>
	<1424686123.11836.76.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto task performance numbers
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
X-List-Received-Date: Mon, 23 Feb 2015 10:22:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Also, for reference/interest, the recent kernel populate_sysroot changes
took the kernel build time from over 11 mins to 8 mins. With the move to
3.19:

fedora19,master:5db6a27f4847e51c6434a968f81d3ceffcc54952 7:58.74
fedora19,master:5db6a27f4847e51c6434a968f81d3ceffcc54952 7:57.59
fedora19,master:5db6a27f4847e51c6434a968f81d3ceffcc54952 7:59.18
fedora19,master:5db6a27f4847e51c6434a968f81d3ceffcc54952 8:00.81
fedora19,master:5db6a27f4847e51c6434a968f81d3ceffcc54952 8:01.44
fedora19,master:5db6a27f4847e51c6434a968f81d3ceffcc54952 7:59.12
fedora19,master:172606338757d0b788e3382bf413102647307e1d 8:29.71
fedora19,master:172606338757d0b788e3382bf413102647307e1d 8:37.66
fedora19,master:172606338757d0b788e3382bf413102647307e1d 8:36.41
fedora19,master:172606338757d0b788e3382bf413102647307e1d 8:34.24
fedora19,master:172606338757d0b788e3382bf413102647307e1d 8:36.19

You can see 3.19 takes around 30-35s longer to build. These numbers are
extracted from our benchmark machine which monitors things like this.

Cheers,

Richard


