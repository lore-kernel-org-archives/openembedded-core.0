Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id A30CE79CCB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 17:54:49 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id c5so7032225pll.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=G3j1ywX8fneqgTJsDbdIGlKrkB1BmLvUlaxZ8Eix8FA=;
	b=WrLk9n2MojACjlQfwydVMd8ziwDsa/EZ9ty4YraeIz8yJPWisafqtneSBiak2ruJ3p
	7ufY0DuAcboxmIMoqEAC1ddRj0sUKtBKLD4db6XCScPT8QMozkXjDbDS8BTp87SXJ2g8
	h1NLrkl4yE1+HJfCKDR38OOFDEQ3hy7kfR/8iJIEy1Ufq7aEe5iRSrxatYsY8yakgYlh
	MzA114hqi9mhajJQpW1/x8z4ei27wQvmdoPRubIyZrU79NCL6Rp0fC2Mbr/c5B2xrb7D
	b5bYz28619/k7K2xZHeK4gFgtXZSOO+h3cvr3ih7o8AqENVsDKmJGzJc6L9wSnLCOgNg
	tQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=G3j1ywX8fneqgTJsDbdIGlKrkB1BmLvUlaxZ8Eix8FA=;
	b=KfFc5U1X13kCR82D+3lz+cw/t/3kygaTq2KRxcpaegtc2si1eo+uWAulSYdLw7iKxy
	1yMdYkCpDAstsGh8ZlwVE2jLpF0L+Smsxa+3rJF8RBIosFQcvcipfoaJh/I+vF103484
	qOOmjRxVefeD4dtgoFyR78da8+kCBK9JKttKBMeI+fKrwIGdq91fWR+rHJVcQfN39AK6
	SfGAj/f5CWEF7fhi7gjuKcfkEavSjX6NhcHoxjnKt+1YvqQararOM80xmHKIn986MrWK
	0o89p9//Bjs9kFZT5RJdsueg/QYkUsuirOabqbTQfQ+CUA0jkre4WfWPJghahBkQs8+m
	JfWA==
X-Gm-Message-State: APjAAAUHPLN0mNH/x5AWl1wI6FLYYOYe+bf1g/Xx+xUvIjiuhEu8TAQN
	DjY80mi97U0TXSBYMieH1cExIsRTck0=
X-Google-Smtp-Source: APXvYqxbp5MW9dyExzlWQSlhIpJ4YNz2v5qLEfC2Yrlaw+b44zMlG/uvT1j6ow0mxWrFGnh2gx5XYw==
X-Received: by 2002:a17:902:4283:: with SMTP id
	h3mr54542232pld.214.1558374890423; 
	Mon, 20 May 2019 10:54:50 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	e73sm25495230pfh.59.2019.05.20.10.54.49
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 10:54:50 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
	<20190520141125.10805-24-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5458b99f-5330-1ad6-30e3-a98018c88e00@gmail.com>
Date: Mon, 20 May 2019 10:54:48 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190520141125.10805-24-alex.kanavin@gmail.com>
Subject: Re: [PATCH 24/42] at-spi2-core: upgrade 2.30.0 -> 2.32.1
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
X-List-Received-Date: Mon, 20 May 2019 17:54:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/20/19 7:11 AM, Alexander Kanavin wrote:
> -GTKDOC_MESON_OPTION = "enable_docs"
> +GTKDOC_MESON_OPTION = "docs"
>   
> -GIR_MESON_OPTION = 'enable-introspection'
> +GIR_MESON_OPTION = 'introspection'
>   GIR_MESON_ENABLE_FLAG = 'yes'
>   GIR_MESON_DISABLE_FLAG = 'no'
>   

is this change intentional ? if yes then perhaps commit msg should 
document it.

