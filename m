Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PvI0m-0001KA-9b for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 00:32:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23NVKbS023571
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 23:31:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23514-02 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2011 23:31:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23NV7iL023519
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 23:31:07 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1299168546-20430-1-git-send-email-raj.khem@gmail.com>
References: <1299168546-20430-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 03 Mar 2011 23:31:01 +0000
Message-ID: <1299195061.17567.194.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv4 6/6] rpm: Fix linking error encountered in rpm-native
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
X-List-Received-Date: Thu, 03 Mar 2011 23:32:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 08:09 -0800, Khem Raj wrote:
> * This patch passes the correct LDFLAGS to account for
>   additional dependencies of librpmio on libbeecrypt and libsyck
>   and hence fixes the build error.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |   24 ++++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
>  2 files changed, 26 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch

Merged into OE-Core master, thanks for the update.

Cheers,

Richard




