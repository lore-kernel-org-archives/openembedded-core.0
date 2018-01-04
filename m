Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E97FA7017B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 23:08:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w04N8q3S020372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 4 Jan 2018 23:08:54 GMT
Message-ID: <1515107332.30291.21.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 04 Jan 2018 23:08:52 +0000
In-Reply-To: <519437989588d44d130890dce1285d796e3382ad.1515051241.git.Qi.Chen@windriver.com>
References: <cover.1515051241.git.Qi.Chen@windriver.com>
	<519437989588d44d130890dce1285d796e3382ad.1515051241.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] coreutils: upgrade to 8.29
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
X-List-Received-Date: Thu, 04 Jan 2018 23:08:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-01-04 at 15:35 +0800, Chen Qi wrote:
> * ls.c license checksum is changed, but the license remains the same.
> 
> * The new version provides native manual page support, there's no
>   need to download extra manual page from gentoo site.
> 
> * man-decouple-manpages-from-build.patch is removed, as new version
>   has manual page support in environment lacking of perl.
> 
> * hostname is explicitly enabled to keep the same with previous
> recipe's
>   behaviour.
> 
> * ALTERNATIVE_XXX settings for lbracket.1 are removed as there's no
> such
>   file.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../man-decouple-manpages-from-build.patch         | 27 ------------
> ----------
>  .../{coreutils_8.28.bb => coreutils_8.29.bb}       | 24 +++++-------
> -------
>  2 files changed, 6 insertions(+), 45 deletions(-)
>  delete mode 100644 meta/recipes-core/coreutils/coreutils/man-
> decouple-manpages-from-build.patch
>  rename meta/recipes-core/coreutils/{coreutils_8.28.bb =>
> coreutils_8.29.bb} (80%)

Sorry, doesn't build:

https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds/678/steps/BuildImages/logs/stdio

Cheers,

Richard

