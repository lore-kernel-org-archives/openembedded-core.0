Return-Path: <olof.johansson@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 67ADC6AF12
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 13:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id CEACA11F9C;
	Thu,  8 Aug 2013 15:06:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sjoDxpeBW-gm; Thu,  8 Aug 2013 15:06:06 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 3DF6E11F9B;
	Thu,  8 Aug 2013 15:06:06 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 244ED5C3;
	Thu,  8 Aug 2013 15:06:06 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 18D1651B;
	Thu,  8 Aug 2013 15:06:06 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 172D73E06F;
	Thu,  8 Aug 2013 15:06:06 +0200 (CEST)
Received: from axis.com (10.92.17.1) by xmail2.se.axis.com (10.0.5.74) with
	Microsoft SMTP Server (TLS) id 8.2.255.0; Thu, 8 Aug 2013 15:06:05 +0200
Date: Thu, 8 Aug 2013 15:06:04 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130808130604.GB12638@axis.com>
References: <cover.1375952210.git.hongxu.jia@windriver.com>
	<9facc9593dc27237a07ebd620b9d7c9d9541f20a.1375952210.git.hongxu.jia@windriver.com>
	<20130808090617.GF25081@axis.com> <52036240.3090506@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52036240.3090506@windriver.com>
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
X-List-Received-Date: Thu, 08 Aug 2013 13:06:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 13-08-08 11:17 +0200, Hongxu Jia wrote:
> On 08/08/2013 05:06 PM, Olof Johansson wrote:
> > The recipe is called libdbm-sqlite-perl, but the perl module is
> > called DBD::SQLite. Is that intentional, and if so, why?
>
> I know what your mean, we should rename the recipe:
> s/libdbm-sqlite-perl_1.40.bb/libdbd-sqlite-perl_1.40.bb/

Yes, exactly. Sorry if I was unclear.

-- 
olofjn

