Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6iHG-00072G-N2 for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 13:49:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BkrKc015529
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:46:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14972-10 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 12:46:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BkkqE015523
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:46:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <f342173d3b3e5e329a81f4d1abb91f4af42e5335.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<f342173d3b3e5e329a81f4d1abb91f4af42e5335.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 12:46:43 +0100
Message-ID: <1301917604.24596.338.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 06/46] recipes: Use -uclibceabi instead of -uclibcgnueabi
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
X-List-Received-Date: Mon, 04 Apr 2011 11:49:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:28 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../pciutils/pciutils-3.1.7/configure.patch        |    2 +-
>  .../pciutils/pciutils-3.1.7/guess-fix.patch        |    2 +-
>  .../openssl/openssl-0.9.8p/configure-targets.patch |    4 ++--
>  .../gcc/gcc-4.3.3/110-arm-eabi.patch               |    2 +-
>  meta/recipes-devtools/gcc/gcc-configure-common.inc |    2 +-
>  meta/recipes-devtools/gcc/gcc-configure-sdk.inc    |    2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)

Patches 3-6 merged to master, thanks.

Richard



