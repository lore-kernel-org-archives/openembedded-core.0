Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A7DC1601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 16:51:47 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 204so34629754pge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 08:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=NUdMhiX3Z2WUs1dXp3eCQavpG+JTP47B2oa+z4ZsIdM=;
	b=Z/yCa7V2BQ9Z2OzJRC69V4310q0/25Co69NQSdA4gn4Fr3WFcg8mJeZAX4xy/WvTOZ
	4cWdfkOU04+kLHFYLGJCg7LhngxczB/KtLquAhNkGlP/BUkxigyX7elnnYQbFdWzwxqs
	zV+OWHGxSua5CAHVt7IxGyXA4Y+pXOLVCQh/A3cqU3B/Xdsn3xpKe3kohOQUJ8sBmGA9
	GSLQtA8WI7a9YUpzGb6+4nhMwXQrmkQUjFp89cGzLkRfBUkdgo3mY8RJVBnTnvraxI3R
	1IiqM09ZZbxet+22DjyZoyoy2ulOYO8+LgK7KK9Bgvdih09cwqz2VZyv2A2zaSZKfniM
	nKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=NUdMhiX3Z2WUs1dXp3eCQavpG+JTP47B2oa+z4ZsIdM=;
	b=C3DmVCNsnzKQW3/HRk7yQ2c5o3fCWnpTzZev6OCO6lp9i6xKTNDRpdJHxGr+9WYcYD
	anB8oKGrkYs6dR6P6n/Z0ZfEpN18nBTFYIxpEBtR4iL65gvHz6T9mn72THk23vpgbqOe
	wF5AEM1KhKWTLZFkZ2bZ8KVFcJsObxddzhBxvkg3COFdeWXSszCI+2SrpQ6bhiGR0elr
	pJ7WQ1ifDN4pEj/jENa+PbjYN63pG7Lmj1eNlBvjPty+hEKPnwh4EkDotLXZscV6dFPJ
	7o9P7HRI4TQ9Kto46P+d3Mall+x8+pKCBFvgy9Z2EwMEfqb6zrOMpJ3SAfMsqt/mhgvU
	Jy8Q==
X-Gm-Message-State: AIkVDXInxUFPVt50PG+WhEQHDewV26wra1+3sc7XkYtiv8N2Aoo/f27ZIOhYwDUn5IGT/Q==
X-Received: by 10.84.141.1 with SMTP id 1mr5882010plu.33.1485967906845;
	Wed, 01 Feb 2017 08:51:46 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:8ce9:48a5:c3c4:adfc])
	by smtp.gmail.com with ESMTPSA id
	82sm51362066pge.42.2017.02.01.08.51.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 08:51:46 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <cover.1485846907.git.anders@chargestorm.se>
	<6f44da9601d2ae87573905ca1b7fa30cf5043100.1485846907.git.anders@chargestorm.se>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <385d3282-7a91-7d60-cd6a-393ada75bd09@gmail.com>
Date: Wed, 1 Feb 2017 08:51:48 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <6f44da9601d2ae87573905ca1b7fa30cf5043100.1485846907.git.anders@chargestorm.se>
Subject: Re: [PATCH v2 2/7] python3-manifest: move htlm.py to python3-html
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
X-List-Received-Date: Wed, 01 Feb 2017 16:51:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/30/17 11:18 PM, Anders Darander wrote:
> This allows us to use html.py without importing misc.
> 

html.py is provided by many packages. Does is make more sense to package
html.py on a package of its own ?

> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
>  scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
> index b92048f..6093c28 100644
> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
> @@ -103,7 +103,7 @@ FILES_${PN}-gdbm="${libdir}/python3.5/lib-dynload/_gdbm.*.so ${libdir}/python3.5
>  
>  SUMMARY_${PN}-html="Python HTML processing support"
>  RDEPENDS_${PN}-html="${PN}-core"
> -FILES_${PN}-html="${libdir}/python3.5/formatter.* ${libdir}/python3.5/__pycache__/formatter.* ${libdir}/python3.5/htmlentitydefs.* ${libdir}/python3.5/__pycache__/htmlentitydefs.* ${libdir}/python3.5/htmllib.* ${libdir}/python3.5/__pycache__/htmllib.* ${libdir}/python3.5/markupbase.* ${libdir}/python3.5/__pycache__/markupbase.* ${libdir}/python3.5/sgmllib.* ${libdir}/python3.5/__pycache__/sgmllib.* ${libdir}/python3.5/HTMLParser.* ${libdir}/python3.5/__pycache__/HTMLParser.* "
> +FILES_${PN}-html="${libdir}/python3.5/formatter.* ${libdir}/python3.5/__pycache__/formatter.* ${libdir}/python3.5/htmlentitydefs.* ${libdir}/python3.5/__pycache__/htmlentitydefs.* ${libdir}/python3.5/html ${libdir}/python3.5/html/__pycache__ ${libdir}/python3.5/htmllib.* ${libdir}/python3.5/__pycache__/htmllib.* ${libdir}/python3.5/markupbase.* ${libdir}/python3.5/__pycache__/markupbase.* ${libdir}/python3.5/sgmllib.* ${libdir}/python3.5/__pycache__/sgmllib.* ${libdir}/python3.5/HTMLParser.* ${libdir}/python3.5/__pycache__/HTMLParser.* "
>  
>  SUMMARY_${PN}-idle="Python Integrated Development Environment"
>  RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
> diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
> index cf19f47..cc2e561 100755
> --- a/scripts/contrib/python/generate-manifest-3.5.py
> +++ b/scripts/contrib/python/generate-manifest-3.5.py
> @@ -276,7 +276,7 @@ if __name__ == "__main__":
>      "lib-dynload/fcntl.*.so" )
>  
>      m.addPackage( "${PN}-html", "Python HTML processing support", "${PN}-core",
> -    "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
> +    "formatter.* htmlentitydefs.* html htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
>  
>      m.addPackage( "${PN}-importlib", "Python import implementation library", "${PN}-core ${PN}-lang",
>      "importlib imp.*" )
> 

