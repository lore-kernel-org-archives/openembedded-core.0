Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDcEP-00069c-GM for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 15:18:53 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9BDJmFW017971 for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 14:19:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yLGGRjggB17V
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 14:19:48 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9BDJkqT017967
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 14:19:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2011 14:13:04 +0100
In-Reply-To: <ab7c12d54b2e4c470c51cf203e7ae63f6bf544e1.1318321409.git.liezhi.yang@windriver.com>
References: <cover.1318321409.git.liezhi.yang@windriver.com>
	<ab7c12d54b2e4c470c51cf203e7ae63f6bf544e1.1318321409.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318338793.23801.93.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] Fix typos in local.conf.sample and local.conf.sample.extended
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
X-List-Received-Date: Tue, 11 Oct 2011 13:18:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-11 at 16:25 +0800, Robert Yang wrote:
> Fixes bug [YOCTO #1667]
> 
> Fix typos in local.conf.sample and local.conf.sample.extended:
> 
> differernt -> different
> chages -> changes
> complation -> compilation
> egde -> edge
> "an an" -> "as an"
> images's -> image's
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-yocto/conf/local.conf.sample          |   10 +++++-----
>  meta-yocto/conf/local.conf.sample.extended |    4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)

This is a patch against poky, not oe-core. I've merged it into poky with
some tweaks and also ported the appropriate fixes to OE-Core's version
of local.conf.sample.

Cheers,

Richard



