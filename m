Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RINJp-0004YR-Dv for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 18:24:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9OGID4b031010
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 17:18:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30368-06 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 17:18:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9OGI3OG031004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 17:18:04 +0100
Message-ID: <1319473083.26563.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 24 Oct 2011 17:18:03 +0100
In-Reply-To: <64effb846c8f9b1e6fe57a7e213d24d046439b99.1319135920.git.josh@linux.intel.com>
References: <cover.1319135920.git.josh@linux.intel.com>
	<64effb846c8f9b1e6fe57a7e213d24d046439b99.1319135920.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] gst-plugins-good: correctly handle gconf schema
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
X-List-Received-Date: Mon, 24 Oct 2011 16:24:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-20 at 11:40 -0700, Joshua Lock wrote:
> Add the shipped gconf schema to the gconfelements package and inherit the gconf
> class so that schema processing is handled via post* scripts.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  .../gstreamer/gst-plugins-good_0.10.30.bb          |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



