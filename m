Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25936.1795303339639107720
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 15:22:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=CigQcYGg;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so24578015e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 15:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795303338; x=1795908138; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kVycEklJqOaDV+9uYSNxqcv/cH8HQ1ixTx6hA2WRE4g=;
        b=CigQcYGgcr+ay0oJ2Dsj+969PulbIreSnfTd/APqIe1Iy2uYHZAZQLArR/KovgNZMH
         RuamO3Sziw4xQ96WPTK03BGQHNywXNKvCGy0t5A6tWhLs7LmYrMX0AfSpiNKdMeKUC2c
         jKcZX++3I5VisvzLjt0QwDiL2oXWtj505esgVYE636Rjfg9D4lSnvJMqz3rvfOLbMHY2
         dnqpf0NuU5mh3bkYt5LE02NL2zv2YmeoAqEd8VpXTAtSKkF4MQ06eZDWFxuvKWVP4nXB
         AAGgf+IyfLukm1AkUI6zhd8JRgx70VHTu5jm57924k4Fi61UfqW9CQt8wDAF3/kbqG92
         Qgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795303338; x=1795908138;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVycEklJqOaDV+9uYSNxqcv/cH8HQ1ixTx6hA2WRE4g=;
        b=Jo48tuNHQtYWnfgsHBrKn+yexVNKruw8FpebOLlsZfCMxbOaLSJsRLpU3AEvdpXKaV
         CfRvDGy+DJtZdsvyN8+1TqU+XD8p38EHKazD4v8rFMVLFhqC+uxJo3trTivu7gqU3AkF
         rKjzSvGrlRbOkJtQvYHDPX8Vnf07FOAHg1s019b5PPpw3MUq6L8fPDhLCueD85yTAhJc
         0ESACWhoZdyW7b8dPT9PFN8DF6sONR/1GQR+zfjJlzYG9qIpNWAePdh5RL+PAj+t8xIy
         vquAhx8+RNFKPB7wsMe+uAbt5tTpi/r/PUVgVViiTz+zxjz6xR0vg1UiUGnulghe41pu
         z45g==
X-Gm-Message-State: APuU4Z9pFwOq5Ld5AslKtXTR7xPLZyV2IEZy8Rjm6IDEDbMCr4wGLgai
	VpMehSrj1QFbGdnZql5XAoCbEOX1OAmQ3JWadZUwJitg3M/BoCTXNckm+ro+JKH9WKA=
X-Gm-Gg: AZFdTZcei28rD5VxBnncgBotBsjoxSGvK7ARZ+JJdSLfUNCSjxla8cO8Dge/8emfiU2
	QR0TIt4wjFll8Ky1qx4713gDR60TokIyKXem5Fy2cURZZ7xJWuVNItOLidiozaT3z8BqPT4JTQW
	hcMokEcpzHfFNkjzJMAoM6UhfnpVEhZ2FOtIkeLl2nI+AZtehSIxMnqqB/Bhwm4ciV6WpXYiF5g
	pWqi/T/Lp0uTiF8+qkVPfuwuRZ+UCk9YYAcqewUNihazQ/CQQ79QwHRsvAe/OnGIrcXFdWMJTRt
	eMyjF/2LnYrsld1Reekomota6Mm4+qZYszIKj/r0e9bbqa72qv3PDYGgsygbhUYQuoeqNeUl5BG
	RmLmHGqQJR4qkrpYvJ+e1HAOYnXjgLnWBPVTks7jHRQp7Y7BzKIYvtVt06jtE68HlPDKaBUzUn8
	VNyyG1yGg8ihLi6IhlqtPJTJNKKuLZqQVCoTq0xvkR9omUnW+qU2CfK3C88xJbDZ5OXnl2oqlIE
	nu8g/MWwpC60lA7B3n/+BB/GPaFHw+fTXoNUs3hvlFzb7Ku+ISAfmGzE1ns0oPK+OPqZLj3EeFK
	VyEF7UEJQqpreZKyL8ZeA5+754KnL0U3f1lzHTGdS3mxhfgZPW4BMy0HE0UCcmLPeFe+qIOB8Fb
	GCRomjsT6SgeGbDKQ
X-Received: by 2002:a05:600c:b8a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4bb88818156mr155390745e9.16.1795303337676;
        Sat, 21 Nov 2026 15:22:17 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa0009d38a8173e0a09d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9d3:8a81:73e0:a09d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm193741475e9.9.2026.11.21.15.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 15:22:17 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 00:22:17 +0100
Message-Id: <DN19X39TLGKB.125E3V032DBN5@smile.fr>
Subject: Re: [scarthgap][PATCH 1/2] u-boot: fix CVE-2026-29009
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Prasanth Ramesh" <ragaprasanth@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261117073849.3089566-1-ragaprasanth@gmail.com>
 <DN19P4D41RQC.J6VXZC0CZ5L8@smile.fr>
 <CAG7eodEvJJaUjWMj_jQa1wE_hLf6owq=xwHj_9Sy3tgc8qN_qQ@mail.gmail.com>
In-Reply-To: <CAG7eodEvJJaUjWMj_jQa1wE_hLf6owq=xwHj_9Sy3tgc8qN_qQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 23:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250860

On Sun Nov 22, 2026 at 12:13 AM CET, Prasanth Ramesh wrote:
> =F0=9F=91=8D
>
> Prasanth Ramesh reacted via Gmail
> <https://www.google.com/gmail/about/?utm_source=3Dgmail-in-product&utm_me=
dium=3Det&utm_campaign=3Demojireactionemail#app>

BTW, please refrain from using the reaction emoji from gmail on mailing
list emails. It is only supported in the gmail client.
Everybody else see this:
https://lore.kernel.org/all/CAG7eodEvJJaUjWMj_jQa1wE_hLf6owq=3DxwHj_9Sy3tgc=
8qN_qQ@mail.gmail.com/

Thanks!
--=20
Yoann Congal
Smile ECS

