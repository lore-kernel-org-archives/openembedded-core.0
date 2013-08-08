Return-Path: <olof.johansson@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4426AF12
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 13:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id A8C1211F9F;
	Thu,  8 Aug 2013 15:08:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D3FWYr8LdD3P; Thu,  8 Aug 2013 15:08:42 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 39320349606;
	Thu,  8 Aug 2013 15:08:40 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id E1E3B5C5;
	Thu,  8 Aug 2013 15:08:39 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id D6C5B4FA;
	Thu,  8 Aug 2013 15:08:39 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id D51133404E;
	Thu,  8 Aug 2013 15:08:39 +0200 (CEST)
Received: from axis.com (10.92.17.1) by xmail2.se.axis.com (10.0.5.74) with
	Microsoft SMTP Server (TLS) id 8.2.255.0; Thu, 8 Aug 2013 15:08:39 +0200
Date: Thu, 8 Aug 2013 15:08:38 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130808130838.GC12638@axis.com>
References: <cover.1375952210.git.hongxu.jia@windriver.com>
	<9facc9593dc27237a07ebd620b9d7c9d9541f20a.1375952210.git.hongxu.jia@windriver.com>
	<CAJTo0LZgSV7RRPE6qjNp9fkRD9abiWoW6teRdYq2zBXEWdcmew@mail.gmail.com>
	<52037BBF.1030600@windriver.com>
	<CAJTo0LbxpTyZCn7wCmynEPT9n5o=iSbZcn7HMooe=mewV_fE3w@mail.gmail.com>
	<5203828E.2040705@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5203828E.2040705@windriver.com>
Thread-Topic: [OE-core] [PATCH 2/2] libdbm-sqlite-perl: add version 1.40
Accept-Language: en-US, sv-SE
acceptlanguage: en-US, sv-SE
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libdbm-sqlite-perl: add version 1.40
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
X-List-Received-Date: Thu, 08 Aug 2013 13:08:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Language: en-US

On 13-08-08 13:35 +0200, Hongxu Jia wrote:
> Great, how about create a new layer named 'meta-perl', we sould do:
...
> - and than move other perl libraries already existed in oe-core
>    to that layer, it includes:
>    * meta/recipes-extended/perl/
>    * meta/recipes-devtools/perl/

I assume perl module recipes already in oecore are there for a
reason, and we should perhaps avoid moving them, and just let
meta-perl depend on oecore. Right?

But I like the idea of a meta-perl for my personal projects...
Would be happy to help!

-- 
olofjn

