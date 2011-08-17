Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qth6g-0008Qe-N6 for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 16:28:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HENwVE007783
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:23:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06235-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:23:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HENmsI007777
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:23:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9d113e2d08c51a5829e05c87c70c70546f262ebb.1313580714.git.elizabeth.flanagan@intel.com>
References: <cover.1313580714.git.elizabeth.flanagan@intel.com>
	<9d113e2d08c51a5829e05c87c70c70546f262ebb.1313580714.git.elizabeth.flanagan@intel.com>
Date: Wed, 17 Aug 2011 15:23:41 +0100
Message-ID: <1313591021.13995.42.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] buildstats.bbclass: Fixing task endtime
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
X-List-Received-Date: Wed, 17 Aug 2011 14:28:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-17 at 04:38 -0700, Beth Flanagan wrote:
> Task endtime got left out of recent changes. Adding it back in.
> 
> Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
> ---
>  meta/classes/buildstats.bbclass |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

Merged to master, thanks.

Richard



