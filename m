Return-Path: <marek.vasut@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id D206B6C455
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 07:10:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id a14so5927245plm.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 23:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=JdMLiDFrwv/SVxpGa24DkVjHcW8ejjOlcNSKdxCbPY8=;
	b=lGd/6VdPdLVObUPNeDjXfnniUzM2K0dfjdaSIkUIib2IeV5PvDl0OKcNAbiVVHnd1B
	BJC20Ki1lee5oQoAZ3eNYtm7oy1nzdE7U5QAv3DGF89EuNjhYZOBQP43xzTTnysjS5DZ
	MyH0mlpKeb7zW5QLRRfqOU+3geXm6zQ3yWN81kxbQSy8tsmVd1ImsxacMA6V8pYFpV8r
	urfNkrCSbGThzwbkZ+CoOqO82MjZZgV+eydwHvcQ1A/3FpPmcFf3lrKsG0NOR5AyBK9R
	UQE698nKcXX+t/TTe5ermHV0gSEYPlPuYGUzcibt4yEBUxQd80KVy0lGA9Q+QnYbNleZ
	DiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JdMLiDFrwv/SVxpGa24DkVjHcW8ejjOlcNSKdxCbPY8=;
	b=bf+b4R8XFcBEDUwZbK9h+kuNdX95Kublo/b8NH2l74Pi2GDSRxkZm1lwBl9AQGGPdF
	2DWG0qtAq88yttkgzF4jLeumWsAvzkOjZ/EiiL2HGGN+iyOog/yRM4+t3gQmkOb4o6yx
	LIIglW/dC0qV76Ycn+yWJfbi4jdePMnlk+GQGRUqFE/bm/qDEsC5KDaZhi9JxDYoXiDY
	DcN00Yffgag0/Jl1QA1vVM9pLOUR+HXMR/aeh2gk2vd0HevBsgIn4chH78KUbJuskAKx
	4g3o6HtDcV4GYkstNFbcpLvnmgixi31Ir2WpReV4WkjgTcBY1lGWrbylQ8jI2YW4EclV
	HeaQ==
X-Gm-Message-State: AJcUukfFEejGLoqScY/F2zvDXVntWJQO/2M7zSSD/z/P91ctpqkliDgs
	3GqVYeQ+aIbFXOOWbQgr7wTmGv1A
X-Google-Smtp-Source: ALg8bN7/ypPjvs9saqvrajTghR7Cx6z0Z2plbJhHFIB4CDR4UDhfBKBemrIPWZKV0XirDvSvAyjwAg==
X-Received: by 2002:a17:902:264:: with SMTP id
	91mr18266766plc.108.1547795403614; 
	Thu, 17 Jan 2019 23:10:03 -0800 (PST)
Received: from [192.168.42.184] ([103.44.164.150])
	by smtp.gmail.com with ESMTPSA id
	n22sm8843293pfh.166.2019.01.17.23.10.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 23:10:02 -0800 (PST)
To: auh@auh.yoctoproject.org
References: <20190117104456.E6876440001@auh.yoctoproject.org>
From: Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <5a8d0f4a-2b06-cd9c-b571-ce3bff62f86c@gmail.com>
Date: Fri, 18 Jan 2019 07:17:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190117104456.E6876440001@auh.yoctoproject.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [AUH] u-boot: upgrading to 2019.01 FAILED
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
X-List-Received-Date: Fri, 18 Jan 2019 07:10:03 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/17/19 11:44 AM, auh@auh.yoctoproject.org wrote:
> Hello,
> 
> You are receiving this email because you are the maintainer
> of *u-boot* recipe and this is to let you know that the automatic attempt
> to upgrade the recipe to *2019.01* has Failed(do_compile).
> 
> Detailed error information:
> 
> do_compile failed
> 
> 
> 
> Next steps:
>     - apply the patch: git am 0001-u-boot-upgrade-2018.11-2019.01.patch
>     - check the changes to upstream patches and summarize them in the commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --amend
>     - send it to the appropriate mailing list
> 
> Alternatively, if you believe the recipe should not be upgraded at this time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
> 
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Can AUH be fixed please ?

-- 
Best regards,
Marek Vasut

