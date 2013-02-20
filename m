Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U8422-0002OI-3t
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 08:23:58 +0100
Received: by mail-ea0-f177.google.com with SMTP id n13so3114779eaa.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 23:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:date:message-id:in-reply-to:references
	:user-agent:subject:mime-version:content-type
	:content-transfer-encoding;
	bh=7UjweVoa8xLxfoCQ6UvbXdkGEXlrIDlAK7LG7SXxOL8=;
	b=Atm9sToGFRytSOAABedUBD/6FIXfo/lG5yfen5CnzYZxylUkH1V2mjp9gEpyE/rQ7x
	RCenX/BilwJpCT4mhKSAIsPjqB+xGlZLRTjJgZNEQbGHMdKdNkqy9a4z1cRqF3YdUb/+
	rjjBtIuugnVqAtyxtjC8YAQOlcLsvN2OGN00W1muHX9EZBnU4+oTelOdXdS4j9iX7OTo
	HwTlkIsyxGe9Ovo7CzYA5n3Y204Ub/BQ+lBBhw4+26hcXa7L2ewgaOtCj+Z2xmIkvJ3C
	zOo46D3mAcgRtIDGNyFiPU+o3HzwYSaBMPb+6jzeXmPR8qAn9vswk4a+D9chOixwrE8l
	1NNg==
X-Received: by 10.14.213.199 with SMTP id a47mr66048820eep.31.1361344067870;
	Tue, 19 Feb 2013 23:07:47 -0800 (PST)
Received: from [46.207.101.215] (046207101215.atmpu0028.highway.a1.net.
	[46.207.101.215])
	by mx.google.com with ESMTPS id q5sm107600150eep.11.2013.02.19.23.07.45
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Feb 2013 23:07:46 -0800 (PST)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 08:10:05 +0100
Message-ID: <13cf6700102.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <5ef28960f6e00cda4b04bbe53399053704921d2d.1361338900.git.Qi.Chen@windriver.com>
References: <cover.1361338900.git.Qi.Chen@windriver.com>
	<5ef28960f6e00cda4b04bbe53399053704921d2d.1361338900.git.Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.2 (build:
	2100209)
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH V2 4/5] populate-volatile.sh: improve the handling of link config items
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2013 07:23:58 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 20 February 2013 06:55:33 <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Previously, if there's a link config item in the config file like
>
> 	    l root root 1777 /tmp /var/tmp
>
> and /tmp has existed, the symlink will not be created correctly.
>
> Another example is the /run directory. If /run directory has been
> created by some recipe or script before populate-volatile.sh runs,
> the symlink of /run to /var/run will not be created correctly.
>
> This patch ensures that the system creates symlinks exactly as the
> config file tells it.

This one also has bugs in background handling, it seems.
Can't you massage stderr redirection when setting EXIT instead?
>
> [YOCTO #3404]
> [YOCTO #3406]
>


Sent with AquaMail for Android
http://www.aqua-mail.com




