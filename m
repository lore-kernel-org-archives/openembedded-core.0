Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QwcH0-00055G-LG for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 17:55:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7PFoWqn031398
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 16:50:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30999-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 16:50:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7PFoMh1031392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 16:50:25 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <452876f08ee6516713d5a7198e8589953cd35f4b.1314286007.git.josh@linux.intel.com>
References: <cover.1314286007.git.josh@linux.intel.com>
	<452876f08ee6516713d5a7198e8589953cd35f4b.1314286007.git.josh@linux.intel.com>
Date: Thu, 25 Aug 2011 08:50:19 -0700
Message-ID: <1314287419.5939.199.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] classes/sanity: enhance the network connectivity test
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
X-List-Received-Date: Thu, 25 Aug 2011 15:55:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-25 at 08:29 -0700, Joshua Lock wrote:
> Switch to use the checkstatus fetcher API for the network connectivity test,
> this has several advantages:
> * we no longer print any messages to the console whilst the check is
> being run
> * we don't actually download anything, removing the need for tidy up and
> making the code more concise
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>

Merged to master, thanks.

Richard



