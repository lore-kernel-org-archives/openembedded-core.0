Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QthS9-0000Jc-V1 for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 16:50:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HEk9bI007884
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:46:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07786-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:46:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HEjfLx007878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:46:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <43bd6d395732a99058b427739aefdc5dfa0c0e95.1313539219.git.josh@linux.intel.com>
References: <cover.1313539219.git.josh@linux.intel.com>
	<43bd6d395732a99058b427739aefdc5dfa0c0e95.1313539219.git.josh@linux.intel.com>
Date: Wed, 17 Aug 2011 15:45:32 +0100
Message-ID: <1313592332.13995.44.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] shadow: switch to a fetchable SRC_URI
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
X-List-Received-Date: Wed, 17 Aug 2011 14:50:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-16 at 17:02 -0700, Joshua Lock wrote:
> Swith the SRC_URI to the one referenced on the sources section of the
> utilities download page (http://pkg-shadow.alioth.debian.org/download.php).
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  .../shadow/shadow-native_4.1.4.3.bb                |    2 +-
>  meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



