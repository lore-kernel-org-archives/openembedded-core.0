Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id CCFED7DAD9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 16:27:00 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id a3so5335084pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 09:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Hlp8WwT2PeO8LbfaYjyJYBtfPbWbWPHdAkvlYO2veQA=;
	b=vBKFoBu6aM2/9YqPcpBR6hgL5uPqmeFgRaRG0sORwvejNhBRaTuFqReuCqmISJdPf3
	oJefLR/PD6xCAto7lkoxBUsBG4Y72LW9SWF2hHEqOPLIJqWCcvvm/qS1mW3qWhz3m6K7
	/EspLhWkcKDxCxhg/FIcYGJbGnw22EUDo5wCkMhvIxR/9TVTP89rJFPef/m3/AQX2h6L
	MkXowJ2D2FaCDXmZKjVgaE56C/hiP5vOYffNBDFS4eVZIRvEA5Za8JoAiEsmoUUrNL1J
	NdFRLsju46yOFt+V836smPn5A2P6PENWss73y2kWLvijcrgSSZAtnC909V0C3a8eGRMT
	Y69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Hlp8WwT2PeO8LbfaYjyJYBtfPbWbWPHdAkvlYO2veQA=;
	b=rlMfN23ci0bvaYhziL1wI/vW82iwdb/S8Bn6z+PY0kW516fzO6LZzwhYo1m6AASotu
	rirNFVC8ukTNeSMV7OqaI1FsvQAkO4Wgr73R6OQA7qdSQWOF+GNjCqPzrit/c1e/Ngld
	+cfggdSl0IRqtpS1t7T5xQhjh82W/2jy4Ah+/jO0XS2AOxYD4ushLjLdPWE1vczbN6RV
	Z/XSXvslrHig/CJRYNq7/GOcao2nj9ca/C4eLesGTvuacO2fAd58+eDhy9Wq/eNK2LSW
	AD1QSvCVlzy+aCMJtCfODZQZbtVjMfZCZz4/SZSC+XqQMQsLd7pIXfrCuz3EHVZ0Ck4M
	eh8w==
X-Gm-Message-State: APjAAAX+DkWHnYUIke6z3GgtB6rLKMoAI+ROSP7KUk6Wp8hYwByyqs7D
	/8L7aNJToSYlSpwvCRJKdW6mWXC3
X-Google-Smtp-Source: APXvYqxwjHAv0N3YQryZh/8dWjjEW9tFyXTgDcLDbsIy77myATLvt4jxiEVR2kpmFWIqpQaxnT05gA==
X-Received: by 2002:a62:460a:: with SMTP id t10mr112839257pfa.3.1558715221553; 
	Fri, 24 May 2019 09:27:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:5082:6fa8:7c77:a641?
	([2601:202:4180:c33:5082:6fa8:7c77:a641])
	by smtp.gmail.com with ESMTPSA id
	b67sm3242515pfb.150.2019.05.24.09.27.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 09:27:01 -0700 (PDT)
To: Nicola Lunghi <nick83ola@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190524143659.23751-1-nick83ola@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <75b746c6-1545-0ae6-850b-6bc3685d5251@gmail.com>
Date: Fri, 24 May 2019 09:27:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524143659.23751-1-nick83ola@gmail.com>
Subject: Re: [PATCH] nginx: fix kill path in nginx systemd unit file
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
X-List-Received-Date: Fri, 24 May 2019 16:27:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/24/19 7:36 AM, Nicola Lunghi wrote:
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  meta-webserver/recipes-httpd/nginx/files/nginx.service | 2 +-
>  meta-webserver/recipes-httpd/nginx/nginx.inc           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Wrong mailing list.

please send to openembedded-devel@lists.openembedded.org

>
> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
> index c6fc0495f..9a6ca9651 100644
> --- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
> @@ -8,7 +8,7 @@ PIDFile=/run/nginx/nginx.pid
>  ExecStartPre=@SBINDIR@/nginx -t
>  ExecStart=@SBINDIR@/nginx
>  ExecReload=@SBINDIR@/nginx -s reload
> -ExecStop=@BINDIR@/kill -s QUIT $MAINPID
> +ExecStop=@BASE_BINDIR@/kill -s QUIT $MAINPID
>  PrivateTmp=true
>  
>  [Install]
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index 29e7efc14..c4c776e37 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -134,7 +134,7 @@ do_install () {
>          sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
>              -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
>              -e 's,@SBINDIR@,${sbindir},g' \
> -            -e 's,@BINDIR@,${bindir},g' \
> +            -e 's,@BASE_BINDIR@,${base_bindir},g' \
>              ${D}${systemd_unitdir}/system/nginx.service
>      fi
>  }


