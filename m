Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9265260155
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 14:43:21 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id c9so3260630qcz.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2014 06:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9PUeOk3L2Ci1LYajdkd1T6qzMLHOjNdpAhFj27BvGZg=;
	b=bUBOO2eAdRUpv1bNTxkEC41+mxa0EatiwR+CAPu5kitQ7EBuUw0UXXiLgBFgOpBHIA
	/HldMJ5Z9mn849dM3JNTkT8mTrEJ/3sQ/xMPB6i5/yNSdqcgh6VyM84DwLZ7OhEoqQhJ
	2/EkdMQ6ufFqffBfJBUnCNHerRwYcMAzATWsQ5VkFq3KbAsXjcFqq8mlW5C32eQXgvDs
	VTr8RVp49jTWR338jKstMWtQigek7evlkjJ22UOGfNzKvPHq5Q9gflGBXD8IpmC5eYOW
	ALaeFeb9m2C2CHbyKevfZUv/CF8A/YoReKAo3HMtTQw1kZVYxCE76EIJsnT4t+I/To45
	tV/Q==
X-Gm-Message-State: ALoCoQkz88qYgYQWLAOK3IuUKI1sNfzBRFUqMtFZtYE9c9vT6OLv/+RbFq2f2pqsWjNccLRkxFhi
X-Received: by 10.224.97.67 with SMTP id k3mr13138954qan.17.1391697798350;
	Thu, 06 Feb 2014 06:43:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 6 Feb 2014 06:42:58 -0800 (PST)
In-Reply-To: <20140206142700.GG13035@mail.itconsulting-heinold.de>
References: <1391695992-29453-1-git-send-email-ross.burton@intel.com>
	<20140206142700.GG13035@mail.itconsulting-heinold.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Feb 2014 14:42:58 +0000
Message-ID: <CAJTo0LaZ0c+X7eNgKsGwpkkmu_s1vAUSs2o8rUp3yvS8dL-xeg@mail.gmail.com>
To: Henning Heinold <henning@itconsulting-heinold.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: add a hard dependency on udev=$EXTENDPKGV
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
X-List-Received-Date: Thu, 06 Feb 2014 14:43:23 -0000
Content-Type: text/plain; charset=UTF-8

On 6 February 2014 14:27, Henning Heinold
<henning@itconsulting-heinold.de> wrote:
> which package manager did you test to verify it is working as expected?

I haven't attempted to replicate the failure case (because it involves
quite a lot of building...) but the idiom of EXTENDPKGV is used in
every -dbg and -dev package.

Ross

