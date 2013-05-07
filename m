Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UZfjz-0002iG-Hw for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 13:07:27 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47Ao0BV031707; Tue, 7 May 2013 11:51:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id azEC8fhCnSGo; Tue,  7 May 2013 11:51:34 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47ApR5P031775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 7 May 2013 11:51:29 +0100
Message-ID: <1367923743.27116.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Olivia Yin <hong-hua.yin@freescale.com>
Date: Tue, 07 May 2013 11:49:03 +0100
In-Reply-To: <1367896309-5638-1-git-send-email-hong-hua.yin@freescale.com>
References: <1367896309-5638-1-git-send-email-hong-hua.yin@freescale.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [oe][meta-oe][PATCH]yajl: pass the cmake variable LIB_SUFFIX to handle installation on 64-bit systems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 11:07:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-05-07 at 11:11 +0800, Olivia Yin wrote:
> WARNING: QA Issue: yajl: Files/directories were installed but not shipped
>   /usr/lib
>   /usr/lib/libyajl.so.2
>   /usr/lib/libyajl.so
>   /usr/lib/libyajl_s.a
>   /usr/lib/libyajl.so.2.0.4
>   /usr/lib/.debug
>   /usr/lib/.debug/libyajl.so.2.0.4
> 
> NOTE: for 64-bit systems where lib64 is used you can pass the cmake
>       variable LIB_SUFFIX to cause installation into the system's 'lib64'
>       directory.
> 
> Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
> ---
>  meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

This needs to go to the openembedded-devel list since its for meta-oe.

Cheers,

Richard



