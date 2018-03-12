Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1E5117886F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 18:11:59 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id f186so13105111oig.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=+/h3as+Qu9qOzbqiYIxwcq/naCm2T6sY2oIxLZtP5OM=;
	b=yaQ4yusxkKWAzcYKM6EjVfb8oigHS53CrTDkBll+lQeKX28oy8xBPSu2Lvo3W3YO7d
	KZlez/MFH8HPPHTCiuMn1c2BjfGLoqz6k0Zw4fcRkbxX6j4hY7xHWQQpt+x5D2UGB3t9
	Rsg6yxVq9FHmAgvd+L/axHJa5ad+s3GZ/bCzetKxoZCyP3/VhYYgre6ZYgkiayeuVq4D
	H7IBsorl7c33xFpngxBhX6II41lIFhFfuTtVIpjRSb9ACXwP0H+P+DkWLsk2jM8ZH0+K
	3IgP6TZBUeufHuQXb356RZfzxinX8fSemvFrATZNV89XqLwxDSPMWdLj0P8EnybDv6PS
	bYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=+/h3as+Qu9qOzbqiYIxwcq/naCm2T6sY2oIxLZtP5OM=;
	b=g/ZbiiGByRrXQX6khOCyMMG/kTOkusZGEFrWtDrXA1i7pcvuFCkQq2PeXAOU8QxmyP
	y9tBumtc7fKiGRJibY5QGKJhGlJ8MfjWG/91D9Ng8Fn/IjoqpAVYTvQLLksYkFcioTum
	WcPmrOUpYOmXof8dh65YY7wUiuCW6Kxbyc6KIdWviHZCqIw9B+6XHh6RgbYIPuCaKMxt
	McEczaOTJhUsj2VfCvfonhMki4d/MmBwB5Yo8I0DBhW/89iryFkPs0DFKgp6YnVXqskR
	/ceIki0FkRLyybtw3j4Y8N/to6gYdBxI+w2+8TJLEmcYx5zGcuF8X7v8KUIOdDmaYBQY
	chaA==
X-Gm-Message-State: AElRT7F3aNuOeC/uqvXLNI6QZewn9WDnqQGOC071eSx3PHcR1YDqloJh
	i8pojLFq53Kf5GU/a4iF4U+1N/1e
X-Google-Smtp-Source: AG47ELtA5r2gh487SASiLGUKjWscvmeS13acs+WnRkcHD0IOHUK6WP2Do+NEQo1FM3yyEubZGImV+A==
X-Received: by 10.202.94.132 with SMTP id s126mr5193722oib.155.1520878320714; 
	Mon, 12 Mar 2018 11:12:00 -0700 (PDT)
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com.
	[74.125.82.181]) by smtp.gmail.com with ESMTPSA id
	v125sm3704523oie.8.2018.03.12.11.11.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Mar 2018 11:11:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f181.google.com with SMTP id w38so16216161ota.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 11:11:59 -0700 (PDT)
X-Received: by 10.157.63.184 with SMTP id r53mr5775004otc.168.1520878319152;
	Mon, 12 Mar 2018 11:11:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5081:0:0:0:0:0 with HTTP; Mon, 12 Mar 2018 11:11:58
	-0700 (PDT)
In-Reply-To: <CAJTo0La3UXoWCnw=H9k7OjQF3PFH2_VMGJB-auf1kuygw-i5mw@mail.gmail.com>
References: <20180312112901.9844-1-matt@madison.systems>
	<20180312112901.9844-2-matt@madison.systems>
	<CAJTo0La3UXoWCnw=H9k7OjQF3PFH2_VMGJB-auf1kuygw-i5mw@mail.gmail.com>
Date: Mon, 12 Mar 2018 15:11:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqXveQg8wNoWdYwTigw1JOL5aYbC2EhbHWpcam_s-GojA@mail.gmail.com>
Message-ID: <CAP9ODKqXveQg8wNoWdYwTigw1JOL5aYbC2EhbHWpcam_s-GojA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [rocko][PATCH 1/1] go: Upgrade 1.9 to 1.9.4 stable release
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
X-List-Received-Date: Mon, 12 Mar 2018 18:12:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 12, 2018 at 8:44 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Note that stable branch policy is to cherry-pick security fixes unless
> they're too complicated/risky to pick (openssl is the notable example here).

I strong believe Go should be dealt in same way; it is known to be
good at supporting forwarding upgrades easily and it does fix some
security and other bugs. Picking them would be pointless and risky.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

