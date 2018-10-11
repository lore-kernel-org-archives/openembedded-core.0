Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCC1D79B13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 11:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 428B918435;
	Thu, 11 Oct 2018 13:51:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id kakSyQPWTCGV; Thu, 11 Oct 2018 13:51:57 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 83CB41852F;
	Thu, 11 Oct 2018 13:51:57 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B1881A10F;
	Thu, 11 Oct 2018 13:51:57 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FEA61A08F;
	Thu, 11 Oct 2018 13:51:57 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 11 Oct 2018 13:51:57 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 24029DD7;
	Thu, 11 Oct 2018 13:51:57 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 0ED8D9C118; Thu, 11 Oct 2018 13:51:57 +0200 (CEST)
Date: Thu, 11 Oct 2018 13:51:56 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-ID: <20181011115156.bibtvbacs2haf4u4@axis.com>
Mail-Followup-To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20181010153528.9110-1-olofjn@axis.com>
	<ad0c4f9df33f9dfbece0d5e178779388c1b6d61c.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <ad0c4f9df33f9dfbece0d5e178779388c1b6d61c.camel@linuxfoundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] devtool-source.bbclass: Only create each patch branch once
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
X-List-Received-Date: Thu, 11 Oct 2018 11:51:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 18-10-11 10:34 +0100, Richard Purdie wrote:
> This breaks the oe-selftest devtool tests:
> 
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/46751/raw
> 
> oe-selftest -r devtool
> 
> should reproduce.

Thanks! Was under the impression that the DEVTOOL_EXTRA_OVERRIDES
was initialized to "", but that's not the case. Should it be? A
simple fix could be to just add DEVTOOL_EXTRA_OVERRIDES ??= "" to
the top of the bbclass. Is that the most appropriate fix? Or should
I make sure to handle None values coming back from getVar?


-- 
olofjn

