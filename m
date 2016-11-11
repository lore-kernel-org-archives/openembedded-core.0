Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 26C4F6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 18:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uABI3eih002952; Fri, 11 Nov 2016 18:04:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zUOzYoOnU3Hm; Fri, 11 Nov 2016 18:04:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uABI4Yjp003051
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 11 Nov 2016 18:04:35 GMT
Message-ID: <1478887474.23123.233.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2016 18:04:34 +0000
In-Reply-To: <d8dfb2d5-66de-8daf-99c3-13c611a7f5b2@linux.intel.com>
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<d8dfb2d5-66de-8daf-99c3-13c611a7f5b2@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Fri, 11 Nov 2016 18:04:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-11-11 at 15:10 +0200, Alexander Kanavin wrote:
> On 11/10/2016 02:39 AM, Khem Raj wrote:
> > 
> > This is converging the recipes for go from
> > meta-virtualization and oe-meta-go
> Wait a moment, why this should go to oe-core and not to meta-go? Is 
> there something in oe-core itself that requires presence of go
> compiler?

This was something that came up at OEDEM. There are several layers with
several attempts at getting this right, most have some issues.

Whilst we've been pulling things out of core, we also need to consider
things that perhaps should get added. Having this in core would
certainly address a number of issues (but is also potentially a
maintenance burden).

We did agree there that we'd consider this. Obviously input from people
not there is welcome though and this does need discussion. I'm leaning
moderately in favour of adding it as things stand.

Cheers,

Richard

