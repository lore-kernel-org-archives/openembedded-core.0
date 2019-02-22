Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id B4C587CBF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 15:20:39 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y5so1233494plk.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 07:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=6wD0KJgN5NOispCz+vsTPVbqM7XOMcH1xxulf3UfeGQ=;
	b=eif/5Cy2Tcu7qKvbpWY28u7oDYFefd2FSwsNU1z4wT0DP8zD2JMmIOem5vYOzePa3U
	fR7oyNIMmKKIa1qZfn0XDlrsCCawDS3MgfiibikPs0XyMZ4arXHxe+Yb7302NE3EJbGv
	W+vvk7pHoclViAYcvZ/qDJ0N10quiOByTWDB97JaFpK2TA5gLi+XF8Wn+6KeNcv2O7EE
	gX6PiaxqS3+Nxk7cP/7//bpgYg1qd9Fh9qj/qRVAwJU/DzATcwJFlmw58DT0MAZOAMbV
	T7UcuwBWy1bQ5a26ROi66J55brGdh/qw4UNUhfXZAdb//HxoMqkOOFVBcj1Vqzl23eOe
	wM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=6wD0KJgN5NOispCz+vsTPVbqM7XOMcH1xxulf3UfeGQ=;
	b=MLo74EXsdHCuKi1C4uyuNHY7tVhgXQi9S6NsQo34kLLV+4BLDlg8vYZv1G+0A6Lwz0
	KBHib30UL2hwp3Nx9WFlgOxd+aFx+Ly4oCrIiZ3VMSaSyG97H79wo97Lj7KzZQSpp8la
	7w0zZgf3RXAivfAcYqRK+zrTyz+Gtl8UWi6T+nOJ1FJ1U8VzSCtSbDuiakBvUg1Qn+zs
	iSOZiIGbQaf5IMTYm2UwGTlicvH9IUQgKsYoWf33J/ZtorHYGNqq3ENVVRtS/TQc42bf
	G7wd96jUfe8DlvGGFnoCyE/PJSddbwQ1pbvF3oGXU5uMRdaJjy33Qzocl8DfL2CYFuhp
	rZcw==
X-Gm-Message-State: AHQUAuav92TctuD7Q8MkuNP9W6dXRBNN1dxS9ofKSQonFRxLgpIpaEE3
	Iq/FWScnnpplanryt2AuZwsbSVZ5
X-Google-Smtp-Source: AHgI3IbUdxA0vLRDYVTho3Rg+mM4TRYyMgLKokIroJ+t218K1yW/NFuU25QWVBrRbSJZ2nhNlYEJDA==
X-Received: by 2002:a17:902:1486:: with SMTP id
	k6mr4818156pla.49.1550848840476; 
	Fri, 22 Feb 2019 07:20:40 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:70ef:357b:adf:5cc4?
	([2601:202:4180:c33:70ef:357b:adf:5cc4])
	by smtp.gmail.com with ESMTPSA id
	p29sm2208861pgm.78.2019.02.22.07.20.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 07:20:39 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20181222221322.3768-1-pkj@axis.com>
	<db68711ecba94d9aa3fd99ff16652e78@XBOX04.axis.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f272c949-3c12-a35c-40e3-2c8ce5cb9fab@gmail.com>
Date: Fri, 22 Feb 2019 07:20:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <db68711ecba94d9aa3fd99ff16652e78@XBOX04.axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH 1/2] libaio: Extend to native
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
X-List-Received-Date: Fri, 22 Feb 2019 15:20:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/22/19 3:00 AM, Peter Kjellerstedt wrote:
> *ping*
>
> //Peter

you mean this?
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-extended/libaio?h=thud&id=40350b46d5c053b4336cc128922f44ce80e7da9a
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
>> Sent: den 22 december 2018 23:13
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [thud][PATCH 1/2] libaio: Extend to native
>>
>> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>>
>> lvm2 currently requires libaio. So building lvm2-native will result in
>> the following error.
>>
>>   ERROR: Required build target 'lvm2-native' has no buildable providers.
>>   Missing or unbuildable dependency chain was: ['lvm2-native', 'libaio-native']
>>
>> Extend libaio to native to fix this issue.
>>
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>
>> This is a backport from master.
>>
>>  meta/recipes-extended/libaio/libaio_0.3.111.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/libaio/libaio_0.3.111.bb b/meta/recipes-extended/libaio/libaio_0.3.111.bb
>> index 04b50b61ec..8e1cd349a0 100644
>> --- a/meta/recipes-extended/libaio/libaio_0.3.111.bb
>> +++ b/meta/recipes-extended/libaio/libaio_0.3.111.bb
>> @@ -20,4 +20,4 @@ do_install () {
>>      oe_runmake install DESTDIR=${D}
>>  }
>>
>> -BBCLASSEXTEND = "nativesdk"
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.12.0


