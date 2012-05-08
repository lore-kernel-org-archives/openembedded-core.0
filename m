Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SReeU-0006j0-PY
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 09:16:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id C4BD8315BDD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2012 09:06:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 3MNKsUiOgzsG
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2012 09:06:09 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c5bee.pool.mediaWays.net [89.12.91.238])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D4A61315BDD6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2012 09:06:08 +0200 (CEST)
Message-ID: <4FA8C5DE.5070404@opendreambox.org>
Date: Tue, 08 May 2012 09:06:06 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1335330662.git.scott.a.garman@intel.com>
	<2141be5ebcb7b14e348ad7e8a516a19333388eeb.1335330662.git.scott.a.garman@intel.com>
In-Reply-To: <2141be5ebcb7b14e348ad7e8a516a19333388eeb.1335330662.git.scott.a.garman@intel.com>
Subject: Re: [PATCH 2/2] openssl: upgrade to 1.0.0i
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
X-List-Received-Date: Tue, 08 May 2012 07:16:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Scott,

On 25.04.2012 07:13, Scott Garman wrote:
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -4,8 +4,7 @@ HOMEPAGE = "http://www.openssl.org/"
>  BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
>  SECTION = "libs/network"
>  
> -# Big Jump for OpenSSL 1.0 support with meta-oe
> -INC_PR = "r15"
> +INC_PR = "r0"
>  
>  # "openssl | SSLeay" dual license
>  LICENSE = "openssl"

this hunk broke the upgrade path of out-of-tree users of openssl.inc,
e.g. users of openssl 0.9.8 in their own layer.

Please reset INC_PR to r15. You should have reset only PR (if it wasn't
already "${INC_PR}.0"), not INC_PR.

Regards,
Andreas


