Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id EACD57F8C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 19:11:44 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w7so10294235plz.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 11:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=MLEIXo+mcC7Dw6TgIsAamg9t2Wi2Kr8cLSprzbiKvEI=;
	b=cVXP6wcxjJr4oH7O1Hd3WeK4uSa8it4JmNXQZNVrlWAu8INr8IPobgpfWAx1poGcLk
	L0WWCBZGdXifz2hW5wjJmLuXBgWmgQkeFsNphk1CDbQgprRcNwlRMBQoGYf4y0ENMMId
	fc7BOymiHv7N7zwiXy2vpBdB5ZEtCei8ZHxeKmrpfBxrh5LcOSBZI0++28GnSB8SuGog
	FZb5s95yWnl0u8hk6dE415tPzR2fykbxDaDV/AeTvQgvtBSaff4r/3OYhWs77VkIhJOe
	nYf1npu8oaiM3+pPA+5ERDFn+rCn6AhqgTh/o+Nd3a/livo7uxM5fbWRsCK79fgEhrm4
	kjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=MLEIXo+mcC7Dw6TgIsAamg9t2Wi2Kr8cLSprzbiKvEI=;
	b=Yl+s7n8+ZkTmaF555kg1+MpQtkKe5mmkfTsISNFKkGziQPnIzUAqlw9Cd4nW5sa0TH
	GjOTNUotj4+dmOF/BIwlCTJtwk9yfEGPZmq7Qh0qiTHO8B0vMrN0tDZStAZA+tSH2U2M
	MHFWkg40Py8y8w7fzfy2TRvcXow73pl+kMXnHlCosrSw89hcutiVTx4GAkJvSRqFZYlK
	kImnRZ4eMVNpJUW8tYr+eQJLJ+TYmVmQej+LX+SoWaBdJcYFdPXBtw/Rxe3BQohJAffJ
	aPiDl+s++rgQeeb8FwPXmZIN+4yCOH0T+j9VVA3p/XmmEo6N5T9oTPVaCPOHmruW/kgD
	2yUQ==
X-Gm-Message-State: APjAAAWtmcmQWzsbQRigKo7DH6iO79qNJG9IoWI4KCsogZcnhPAT+a1s
	FVeJaoSz7crGfHwAIF//nySEO9tb
X-Google-Smtp-Source: APXvYqzMMNRKWMmbFIfW/HbgS2F9wKOSu3XnMmpIM6f8cvA+N3AWPk85kmIOTC04vcKtbiwDyDn0Gg==
X-Received: by 2002:a17:902:7b98:: with SMTP id
	w24mr15360653pll.307.1574104305561; 
	Mon, 18 Nov 2019 11:11:45 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:e882:2a90:3db0:e053?
	([2601:202:4180:a5c0:e882:2a90:3db0:e053])
	by smtp.gmail.com with ESMTPSA id
	l18sm18134467pff.79.2019.11.18.11.11.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2019 11:11:44 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20191118164647.29409-1-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <2314f254-7821-bb4c-6637-faf4d26c8be4@gmail.com>
Date: Mon, 18 Nov 2019 11:11:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118164647.29409-1-ross.burton@intel.com>
Subject: Re: [PATCH 1/6] cve-update-db-native: don't hardcode the database name
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
X-List-Received-Date: Mon, 18 Nov 2019 19:11:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/18/19 8:46 AM, Ross Burton wrote:
> Don't hardcode the database filename, there's a variable for this in
> cve-check.bbclass.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

do you recommend these being backported ?

- armin
> ---
>  meta/recipes-core/meta/cve-update-db-native.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
> index 19875a49b1c..c15534de08b 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -28,8 +28,8 @@ python do_populate_cve_db() {
>      BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
>      YEAR_START = 2002
>  
> -    db_dir = os.path.join(d.getVar("DL_DIR"), 'CVE_CHECK')
> -    db_file = os.path.join(db_dir, 'nvdcve_1.0.db')
> +    db_file = d.getVar("CVE_CHECK_DB_FILE")
> +    db_dir = os.path.dirname(db_file)
>      json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
>  
>      # Don't refresh the database more than once an hour


