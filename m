Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
 by mx.groups.io with SMTP id smtpd.web11.4974.1588855645092463241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 05:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=RVqFT/Bi;
 spf=pass (domain: pr.hu, ip: 87.242.0.9, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWfvv-0003TF-L5; Thu, 07 May 2020 14:47:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/r1wtl53TIFifk7Fj6IwH+His2D+aKcKPPd6msX9U7E=; b=RVqFT/BiMHAfkrrZLKp4kwZXl1
	jW7TBTax/0sj22jm5ebTm9IvTRuE6vP5stmLR99DDjEx6lHrSxysVVIM4gRs7BHaObheLopZUeZHX
	PG+4A+djysoLLvP+HcTRMAxGLRI/DEp2ETUMkcJw9Ybe6KylMzzUhqz/AmvEGOHDZbQX+qEv90ZIW
	sLEWqzxacKX+liJ8zEL6E/Oo3IDxD/apPddafdNx8UmVAniU/QR4T2vajfnOInN3agXxeH/wLmNlH
	goEdreGcR/hyQ3Sxb7vQbyc4/TQ9wJbWhlJI9vJbvkuJo+g0j9fEbCMVdZTH3I/XngA3a6K62Bwc6
	lH1hAqzg==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197] helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWfvr-0006yJ-DT; Thu, 07 May 2020 14:47:21 +0200
Subject: Re: [OE-core] [meta-oe][PATCH] libva: Removed virtual/mesa dependency
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 =?UTF-8?Q?Bart=c5=82omiej_Burdukiewicz?=
 <bartlomiej.burdukiewicz@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200424150143.374520-1-bartlomiej.burdukiewicz@gmail.com>
 <44fb22eb-a3ea-15cb-f93e-c0ff4503705b@pr.hu>
 <610a380ebc8ef2638a8d13c8d3a84b3059bcf8aa.camel@linuxfoundation.org>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <0e58e708-dcc0-d355-79f8-9681a4898b0b@pr.hu>
Date: Thu, 7 May 2020 14:47:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <610a380ebc8ef2638a8d13c8d3a84b3059bcf8aa.camel@linuxfoundation.org>
X-Spam-Score: -1.0 (-)
X-Scan-Signature: b6eb8dd8d4e483f7ae84ef827401bc57
X-Spam-Tracer: backend.mail.pr.hu -1.0 20200507124721Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2020. 05. 07. 13:48 keltezéssel, Richard Purdie írta:
> On Wed, 2020-05-06 at 14:41 +0200, Zoltan Boszormenyi via
> lists.openembedded.org wrote:
>> 2020. 04. 24. 17:01 keltezéssel, Bartłomiej Burdukiewicz írta:
>>> Mesa can be compiled with libva support, in order to avoid
>>> recursive
>>> dependency between mesa and libva, virtual/mesa must be removed
>>> from libva recipe.
>>
>> This is why this patch series was created, to break the
>> circular dependency in a clean way:
>> https://patchwork.openembedded.org/series/22976/#
>>
>> The libva-initial recipe was introduced that doesn't need
>> mesa, then mesa can be built with vaapi state tracker enabled,
>> finally libva can be built with dependency on mesa so its
>> GLX support is enabled.
>>
>> What happened to it?
> 
> I think it came in late during the release and was a bit too risky to
> be taken at the time.

I didn't get that impression after the response from Khem Raj:
 >> OK, I guess, we should give it a test.

> It think it is a good solution to the problem,
> would you be able to rebase the patches and we can queue them for
> testing? Its a much better time now to merge a change like that.

I will rebase them, thanks.
Does it have a chance to be backported to 3.1?

> 
> Cheers,
> 
> Richard
> 
> 
> 
> 

