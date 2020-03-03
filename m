Return-Path: <jacob.kroon@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 621EC61927
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 17:41:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id v2so5405954wrp.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 09:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=0ei+HhqgqmaYcY8kdr3p517eLP05yAsIbI4eaYyOvJ4=;
	b=gtMa0lHVurxPLTdY/F4/3peK7EVjo92ECUN+NfJxjt7UH48IdleJjjvSqXSY9gEuLK
	q4EhetUXBlqL5vVRaG/h4juAV3UWWBGuxIDOIv1gzmNgThH2p02vFChkDXpUW3HPBnwU
	Rvqj/PQ/cGdloHZg13mTu3SQh35CbL5iYfYQvyfSbZvEcyaOnKTyDHZt8GuBgYoEPrkx
	ldAW/t1xTEuR+9iZT+piZLWp7p8Nd4+Ex8R48gM8624KDDcWxthEilq9gus4NP9w4d06
	5vKJrHElB/Ij9vCakJJ7k+YZayxD4bEBVGgEIDT3ldUASbB+QBAA1gVJ9tttpBw7Qrzh
	l7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0ei+HhqgqmaYcY8kdr3p517eLP05yAsIbI4eaYyOvJ4=;
	b=MxHApElLar9ntZjMq6d1XrzZuXTq0SAV5XFeyA26uTYihWFWXOUeRNZrVpww+RPtre
	aZzYywlkNoFNO9Gd6VEpdM8xNza9rrvMO23wqNZK4v3YA9Z/6uqHO1hXaJzj8//3snlR
	OwyI4jjC3fP7a6t3lF+uqPjSkiWiNytVrEvsOnYRvOoUF4+MHXqsvfotR/HG+WHfTcQ5
	czQETiDrMdXZ1pYHBJeW97Ud5G0zV3bDCk46Wu6KQBEef3anyQyf0Dwvn34ZA7Umd5/8
	T36ZD374grbN5kNYoXqNHMbWgfdQ3+xAeHPqgh6oET+VkgidtoJFnfggyA1oC1J9OuXM
	zWhg==
X-Gm-Message-State: ANhLgQ2EmnFRAI8NUS77YrEpFj+24zwZNCe7NpKSH8Lz7Jtc6CYjZ+RQ
	QD+sRy6FiNpMBUp0A8ygGbWqWLlA
X-Google-Smtp-Source: ADFU+vu4YXSMTAi6/3YJhw/Zs/kymHqjb6kNDIUDBjbyDHeXeYEFlEvSsKfyK+YAsheZpZtB/u6gSw==
X-Received: by 2002:a5d:534f:: with SMTP id t15mr6184612wrv.190.1583257319361; 
	Tue, 03 Mar 2020 09:41:59 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	g129sm5623963wmg.12.2020.03.03.09.41.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Mar 2020 09:41:58 -0800 (PST)
To: Matt Ranostay <matt.ranostay@konsulko.com>,
	openembedded-core@lists.openembedded.org
References: <20200229234742.3780-1-matt.ranostay@konsulko.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <6353532b-aa0e-a005-2589-2e8281863fd5@gmail.com>
Date: Tue, 3 Mar 2020 18:41:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200229234742.3780-1-matt.ranostay@konsulko.com>
Subject: Re: freetype: add pixmap to PACKAGECONFIG
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
X-List-Received-Date: Tue, 03 Mar 2020 17:41:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/1/20 12:47 AM, Matt Ranostay wrote:
> Add pixmap to PACKAGECONFIG defaults to allow consumers to
> render color emojis without distro changes.
> 
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> ---
>   meta/recipes-graphics/freetype/freetype_2.10.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/freetype/freetype_2.10.1.bb b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
> index b179a0ed47..d1c093054b 100644
> --- a/meta/recipes-graphics/freetype/freetype_2.10.1.bb
> +++ b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
> @@ -27,7 +27,7 @@ AUTOTOOLS_SCRIPT_PATH = "${S}/builds/unix"
>   CONFIGURE_SCRIPT = "${S}/configure"
>   EXTRA_AUTORECONF += "--exclude=autoheader --exclude=automake"
>   
> -PACKAGECONFIG ??= "zlib"
> +PACKAGECONFIG ??= "zlib pixmap"
>   
>   PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
>   # harfbuzz results in a circular dependency so enabling is non-trivial
> 

My distro does not care about rendering color emojis. Building my image 
now pulls in libpng unless I remove the packageconfig in a distro conf.

The pixmap packageconfig has defaulted to being off since it was added 
in 2013 in commmit 7cbf6060ac14b0f4d2f038f821ca980be0d46cb0. Wouldn't it 
make sense to keep it off by default and let whoever needs it enable it ?

/Jacob

