Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 370F76E660
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 14:48:35 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id g8so1012569pgv.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=jv1xcTIbtBFHS6CYHpnNvgbhlLXKoxfyVRvcrHzrCDY=;
	b=uzGQDnT9UXyI2BfkLwh63mwJn5jSWaEHhN+NovYwqNLc3wSsIyPy6jmDKHJI39iaqg
	1jbFXsbykfNIp78JeDv/Ffljl7J1dWNOYxXD1dchF4TvgCc7asPJWuWnjITij0v7bjjO
	IHAu2CP6UyN6yO4JqXqPTY2VUTnhGfkkWCFpcoMEyFME6aDLb7Bv16CeSppvucwxDlAj
	8Wam1xaxes9CkqyHBCSync7jJvm7MIJv59UB2VO+csWbqbsYArqioWTZunyxpqQEJviN
	Oo3w6KrSbyKHX+ZlPeuTwLIxNpg/FskkcNSbvqf568NCgPDWiiqcZTcBvXF0OYL/l7an
	aQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jv1xcTIbtBFHS6CYHpnNvgbhlLXKoxfyVRvcrHzrCDY=;
	b=JmlcAsf52oY5PeF8n0ejbMvnrXM+kyquDZoJt/2Jbg4YNJ70Z7aPv/TFFlUq3brAuO
	mp+kGSD3nTz0gAMDYmCkw1DzHsQ550UTgZynKQZFj0jYBWqqZkS6CDX0GCZyikhjLKJ9
	FwpgbyfN3tK3ui2Ym6kVnhPs5i5q6EMSRdSeVnh7fACJ0d++pSEaxWNJycirJhp/HmhY
	zrSg3gJu9kG4+dAqVj6Ue0ZtUm0zNbTJMYkF6gT7lsWe87e/hRUXUtKsfvUXbSYs7TEk
	qoBzY6ON6M8yz87+rzSq3wdk9BEbkTV7mGqgais/H+nPGbAGrRYKzjpbU0vKqve8Foi8
	/Z7Q==
X-Gm-Message-State: AElRT7FFG2+YQAOt4L+1mebfpNe3hAjzstW01aZMe0jEl41EL8Z2FG/w
	EoVQEytB6voPubCZhoSW97MlSA==
X-Google-Smtp-Source: AIpwx4/R85DAuDYRT7uMPS0s1Vs7Uepbncdy3LeGgmgk4ssuJYAuYreo6KrShTW49C/pVVOUv+LeKw==
X-Received: by 10.101.83.199 with SMTP id z7mr2837288pgr.105.1522248517138;
	Wed, 28 Mar 2018 07:48:37 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:315e:77dc:98f1:ec41?
	([2601:202:4000:1184:315e:77dc:98f1:ec41])
	by smtp.gmail.com with ESMTPSA id
	o90sm10869467pfj.102.2018.03.28.07.48.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Mar 2018 07:48:36 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <62e48d71-f219-2d7d-ea58-b99e1caaaecf@gmail.com>
	<CAJTo0LbSaZDNtGmgtoBba1n1aFLBUaaDN00L=G3UUq6UAvT6hA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d08f4cbf-7604-0115-61ca-a020fe2164fd@gmail.com>
Date: Wed, 28 Mar 2018 07:48:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbSaZDNtGmgtoBba1n1aFLBUaaDN00L=G3UUq6UAvT6hA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bind update
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
X-List-Received-Date: Wed, 28 Mar 2018 14:48:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/28/2018 04:15 AM, Burton, Ross wrote:
> Hi Armin,
>
> Does this mean you are working on the upgrade, or should someone else start now?
I think I did it. just need to find my work.

- armin
>
> Ross
>
> On 24 March 2018 at 15:35, akuster808 <akuster808@gmail.com> wrote:
>> Hello,
>>
>> While working on updating the current bind to the next patch level, I
>> noticed our current version 9.10.6 will EOL June 2018. I know we are
>> under feature freeze for the Sumo release.
>>
>> Could we make an exception and allow an update of bind to the ESV
>> version 9.11.3 ?, it EOL's Dec 2021.
>>
>> regards,
>>
>> armin
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


