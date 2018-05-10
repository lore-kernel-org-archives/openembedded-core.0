Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id BEB7775340
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 19:26:40 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a22-v6so1538443pfn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 12:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3O5BvyAkrshSDi9ycYXqj2YlFqwwwygOUZXou5OrIH8=;
	b=nLVE3Hb55CeKUaDOLUmwp0acpZyG5MU89Y2/F8eIjU4Fjrrphk89mpjBEnj975ZTRe
	P8++4yDgmbblSIbOIW+1sN4ZGRRWopL0Y1F6ykrIUIj3gqfrJwG9RxdxHLnKwx19PpQ3
	rnAm+fY15aHjFH1OIw0WCceVBPt+2ophXjGQksnM7CJzSZICZKLAYX9EhW7SxpgJImg2
	OXICTX0j6G421Zx/rygxZTyPSIqrtoLHam9oFgYQag+O3eBDYfMk+609WVZzGFGvbXo+
	Au9uepDRM25FYSIPFYclMQNsMRPFB4tTaa6rPPqijHU42M5PrvsqMbrXO95FG3yEbWTb
	4jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3O5BvyAkrshSDi9ycYXqj2YlFqwwwygOUZXou5OrIH8=;
	b=JmD5sjsUFRQa7EYqr4J8gOtFZzEA/aXQ3vCCuWYymUc4Vm8gDYlHwjouilHWQsSoqg
	1j8OqlEr+etok6KViLozIDnu8hOb8CHqhdCzHxxju4dmZYit292Mw69oOGDcCS4Nn4zp
	Nq6IFGBgDCY+3DnzDlBSA12cKnwxnWUgJaJaIb6JqPs0Hmmzg6k4xfx2PKhRhFeNMjU2
	ImrO8s2CAPQEMVASALnEwk3fEA3Df/Ob6IcGayo2FWLJPPq54ckrGz+LnIyEUScqmofW
	DMTmaZH3qM63H/y2QNEH3eIRdQcFvq9pOps9VKcrBH9WOtQA/pWYJrwyQSlIZ/J7De/j
	HHxQ==
X-Gm-Message-State: ALKqPwdc74Ujn1ugp3XPp8CBW2i2aAmg7vUNXVvJ1wgP6QUKwBYTgTnZ
	9TArT3shfXPYvfPcoBS9qn93jtEF
X-Google-Smtp-Source: AB8JxZq8YION0aktK0KRf7+nXZXCwoBZkNeSEDTMzJM4e0Z1gw/4N+a6ODDuzfneUJgoxLZDvr9IKA==
X-Received: by 2002:a62:9b57:: with SMTP id
	r84-v6mr2537483pfd.109.1525980401240; 
	Thu, 10 May 2018 12:26:41 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:49fa:9382:bcbc:28ae])
	by smtp.gmail.com with ESMTPSA id
	x10-v6sm6481280pfd.162.2018.05.10.12.26.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 12:26:40 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<20180510122036.15212-1-Martin.Jansa@gmail.com>
	<CAJTo0Lb4aV0BKz=BQCf8-=8i16BDQAJZu8hGqBJoK497GowEUg@mail.gmail.com>
	<84e0278e-4ed3-51e7-81b8-f104c469ed4c@gmail.com>
	<8df86d81-5e7f-46fa-0d25-ecb902d70d8c@gmail.com>
	<20180510191612.GB1954@jama>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4ab499de-5f57-520e-4951-91f15115435d@gmail.com>
Date: Thu, 10 May 2018 12:26:39 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180510191612.GB1954@jama>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: Enable FEATURE_MOUNT_NFS and use libtirpc
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
X-List-Received-Date: Thu, 10 May 2018 19:26:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/10/18 12:16 PM, Martin Jansa wrote:
>> On second thought, this probably should be enabled using a config
>> fragment, since its not gonna link in another library it may not be
>> common case to justify for a default config.
> That's true, I've enabled CONFIG_FEATURE_MOUNT_NFS mostly to show how to
> reproduce the issue.
> 
> If there isn't interest to enable this by default, I'm fine with keeping this
> locally (to enable it only with our defconfig changes which enable it).
> 

I think keeping it as a nfsmount.cfg which then can be applied via a 
bbappend could be a good option. May be adding a PACKAGECONFIG to 
control the -I flag and libtirpc dependency would be nice too

