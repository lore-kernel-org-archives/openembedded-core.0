Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id DEF9071A6A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 20:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 8C8EC3184AE2;
	Mon, 31 Oct 2016 21:44:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id S6WyAXj1ohSe; Mon, 31 Oct 2016 21:44:27 +0100 (CET)
Received: from [172.22.22.61] (55d45b97.access.ecotel.net [85.212.91.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 148783183FB8;
	Mon, 31 Oct 2016 21:44:27 +0100 (CET)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <20161031132336.16626-1-alexander.kanavin@linux.intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <2de2e824-4b57-1adf-5053-6f9fcd518b8d@opendreambox.org>
Date: Mon, 31 Oct 2016 21:44:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161031132336.16626-1-alexander.kanavin@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: fix the SRC_URI to point to an actual release, and not a master snapshot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Oct 2016 20:44:31 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Alexander,

On 31.10.2016 14:23, Alexander Kanavin wrote:
> Sourceforge does a not-so-clever redirecting that fails miserably here:
> 
>      Proxy request sent, awaiting response... 301 Moved Permanently
>      Location: http://downloads.sourceforge.net/project/boost/boost/snapshots/master/boost_1_62_0.tar.bz2 [following]
> 
> Also, boost developers are naming their snapshot tarballs the same as
> release tarballs. The two things conspired together.
> 
> The new tarball does have the same checksum as the one in release
> announcement, so we should be good now:
> 
> http://lists.boost.org/Archives/boost/2016/09/230886.php
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-support/boost/boost-1.62.0.inc | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/boost/boost-1.62.0.inc b/meta/recipes-support/boost/boost-1.62.0.inc
> index a097ea1..cd99b0e 100644
> --- a/meta/recipes-support/boost/boost-1.62.0.inc
> +++ b/meta/recipes-support/boost/boost-1.62.0.inc
> @@ -11,9 +11,11 @@ BOOST_VER = "${@"_".join(d.getVar("PV", True).split("."))}"
>  BOOST_MAJ = "${@"_".join(d.getVar("PV", True).split(".")[0:2])}"
>  BOOST_P = "boost_${BOOST_VER}"
>  
> -SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
>  
> -SRC_URI[md5sum] = "7ef085456c48c49a7fe8237f07e5f674"
> -SRC_URI[sha256sum] = "bce80293052e2d6230f1bec9b7524b33412e4fb26e9723460a0f362ac15b7acb"
> +SRC_URI[md5sum] = "5fb94629535c19e48703bdb2b2e9490f"
> +SRC_URI[sha256sum] = "36c96b0f6155c98404091d8ceb48319a28279ca0333fba1ad8611eb90afb2ca0"
> +
> +PR = "r1"

doesn't the changed SRC_URI (or even the modified checksums alone)
render the PR bump unnecessary?

Regards,
Andreas

