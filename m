Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=47094b4ea=rich.pixley@palm.com>)
	id 1SSH08-0003p7-LR for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:13:00 +0200
X-IronPort-AV: E=Sophos;i="4.75,560,1330934400"; d="scan'208";a="13415666"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP; 09 May 2012 17:03:06 -0700
Received: from fuji-land.noir.com ([10.100.2.2])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id q4A036S0019461;
	Wed, 9 May 2012 17:03:06 -0700
Message-ID: <4FAB05BA.1000803@palm.com>
Date: Wed, 09 May 2012 17:03:06 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FA17B2A.5060903@palm.com> <4FA17FA7.9030805@windriver.com>
	<4FA187F4.9040003@palm.com> <4FA18DA7.6010205@windriver.com>
	<4FA18EC8.5040504@palm.com> <4FA18F9D.5090805@windriver.com>
	<1335999994.30113.39.camel@ted> <4FA6B6AC.60301@palm.com>
	<1336480442.25084.74.camel@ted> <4FAAAEB6.2060703@palm.com>
	<1336593138.2494.72.camel@ted> <4FAAF7F9.4030000@palm.com>
	<1336605997.2494.103.camel@ted>
In-Reply-To: <1336605997.2494.103.camel@ted>
Subject: Re: SetScene tasks hang forever?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 00:13:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/12 16:26 , Richard Purdie wrote:
> The settings that are now recommended are:
>
> BB_SIGNATURE_HANDLER ?= 'OEBasicHash'
> OELAYOUT_ABI = "8"
>
> This requires a rebuild since the stamp file format changes, hence the
> ABI number increase. Currently, poky and angstrom use these settings
> amongst others but its not default in OE-Core. I'll likely propose a
> change to make it the default soon though.
>
> This would then make BB_STAMP_POLICY = "full" obsolete and yet
> incremental builds will work correctly and likely rebuild less things
> (only really what potentially changed).
Thank you for the explanation.

I'll switch us immediately.

--rich


