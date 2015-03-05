Return-Path: <naresh.bhat@linaro.org>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id AAD4765C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 13:54:54 +0000 (UTC)
Received: by lamq1 with SMTP id q1so28419801lam.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 05:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=wqNOZQtYISfUjah8ar0iEC34OCBNXm5z00ZjzqZPMH0=;
	b=IasklZnMq/LUARWUhi9DxkFrJ5vsobSzAGePiYsuDoWfmhint8FNal7W8rb1KD2cpW
	pxpevFBg6kCjQ2WAMRp4qQhINpdCpsmw1y3hjT4EQa+i2pZDMrgrSu1HpfIKCeNVmFvS
	vDddxNRuX4TJ7/PTIzHb2IsaW00Dg1GMx9h/Y5L8FVql+2VPSgDFjoYsHRPRwGAZfZKv
	3ov7Q6PGBljyqFAa3E2PmvGkKFwy56WdMnk/ztY7kd2o/GEa/fGjBh2ggm2hXhUG8kNL
	TTApM5IR1KUasvBF2Y3+9FyxJLJAiAm3pEZ5vQ17kbs8E1YFWSMf9iWpT8ywrNIC8HBi
	RLCQ==
X-Gm-Message-State: ALoCoQkwQvWcGn8kAtfRJ1bYgvuozNmYhBqHKk6cuGBMiTNcBfdlR9RzfaqUMYqpck+WO/wVi8/0
MIME-Version: 1.0
X-Received: by 10.112.24.235 with SMTP id x11mr8012198lbf.18.1425563695251;
	Thu, 05 Mar 2015 05:54:55 -0800 (PST)
Received: by 10.112.225.172 with HTTP; Thu, 5 Mar 2015 05:54:55 -0800 (PST)
In-Reply-To: <CAJTo0Lbsd6zB4xMo7gpdNREsoVjVhpQn9-O7YWJU95YY3ageBw@mail.gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-5-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcS_ZWC38KgLUQceEL6hWt2jz0JE8W09Sjku8zCV5QJJng@mail.gmail.com>
	<CAFoFrHa7TdpNSo25q21BO+SOtaqVkJw26Vz3dK+ntGAtKkMd=g@mail.gmail.com>
	<CAJTo0Lbsd6zB4xMo7gpdNREsoVjVhpQn9-O7YWJU95YY3ageBw@mail.gmail.com>
Date: Thu, 5 Mar 2015 19:24:55 +0530
Message-ID: <CAFoFrHYqDxzhvncztKF6CGMu_YUNf7JKZm2fZvLHH55gRfZyUQ@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 4/4] grub: Update grub git recipe
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
X-List-Received-Date: Thu, 05 Mar 2015 13:54:57 -0000
Content-Type: text/plain; charset=UTF-8

On 5 March 2015 at 02:05, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 4 March 2015 at 07:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>>
>> As far as I understand, when autotools is inherited, it jumps to ${B}
>> to build, and B is assigned with ${WORKDIR}/build
>
>
> Thats right, but if the recipe fails to work with B!=S then please inherit
> autotools-brokensep instead of autotools, so broken recipes are clearly
> marked as such.  B!=S makes builds far more reliable so fixing the
> recipe/upstream to work with that is preferable to simply using
> autotools-brokensep.
Thank you very much.  I will try to use it.
>
> Also we're feature frozen now, so merging of these patches will have to wait
> for the 1.9 cycle to open.
ok, l will wait for next cycle to open.
>
> Ross

