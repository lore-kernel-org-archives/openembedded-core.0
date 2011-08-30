Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyVaG-0002Dc-KM for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 23:11:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UL67Qg001059;
	Tue, 30 Aug 2011 22:06:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20955-09; Tue, 30 Aug 2011 22:06:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UL5xT3001010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 30 Aug 2011 22:05:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314640829-28570-2-git-send-email-kergoth@gmail.com>
References: <1314640829-28570-1-git-send-email-kergoth@gmail.com>
	<1314640829-28570-2-git-send-email-kergoth@gmail.com>
Date: Tue, 30 Aug 2011 22:05:48 +0100
Message-ID: <1314738348.5939.422.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 2/2] image_types_uboot: fix a number of issues
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
X-List-Received-Date: Tue, 30 Aug 2011 21:11:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-29 at 11:00 -0700, Christopher Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> - Don't use a variable reference in the IMAGE_DEPENDS
> - Inherit kernel-arch to get UBOOT_ARCH
> - Don't include the .bz2 variants, since the base types aren't in
>   oe-core
> - Add the new types to IMAGE_TYPES
> - Inherit image_types, to be certain we load after it
> 
> Signed-off-by: Chris Larson <chris_larson@mentor.com>
> ---
>  meta/classes/image_types_uboot.bbclass |   25 ++++++++++++-------------
>  1 files changed, 12 insertions(+), 13 deletions(-)

Merged to master, thanks.

Richard



