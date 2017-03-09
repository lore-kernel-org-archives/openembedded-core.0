Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D673473068
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 14:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29EituT027493; Thu, 9 Mar 2017 14:44:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ulmDG7QV5pnu; Thu,  9 Mar 2017 14:44:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29Eipht027488
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Mar 2017 14:44:52 GMT
Message-ID: <1489070691.22968.107.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ismo Puustinen <ismo.puustinen@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Mar 2017 14:44:51 +0000
In-Reply-To: <20170309135933.1232-1-ismo.puustinen@intel.com>
References: <20170309135933.1232-1-ismo.puustinen@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] gcc: let cpp rrecommend gcc.
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
X-List-Received-Date: Thu, 09 Mar 2017 14:45:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-09 at 15:59 +0200, Ismo Puustinen wrote:
> The file /usr/libexec/gcc/.../cc1 has been installed in package "gcc"
> instead of package "cpp", because FILES statements for both packages
> match the cc1 binary. Remove the attempt to install the file in cpp
> to
> avoid confusion.
> 
> However, cpp uses cc1. If cc1 is not installed, there are error
> messages
> such as: "cpp: error trying to exec 'cc1': execvp: No such file or
> directory". Add gcc to RRECOMMENDS_cpp to fix the problem.
> 
> Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-target.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

If its fatal without it shouldn't it be an RDEPENDS?

Cheers,

Richard

