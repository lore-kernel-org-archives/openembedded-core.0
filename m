Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3B903787D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 16:09:43 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y8-v6so3001290pfm.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 09:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DF1jeXwe42gNom/NBQEMvROMpxthlbKeCQOqOUCZTCk=;
	b=pN5mLHIiH4LngY1Y5BmT6H00LnqQ5Lk/4HQpfKXTCDetIusV/xxNOACmeN5Kw7xV+x
	5gtQzmv+C5YXAkLbc4gIzrVMsvOgwcENpqYZWtvbsWYYBxLGXLPP3MOyz7Sjs3IuTFbb
	h6OjDVykNFEW12B+1ADVkbkrcJ9C2+eqJFMWxrK52qpBnbqEfCzoEsS7xJNkKZJ7y0SN
	yzWPUaz9XZvzmNqVYODwjcNsPKGnqktgqJrV7qz1L0ksyJwX6A+JB/ka65llVfYWdm/9
	H7TPt0cp1EbPyl5rDp4mfd84RvUfkZj5wDTpLD7cD+hC/LFv8VjLAIF35qLBmTRzOcI6
	Mwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=DF1jeXwe42gNom/NBQEMvROMpxthlbKeCQOqOUCZTCk=;
	b=OEV7XS0u+1/plInVYy5tEMIvmiAGB8YGYL0wvXhNsBEKuO67s5e/VAyFnwEf8k+MR6
	Yf69zV2U5Pvz78hwmAaE9cLLDuV1KUgsc4KhDslhQ7wC7zPXON4oSzOurpNYkrE0938T
	oAfyU1xLXxKlymuQQy6DYYSTA/Nyeq9Erj1drKpU4mxDuFy+eHS+lmdhrB+X1qwny5d5
	pgcKleh6e46ha87aqlmf6ngOiAxQNdY42vPkjFHBv40GM0hAg+dZRfibp5HCF09wI8Ol
	0flLRLR8NjSaOfKr/IbE4eWFGdAARPd4ERkAS3+X4Rsva6FWyPCiwQO4veyaC6MTP6SN
	oxEA==
X-Gm-Message-State: APt69E3TJOiOeNRtf4PeV1sYRoMzCUoDRn264HaI1vppmccjGGGk2JJt
	sDLzvdO78AIyukEDL+AaOHh4LkZX
X-Google-Smtp-Source: AAOMgpcUOMp5qNmXBC6e9tE1KbTT7Ba9Yh1jt+TwjdpCp7mTQ8UW0yVR1UBqlR4tSEvzIDlndCx6Tw==
X-Received: by 2002:a17:902:3281:: with SMTP id
	z1-v6mr2738682plb.226.1530720583880; 
	Wed, 04 Jul 2018 09:09:43 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:1caa:7afc:f307:5930])
	by smtp.gmail.com with ESMTPSA id
	k11-v6sm1645549pfk.146.2018.07.04.09.09.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jul 2018 09:09:43 -0700 (PDT)
To: Paulo Neves <ptsneves@gmail.com>, openembedded-core@lists.openembedded.org
References: <20180702150344.12852-1-ptsneves@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <530e7398-c299-f4b9-f18e-dce3ced9ba80@gmail.com>
Date: Wed, 4 Jul 2018 09:09:00 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180702150344.12852-1-ptsneves@gmail.com>
Subject: Re: [meta-oe][PATCH] kernel-devicetree: Corrected normalize_dtb
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
X-List-Received-Date: Wed, 04 Jul 2018 16:09:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/2/18 8:03 AM, Paulo Neves wrote:
> The normalize_dtb function was buggy because
> it only converted from .dts suffix to .dtb
> suffix if the user passed a full source path to
> KERNEL_DEVICETREE containing the /dts/ path.
> The problem is that if the user did that there
> would be a warning.
> 
> On the othet hand if user just set the variable
> KERNEL_DEVICETREE="file.dts" the bbclass translation
> to the respective .dtb target did not occur and
> make would fail saying it has no rule to make target
> file.dts
> 
> This patch decouples the logic of having /dts/ in the
> path from the target translation.
> 

This breaks a case where relative paths are used e.g. for rpi
kernel we use DTB=overlay/xxx.dtbo and DTB=xxx.dtb and so on
with this change its going to strip leading directory name and
break that assumption.

See
http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/conf/machine/include/rpi-base.inc#n17

> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>   meta/classes/kernel-devicetree.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
> index 4f80cc62eb..9866d844ab 100644
> --- a/meta/classes/kernel-devicetree.bbclass
> +++ b/meta/classes/kernel-devicetree.bbclass
> @@ -13,8 +13,8 @@ normalize_dtb () {
>   	DTB="$1"
>   	if echo ${DTB} | grep -q '/dts/'; then
>   		bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
> -		DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
>   	fi
> +	DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
>   	echo "${DTB}"
>   }
>   
> 

