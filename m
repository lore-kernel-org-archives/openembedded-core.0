Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QKBCi-0003u4-CS for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 17:20:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BFHDiR021021
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 16:17:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20697-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 16:17:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BFH9x2021015
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 16:17:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305039119-1469-3-git-send-email-otavio@ossystems.com.br>
References: <1305039119-1469-1-git-send-email-otavio@ossystems.com.br>
	<1305039119-1469-3-git-send-email-otavio@ossystems.com.br>
Date: Wed, 11 May 2011 16:17:03 +0100
Message-ID: <1305127023.30391.374.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] cmake: add support for oe qt4 tools names
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
X-List-Received-Date: Wed, 11 May 2011 15:20:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 14:51 +0000, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-devtools/cmake/cmake-native_2.8.3.bb  |    2 +-
>  meta/recipes-devtools/cmake/cmake.inc              |    3 +-
>  .../cmake/cmake/support-oe-qt4-tools-names.patch   |   90 ++++++++++++++++++++
>  3 files changed, 93 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch

This looks ok but could you please give more details in the patch about
why its needed. Saul should be able to point you at the details of where
that information is.

Cheers,

Richard



