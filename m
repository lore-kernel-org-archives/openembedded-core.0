Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0EF77E0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 12:49:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7TCnt1b008349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 29 Aug 2017 13:49:56 +0100
Message-ID: <1504010995.2175.2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 13:49:55 +0100
In-Reply-To: <20170829114526.37559-2-alexander.kanavin@linux.intel.com>
References: <20170829114526.37559-1-alexander.kanavin@linux.intel.com>
	<20170829114526.37559-2-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 29 Aug 2017 13:49:57 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/3] subversion: inherit pkgconfig, so that serf can be found
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
X-List-Received-Date: Tue, 29 Aug 2017 12:49:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-29 at 14:45 +0300, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-devtools/subversion/subversion_1.9.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/subversion/subversion_1.9.6.bb
> b/meta/recipes-devtools/subversion/subversion_1.9.6.bb
> index b27115b981f..f49e26a5c8c 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.9.6.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.9.6.bb
> @@ -8,7 +8,7 @@ HOMEPAGE = "http://subversion.tigris.org"
>  
>  BBCLASSEXTEND = "native"
>  
> -inherit gettext
> +inherit gettext pkgconfig
>  
>  SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://disable_macos.patch \

Any idea why we haven't had errors from this? Did it mean we just lost
something like https support?

Cheers,

Richard

