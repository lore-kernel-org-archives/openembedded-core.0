Return-Path: <dvorkin@tibbo.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4CD6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 14:21:57 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id t128so4385928lff.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tibbo-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=7HRgAghzqq2R+AfyXRM+sf2cyt83xekLu4zPGisqza8=;
	b=ZcPCQ66J+DIb4bf9JgxRq+b/ETatah6nFovAng51G1hsXzF78uLj3jYHQKepdKyMyf
	XwSez0rrQYBbwPoVqWbOM4nzoLXEtF6L6yekcSwcMHxzEt4QtM848XiEvE2v0IFhI1x3
	hgnOsTFeODQyL/FXqP1Yep6OHyeodIklZq/3Ge6htx8chUJbSASUvQkS45qSCdGYyRAK
	jKIS1MWeJifFezk5Re24alo1eoRKcCntKOMS2r0lMnnnoKq8ZXPaoCCnXTqJIm7zbQdP
	E4rLZZMMVV9t8dDCfi95lTbjU+dazh9pWz/YfOaRtPqRN4WdYr6c4JLw4Mi8xoDEkPyd
	6rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=7HRgAghzqq2R+AfyXRM+sf2cyt83xekLu4zPGisqza8=;
	b=Sg8uCN/igC/AGTAYEsbldXcjRpeSLkX5ZShGJKyvR6178UF2mZWuqnW1xrM7B3seeo
	PRqjLyogXkFlQpLnJSmJd/TLfw7V1+TawZSvNfKoqhmNb8JK5yyXnvfwOxQzifRfrU4X
	7VPwMwl3qTQpjUybAFGoF0VN8rhtWN5jAZyqNDavuNRAKtvcsUoyFym2CywiKU0StLdN
	mmSS5Hfe4ruwxJcVB0UmWg7JDlRvPmHwwiK/BcxtUlQ+P3t+eC3Wl1VucUzwM43Iba0H
	3PgLXN6CpUqkJYRmM/vd1wCsYKq3uDKtxlNxSL9++Wc0TxN3lSDPwTP+QBwxRhbYxNIy
	dfXA==
X-Gm-Message-State: AHYfb5ix6+5VxPIfrmaZZKT6Ix4BCE2vTSkjVnoD2a5TPK6V3zUjoKxc
	fAB9vUiB4yZGAVaYYag/dA==
X-Received: by 10.46.21.10 with SMTP id s10mr9881074ljd.2.1502806918387;
	Tue, 15 Aug 2017 07:21:58 -0700 (PDT)
Received: from [192.168.75.150] ([176.114.204.12])
	by smtp.gmail.com with ESMTPSA id s7sm1985223lfg.25.2017.08.15.07.21.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Aug 2017 07:21:57 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1503655141-1302-1-git-send-email-stefan@agner.ch>
	<3ce69269-11b4-34b8-68fe-0ce8ac9bd103@tibbo.com>
	<5574f618-9b75-43a2-8bdd-e6b45340ee0b@linux.intel.com>
From: Dvorkin Dmitry <dvorkin@tibbo.com>
Message-ID: <a8241b56-7927-fba3-70eb-296125f7b8c3@tibbo.com>
Date: Tue, 15 Aug 2017 17:21:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <5574f618-9b75-43a2-8bdd-e6b45340ee0b@linux.intel.com>
Subject: Re: two recipes, one replaces files of another
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
X-List-Received-Date: Tue, 15 Aug 2017 14:21:58 -0000
X-Groupsio-MsgNum: 101416
Content-Type: multipart/mixed; boundary="------------D2007904CB1E3AEFB55E33B5"
Content-Language: en-US

--------------D2007904CB1E3AEFB55E33B5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you, Alexander!

But according to this

https://lists.yoctoproject.org/pipermail/yocto/2013-January/011855.html

PREFERRED_PROVIDER_... can't be used in image recipes, only at top-level 
configuration files.

I can't make it work...


On 15.08.2017 13:59, Alexander Kanavin wrote:
> On 08/15/2017 01:37 PM, Dvorkin Dmitry wrote:
>> How to create dependencies correctly?
>> I try to add
>> RPROVIDES_${PN} += "recipe-brd" in both recipe-brdRevA/B  and use 
>> PREFERRED_PROVIDER_recipe-brd = "..."
>> into imgA/B.bb without success.
>
> PREFERRED_PROVIDER is the right way to go. That's how a kernel variant 
> is selected from multiple choices (regular, tiny, real time) for 
> example - have a look at how it's done.
>
> Alex


--------------D2007904CB1E3AEFB55E33B5
Content-Type: text/x-vcard; charset=utf-8;
 name="dvorkin.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dvorkin.vcf"

begin:vcard
fn:Dmitry Dvorkin
n:Dvorkin;Dmitry
org:Tibbo Technology Inc.;Tibbo Engeneering
adr:;;9F-3, No.31, Lane 169, Kang-Ning St., Hsi-Chih, New Taipei City;Taipei;Taipei;22180;Taiwan
email;internet:dvorkin@tibbo.com
title:Embedded Linux System Architect
url:http://tibbo.com/
version:2.1
end:vcard


--------------D2007904CB1E3AEFB55E33B5--
