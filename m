Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id AFC157146E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 15:29:21 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id rd3so20243161pab.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=RCqg6RvpQqwWg2N7TNNe2SxJds9IyH3YEpGskqr/1QI=;
	b=jE9sgizKGdQd0rG1+/onb9afGyqOz8z2ocnQl3vdZtxi6K1B37kTsYkmKXpxQC3w7D
	fT3YCvV3D8xU+g7EXRROJR1aSEBw76hevJRGLrmWJIEhHWzoThsupMEhXXyL4z2BwZfQ
	2Ahl45wCSm26MKcjZ/Bx7oVtSOL6KgI4jV9TjiiBho6QuZRDmBFw9CRZgT5KZgCvJmz6
	C9x7853Un2tzRfdBU64598FQevCGoh9vHuHlWzCJMpgszO2+iv3grSC1SWuJw2ID7BLw
	yTnvu5FcBDWH9aY18o26WBO20oFZ/a8l3H60Xb9A/UYVRe6HTxN6ru82B0pyOxp+qZGf
	F0OQ==
X-Received: by 10.70.24.133 with SMTP id u5mr9430851pdf.87.1409844562670;
	Thu, 04 Sep 2014 08:29:22 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:9d66:e68f:e0f4:6f0b?
	([2601:c:9380:601:9d66:e68f:e0f4:6f0b])
	by mx.google.com with ESMTPSA id gf5sm1945392pbc.89.2014.09.04.08.29.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Sep 2014 08:29:21 -0700 (PDT)
Message-ID: <54088546.3030602@gmail.com>
Date: Thu, 04 Sep 2014 08:29:10 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1408514703-6424-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1408514703-6424-1-git-send-email-akuster808@gmail.com>
Subject: Re: [[PATCH] python: add webbrowser module
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
X-List-Received-Date: Thu, 04 Sep 2014 15:29:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

This patch is sitting the the queue still. Is it being considered or has 
it been dropped ?

- Armin

On 08/19/2014 11:05 PM, Armin Kuster wrote:
> webbrowser is being compiled but not included in packaging.
> Add webbrowser to python-netclient
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
> index a8afe13..b477f3f 100644
> --- a/meta/recipes-devtools/python/python-2.7-manifest.inc
> +++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
> @@ -159,7 +159,7 @@ FILES_${PN}-multiprocessing="${libdir}/python2.7/lib-dynload/_multiprocessing.so
>
>   SUMMARY_${PN}-netclient="Python Internet Protocol clients"
>   RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
> -FILES_${PN}-netclient="${libdir}/python2.7/*Cookie*.* ${libdir}/python2.7/base64.* ${libdir}/python2.7/cookielib.* ${libdir}/python2.7/ftplib.* ${libdir}/python2.7/gopherlib.* ${libdir}/python2.7/hmac.* ${libdir}/python2.7/httplib.* ${libdir}/python2.7/mimetypes.* ${libdir}/python2.7/nntplib.* ${libdir}/python2.7/poplib.* ${libdir}/python2.7/smtplib.* ${libdir}/python2.7/telnetlib.* ${libdir}/python2.7/urllib.* ${libdir}/python2.7/urllib2.* ${libdir}/python2.7/urlparse.* ${libdir}/python2.7/uuid.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/mimetools.* "
> +FILES_${PN}-netclient="${libdir}/python2.7/*Cookie*.* ${libdir}/python2.7/base64.* ${libdir}/python2.7/cookielib.* ${libdir}/python2.7/ftplib.* ${libdir}/python2.7/gopherlib.* ${libdir}/python2.7/hmac.* ${libdir}/python2.7/httplib.* ${libdir}/python2.7/mimetypes.* ${libdir}/python2.7/nntplib.* ${libdir}/python2.7/poplib.* ${libdir}/python2.7/smtplib.* ${libdir}/python2.7/telnetlib.* ${libdir}/python2.7/urllib.* ${libdir}/python2.7/urllib2.* ${libdir}/python2.7/urlparse.* ${libdir}/python2.7/uuid.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/mimetools.* ${libdir}/python2.7/webbrowser.*"
>
>   SUMMARY_${PN}-netserver="Python Internet Protocol servers"
>   RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient"
>

