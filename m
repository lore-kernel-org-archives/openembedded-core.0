Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 60536601A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 22:41:00 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id bj1so125995pad.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 15:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=amNFF8Cbl4e5daTZFtT4XKc8wiZf6AdezcLOLCwk3v8=;
	b=hM3adPTQt6qmYPk2V5ZKTPJ08JyutduTQbC9/HaWKToLNGISRuVNLDLrPnHV63gdmv
	nVCu0i1M2uvvqat0mVm94UQXh6K2+ZoFhXDYjGPSYceg5MXP7oL8kwkJhhsfjPxOcIHD
	UXZLB0iv6fXBUq5is899R11bKrZx9RYpukgE+CzFiS42A3EmkyPJZY2LAKKcgko42Vn4
	kND++uNTGNFnvfFZDj4T36Rjl4ZCJ5ESEOaAb7ElnRJLea3vcWDfrHz/ZsAYhElrlqrx
	GBmfDZlMlT4AZhnvRsl63dow/H1tFml2f5K8hX8Fpq8yftuzixHVrr/cTH0ZcfWzRRiJ
	XzDQ==
X-Received: by 10.68.131.200 with SMTP id oo8mr26499604pbb.75.1407192062159;
	Mon, 04 Aug 2014 15:41:02 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id
	ra2sm13453665pbc.71.2014.08.04.15.41.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Aug 2014 15:41:01 -0700 (PDT)
Date: Mon, 4 Aug 2014 15:44:19 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Ben Shelton <ben.shelton@ni.com>
Message-ID: <20140804224419.GD11951@haswell>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>
MIME-Version: 1.0
In-Reply-To: <78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/20] udev-cache: Compress the cache
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
X-List-Received-Date: Mon, 04 Aug 2014 22:41:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-04 13:40:53, Ben Shelton wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
> 
> $DEVCACHE is observed to be 100k uncompressed; compressing it reduces
> its size to ~5k.
> 
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58620
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
>  meta/recipes-core/udev/udev/init               | 2 +-
>  meta/recipes-core/udev/udev/udev-cache         | 2 +-
>  meta/recipes-core/udev/udev/udev-cache.default | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> index f2c84d5..1e69861 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -69,7 +69,7 @@ case "$1" in
>  		    readfiles /etc/udev/cache.data
>  		    OLDDATA="$READDATA"
>  		    if [ "$OLDDATA" = "$NEWDATA" ]; then
> -                            (cd /; tar xf $DEVCACHE > /dev/null 2>&1)
> +                            (cd /; tar xzf $DEVCACHE > /dev/null 2>&1)

wouldnt cf still handle gz and xz or any other compression ?

