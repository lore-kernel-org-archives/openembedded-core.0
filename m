Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1STyc5-0004Jr-Kp
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 18:59:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4EGnDLp021945
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 09:49:13 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 14 May 2012 09:49:13 -0700
Message-ID: <4FB13788.2020200@windriver.com>
Date: Mon, 14 May 2012 11:49:12 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337011770-24297-1-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1337011770-24297-1-git-send-email-jason.wessel@windriver.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH 0/2] bitbake.conf: gracefully work with ccache environment variables
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
X-List-Received-Date: Mon, 14 May 2012 16:59:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/14/2012 11:09 AM, Jason Wessel wrote:
> The end user of oe-core should be free to turn off ccache, or use an
> external ccache without impacting the sstate sums.
> 
> Example of using a different ccache directory via local.conf
> 
> CCACHE_DIR = "/tmp/ccache"
> 
> Example of turning off ccache:
> 
> export CCACHE_DISABLE = "1"
> BB_HASHBASE_WHITELIST += "CCACHE_DISABLE"


Oops.  I got this totally wrong...  It is bogus to move around the defaults in the core bitbake.conf.

All that needs to be done for the second case is to add to my local.conf:

export CCACHE_DISABLE = "1"
BB_HASHBASE_WHITELIST_append += "CCACHE_DISABLE"

And that doesn't require any changes to the bitbake.conf.

Sorry for the noise.   I'll send a patch just to add CCACHE_DIR to the BB_HASHBASE_WHITELIST.

Cheers,
Jason.




