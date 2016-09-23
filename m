Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5969C6079F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 14:57:57 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hi10so5192581pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=AdLptIQnn6nWVTzSneXqxKMUBApLYvetd0uQJ49ivCg=;
	b=D+4PE4Aj5Qs82j6AOaRtZsRQBArccPPXwFNM8FPOxt8kg/r08Q7bcevYOh3wfD/3Nv
	4sT3n7t12ZoGNwbDy2wriI3TiJH7d9BAvFDsXHiAc4/MuzmkbxPmNWWAbIYy25EXJxbh
	SGE+w/oiypE1m4J8HHwVzFY6N7HVkN7GivpD3nORkpa4yKyBaptyBpLl5z1nBTBki1mr
	Zgc808Db4l/Yvxd/Dlqro0a+Ssv/EJr76O7iIFuloRloJ4Gw9kTxo4pvV/sBVIZrmBGZ
	1YdWa4pO6HDuIhEnbkFbJrW7PWdY4x7bv0lVrmwQORM11PlyAgiXWzE5+EaRKn9oIIQI
	upIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=AdLptIQnn6nWVTzSneXqxKMUBApLYvetd0uQJ49ivCg=;
	b=JJVoJqtVk6nJZWpMhx5zHpdpTYwOgn2l04fpgqqtRUKBIkmOq/If4JcgvOa27oSw/T
	fZpMWKI6R0wRZpIc3crEO8EdhSkUIY0Pw8TG8Mn4+S4Ywhs+TCw3bXlvk1k3cvpJSYG/
	MuQdCRJW4biGgzzK0zGWDVs5jsK18TPfhi2noyHtGi+m6mIbG6KJJxLYAt31yKum1N5P
	adGznWaHTIj++zmB4J5hjbjND334tpp9zN0QY5FT6pNhO2gvjwvCPpmWUk9gjarm7rBE
	/2SzEs2/ghNKw8IEjggQJRttjMPmu8e0IOMAQQuQ6m0i7yIVfPdCo3B2/fphjX1skgpI
	Caaw==
X-Gm-Message-State: AE9vXwNcqidO5EUFMn9Zt4GNC86B+gyeoF9MzrGrBVOa1j+z718UR/5eG5GbY79qQO06fQ==
X-Received: by 10.66.144.164 with SMTP id sn4mr13325670pab.0.1474642678609;
	Fri, 23 Sep 2016 07:57:58 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:c560:5d36:d9b:7d07?
	([2601:202:4001:9ea0:c560:5d36:d9b:7d07])
	by smtp.gmail.com with ESMTPSA id
	m82sm12253318pfk.64.2016.09.23.07.57.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 07:57:57 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1474492215-39510-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<a826406c-2bff-0e51-014c-81203e0ec06c@gmail.com>
	<1474641658.7207.371.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <521eccdb-9541-fd49-a5ae-054f7113ad59@gmail.com>
Date: Fri, 23 Sep 2016 07:57:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474641658.7207.371.camel@linuxfoundation.org>
Cc: akuster@mvista.com
Subject: Re: [PATCH] [krogoth] Fixes several python3 dependencies
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
X-List-Received-Date: Fri, 23 Sep 2016 14:57:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/23/2016 07:40 AM, Richard Purdie wrote:
> On Thu, 2016-09-22 at 08:33 -0700, akuster808 wrote:
>> Alejandro,
>>
>>
>> On 09/21/2016 02:10 PM, Alejandro Hernandez wrote:
>>> This patch adds the packages python3-signal, python3-enum and
>>> python3-selectors,
>>> while it also fixes python3-subprocess, this fixes the installation
>>> of python3-modules
>> I can not get this to apply to my krogoth-next nor krogoth in Poky.
>> Can
>> you double check and let me know if I am doing something wrong or
>> need
>> any dependency changes?
>>
>> error pw is showing is:
>> fatal: patch fragment without header at line 29: @@ -89,6 +89,10 @@
>> SUMMARY_${PN}-email="Python email support"
> I've pulled this onto the branch since we have it as a high for krogoth
> (and merged the other queued krogoth patches, thanks!).

I saw that. Thanks.

- armin
>
> Cheers,
>
> Richard
>
>


