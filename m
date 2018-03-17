Return-Path: <marek.vasut@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0297E78946
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 16:27:11 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id z73so10232329wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 09:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UidbJNYiLv2Xab1M8r4d8aie9m49siyxuhzyD8pmUH0=;
	b=HxB2BUWu0dBA3R9/cG4S74jbvAeN9n+dHwLBQOSkQCr9Tzlji0GXACUf5SXnIsMEXA
	6b0/taPTwSMe947SOgWrxUrSKHQl1oFIxmf0QdoSqpbI2Dv3JvhSbzOb2iil0NBwpJIx
	28/WU+1Fk+O8dwiB2MwKcIGWnqRsAW3clJGO8PPPP70yuw1O02nBny/NbgxsqM48U7vt
	zL5aopzYfOVwYeNuE5S52ndXyngUUor097Zb041GmV9f/y/YQUw0OVg1bUzBMtJcLJOn
	FKsMCDKl2xIMVyLgRI6pB2rbgc4vZ2zoaPK0Q+pT/8ho9pmVNVNWCTS05VW7MwSOOkeo
	BHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UidbJNYiLv2Xab1M8r4d8aie9m49siyxuhzyD8pmUH0=;
	b=P0iGfb0SxGkWJ/f8phn6bBnY0mwWOvdRrRIXttwUYCikC9Qnyt5C21xl2vV6NK0t1E
	g5GC8mwHCNRHll/DVd3mYJ7CkOPx3U3DitNFzkuxBnnMZxQz6CY4OxmaXSInqVh4tY4R
	IkDvZAv7pJncFWh8lE+sQPg2gixkhgmfHvdqgBz4ERhIOxZHUqzOtQEeM9OQrtDTf3ls
	wFpL2um3J1opxkb5ezGfOUHs7SBAaVmyhYobq+718eSJT1fCzNr3sJ17SQXcaJsY0w0B
	+xuBZhW5JA5WGVbouaBENsSV6WxFqMKa3W/Tx90iXbes0x+BcDDSzCfAbLuoqm+z7ldC
	foew==
X-Gm-Message-State: AElRT7FJd2CVCbEYWd4/19oHkU5loYaBhN7silvwBL/lvEqTAM8RMFyX
	Ry2Olx8uqcCeVEUI1JjbIuTqS72H
X-Google-Smtp-Source: AG47ELudb3fTs206T7qYoXaeNrHyKuogoi2YZF62xEzq5zv8o82PIL+La30oOasOrDPqv5CEB4ko7g==
X-Received: by 10.223.184.147 with SMTP id i19mr4528693wrf.129.1521304032656; 
	Sat, 17 Mar 2018 09:27:12 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-107-50.net.upcbroadband.cz.
	[86.49.107.50]) by smtp.gmail.com with ESMTPSA id
	43sm12029450wru.40.2018.03.17.09.27.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Mar 2018 09:27:11 -0700 (PDT)
From: Marek Vasut <marek.vasut@gmail.com>
To: auh@auh.yoctoproject.org
References: <20180316092125.64DD7440071@auh.yoctoproject.org>
Message-ID: <8f7b8f66-1a17-6051-e626-fc4a3d26c5af@gmail.com>
Date: Sat, 17 Mar 2018 17:27:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180316092125.64DD7440071@auh.yoctoproject.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [AUH] u-boot-mkimage: upgrading to 2018.03 FAILED
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
X-List-Received-Date: Sat, 17 Mar 2018 16:27:12 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/16/2018 10:21 AM, auh@auh.yoctoproject.org wrote:
> Hello,

Hi,

> You are receiving this email because you are the maintainer
> of *u-boot-mkimage* recipe and this is to let you know that the automatic attempt
> to upgrade the recipe to *2018.03* has Failed(do_compile).
> 
> Detailed error information:
> 
> do_compile failed

It seems this only bumped some of the U-Boot recipes to 2018.03 while it
left some at 2018.01, so it's not really surprising it failed. Maybe
this is an auto-update bug ?

-- 
Best regards,
Marek Vasut

