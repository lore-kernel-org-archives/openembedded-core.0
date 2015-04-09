Return-Path: <joaohf@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id D7BB7606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 22:24:17 +0000 (UTC)
Received: by qkhg7 with SMTP id g7so1959313qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 15:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=jZswuFpmGnjgEmWsn3Soxl3HmazGh6qhp5RQg2DK+3w=;
	b=Qvl218aiofDRWvu5SE38RLs+5Dqk0rvXkzd6ZBkJE6vsTkFlfUj30yVcfy//cH8r9M
	BWGjSPrhObgnaqpnVTU9KMNqqyYRMx8M0uM6evOk+1Zf1S+dUxF0Zgi62vp4V/2Ib+gI
	lG6AAH5ab4vBfVi796M5a2nCLJPFAAGEESC5wrHRHOsv8B220ekWwIh64WnNS9t7SCW4
	9h5UuMFY6oxBMHmekKoRHSwe7i2pA8z8yivVEBowVAIyB/iBVGXbTSW04zB1B7NtcL9W
	1qj05dpnZbzoQ56jH+BYfX6NdUeLOLEy2Ax39C8XFgXffdtLom6h1+Vllesu1ONggyDp
	5RSw==
X-Received: by 10.140.149.150 with SMTP id 144mr39819459qhv.16.1428618258420; 
	Thu, 09 Apr 2015 15:24:18 -0700 (PDT)
Received: from [192.168.0.16] ([201.53.207.14])
	by mx.google.com with ESMTPSA id g21sm77282qhc.35.2015.04.09.15.24.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Apr 2015 15:24:17 -0700 (PDT)
Message-ID: <5526FC10.4080806@gmail.com>
Date: Thu, 09 Apr 2015 19:24:16 -0300
From: =?windows-1252?Q?Jo=E3o_Henrique_Ferreira_de_Freitas?= <joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: ed.bartosh@linux.intel.com
References: <1428400661-19372-1-git-send-email-ed.bartosh@linux.intel.com>
	<5525A940.5040600@gmail.com>
	<20150409191235.GA19415@linux.intel.com>
In-Reply-To: <20150409191235.GA19415@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH] wic: Implement --build-rootfs command line option
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
X-List-Received-Date: Thu, 09 Apr 2015 22:24:18 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 09/04/2015 16:12, Ed Bartosh wrote:
> On Wed, Apr 08, 2015 at 07:18:40PM -0300, João Henrique Ferreira de Freitas wrote:
>> Hi Ed,
>>
>> I liked.
>>
>> Two points:
>>
>> - How about if user sets INHERIT = "rm_work"? I mean the image
>> recipe will be rm, right? I always put my images in RM_WORK_EXCLUDE
>> so wic can use it.
>>
> rm_work removes artifacts required by wic. Wic will complain that rootfs
> can't be found. There is a bug about i https://bugzilla.yoctoproject.org/show_bug.cgi?id=7042
> I closed it as not a bug as wic uses build artifacts by design.

I agree.

>> - What will be the behavior if: wic create test-image-4Gb -e
>> test-image --rootfs rootfs1=test-image --rootfs
>> rootfs2=bringup-image -f. A believed that only 'test-image' will be
>> build. Right?
>>
> I don't fully understand command line options in your example, but generally you're right.
> wic will take image name from -e option and run "bitbake test-image" in this case.

This thread explain the above command line options: 
http://lists.openembedded.org/pipermail/openembedded-core/2014-March/091185.html

Usually I run this sequence:

bitbake test-image
bitbate bringup-image

wic create test-image-4Gb -e test-image --rootfs rootfs1=test-image --rootfs rootfs2=bringup-image

So wic will create a directdisk with two images where each one will be 
place on specific partition.

I  guess if '-f' is used, wic could call bitbake to 'test-image' and 
'bringup-image'.

Thanks.

