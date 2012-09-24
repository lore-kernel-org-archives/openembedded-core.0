Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mneergaa@cisco.com>) id 1TG6b8-0008K2-Kg
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 13:13:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=650; q=dns/txt; s=iport;
	t=1348484425; x=1349694025;
	h=date:from:to:subject:message-id:references:mime-version:
	content-transfer-encoding:in-reply-to;
	bh=1CQ4HzE5BmCZOuMUkclYQEIKGvBtsGS9pHXkLBoRF4k=;
	b=RGD06WJPZ7Se0BP8AU3bhwUK6fYWDWxm/fQPIhRxSqaV8uc6Nncdsnzl
	Vdtnpg0hlAu3gCS7qfVwdaQLXfcBKS9QIk7lTMPoSHFB0rD0j6UiNFrEA
	hYle+tdezPghrOflXHSzZRB/hZR3BdVwVhDyRx3Y86MVT68bbxuX9bYId 8=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AkkFAD08YFCQ/khM/2dsb2JhbABFhURHuCGBCIIhAQEEEgEQDwFWCxoCJgICFH6HY5hJjRySJgSBIY0Fgg6BEgOVZI47gWmCaQ
X-IronPort-AV: E=Sophos;i="4.80,474,1344211200"; d="scan'208";a="144273087"
Received: from ams-core-3.cisco.com ([144.254.72.76])
	by ams-iport-1.cisco.com with ESMTP; 24 Sep 2012 10:58:40 +0000
Received: from kattastrofe (dhcp-10-54-74-65.cisco.com [10.54.74.65])
	by ams-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id q8OAweSr014264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 10:58:40 GMT
Date: Mon, 24 Sep 2012 12:58:40 +0200
From: Morten Minde Neergaard <mneergaa@cisco.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120924105839.GK2254@kattastrofe.rd.tandberg.com>
References: <20120924074452.GH2254@kattastrofe.rd.tandberg.com>
MIME-Version: 1.0
In-Reply-To: <20120924074452.GH2254@kattastrofe.rd.tandberg.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Customize devshell terminal command / environment?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 11:13:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

At 09:44, Mon 2012-09-24, Morten Minde Neergaard wrote:
[…]
>  * Make a new CustomTerminal terminal class that takes its command line
>    from a configuration directive, e.g. OE_TERMINAL_CUSTOMCMD
>  * Allowing option overrides for each of the existing classes
>  * Detect the STY variable if present, and use the existing screen if
>    one exists

Class tentatively named Custom, and allows me to use screen as I wish
using the following config:

OE_TERMINAL = "custom"
OE_TERMINAL_CUSTOMCMD = "screen"
OE_TERMINAL_EXPORTS += "STY"

Patch maintained on the gist:

https://gist.github.com/3774736

-- 
Morten Minde Neergaard


