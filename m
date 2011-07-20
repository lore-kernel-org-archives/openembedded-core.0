Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QjXbX-0002fm-OX for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 16:18:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEELP3023276
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:14:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22766-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:14:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEEBi2023269
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:14:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <b2ea206c2113d6c4549c52d97e09542a78d96f0e.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
	<b2ea206c2113d6c4549c52d97e09542a78d96f0e.1311150183.git.sgw@linux.intel.com>
Date: Wed, 20 Jul 2011 15:14:08 +0100
Message-ID: <1311171248.2344.38.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 03/50] libiconv: Add recipes for 1.13.1
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
X-List-Received-Date: Wed, 20 Jul 2011 14:18:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 01:27 -0700, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Import 1.13.1 recipes from meta-oe
> share common code through libiconv.inc
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libiconv/libiconv-1.13.1/autoconf.patch        |16018 ++++++++++++++++++++
>  meta/recipes-support/libiconv/libiconv.inc         |   18 +
>  meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   24 +-
>  meta/recipes-support/libiconv/libiconv_1.13.1.bb   |   20 +
>  4 files changed, 16061 insertions(+), 19 deletions(-)
>  create mode 100644 meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
>  create mode 100644 meta/recipes-support/libiconv/libiconv.inc
>  create mode 100644 meta/recipes-support/libiconv/libiconv_1.13.1.bb

I've given feedback elsewhere about this. Please can we combine the best
bits of the recipes rather than overwrite one with the other. I think
removing the libtool.m4 file directly rather than patching is a better
approach as per the current recipe for example.

I also suspect the .inc file wasn't used specifically due to the
gplv2/v3 contamination issue. I'm fine with having a .inc file but the
gplv2 recipe probably shouldn't use it.

Cheers,

Richard



