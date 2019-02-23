Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 1333 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 23 Feb 2019 14:48:12 UTC
Received: from cpanel4.indieserve.net (cpanel4.indieserve.net [199.212.143.9])
	by mail.openembedded.org (Postfix) with ESMTP id 91A907CB50
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BVYWRnnK8RYu2IJS1QprrHWyqLWY0GZax+9b9TrC80A=;
	b=Fu4pR7oK2aIf2P7dPWzA2b+kl
	Pom8qzcb6LrnAW7/vGt4wxQmf9wU7H5QBtvrJ1ifqb+6q9uAo4DHKNb+JKKoyX3Zew48AL+lakkM4
	HDVsRJIyR5MnUPjOsVniU4DhknVSGZ5H1QZffDTDKDtVRvu4+9OExbEO0CselUP6s0SCGNSwG+Z5g
	Mze2YSunJBYCeYCAZUBclhdSTjQvIM4L8vYVuHx84gW5bQoZGRAj4f+YpVpGoXRju0GZolGoRdC4p
	/pFM4GpxCN906hthcowLpM/ew/3dZA1Z7obRdzIe6U3JtV/GktBzafOkcvCx8yBTE9n5/z1rKwFsT
	R3mi9wrlQ==;
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:60844 helo=localhost.localdomain)
	by cpanel4.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1gxYFa-00G9LQ-Fc; Sat, 23 Feb 2019 09:25:59 -0500
Date: Sat, 23 Feb 2019 09:25:57 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <20190223135029.15553-1-richard.purdie@linuxfoundation.org>
Message-ID: <alpine.LFD.2.21.1902230925430.28249@localhost.localdomain>
References: <20190223135029.15553-1-richard.purdie@linuxfoundation.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel4.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel4.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel4.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: Ensure an initramdfs is added if configured
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
X-List-Received-Date: Sat, 23 Feb 2019 14:48:12 -0000
Content-Type: text/plain; charset=US-ASCII


  "initramdfs"?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                  http://crashcourse.ca/dokuwiki

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

