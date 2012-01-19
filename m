Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RntAc-0005un-FJ for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 15:40:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JEXGOZ002884
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:33:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01991-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:33:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JEX9Jx002878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:33:10 GMT
Message-ID: <1326983589.2511.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2012 14:33:09 +0000
In-Reply-To: <cover.1326968802.git.paul.eggleton@linux.intel.com>
References: <cover.1326968802.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] buildhistory analysis improvements
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
X-List-Received-Date: Thu, 19 Jan 2012 14:40:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-19 at 10:32 +0000, Paul Eggleton wrote:
> Collect and monitor some additional information about images, and
> report other (possibly non-monitored) changes when a monitored item
> changes to provide context.
> 
> Additionally a couple of minor issues where found in field handling for
> the package info files.
> 
> The following changes since commit a0f5dd25a37fe3b8664c2133e80b6214559f93f6:
> 
>   package_rpm.bbclass: Add support for filenames with spaces (2012-01-17 16:20:46 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-imginfo
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-imginfo
> 
> Paul Eggleton (4):
>   buildhistory: record additional image info
>   buildhistory_analysis: correctly handle whitespace when splitting
>     lists
>   buildhistory_analysis: improve field handling robustness
>   buildhistory_analysis: include related fields in output

Merged to master, thanks.

Richard



