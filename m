Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Shgac-0001kD-G6 for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 14:34:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LCNVO2022166
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:23:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22083-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:23:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LCNNAG022158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:23:24 +0100
Message-ID: <1340281406.1640.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 13:23:26 +0100
In-Reply-To: <f12684b1c61cf98e52d4f5172e8c54b70e249b0a.1340192772.git.ross.burton@intel.com>
References: <cover.1340192772.git.ross.burton@intel.com>
	<f12684b1c61cf98e52d4f5172e8c54b70e249b0a.1340192772.git.ross.burton@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] gitignore: ignore build*/ entirely
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
X-List-Received-Date: Thu, 21 Jun 2012 12:34:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-06-20 at 12:47 +0100, Ross Burton wrote:
> Previously parts of build*/ were ignored, but unless you committed the top-level
> build/ in a branch this didn't achieve anything.  Change that to ignore all
> top-level build* directories.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .gitignore |    6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Merged to master, thanks.

Richard



