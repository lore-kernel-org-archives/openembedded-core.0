Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4byT-0001Wx-OD for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:13:13 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GHE8qY000420 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 18:14:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eJehbizYOSA2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 18:14:08 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GHE25F000410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 18:14:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 18:07:50 +0100
In-Reply-To: <9320024626bed55a7c6058131e1cb6c47944a36d.1316037832.git.josh@linux.intel.com>
References: <cover.1316037832.git.josh@linux.intel.com>
	<9320024626bed55a7c6058131e1cb6c47944a36d.1316037832.git.josh@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316192878.20858.51.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] sanity: disable mirrors for connectivity check
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
X-List-Received-Date: Fri, 16 Sep 2011 17:13:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 15:09 -0700, Joshua Lock wrote:
> It's difficult to test a range of fetchers when using mirrors, therefore create a throwaway
> copy of the datastore and delete the MIRROR and PREMIRROR variables to ensure they aren't
> used in the connectivity check.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/classes/sanity.bbclass |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



