Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3D179C7C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 19:49:15 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 83so5571571pgg.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 12:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Y1uckjvbvYaQabU3Tc6WLn6AEl8KguXOIIzv25NoR1w=;
	b=NFE+GF5Il/v3lRramYnp28N6swbTkrNzYQN20Ajpymp2QbaSDpaFobijNnskBTG/z4
	yrhknV2ruGTVpLrJvG5ctn0nbGZPRCBm73vIXWcMShKnC97yxHFZWdRDrukv7vUZutCu
	M/i9VRTXmzg2lDXiudPtYy229f91T4lx0glCvZ9CMxL/2MoC1fM1ONnVuLEHArN+zHvj
	OAQZP4fkq+q3WRRlmsPSXETYPzMSIXGIYuPYhe8OHBB21vm4NP4GlGHlUr1eJxvwHg+w
	bSQDlIzo4LFO3Ht1zpxWEMUC5/7dg3XFXE59tvNy7AefjT/cOHjgvJfUPXDUZjmm7MXU
	5sSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Y1uckjvbvYaQabU3Tc6WLn6AEl8KguXOIIzv25NoR1w=;
	b=q7zvpWunWLqJ9F2vK0F5b/soR+wesJPwZQO+SsQY9/vf4Dc2P+Wx+/umJBWsA3gPBz
	qnbsfrtrqbN/XVliaqPE16oGJPwfzVnZzABEJImuMKAu3y3iYR9orG0W67Ohd88ByyRI
	OEFZhOoPYJ/CgVF1e6pPMcpDXHw7fdVEGadKPVki4eLSfjUL98Q5ItiwACo+RrV0mvFI
	1rN9CX5XwjyNvZmTK3/RCbbBWTZ4/okyA3XDEoBXsDuxAu+bCQWoz9NSBW4zL0vik/QZ
	XiKdwHDQZ1LzyqKAwdPjb4MtMxurhnMKDSMMZzCHE358cFGykseRCzfdyHq0ESRkSxxT
	6JOQ==
X-Gm-Message-State: APjAAAWNDY5LLnIzVlKadjnU4RzmOWgrwApjUDSbtCudZGYslaszOLnA
	k4oqRJRb6FnGCmUXqiWGhPdzWOMe
X-Google-Smtp-Source: APXvYqxC2LuIoYS1syJYRAsLEGatH9yxKSio7pT1m9gojDStd68Z1SXXCzjOSHDu130YPbBPfXXwwQ==
X-Received: by 2002:a65:5685:: with SMTP id v5mr17312827pgs.184.1560196156058; 
	Mon, 10 Jun 2019 12:49:16 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:41f8:3a5:3f1:1b89?
	([2601:202:4180:c33:41f8:3a5:3f1:1b89])
	by smtp.gmail.com with ESMTPSA id
	w132sm6703323pfd.78.2019.06.10.12.49.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jun 2019 12:49:15 -0700 (PDT)
To: Sylvain Lemieux <slemieux.tyco@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
	<5d70ab1ba3570ff24d5d118805ed0d9bafad022d.1559574291.git.akuster808@gmail.com>
	<CA+rxa6oyS5W1p8TW850CUU5TgZ896+sT=ccb4dQiD-AmPOfxAQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <50d01ae5-b44d-99d2-c3b7-e17a8e5d0c3a@gmail.com>
Date: Mon, 10 Jun 2019 12:49:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+rxa6oyS5W1p8TW850CUU5TgZ896+sT=ccb4dQiD-AmPOfxAQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/21] openssh: Avoid PROVIDES warning from rng-tools dependency
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
X-List-Received-Date: Mon, 10 Jun 2019 19:49:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/10/19 12:17 PM, Sylvain Lemieux wrote:
> Is there any plan to add a revision of this patch (From OE-Core rev:
> f93f026212ebc28fce66682cdb995e061586df45) and a revision of the patch
> that fix the "sshd startup is delayed" issue (From OE-Core rev:
> 9b01375236e19e3366c58877c4154d7c71632984) into thud?
Yeah, I don't see any reason why not. I will add it to my list.

thanks,
Armin
>
> p.s. I already added the change into a bbappend and tested it.
>
>
> Regards,
> Sylvain Lemieux
>
> On Mon, Jun 3, 2019 at 11:08 AM Armin Kuster <akuster808@gmail.com> wrote:
>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> Avoid the warning:
>>
>> WARNING: Nothing RPROVIDES 'nativesdk-rng-tools' (but virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-connectivity/openssh/openssh_7.9p1.bb RDEPENDS on or otherwise requires it)
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-connectivity/openssh/openssh_7.9p1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
>> index 976bcc5..3b4ed72 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
>> @@ -148,7 +148,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
>>
>>  RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
>>  RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
>> -RRECOMMENDS_${PN}-sshd += "rng-tools"
>> +RRECOMMENDS_${PN}-sshd_append_class-target = " rng-tools"
>>  RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed"
>>
>>  RPROVIDES_${PN}-ssh = "ssh"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


