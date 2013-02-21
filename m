Received: from exprod5og117.obsmtp.com ([64.18.0.149])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.donnelly@ge.com>) id 1U8XKB-0005pI-Vi
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 15:40:44 +0100
Received: from cinmlip11.e2k.ad.ge.com ([165.156.4.1]) (using TLSv1) by
	exprod5ob117.postini.com ([64.18.4.12]) with SMTP
	ID DSNKUSYuHNH4Bp6yWsrt38tUmAXoKjHihDp3@postini.com;
	Thu, 21 Feb 2013 06:24:29 PST
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by cinmlip11.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	21 Feb 2013 09:19:06 -0500
Received: from selma.edi.geip.ge.com ([3.26.68.70])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 21 Feb 2013 09:19:04 -0500
Received: from [3.26.68.199] (fyvie.edi.geip.ge.com [3.26.68.199])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by selma.edi.geip.ge.com (Postfix) with ESMTPS id CF22DE180A;
	Thu, 21 Feb 2013 14:19:02 +0000 (GMT)
Message-ID: <51262CD4.7030303@ge.com>
Date: Thu, 21 Feb 2013 14:19:00 +0000
From: Martin Donnelly <martin.donnelly@ge.com>
Organization: GE Intelligent Platforms
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130215 Thunderbird/17.0.3
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1361265275.git.kai.kang@windriver.com>
	<97d24123c74069eea42442dca543d77c6fd6647a.1361265275.git.kai.kang@windriver.com>
In-Reply-To: <97d24123c74069eea42442dca543d77c6fd6647a.1361265275.git.kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] rpm: redirect output of post install script
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
X-List-Received-Date: Thu, 21 Feb 2013 14:41:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 20/02/2013 06:16, Kang Kai wrote:
> When distro feature "debug-tweak" enabled, redirect output of post
> install script to log file which can be configured.

Is the DISTRO_FEATURE not "debug-tweaks" here and not "debug-tweak"?

Martin


