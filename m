Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2A2377828E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 13:19:03 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id l137so331468lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 06:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=5xjHdU/mw9XWf2JBjEpuXCIHSSMIx6vABNKC/HHe4ww=;
	b=TW00gbuYMwMlnsDaiU3QAPK/frixwxmSYRnUUWgc/Zs7FTCrhX7U1dcMJC9XAGLEUD
	ZlUrW8vWB7f0yAEpX2s3fBzsSWGFlWXVqHg29uxBUVjMGrbIs550R14UIBjGdjukDV4W
	VJ5IguAWZSVqR2cfMRiVFXY+UoogA4D/8R1BbU+K1rGjZ/c5+2tZvYQcugxyc/luJuI8
	oXxc4KZ9d9Slq/XpjYr/uKRxd+EGGxqXXNVF/WSdw4ikGTGE5LwoAD0kE7gpYY+hItyU
	gKf8Ku7LWCXtDerI4l0lJ3VutoXfFISRaHl5KemSqTe2+z/60ijLwHZD/F2Ouf2ltxoX
	n2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5xjHdU/mw9XWf2JBjEpuXCIHSSMIx6vABNKC/HHe4ww=;
	b=tEOWjuknCZ/X0fxRRplOJILDVc9volSWw0q6BfFmdg2+FcCMcyz/cJv2HPtvKxbDXm
	8d9t4YpTZ+Sm+U+auPX1C3eZMBCHr+yoUdCOoJA9cRSIOPeeXsgzGloZKuZINID1hCDd
	d9Rj9pZC9Pv+/T2yyElTJfSZpbxaBdvAdBcXB620g0mer9GjsLPFr0NVrzffNzAR53Ld
	wCi7t+6a60/CjW8GvT+07yOx7odp418iSxsqNw39KLBzJRFgwit3lvWc4I8PpP6e7MDL
	BLsukOp9b4qysBjH69Sv82+9lvl6Qfhym7oW3m7Ps0i1TZyUBf2ATYEeaJ8IjtLMBX9a
	q1cA==
X-Gm-Message-State: AHYfb5gmPX+cw9lkHxoRG9DOHM5QeOvDMrdaqUl3fWtEdU3C421gHFic
	VOOuXjHsWX5OkTHK
X-Received: by 10.46.9.197 with SMTP id 188mr936053ljj.57.1503494344793;
	Wed, 23 Aug 2017 06:19:04 -0700 (PDT)
Received: from [10.20.33.249] ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	r5sm270050lje.11.2017.08.23.06.19.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Aug 2017 06:19:04 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1503488763-1554-2-git-send-email-kristian.amlie@northern.tech>
	<1503491991-14792-1-git-send-email-kristian.amlie@northern.tech>
	<1503491991-14792-2-git-send-email-kristian.amlie@northern.tech>
	<1503492432.32591.155.camel@linuxfoundation.org>
From: Kristian Amlie <kristian.amlie@northern.tech>
Message-ID: <a86ad415-8cd7-d037-0e7c-183ff2662911@northern.tech>
Date: Wed, 23 Aug 2017 15:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503492432.32591.155.camel@linuxfoundation.org>
Subject: Re: [PATCH v5] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Wed, 23 Aug 2017 13:19:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23/08/17 14:47, Richard Purdie wrote:
> On Wed, 2017-08-23 at 14:39 +0200, Kristian Amlie wrote:
>> From: Kristian Amlie <kristian.amlie@mender.io>
>>
>> This is a direct followup from the earlier f6a064d969f414 commit in
>> wic. It works more or less the same way: The variable specifies a
>> list
>> of directories relative to the root of the rootfs, and these
>> directories will be excluded from the resulting rootfs image. If an
>> entry ends with a slash, only the contents are omitted, not the
>> directory itself.
>>
>> Since the intended use of the variable is to exclude certain
>> directories from the rootfs, and then include said directories in
>> other partitions, it is not natural for this variable to be respected
>> for image creators that create multi partition images. Therefore the
>> default is to ignore the variable, and image creators that create
>> single root filesystems need to set
>>
>>   do_image_myfs[respect_exclude_path] = "1"
>>
>> in order to honor it. Specifically, "wic" and "multiubi" have not
>> received this variable flag, while others have.
> 
> I have to wonder if this is implemented the correct way around. Would
> it not be better to mark multiubi and wic as not wanting this feature,
> rather than requiring every other image creation method (which may even
> be in other layers) to set this?

The idea was that people in downstream repositories (other layers) are
more likely to have their own complete image creators than to have
filesystem creators. So rather than requiring all of the downstream
repositories to opt out of the feature, we opt in in the filesystem
creators which are mostly contained in OE.

Or so was the thinking. Not sure if it's a good reason though. I can
invert the behavior if you think it's better!

-- 
Kristian

