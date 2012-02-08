Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rv5Ki-0007Lq-FL for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 12:05:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q18Av1vu018737
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2012 10:57:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18383-05 for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2012 10:56:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q18AupEI018731
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2012 10:56:53 GMT
Message-ID: <1328698619.29471.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Feb 2012 10:56:59 +0000
In-Reply-To: <cover.1328638222.git.paul.eggleton@linux.intel.com>
References: <cover.1328638222.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Buildhistory sorting fixes v2
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
X-List-Received-Date: Wed, 08 Feb 2012 11:05:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-07 at 18:14 +0000, Paul Eggleton wrote:
> v2 fixes incorrect variable name and removes the erroneous sorting of
> PACKAGES (for which the original order *is* significant).
> 
> The following changes since commit 18d9fcfc4bc4b01f73e89f3b988c9d3d543c7705:
> 
>   libzypp: add missing runtime dependences on gzip and gnupg (2012-02-03 17:23:28 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fix3
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fix3
> 
> Paul Eggleton (2):
>   classes/buildhistory: sort image file list
>   classes/buildhistory: sort list fields in package info

Merged to master, thanks.

Richard





