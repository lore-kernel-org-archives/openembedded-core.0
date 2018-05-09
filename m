Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8997874F4C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 16:04:31 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id p85-v6so16325933lfg.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 09:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LbKPh5brN9CIYJ1uFGBSsMk7xG05TnTMFlv6BLVqw1o=;
	b=f3z0liuO7YCQ3x/QacA2NFzJ/+P7BTrnNhMUenhKqQQFoR3dqRnaZX56Evc7XknRuK
	kNwLn9K23zGNm9Q3TxTDAfXijCd/VQDs5zoE1RqlyuVMye2RSLzql5d5KAV8dkaf75HR
	DRIu+sAbXH6Bvyavtg4tgqYqyRhqC6yIqNvQO8CwBN/6Dkpd/9uSYPesTTLGyzkgCGlL
	ZtcLwlqUCOSB+Km8ehFv03W8AdqSSeYj32Ja5IzILe18LsgSyzlLBQEGX7sRJPqB59DV
	+dlgYcYIKsK1do3uPulvhuB2qrRNZBLBGGDcgDE1ExoyQR0vMczeD+nYe7ji8rOO8Y38
	wXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LbKPh5brN9CIYJ1uFGBSsMk7xG05TnTMFlv6BLVqw1o=;
	b=Yo2uNz+utA2OhH3f9hAK92Jg/BmPt4KvvYaRCGCfg0lLZIPmo0fI98fxpum8kCR/QC
	jC0vNSXYEMcDW8RvV4vAbjF6BbezNkkxwP3IoU/hsg2EFD5eayMD4OEIqjsdLnitUX1a
	50BOd35EDK1ypxPKhe4BQYA59OYvTYjyfg52NjftILNnhAv91gdTydfSndHpofUH8IM/
	kRgrqFAiMJA1IGvyMrOkhabFV+QIMR4rq6LQVhD580PEWJEobrQz/pLo/X3rlnO+y+Bi
	m1jzEuc1IQz3pSk+va2jeNpEq0rOEQkCbfEaMACtwCJR+62q4usAxT/j6Hyh/wLBkUBm
	pm5Q==
X-Gm-Message-State: ALQs6tDUbKeRe3YT7sChA+znJeIPWgCY3kqQILKx4ReZ4gefCwcwMFOK
	ctkymJa0RzSHQMET6iVQUmXWEjMc1KjJaoFcBnc=
X-Google-Smtp-Source: AB8JxZpl8YQGmd82X9Parex5NU7wTBVAYl6PJq3mRITl4gEpWATg6AU63GALzxYULN/O9JNt7kvA+AYgqx4JpYj294w=
X-Received: by 2002:a2e:9b01:: with SMTP id
	u1-v6mr22951374lji.26.1525881872117; 
	Wed, 09 May 2018 09:04:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:380e:0:0:0:0:0 with HTTP;
	Wed, 9 May 2018 09:04:31 -0700 (PDT)
In-Reply-To: <CAJTo0LbCv1A6+ORgJzrGmwO4CSaS9H9VwwC61cd5HS0qx+YNyg@mail.gmail.com>
References: <20180509154920.5987-1-danismostlikely@gmail.com>
	<CAJTo0LbCv1A6+ORgJzrGmwO4CSaS9H9VwwC61cd5HS0qx+YNyg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 9 May 2018 10:04:31 -0600
Message-ID: <CACS+7ZT6X8rrqrvi71T+_hkrquunbaR78pMW_7Ad_sn38+uPMw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] go-native: use nonarch_libdir
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
X-List-Received-Date: Wed, 09 May 2018 16:04:32 -0000
Content-Type: text/plain; charset="UTF-8"

On 9 May 2018 at 09:58, Burton, Ross <ross.burton@intel.com> wrote:
> Is that *right* though?  Non-arch libdir is for architecture-independent
> pieces as the name suggests.

Looking at it again, no. It's not. That was just the first solution
that came to my head.

I think the right solution is to use libdir_native, which doesn't
change at all, and nonstaging_libdir can go away entirely.

>
> Ross
>
> On 9 May 2018 at 16:49, Dan McGregor <danismostlikely@gmail.com> wrote:
>>
>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>
>> Setting staging_libdir to libdir caused unnecessary rebuilds of
>> go-native when switching from a multilib build to a non-multilib
>> build. Switch to nonarch_libdir because that's the same on both
>> multilib and regular builds.
>>
>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>> ---
>>  meta/recipes-devtools/go/go-native.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/go/go-native.inc
>> b/meta/recipes-devtools/go/go-native.inc
>> index b76fb0825e4..76c83848cd3 100644
>> --- a/meta/recipes-devtools/go/go-native.inc
>> +++ b/meta/recipes-devtools/go/go-native.inc
>> @@ -1,6 +1,6 @@
>>  # Use immediate assingment here to get the original (/usr/lib)
>>  # instead of the one rewritten by native.bbclass.
>> -nonstaging_libdir := "${libdir}"
>> +nonstaging_libdir := "${nonarch_libdir}"
>>
>>  inherit native
>>
>> --
>> 2.18.0-dev
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

