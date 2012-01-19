Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rnt7k-0005jw-2W for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 15:37:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JEUHLM002798
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:30:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01601-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:30:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JEUAue002791
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:30:11 GMT
Message-ID: <1326983409.2511.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2012 14:30:09 +0000
In-Reply-To: <3AB6CE7F274E534CAFD089D127A8A1FC0FCC82E5@SHSMSX102.ccr.corp.intel.com>
References: <cover.1326976547.git.shane.wang@intel.com>
	<09ab90b65169616911ae3811421b374158b6453d.1326976547.git.shane.wang@intel.com>
	<1326977788.2511.60.camel@ted>
	<3AB6CE7F274E534CAFD089D127A8A1FC0FCC82E5@SHSMSX102.ccr.corp.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] core-image-foo: add summary to each image bb file
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
X-List-Received-Date: Thu, 19 Jan 2012 14:37:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-19 at 13:12 +0000, Wang, Shane wrote:
> That could be. I originally thought they are DESCRIPTIONs.
> But for CacheData in cache.py, it seems not description but summary is used.
> Is it OK to change the code to make descriptions into CacheData?

Please see cache_extra.py and add the DESCRIPTION there.

Cheers,

Richard



