Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qsvo1-0005re-SK for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 13:58:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FBrYqh016546
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 12:53:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16215-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 12:53:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FBrRYc016540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 12:53:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <7443e896b8c85ab870f00a81151d827bda343eef.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
	<7443e896b8c85ab870f00a81151d827bda343eef.1313363644.git.sgw@linux.intel.com>
Date: Mon, 15 Aug 2011 12:53:25 +0100
Message-ID: <1313409205.14274.567.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 03/12] utils.bbclass/multilib.class: Added misc supporting functions.
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
X-List-Received-Date: Mon, 15 Aug 2011 11:58:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-08-14 at 16:30 -0700, Saul Wold wrote:
> From: Lianhao Lu <lianhao.lu@intel.com>
> 
> 1. Added variable MULTILIB_VARIANTS to store all the instance variants
> for multilib extend.
> 
> 2. Added function all_multilib_tune_values to collect the variable
> values for all multilib instance.
> 
> 3. multilib bbclass handler will save the orignal value of all variables
> defined in MULTILIB_SAVE_VARNAME.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/classes/multilib.bbclass |    7 ++++++-
>  meta/classes/utils.bbclass    |   29 +++++++++++++++++++++++++++++
>  meta/conf/bitbake.conf        |    1 +
>  meta/conf/multilib.conf       |    3 +++
>  4 files changed, 39 insertions(+), 1 deletions(-)

I've taken this however we have a lot of different lists of the mulitlib
pieces floating around in different variables now and I'm hoping we can
consolidate these a bit...

Cheers,

Richard



