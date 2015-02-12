Return-Path: <openembedded-devel@urbanec.net>
Received: from mail14.tpgi.com.au (mail14.tpgi.com.au [203.12.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 354EC73310
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 03:56:46 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Thu, 12 Feb 2015 14:56:44 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail14.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t1C3ufYg017716
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Thu, 12 Feb 2015 14:56:44 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YLktN-0000WJ-EH; Thu, 12 Feb 2015 14:56:41 +1100
Message-ID: <54DC2479.7050507@urbanec.net>
Date: Thu, 12 Feb 2015 14:56:41 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Gortmaker <paul.gortmaker@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1423699224-19243-1-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1423699224-19243-1-git-send-email-paul.gortmaker@windriver.com>
Subject: Re: [PATCH] mozjs: fix build failure due to missing dependency on libxt
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
X-List-Received-Date: Thu, 12 Feb 2015 03:56:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/15 11:00, Paul Gortmaker wrote:
> Looking at the configure script, we see these invalid values are output
> when the autoconf test for X11 fails.  That test fails in the following
> fashion:
...
> Since the package clearly has never been built in a no-X11 OE environment,
> we assume that all OE users to date are X11 users and hence simply add a
> dependency on libxt.

I've run into this problem quite a while ago. My fix for this was a 
.bbappend file that passes --without-x to configure, since my target has 
no X11.


