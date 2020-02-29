Return-Path: <petr.vorel@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A6D0661A71
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 17:00:42 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x7so7209312wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 09:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to;
	bh=sbXd5LlCUruNq/BpCM5L0gdKs/7N4GjJJuX9JLB+FJE=;
	b=sc0p/bKeBVxzN2woeP1czPRa6EjQEBR16bLz1suzP5vDdPC2fuETl9lg5BDpbNn8vK
	CqlC0OiAie9Ljm9pQzO7Tslbk9PU20dNxanuForIyYirhsR2VcW4hM4crBfkapLGCRoL
	D04VfQOlzYs2y4dqvmXiDQUbWJcARq+PaNG7R0hY4nbaZPz/QL3XjcuNgTN2+zcHmTBc
	omGw5RdjYQql2fW7dBXdl/Tp8oh7pP+uHf2ZHs3jdzX2kNVmg369OyG5tVj9ao9Dfvl3
	JZ4cwyl1GpJd/q+NCfhU4UulCxxWvrq3mmCnmSp4ZQcM9YChGaV/0v1WTGTZ9sjB54ya
	+s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to;
	bh=sbXd5LlCUruNq/BpCM5L0gdKs/7N4GjJJuX9JLB+FJE=;
	b=p94R72ycGQhNZh64WMXJiN07wMecuLvz0s2vkK0y5px9GmJO4kSQXfpJE0hZvksnQL
	/AbxDk4NaHKyUjPAsrl/PYazw9FgL+IwHGT4EYYTcAOXkk9zmUSbMgO2r5TNULBjH8jL
	6ctBW3wKL1owTxdb6EohBVOthGE3JfeZdSD6k3MDlqvWxvhW65eaS3e0nS1gG0YceE5A
	SfR3rE7X1rnK5FmL1WYynZ53vtfSK+xTANDaLwcD89uU/dOYxvSKnjQ0npcYtr1OGyCk
	1xhRsmyARay3V8u4pBqFDc/2Np3NNLF80g81SNj+M+9maTgc3ETnrpM+gS9lSBWHHwZW
	N9yQ==
X-Gm-Message-State: APjAAAW0egTfkkNSZghAorLW+Tv9zbAqg4j/S1g+c8WCJ1UE7x4AGVPa
	uKjfdN3Qkt9BoUelHBWQd+w=
X-Google-Smtp-Source: APXvYqw8AT2J8UgfpB7QZKbRtc+RZU9YeaFoRAdrIaYBYN4Z1SLLMajQFc5IfkzHmF4VyEz3Lboktw==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr11064433wrn.209.1582995643355; 
	Sat, 29 Feb 2020 09:00:43 -0800 (PST)
Received: from x230 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	e16sm19259766wrc.48.2020.02.29.09.00.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 09:00:42 -0800 (PST)
Date: Sat, 29 Feb 2020 18:00:40 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200229170040.GB832653@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20200228175731.10604-1-petr.vorel@gmail.com>
	<e64730b1908726a7e8ca4dd5e27b0f7567dd0a57.camel@linuxfoundation.org>
	<20200229064656.GA4045619@x230>
	<4db943be8cba440551847721156d22f9664cca0a.camel@linuxfoundation.org>
	<da2bffd2ba22435a66a17044f922ab555d7a3ede.camel@linuxfoundation.org>
	<c70d9ceacc5b7a557179ff9fc1b05100b7aa4065.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <c70d9ceacc5b7a557179ff9fc1b05100b7aa4065.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Sat, 29 Feb 2020 17:00:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

> Grep suggests LIBS is a configure option, not a makefile one. I tried:

> diff --git a/meta/recipes-extended/ltp/ltp_20200120.bb b/meta/recipes-extended/ltp/ltp_20200120.bb
> index 847f267b0b7..5be9489a756 100644
> --- a/meta/recipes-extended/ltp/ltp_20200120.bb
> +++ b/meta/recipes-extended/ltp/ltp_20200120.bb
> @@ -16,7 +16,8 @@ LIC_FILES_CHKSUM = "\

>  DEPENDS = "attr libaio libcap acl openssl zip-native"
>  DEPENDS_append_libc-musl = " fts "
> -EXTRA_OEMAKE_append_libc-musl = " LIBC=musl LIBS=-lfts "
> +EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
> +EXTRA_OECONF_append_libc-musl = " LIBS=-lfts "
Thanks a lot for an explanation. Next time I need to read carefully.

Kind regards,
Petr

