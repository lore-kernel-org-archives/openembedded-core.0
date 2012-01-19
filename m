Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rnt9v-0005ny-BZ for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 15:40:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JEWWqo002850
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:32:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02801-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:32:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JEWOZt002844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:32:25 GMT
Message-ID: <1326983543.2511.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2012 14:32:23 +0000
In-Reply-To: <592d932934f891f3f73dc9630fa9d1a7d94aff56.1326981479.git.paul.eggleton@linux.intel.com>
References: <cover.1326981478.git.paul.eggleton@linux.intel.com>
	<592d932934f891f3f73dc9630fa9d1a7d94aff56.1326981479.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] classes/patch: avoid backtrace when patch does not apply
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
X-List-Received-Date: Thu, 19 Jan 2012 14:40:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-19 at 13:59 +0000, Paul Eggleton wrote:
> We don't need to see a Python stack backtrace when a patch does not
> apply, just the error output from patch, so trap these kinds of errors
> and ensure that we display the message and fail the task and nothing
> else.
> 
> Fixes [YOCTO #1143]
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/patch.bbclass |    5 ++++-
>  meta/lib/oe/patch.py       |   10 +++++-----
>  2 files changed, 9 insertions(+), 6 deletions(-)

Merged to master, thanks.

Richard



