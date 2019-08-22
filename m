Return-Path: <jacob.kroon@gmail.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id E932B6C3AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 16:10:21 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id t50so8723969edd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kvsrvh6DOraRiCNzTmR/TkgETz89/gDf9z3tMArdCuY=;
	b=QP5th4V2WdbjDrinQiaSlvqgQ8IMXHFEjBEKx8XWm94D11k/Hr92IahRe0fqcDHqPo
	XVeRjpD4QK6yLgJfRePAxsT2t3s9Uv52XM8IlyIvfegy1DXLPELqcmxsR1WofQNTx8PX
	543dClMUTX53dKCNlyxFj03LskBKVoNTb+FFwATMeBkZismk6w4Y47HDDMsv4cRmgcbP
	eH+B3ZzjG4HUgOE7setE80mFNfCoi2jENTrIUEEQHzIpE4euUdmZ6olJnPJJ/g1EK0LX
	HKOUfzQ13Ahl2KOKJ/V1RSDLWFW7h4CJm+73F1c9e6HY5yclEk4rlXaZEYr/GNaYcSiD
	5xuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kvsrvh6DOraRiCNzTmR/TkgETz89/gDf9z3tMArdCuY=;
	b=YsA59/U80k7+JXMxFEqqMZBn0FbDaQTHDwu1KHj84bmfX8TsJi0hboWfCHMM8irw11
	aD4by/9XJ1oIGsEDib8PoUCwofxD06NiTHPzB309VYG7FIB1j8snkuZ6KpLtJmLXDy+a
	nd6n305qs1c7utIOB9JKjGHr44twaUaZWC6/SGhrdoVUD11x1SYF1KRMSB/bOW18Fz+q
	3xb0s9dnY4glsvHR1ZEFforkv5dynJSiQ2gOW+/kF6vjvDCZ1/V9nEp2KDlD7WEpvkjH
	Z3nySCExVH0OYlEgR1LRXtmKQtDobyhxela8XIFy6IBwWnbQZcPsMFk1DGUQW4dAOhWI
	HOag==
X-Gm-Message-State: APjAAAWdiPptzO0SMgN4IvjW8pLna46PT6rQsUT/hm/i3fzFySp1RbgV
	X/EgbLxD5LqGMS7AHNe/hr1N8lu8
X-Google-Smtp-Source: APXvYqykx5mJpLq9EtGylB55IvR1Y+tRA6SqkeBRd7BuAvP64N56S5FOBlu4WRHZWOKKqth3BMM4HQ==
X-Received: by 2002:a17:906:505:: with SMTP id j5mr4174eja.261.1566490222357; 
	Thu, 22 Aug 2019 09:10:22 -0700 (PDT)
Received: from [192.168.10.117] (37-247-29-68.customers.ownit.se.
	[37.247.29.68])
	by smtp.gmail.com with ESMTPSA id e6sm1772750eds.91.2019.08.22.09.10.19
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 22 Aug 2019 09:10:19 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org, Qi.Chen@windriver.com
References: <20190821102553.17770-1-jacob.kroon@gmail.com>
Message-ID: <a0590f69-36f1-8770-7ee1-f55194502e31@gmail.com>
Date: Thu, 22 Aug 2019 18:10:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821102553.17770-1-jacob.kroon@gmail.com>
Subject: Re: [PATCHv2] initscripts: remove warnings on read-only-rootfs (again)
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
X-List-Received-Date: Thu, 22 Aug 2019 16:10:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/21/19 12:25 PM, Jacob Kroon wrote:
> From: Martin Hundebøll <martin@geanix.com>
> 
> When the populate-volatile.sh initscript tests if a configured symlink
> is already in place, it uses readlink with the '-f' (follow) option:
> 
>> [ "$(readlink -f $source)" = "$dest" ]
> 
> If the test fails, it proceeds to delete the exisiting folder/file, and
> create the configured symlink.
> 
> However, the '-f' option to readlink makes it follow symlinks pointing
> at symlinks. If the $dest argument is a symlink, the above test fails,
> and warnings are printed due to changing a read-only rootfs.
> 
> This is the case for /tmp, and /etc/resolv.conf:
>> /tmp -> /var/tmp -> /var/volatile/tmp
>> /etc/resolv.conf -> /var/run/resolv.conf -> /run/resolv.conf
> 
> Fix the warnings by removing the '-f' option, so that the test matches
> the configuration.
> 
> [ YOCTO #10814 ]
> 
> Signed-off-by: Martin Hundebøll <martin@geanix.com>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
> 
> v2:
>   * Added my own signed-off-by tag
>   * Added reference to YOCTO #10814
>   * Original patch: https://patchwork.openembedded.org/patch/152602/
> 
>   .../initscripts/initscripts-1.0/populate-volatile.sh            | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> index 6f965a6870..1c525b71bd 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> @@ -80,7 +80,7 @@ mk_dir() {
>   link_file() {
>   	EXEC="
>   	if [ -L \"$2\" ]; then
> -		[ \"\$(readlink -f \"$2\")\" != \"$1\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
> +		[ \"\$(readlink \"$2\")\" != \"$1\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
>   	elif [ -d \"$2\" ]; then
>   		if awk '\$2 == \"$2\" {exit 1}' /proc/mounts; then
>   			cp -a $2/* $1 2>/dev/null;
> 

Hi Chen,

Can I ask you to review the patch above ?
Having spent some time staring at the change and reading up on intended 
behaviour, I think the patch is correct.

Thanks,
Jacob

