Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4FAF279D56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 23:36:29 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wANNaSAO026192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 23 Nov 2018 23:36:29 GMT
Message-ID: <0f5dc9e160b0e4284e4049175019c27f81f932b9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 23:36:27 +0000
In-Reply-To: <20181122154136.121480-3-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<20181122154136.121480-3-alex.kanavin@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 03/16] openssl: update to 1.1.1a
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
X-List-Received-Date: Fri, 23 Nov 2018 23:36:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-22 at 16:41 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../openssl/0002-fix-CVE-2018-0734.patch      | 108 ----------------
> --
>  .../openssl/0003-fix-CVE-2018-0735.patch      |  50 --------
>  .../{openssl_1.1.1.bb => openssl_1.1.1a.bb}   |   6 +-
>  3 files changed, 2 insertions(+), 162 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0002-
> fix-CVE-2018-0734.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0003-
> fix-CVE-2018-0735.patch
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.1.bb =>
> openssl_1.1.1a.bb} (96%)

This one will need to be rebased against master now other openssl
patches merged.

Cheers,

Richard


