Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id AD13F7197B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 12:07:35 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id b14so49169045lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 04:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=YFc5tBWdztvbdAKJ1Raw2cJP0c2veLSj7MgRWE8dWpc=;
	b=SWPL7LQpwz+GYmUsbv36bIpvtUf50u++LaCLeVF6121VqH3iXI0/rbgbFRJv8LEoGn
	3CliOmZe3GrWsHBCEn4QI/7srcsiwW3qLa2xzEEqz6Q3RuXfk74+s2ka52sfja9lJvCV
	HFSNNqpvRRAGKNbnfSs6xfcXCN2+iPqeShYTpQ5vN0V76uFzN2IDXN7O5hDnxHBjPEKy
	OF7WnMoQXYttZofr8FjUmLFVCLel4OZjCzQB06K3VBqfQOq19ScreqHvCRxIqVRXV+1w
	QWjvgWPPICR9ZU4VOMo2wClrvOcSbSeVaJz9ksHwpJNLsnp+L3xzc/CAg8zFnvg81SZS
	Xi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=YFc5tBWdztvbdAKJ1Raw2cJP0c2veLSj7MgRWE8dWpc=;
	b=GcC9/Hp78KWV3lU+QpaxZrcb5r/Qb8J2Epu9EVCs/wizWbN8qdoITxND/tmWl5YEv2
	mGG/pt5i3IbUt4XuzOHZ3emQtG1Buz6DLoy7HO+iH/rUStCVKMgmMxS3xnkH83mOltcD
	gcaNKA+4nl+OBRcRyLx0O8VwQs8ujG/41XGZ+I1XizNZzdejRgA2QMG78FgVJnVtZ5qJ
	HfDwUgbzP86qibtGn9rbGtvNiixQRxojbSMhyz66TyRb29PoF4e3IFt/JJh/aV2fUb4K
	K2M220lQ/tIZpnDY/H3Pi281J0uxY3y6pnDoQGef8rV2TmPE2Szoc2DVokVByHgUuPMM
	7QBA==
X-Gm-Message-State: AKaTC0257Szc1pqPOIJPeRCanbInzF5T9Ftrm/yfTrzWYkrGUS7gcgWH2biRQp7B897Mnw==
X-Received: by 10.25.169.193 with SMTP id s184mr83070lfe.106.1480075656083;
	Fri, 25 Nov 2016 04:07:36 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	10sm9266045ljo.36.2016.11.25.04.07.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 04:07:35 -0800 (PST)
To: Patrick Ohly <patrick.ohly@intel.com>
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<1480069993.6873.98.camel@intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <f1699a69-1949-9cb3-8bef-adf9b68f385b@mender.io>
Date: Fri, 25 Nov 2016 13:07:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480069993.6873.98.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Fri, 25 Nov 2016 12:07:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 25/11/16 11:33, Patrick Ohly wrote:
> On Fri, 2016-11-25 at 11:15 +0100, Kristian Amlie wrote:
>> +            if os.stat(real_rootfs_dir).st_dev ==
>> os.stat(cr_workdir).st_dev:
>> +                # Optimization if both directories are on the same
>> file system:
>> +                # copy using hardlinks.
>> +                cp_args = "-al"
>> +            else:
>> +                cp_args = "-a"
>> +            exec_cmd("cp %s %s %s" % (cp_args, real_rootfs_dir,
>> new_rootfs))
> 
> Not a full review (I'll leave that to Ed), just one thing which caught
> my eye: when the rootfs contains xattrs, they get lost here.
> 
> Use oe.path.copyhardlinktree() instead, it also does the hardlinking
> trick.

Thanks, that's a good tip! I'll include that in the next patchset.

-- 
Kristian

