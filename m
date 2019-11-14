Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id E25A47F884
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 03:42:17 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id 3so3146704pfb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 19:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=31d5nUExzmFl+LP7m43lY9tiukS/0Ys0aqjoAjZc8v8=;
	b=aT9srVqcJFx3ouEdBqvpky8Dh/g7yece8KttXjzNg1FoNDVvQrr15v9sRIfv+SY9LM
	sMVofOf5kAMR9pFAVACjUSGg6rorhSxKPenkUA7mlelRDAxllrFabTa7M8OUUXGYd6Vj
	t0kYV6s2uWTkbJzB1sadxthSUIt3hVxVAGEt07Su4FF67mWPDEsl/rV/4p8xJ1898OA1
	+t9EnOKrUyF9vm6jI923TQ0cIk+WAWTZlFzHbPbWavnFHHWubc/3Upka1a0Na5oj3n+X
	BTZp2pUCyowtL/yWYgLME8yUbYB/T+DdMbgLdc7DcqMFMOq931kY808YTGgQLCCa8MoP
	88XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=31d5nUExzmFl+LP7m43lY9tiukS/0Ys0aqjoAjZc8v8=;
	b=uBO5joShPeFijTvQFGf9+co7gzEpsy+IzzM32Jp3JsnWsbwh1C9DiIF3vn5ttspWjf
	pIdgI1XO4tz+VyXhIsVFjAiqhffbTS5GG5OkLdvsXoa3jH+GTfvFXdWk+UKZIfx5QI+4
	YPMMKOOcGhkVJCU2CfyQnLs7wpymDTEpnVLBu0ZprYxCdP58QsCT/RiNrKt8BXC0eVT4
	nhdcvZ+1tTNs9uCg685oI/GKIj51iGONQ9dPqENdgi2Q4wll7e+gPDZUdDLHEBYxIzhk
	YdpZ0VRJOM4kj2XDtOhU8AdF2Ga/YwdrMjKo2nzK2+hYpK80imH3u0h4shVSXFsBgZZt
	Pt8w==
X-Gm-Message-State: APjAAAXbxUAZBBAgZTEQcEffScVhJLascwtWXhyaFQw18v8TP6AF0HHV
	ObFwfo2vYchDchJs/J+cf32b6/H5
X-Google-Smtp-Source: APXvYqzgw2ormYcQnsrXaYPod8OIVRPW/ANHv4Ib6IVwp1mgkvAEE3XFpuJbbbhuzlZwnDdWpgzlFw==
X-Received: by 2002:a62:20e:: with SMTP id 14mr8372176pfc.153.1573702938651;
	Wed, 13 Nov 2019 19:42:18 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:90e5:8f1e:65b9:f435?
	([2601:202:4180:a5c0:90e5:8f1e:65b9:f435])
	by smtp.gmail.com with ESMTPSA id 12sm4828124pfv.92.2019.11.13.19.42.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Nov 2019 19:42:18 -0800 (PST)
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1573532188.git.akuster808@gmail.com>
	<d7989c4c53d9d41354b45316063b44b0d3162f2c.1573532188.git.akuster808@gmail.com>
	<311c7903f0bab6d468e88beeb8bf06c5216d753b.camel@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <799c0925-a1ab-e0c1-56f6-17e5089ea90f@gmail.com>
Date: Wed, 13 Nov 2019 19:42:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <311c7903f0bab6d468e88beeb8bf06c5216d753b.camel@intel.com>
Subject: Re: [PATCH 04/20] OEQA: update ltp runtimes to use new structure
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
X-List-Received-Date: Thu, 14 Nov 2019 03:42:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/13/19 5:53 PM, Mittal, Anuj wrote:
> Hi Armin
>
> On Mon, 2019-11-11 at 20:33 -0800, Armin Kuster wrote:
>>      # LTP runtime tests
>>      @OETestDepends(['ssh.SSHTest.test_ssh'])
>>      @OEHasPackage(["ltp"])
>> @@ -111,8 +34,10 @@ class LtpTest(LtpTestBase):
>>      @OETestDepends(['ltp.LtpTest.test_ltp_help'])
>>      def test_ltp_groups(self):
>>          for ltp_group in self.ltp_groups: 
>> -            self.runltp(ltp_group)
>> +            self.cmd = '/opt/ltp/runltp -f %s -p -q -r /opt/ltp -l
>> /opt/ltp/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
>> +            self.runltp(ltp_group, 'ltpresult')
>>  
>>      @OETestDepends(['ltp.LtpTest.test_ltp_groups'])
>>      def test_ltp_runltp_cve(self):
>> -        self.runltp("cve")
>> +        self.cmd = '/opt/ltp/runltp -f cve -p -q -r /opt/ltp -l
>> /opt/ltp/results/cve -I 1 -d /opt/ltp'
>> +        self.runltp('cve')
>
> Looks like this is causing:

> NOTE: Running task 731 of 731 (/home/pokybuild/yocto-worker/qemux86-64-
> ltp/build/meta/recipes-sato/images/core-image-sato.bb:do_testimage)
> NOTE: recipe core-image-sato-1.0-r0: task do_testimage: Started
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/qemux86-64-
> ltp/build/meta/lib/oeqa/core/decorator/__init__.py", line 36, in
> wrapped_f
>     return func(*args, **kwargs)
>   File "/home/pokybuild/yocto-worker/qemux86-64-
> ltp/build/meta/lib/oeqa/runtime/cases/ltp.py", line 38, in
> test_ltp_groups
>     self.runltp(ltp_group, 'ltpresult')
> TypeError: runltp() takes 2 positional arguments but 3 were given
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/325
Hmm, will look into it.

thanks.

will send v2.

- armin
>
> Thanks,
>
> Anuj


