Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S2jGm-0000wE-Ri for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 14:08:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1TD0896030092
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 13:00:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28765-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 13:00:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1TD00e8030076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 13:00:01 GMT
Message-ID: <1330520402.24508.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 29 Feb 2012 13:00:02 +0000
In-Reply-To: <cover.1330494042.git.otavio@ossystems.com.br>
References: <cover.1330494042.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Pending patches from O.S. Systems' tree
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
X-List-Received-Date: Wed, 29 Feb 2012 13:08:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-29 at 05:41 +0000, Otavio Salvador wrote:
> The following changes since commit 61216d2743502ef38955054aad6a4f2ed63e6d43:
> 
>   licenses.conf: fix quotting of SRC_DISTRIBUTE_LICENSES (2012-02-28 17:51:42 +0000)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/oe-core master
>   https://github.com/OSSystems/oe-core/tree/HEAD
> 
> Otavio Salvador (3):
>   image.bbclass: do not create image manifest link if IMAGE_LINK_NAME
>     is empty
>   image_types.bbclass: properly support IMAGE_LINK_NAME as empty
>   image_types.bbclass: fix bzip2 and xz compression commands

Merged to master, thanks (with one tweak I've mentioned).

Cheers,

Richard



