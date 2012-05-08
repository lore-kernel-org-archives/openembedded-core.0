Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SRmLE-0007BR-OI for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 17:28:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48FIrvh004299
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 16:18:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03358-09 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2012 16:18:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48FIi3s004293
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 16:18:45 +0100
Message-ID: <1336490329.30349.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 May 2012 16:18:49 +0100
In-Reply-To: <d666e9568920a989b672fb8ba6011eb17dd76037.1336488076.git.scott.a.garman@intel.com>
References: <cover.1336488076.git.scott.a.garman@intel.com>
	<d666e9568920a989b672fb8ba6011eb17dd76037.1336488076.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] openssl: fix incorrect INC_PR
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
X-List-Received-Date: Tue, 08 May 2012 15:28:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-08 at 07:42 -0700, Scott Garman wrote:
> Restore INC_PR to r15 to prevent breakage with out of tree openssl
> recipes (e.g, meta-oe).
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



