Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 18BE371D7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 18:52:21 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y143so9465701pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 10:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=6XZcgs/o3I0//xunRk4k7X02D5GUVyZ3DdIae5aCkpI=;
	b=S4a96rXNkMbnMJR/KpemlWF47+9KCrh1f0ncwmJY6f7IGAG+amrzXHqC7t93tHNLN7
	zF00kbWGU1Zii2KYlsPyIvimMP3AgmQRE6Dou9qYu3tomcwcVoN1aEnpoJfQik0bBb/Y
	v5Gd1hxxa5daYNvbKYqggUtr3A9MaBBOKGKe7Gb5V+3wPDpWoGciuUsulTXeNE5m4hQd
	DgQmG+kEGDvU5u/eZymGcB7KfexMHCL6dSpz+sInVwstTv+yeEQwYh/3tqHNJTaWWcji
	yJY1GLDBs3N16GTXDWD/rCEHJpSRCtl+x859KzTGVCn263j01cBf2D2KILGXAoWYa28b
	uf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6XZcgs/o3I0//xunRk4k7X02D5GUVyZ3DdIae5aCkpI=;
	b=K8IrBkk0Q4B+p56ctcv7N0+XHIQE1TID0jbYIq3EGuKMmuz0hJO7bhxhIQBsdbO2Ia
	486a5084XQCkG7HSCgllT8NJ7IyERMAUdvBbH5y8zBS7aNiqslqw1+KWNE1kFqwmjCEG
	L9OVjgY7+lTZs7J01VFKvCUCc4JjQR+YFBCpGZu1aWe70RynOX+Gl7dfYrC71VGh/Ib4
	RMpHyeZoJtpaCoWmK7eX3pmP3OanHPqHSsRC5pw6Yn6xQ74u8RWO3GWa6kV/k7pH8Hxo
	TRt651XgY4VpvWgi2e10X+m8tmPO5Qv8e9IbSCqorn3lfLPr9pP17Bi3Z+Z9y5MsZFi3
	vQtg==
X-Gm-Message-State: AIkVDXI/M2HRzIp5JiOtGkv19XBiFm6PxkIjnUERBw0xv0DTC3bzfoymmqnjI3JhSnp7Ow==
X-Received: by 10.99.134.199 with SMTP id x190mr3689459pgd.68.1484333541673;
	Fri, 13 Jan 2017 10:52:21 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:4198:472b:7988:3451])
	by smtp.gmail.com with ESMTPSA id
	j130sm31111793pgc.2.2017.01.13.10.52.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jan 2017 10:52:20 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20170111035102.18447-1-raj.khem@gmail.com>
	<20170111035102.18447-2-raj.khem@gmail.com>
	<CAJTo0LZYiqp+b7hwsGaZDKbpwo4UPxyLLw7Eje1-Y5Fg-=Jwow@mail.gmail.com>
	<1484333133.3966.76.camel@pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <3441a3d4-be4e-1f6a-6a4b-9b556796d83d@gmail.com>
Date: Fri, 13 Jan 2017 10:52:19 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <1484333133.3966.76.camel@pbcl.net>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.25
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
X-List-Received-Date: Fri, 13 Jan 2017 18:52:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/13/17 10:45 AM, Phil Blundell wrote:
> On Wed, 2017-01-11 at 12:19 +0000, Burton, Ross wrote:
>> The gdk-pixbuf link does use -lpthread, is this saying that libpng
>> should be linked against pthread too?  I can replicate on demand if
>> you have any suggestions.
> 
> So, amusingly, it now appears that libpng in pthread-using programs has
> actually been a bit broken for a long time, since about glibc 2.22.
>  It's just that the failure has now become more obvious, because ld.so
> will refuse to load the binary at all rather than allowing it to load
> and having it crash later under some circumstances.
> 
> Whether the circumstances that would cause the crash (libpng calling
> longjmp) can ever arise with gdk-pixbuf is another question and I don't
> know the answer offhand.  If this can happen then it would probably be
> when dealing with a corrupted input file.
> 
> Anyway, this is definitely a glibc bug and it is now on the list of
> blockers for 2.25.  Good work by Ross in finding it!

I have sent a patchset with IFUNC change reverted for now until its fixed.

> 
> p.
> 
> 
> 

