Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 771C07D9E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 14:26:55 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id p6so11283261pgh.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+xCZbu9SPGxgtuJMVTJRTfhTG2PP4dmxVWBRN5azYCo=;
	b=peZDfB1QJD+UJUK3WhLMwH4jp6ffCM9pM6kqbIrjoCT3QGPIxV825kt8KiV24helTc
	JJPzekagKo7Gu1E3vCduGphE3k1tVzMxTJriQrkRfXWn3mWyiIQ2FdFy9FZY+TtUfp4K
	/PUtyv3Xw9bGLPydTtsSYJWjdN1mvz81AkDPNovdorinK9jWCb6cREaXMPR4SCBRj8CO
	s4XlccXbaUPmMzD7UmHA6aDn9Nw69UxII+vkHC45+cUKtvvcFHMkYmP+tfZghqdjrK8Y
	IUMEY6bHsu6l6Qyt0QPuGpeQ28tSpCjRVpdWXYprKUirHU6CZpeIL/AVjz/NSlJi06D2
	ZAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=+xCZbu9SPGxgtuJMVTJRTfhTG2PP4dmxVWBRN5azYCo=;
	b=asE6AVfF96QqGaFAWwcYnaUKh/+x5NKjlyh2YqQN+4pJLpWEnplyM+Dn93bZzsqBFx
	Uuay8MWlJmUbUod30aBFkrVUeLvpUYLNsbTy2VLtNNz73aeXLlck+uAnb1OYZhviooaM
	Y2pWfurs9qcpcmhAXGdKKkkc6NivshlzL/jd3SizcubDFe0TDfi4xy29SIQiGiVHLsDT
	cLVESDKZQJ5ragBLXSFY6kj3oTEQkGBNFkg2No9Ll0dhU/JPKhpuBiLC3E4niPg4tfqw
	3VEzfPI+lM9sDYM9KiZSBe9Fg8DxtNPQv18uWmAu/1heYDHdfAe63IkVjmkNdL3/tWPm
	G8rQ==
X-Gm-Message-State: APjAAAXRgYf2ne3n/GbPyQyZUFVwwBFoRcht98doT5jOFU88BEiIpW+9
	D9iSjFQZlw4FuKlxsABFDee1XH0Y
X-Google-Smtp-Source: APXvYqwn3o3W+ORn8e/YkhSN8vpv1E7OhAHD0nu9T4aUPfeiVqGPHkrx5lJpVlHpi9jBIGFkLXHLAQ==
X-Received: by 2002:a63:5349:: with SMTP id t9mr689854pgl.327.1556202416516;
	Thu, 25 Apr 2019 07:26:56 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:c9c3:61ea:6899:785c?
	([2601:202:4180:c33:c9c3:61ea:6899:785c])
	by smtp.gmail.com with ESMTPSA id
	25sm36861104pfo.145.2019.04.25.07.26.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 07:26:55 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190424001333.14948-1-alistair.francis@wdc.com>
	<a824b9bf98abc6545575514aa58e97e5f6347ada.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <bccaa968-1653-f9b1-4b75-8e72337dcd7c@gmail.com>
Date: Thu, 25 Apr 2019 07:26:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a824b9bf98abc6545575514aa58e97e5f6347ada.camel@linuxfoundation.org>
Subject: Re: [PATCH] qemu: Upgrade from 3.1.0 to 4.0.0
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
X-List-Received-Date: Thu, 25 Apr 2019 14:26:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/25/19 6:49 AM, Richard Purdie wrote:
> On Wed, 2019-04-24 at 00:15 +0000, Alistair Francis wrote:
>> This commit upgrade QEMU to the latest 4.0.0 release.
>>
>>  - The COPYING.LIB file has changed SHA to:
>>     "Synchronize the LGPL 2.1 with the version from gnu.org"
>>  - SDL 1.2 has been removed, along with the --with-sdlabi command
>> line
>>     arg
>>  - The backported patches have been removed
>>  - Al the other patches have been refreshed and the numbering has
>> been
>>     updated
> I put this in for testing but it failed as nativesdk-qemu doesn't build
> due to unpackaged files:

Bug opened: 13308

Thanks,

Your neighborhood swat team.

> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/535/steps/7/logs/step1b
>
> Cheers,
>
> Richard
>


