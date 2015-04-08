Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5F80E73D28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 09:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t389sg5Z031726; Wed, 8 Apr 2015 10:56:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id a1vPix5GgHsC; Wed,  8 Apr 2015 10:56:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t389tuB6031755
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Apr 2015 10:56:08 +0100
Message-ID: <1428486956.14020.498.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>
Date: Wed, 08 Apr 2015 10:55:56 +0100
In-Reply-To: <1428470156-19678-1-git-send-email-TicoTimo@gmail.com>
References: <1428470156-19678-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-2.7-manifest.inc: add fractions.* to ${PN}-numbers
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
X-List-Received-Date: Wed, 08 Apr 2015 09:56:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-07 at 22:15 -0700, Tim Orling wrote:
> python-cryptography requires fractions module which is currently unpackaged.
> 
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
> index 12f775e..2fb748e 100644
> --- a/meta/recipes-devtools/python/python-2.7-manifest.inc
> +++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
> @@ -175,7 +175,7 @@ FILES_${PN}-netserver="${libdir}/python2.7/cgi.* ${libdir}/python2.7/*HTTPServer
>  
>  SUMMARY_${PN}-numbers="Python number APIs"
>  RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
> -FILES_${PN}-numbers="${libdir}/python2.7/decimal.* ${libdir}/python2.7/numbers.* "
> +FILES_${PN}-numbers="${libdir}/python2.7/decimal.* ${libdir}/python2.7/numbers.* ${libdir}/python2.7/fractions.*"
>  
>  SUMMARY_${PN}-pickle="Python serialisation/persistence support"
>  RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"

To quote the top of the file:

# WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
# Generator: '../../../scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>

Cheers,

Richard



