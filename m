Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 310BF6BA7C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 20:52:42 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p16-v6so3278794plr.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 12:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=QAHbbmXeTas8nH3t2zUKQejFEiwQ3Wvp0ncdReDOQ5s=;
	b=ochDVHGQBkcX42r/gfmhFxBwRI20i07Aimd73qNgaXYXpwDgUU6hwJ+uhaX/oRJlYn
	PtI/p0aO0veGkbWbxlDBFgWCe7V8wj8WGDjtEMWoJ9+83Zi+KwpTRGHc8v48yh+aqGNU
	ZAqt1bHwZRNATsNeVH8dI/njtUqpniZZRYx+JAuHZac1xWMLo7jSQQwk3CHnWW9J5a+F
	rmkicfS1xsS/tR4LgYsWRMtczD869LiI3vulJBsWatbR6IsocqTQyt/2Vfz2pR+L/XUL
	1/ZAs0vSZOFLuhYeAODkOJt5BykiDuv/hRi9kA3b2KKMdXL/db79YpMdOOBjbGI2Cw1r
	XLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=QAHbbmXeTas8nH3t2zUKQejFEiwQ3Wvp0ncdReDOQ5s=;
	b=bts1Se1CkUfdu40DjBz0FXA3ZADjVIT8UREULeshK8zt7HFZVwJ7DogfbnoeDt40OP
	76LoddJrYHFOdYW8BVFyS6HgTcuVl3el4yIhAszWha81mkBXP2uOpSMJXuBtlG+5ctGO
	tW7oSZD7Q22/gGdRM7s7c7CWjATWJQC7JX3NeW0pxJywUrHeYjWUsFeY5daCmYSaI71G
	qvPZlkPYA9x6++u/45/tyCcY+uPf+yB1BPlUGUWjyzRQwjuvOqhFpJst31m+JLqdW9fb
	ZoYLfswsVU4L9fevnA8Ugtm6pnYhp6lw6BrvFGIGsQ30vVSOAMiihu26cUT7/wyN7xVq
	0Jrw==
X-Gm-Message-State: AGRZ1gK6jSq+xyyWM/n668/E2QPCcsNLuQDJ0InefljQEGNAmkM0qluc
	L74W7imuaQS2SBP27olu8UZKQpzx
X-Google-Smtp-Source: AJdET5ciIljXWcviLT3cn7gyCh2+ZZBh6GHhVhkUvrgkEtS30FFxeiUHE0Nrs+ZioW9YaM9lHyWxxg==
X-Received: by 2002:a17:902:1006:: with SMTP id
	b6-v6mr16825595pla.252.1541969563111; 
	Sun, 11 Nov 2018 12:52:43 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:7077:6962:50cb:42de?
	([2601:202:4180:c33:7077:6962:50cb:42de])
	by smtp.gmail.com with ESMTPSA id
	v1-v6sm15228977pfn.94.2018.11.11.12.52.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Nov 2018 12:52:42 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
	<20181109142912.23102-11-richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <eb4748cd-d26c-a916-f887-311dd6bbb8fa@gmail.com>
Date: Sun, 11 Nov 2018 12:52:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181109142912.23102-11-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 11/12] testimage: Further cleanup DEFAULT_TEST_SUITES
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
X-List-Received-Date: Sun, 11 Nov 2018 20:52:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11/9/18 6:29 AM, Richard Purdie wrote:
> Now the test markup of the development tools tests is complete, this
> can be further tweaked to auto run the correct tests.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/testimage.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index b00d47441b2..4e9494296e1 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -40,12 +40,12 @@ TEST_NEEDED_PACKAGES_DIR ?= "${WORKDIR}/testimage/packages"
>  TEST_EXTRACTED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/extracted"
>  TEST_PACKAGED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/packaged"
>  
> -BASICTESTSUITE = "ping date df ssh scp python perl apt opkg gi ptest dnf rpm parselogs logrotate connman systemd oe_syslog pam stap ldd xorg"
> -DEVTESTSUITE = "gcc kernelmodule buildcpio buildlzip buildgalculator "
> +BASICTESTSUITE = "\
> +    ping date df ssh scp python perl apt opkg gi ptest dnf rpm parselogs \
> +    logrotate connman systemd oe_syslog pam stap ldd xorg kernelmodule gcc \
> +    buildcpio buildlzip buildgalculator"

Again Nak. You are forcing folks to have x11, systemd etc in the "Basic". 


- armin

>  
>  DEFAULT_TEST_SUITES = "${BASICTESTSUITE}"
> -DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${BASICTESTSUITE} ${DEVTESTSUITE}"
> -DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${BASICTESTSUITE} ${DEVTESTSUITE}"
>  
>  # aarch64 has no graphics
>  DEFAULT_TEST_SUITES_remove_aarch64 = "xorg"

