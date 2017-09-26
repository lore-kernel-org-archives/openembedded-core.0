Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id B908E77F34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 01:20:33 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id 188so5033158pgb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 18:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=SBo26kPPE+f5qHxaglqAT7Aw3tcN9vpxwGDpuX7dlew=;
	b=pdrNliFV8rd354NzmG0bNAGbiS3ICUazCmJwi+mXISwXlCyJRWBWHs11EdXiP7eQdF
	Elp+ZlbaKG7t2Mbqk6EQDdonG4jKEc3gr3gUymRiQppiESMtDTcja4zekNhkuG6p7ZFy
	cicx/K6peTuuw1pUSj3u+9xIqz+AzAdN9rQCAZWrQfEHRTNAnHl+GyU+yitS2+Bgdq7W
	6gTXOS9V6i6DHfgcqQ3whcace+Zmq2W0EwlUZDdcawL4rThjUqijD+7FXswBEOg09yi3
	Lqs6gz/MKyKQUR4LrOwkm6iKxnvEd6i+UiaqQSnLvh6o781IQygbbAc4cAbnQI7plkBp
	lpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=SBo26kPPE+f5qHxaglqAT7Aw3tcN9vpxwGDpuX7dlew=;
	b=PtkM53pSI2lSj+wsGpxkRB1PmE/u4bAzydMmV6uGov5++FUFlElCKz4FxFFyAXwQL/
	lRbr1DQc71ytjqG71ZV2CZmSWPM1wL0hpXEsOZ0KhVmmtpNn5ZvXgOJgcgxrLVWkrz0f
	5+QkpnTMxALaiRPBp9txYV58DooelsKuBTAUnogPkd7WCgsCsmrRAQIvY7VZDl37pdUS
	SIPDi3LHBN3wiEgjR0EaKaUFcchkNQLaTWt+xWQ9ajc6bTFe3MkMMdJfZWY65yWf/4ak
	muBsTBwrTvxYnu0McBW4bO7EISvOKn9t4kx/dojYoDSV4kw+e0KMCcX7i09X3d7bLhGH
	BtWQ==
X-Gm-Message-State: AHPjjUhTbtjiOLqUIEeHOBIajWHGrr0t4EsP6PXW/MTIdp0PMQqOFtL1
	ezwQeOoXjkyxBGq/43K7GUNZaA==
X-Google-Smtp-Source: AOwi7QCwrSXk5R/KH8DVJzWCkWvRRL9VxNbhFZbOAuPWomzp6jN3eoCUSLZKTVRXiQysJSFny9vKJQ==
X-Received: by 10.84.218.7 with SMTP id q7mr9573030pli.111.1506388834969;
	Mon, 25 Sep 2017 18:20:34 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:41ca:f424:3692:4c93?
	([2601:202:4001:9ea0:41ca:f424:3692:4c93])
	by smtp.gmail.com with ESMTPSA id
	i63sm15072935pfk.34.2017.09.25.18.20.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Sep 2017 18:20:34 -0700 (PDT)
To: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>,
	openembedded-core@lists.openembedded.org
References: <20170922052908.25666-1-mnhu@prevas.dk>
From: akuster808 <akuster808@gmail.com>
Message-ID: <db54323c-1c3d-9648-445f-f449b5117f4f@gmail.com>
Date: Mon, 25 Sep 2017 18:20:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170922052908.25666-1-mnhu@prevas.dk>
Cc: akuster@mvista.com
Subject: Re: [pyro][PATCH] image.bbclass: Sorted ctypes to avoid basehash error
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
X-List-Received-Date: Tue, 26 Sep 2017 01:20:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 09/21/2017 10:29 PM, Martin Hundebøll wrote:
> From: Gerson Fernando Budke <nandojve@gmail.com>
>
> When selected multiple subimages a similar error could happend:
>   Variable do_image_cpio[subimages] value changed \
>     from 'cpio.gz.u-boot cpio.gz' to 'cpio.gz cpio.gz.u-boot'
> To avoid this, 'ctypes' should be sorted at 'gen_conversion_cmds'.
>
> This garantee that 'CONVERSION_CMD_xxx' are always written in tha same
> order and consequently 'do_image_cpio' have the same hash.
>
> (From OE-Core rev: 271f1a5f65b8685a1e3645026876251122ef3974)
This got merge into Pyro
thanks,
Armin
>
> Signed-off-by: Gerson Fernando Budke <nandojve@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/image.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index ef2b38aeaf..9c9f14a99a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -453,7 +453,7 @@ python () {
>  
>          rm_tmp_images = set()
>          def gen_conversion_cmds(bt):
> -            for ctype in ctypes:
> +            for ctype in sorted(ctypes):
>                  if bt.endswith("." + ctype):
>                      type = bt[0:-len(ctype) - 1]
>                      if type.startswith("debugfs_"):


