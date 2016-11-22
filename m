Return-Path: <kristian.amlie@mender.io>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 63150719A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 11:54:53 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id q130so19691025qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 03:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=qB1B9HrGWe3kki1zq5PTVRf87NHoYW/N7yNKq9JYcNQ=;
	b=F6s8iw1kez7CDsdxwMDCzySn0i47K+6uZguJLkmp7ogrM5ZLJ4G9GJtFy4zrWl5LLQ
	lTFiK857KjVUlc6cVUSpUq4oaOcQK33u3sYYi5u7+iaxDWwGYPkWCcZ0u65HovdDydWH
	7RuFYfsjAq2bNMWNnS+3KQV6Wtc7vRptUMoDR7inCNLMLgY4Siu2Wpi6rOQELPiZ7Cxd
	EcPIvKlmYbxNTSdcPMvohVs5DMyW9gbQgLSJ59U23XgQeJfOIb1MoCuZeyTceAg+2PW1
	5vP19vAEnBBsE1zfMk17UWfS0jLLHyhD5UIpqDAWHJXTjQ29/He0wV8jPXSwp7GYwljU
	BuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=qB1B9HrGWe3kki1zq5PTVRf87NHoYW/N7yNKq9JYcNQ=;
	b=AsHWXKNcaQRxfkx85eyfL231RGNDWlMy5fwOiSaUZYvJwbHFCLvMsROYVXCmzeDYib
	6GKbEGurVwiPtuX4A+bKuYtM0p1fo8xp7q7E2qUwU4TlzSOhPobKL5aIKcNZqVKGzsOb
	COhMQ51TgQTNDr0B/ex61dPy7yKP9ICuZriQzmE2YYZOfap2iYjxZ/GugVjqr0/LPUB5
	V5kwQBpMOM34KlIHLx6KyS8ZLPxLnCtj+8yrZySMxlx0LtpZBf9vzxEJXq4FJ+9bkeXn
	/JJq3rUOVn1XV2XacGf4eQyMEd24OTNQnCT9S6v78fsbSlSdWXQOCy34ozPUBBS8xfLQ
	okLw==
X-Gm-Message-State: AKaTC01swKsNt414p8fEuMGe4Ozs+GBfIxQWS3VQ7umq2UkQA7WZlvS8mqJ5tBK0Bt8wlQ==
X-Received: by 10.46.0.229 with SMTP id e98mr11446094lji.33.1479815694050;
	Tue, 22 Nov 2016 03:54:54 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	20sm1299045ljb.37.2016.11.22.03.54.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 03:54:53 -0800 (PST)
To: Patrick Ohly <patrick.ohly@intel.com>,
	Eduard Bartosh <eduard.bartosh@intel.com>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
Date: Tue, 22 Nov 2016 12:54:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479813004.3239.19.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Tue, 22 Nov 2016 11:54:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 22/11/16 12:10, Patrick Ohly wrote:
>> ...
> 
> All of these introduce some special mechanism. Let me propose something
> that might integrate better with the existing tooling:
> 
> The "rootfs" directory gets redefined as representing the entire virtual
> file system. When creating a disk image, it gets split up into different
> partitions based on the image configuration.
> 
> For example, the /home or /data directories in the rootfs could hold the
> content that in some image configurations goes into separate partitions.
> 
> The advantage of this approach is that the tooling for staging content
> for image creation does not need to be changed. The same staged content
> then can be used to create different images, potentially even using
> different partition layouts.

That's a very good idea. I think it beats all of my suggestions!

> To implement this approach with wic, wic needs to be taught how to
> exclude directories from the main rootfs. Ideally, the mkfs.* tools
> should also support that without having to make an intermediate copy of
> the files for a certain partition, but initially wic could create
> temporary directory trees.

Yes, some work would be needed here, but ultimately it would be contained within wic and related tools, which is a good thing.

-- 
Kristian

