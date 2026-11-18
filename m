Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14616.1795014333103966813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=kVv/1pwM;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: bastien.jauny@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so7162215e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 07:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795014331; x=1795619131; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wTDIfglXM5a0G03KVPzo0GiIon2Ch5XsfbBstCJ4Vtg=;
        b=kVv/1pwMLMPCf/2cYdc38zCbTANO3cSTX8G4PgnUCyeCfcwa+1l9loGabXI5Xrf6O8
         bZG+jg25tCFrTtIqTviRpaMdTrgHr7lLoodlbthmrLlUDVMPZBTB6lZg7Vh8q+FLpFie
         OKwYXSr7nqmC3WxRw+6ehgoCCpF5kzlNvT7+6t6XWy91eZe+up7kvFaRRYdYCio+negs
         EHDIjokdhZDh06an4oyUQfKeZ3wG3NaAxXjZS67HyrIRVpjwa9408aoAI2W4wB4cK6F8
         BY/mpjYxo3+a9wz2MUVckUl7H++YqQrlVMJDlVLqEV/7r97XzFBFATH2UKo4SJxwXnNw
         kwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014331; x=1795619131;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTDIfglXM5a0G03KVPzo0GiIon2Ch5XsfbBstCJ4Vtg=;
        b=duEt8gxmvdlckwc+kkz5INGsqwofwteZjQ6Fv2WwJyNvMk7p4TF9o8lxqcdF+oZoD7
         nptCe7wupySbCyA+UXZqbF7ton0ApeA2q1xsre06ilQaclXHwJcb3uvIExDF6UtdD17o
         +rl917rbyJr8KVjihegdOo9SeD5q8f8+/2cR5LjxWmfH0UBtKvBaXBiOgbLjNHr1+ySB
         zEMjdUGgI1TLJ71rEUd8oop/4cKxfVtsD5p/syDZKJ9IT6tEan2uAwg3YjEyIoN47zcn
         QrNIZo73R9WXM1XqvMw1UBNf/3EZYmwBbLRUxcWVmIjvBj8lkCk6h8hyQVv1yFrzBn63
         VrHA==
X-Forwarded-Encrypted: i=1; AL+hErGVTIBRtMK5D4X5xlcoLCSWPqZPgtHRXvBubPckbd+GXm1HdcasyhTK46BxuBZ+RAfCr5gLCsWN6OTujEHbRKRFSw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9CycGxiU0SFDl/qFH/Da61haifV3SIO4yh0HTCNcg2gBm4KR/j
	cB+sBqZw5k7kvt4f1opTfIljmq1mZ3rxqMtZLbys9VH0ahs4CIWFkf0ZkVM7mRzq8Zg=
X-Gm-Gg: AYBFou12mJwwXVX0iKVA/8zcbkPRtBVPkfokiYW7UlX6IfdcefKeU/GWiJ6NoAMHBxW
	KMa+tlUvdDSjr5MlaMclH4gp3q1PzrsflBLE0UDqQhXJ0KcCosMqhTBwot5mdkDG3OtYcRheUJJ
	thSxIGAM+z6uWcKZdeChiDXAJNYF/tAhhpMJw0Vkd2GvfInrvKdelw38R9lBjEATusC6j7zom4S
	uor8hOLKPVvVyMokhn7JASS8o/usIBt8biXg3kFfqIsZB/hCP803D5wuu0/Cdo0j1fKHiQEXQNb
	5rLS/tp7h1jDqZF7EsKujT+wRazFsOo5TXF3kW8w2ddTA13D6Be4EoUU2bXC7a6YIB8GxL2mFmi
	xhq+69IUHYn2v7osstjGirF4liAdGlINPymRd+tjL/I+VuAjoAalWKETJDdGjgPnmqbtZYf5oJi
	CvykzyBjY4rdy96JsttBFtYlj6gIrJB7ObfhSKzAlIf20qqyRYymuF8ozaaHcVmi+UnVVXKAIjd
	f26YefrdNY4Gtnzpvm7RJpiWw8S6eGh0atG9kH16Qfcn6c3LdnCiCOQiUo3VLqXqTNBbEKLL0r5
	oJWFssm6E+agbkxKEZ8Av9wbmNK2GJ4lthFhyND2VRrT77370WpTz70l/iEl2TOpkNmXcHjSUMb
	urV5OKZa21KAQGA==
X-Received: by 2002:a05:600c:1c1f:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb7da28927mr62870505e9.26.1795014331246;
        Wed, 18 Nov 2026 07:05:31 -0800 (PST)
Return-Path: <bastien.jauny@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430918sm133349325e9.13.2026.11.18.07.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 07:05:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 16:05:30 +0100
Message-Id: <DMYFH3B98MAC.C8DK5RPZKNR3@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>, <yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 3/7] curl: fix CVE-2026-87865
From: "Bastien Jauny" <bastien.jauny@smile.fr>
To: <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0-38-g09b49b623995
References: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
 <20261106144134.1370928-4-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261106144134.1370928-4-joaomarcos.costa@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250556

On Fri Nov 6, 2026 at 3:41 PM CET, Joao Marcos Costa via openembedded-core =
wrote:
> This vulnerability, marked as High [1], was fixed upstream [2] since
> v8.23.0.
>
> Backport the fix to curl v8.7.1.
>
> [1] https://nvd.nist.gov/vuln/detail/cve-2026-87865
> [2] https://curl.se/docs/CVE-2026-87865.html
>
> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
> ---
>  .../curl/curl/CVE-2026-87865.patch            | 212 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
>  2 files changed, 213 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865.patch
>

Hi,

According to the versions affected, this should be seen upstream. I see
it has been submitted for wrynose but nothing more.

Could you please submit this one for blacksail also?

Thanks,
--=20
Bastien Jauny
Smile

