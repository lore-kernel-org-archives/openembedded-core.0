Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 556B07FED5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 15:58:37 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id m30so9459321lfp.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 07:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=iNdenSQ9qKJbMCxswSbt9AmwMKCGR5lx0UD4N/zKZq8=;
	b=mk6FKbcViKimzbVdYBxaP11OptioLVYMmCBpygy6JFma8qJZO42GTyhCSh75fieVfl
	nmABrwJ41Y0IOotMzxcz5SuiiOt1YXopoZMzlgKxz2VXQrju8spMO6kCHUwlSQEF2krg
	Py0w5h5zZymqpqslvkRZ/OIZGXFUH11ozZMNS/cUtnkG5vzQqfdQQeNvxZ2203MQ32LV
	Ek0WauZCx+0UZ1jEgtlw6GJUIkfEZ663bHEaS3uis8YQgDElNRPQZiH7Y9aU/J09o3Zp
	TEHCQYJU0VcaZmNrHGMpEB1KTZHeUqbPD/gpLsZh27FX1fwvp2tdlSGNtIpDf9ToRRQd
	vstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=iNdenSQ9qKJbMCxswSbt9AmwMKCGR5lx0UD4N/zKZq8=;
	b=RwQRN4zRpB0SjJjvAnqJa2AZPmog4knHmeg/WWfhNHnaxBPwedXe4YxNq19Tl49yYc
	Xs8AsEI7W+ELaSkpPpYO0HoJWb9Zh5mRIcMm3iJ2W0EH5azalp9snUmRyLbZPfcZO/BW
	NthkaXKNfwIi6DxGdq4FVEhntqgPg77R4yVslWKfdYW1VWYi2cuAuJ4GXe490kb/jGif
	23zGNOYNn4if5apJHtd74XwofuAwiUaQac9zL7SK4t0UQ1YXR0GA3yYUSZS5sLyk2Bbt
	XsAvxAMOwmHfhE4GrKC9Q1KQ+DY+VLKe9FH21I7rBuequiPNEKQG3A9wiWMOIxpAX0tY
	EPaw==
X-Gm-Message-State: APjAAAXeV7DB7G+S+mzhYIFLDVnze8vsdVd2YGFY9ctwb+tqSVkkib2F
	LqGAPte2Fste1BxOJ6ooYga6jnbg
X-Google-Smtp-Source: APXvYqxW/eK/7/lFIXxcO5IW9R6BdcNmVULFaf1g8coUXhvNLWtfj1sB5hJ177wRV83+qXp0RqVf7Q==
X-Received: by 2002:ac2:5e6c:: with SMTP id a12mr2808111lfr.32.1580227117533; 
	Tue, 28 Jan 2020 07:58:37 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	q24sm10003230lfm.78.2020.01.28.07.58.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 28 Jan 2020 07:58:36 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <a26570fa-a8ff-ed65-80a8-02b8f3067aaf@gmail.com>
Date: Tue, 28 Jan 2020 16:58:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/5] bc: Use texinfo class
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
X-List-Received-Date: Tue, 28 Jan 2020 15:58:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/28/20 4:16 PM, Richard Purdie wrote:
> This recipe uses makeinfo so inherit the class which can provide it.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-extended/bc/bc_1.07.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
> index 4a51302492d..61fc6486538 100644
> --- a/meta/recipes-extended/bc/bc_1.07.1.bb
> +++ b/meta/recipes-extended/bc/bc_1.07.1.bb
> @@ -18,7 +18,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>   SRC_URI[md5sum] = "cda93857418655ea43590736fc3ca9fc"
>   SRC_URI[sha256sum] = "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
>   
> -inherit autotools texinfo update-alternatives
> +inherit autotools texinfo update-alternatives texinfo
>

Looks like it already inherits texinfo ^^^

>   PACKAGECONFIG ??= "readline"
>   PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
> 

