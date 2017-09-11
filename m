Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id BBB0F77E96
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 21:58:17 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id c69so6202078qke.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 14:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=5T5gwVC4+SCkoLdfJ5OpJOPNq5s6Bh29TuQMza0Yg9c=;
	b=Z4K3gWwBgmML2D/tMJyPjUi2b1SFkMhsecypdgqwLCo3CORM9cVtdUIGE/0bisialA
	FrD1PJ4v/SP/VDUtyqP900BMm4cPkDAhg+cU5vsP+T1AkaABrLp7eStnZBaPXfiumeZR
	DR4CFHbfEim4RDy2qss066YHSMCnMVHlsn2QOe2zrHN5o2jNjJTJtC/1+IizaKCDt9LX
	2VebOJ3Up8tBeYwWFw78ceBJ9oSDl0eK4+acb2/fq/F2lu+xJIgJ3iXrU7F0A1xXANXE
	DMrvlk9cNGm/NZKlyPb6DoVA/fET4y0r8h9zm0ZZwhdENZnQZDBGSl7u+nqIjjpInBzl
	JBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=5T5gwVC4+SCkoLdfJ5OpJOPNq5s6Bh29TuQMza0Yg9c=;
	b=R773Nvtgj5jh/H6zgAKYFpSVafZCXeQcVnzNmf08aUuqDrmJRz1VxoMb9L6iotk05b
	Xgw/AVvntckzlSx50tSX9dWjUBuw5LIKjZQe2+UPvhB+pdLgOwzSJAMqOYubiHyLBVuu
	FOotC+eWb1V9/cbvfz6X9TX4Mk3MsYeGoPkTsEhciTnlXGkyq0ubJBnuKnjpuDep5HVV
	eAUIvKjEsdVpiHPZulYQPSoIBFtvGlcNPLcSbGcT6l6gRLGsjm2TU76w8MOJJcsh9doE
	Xgti7dWCISvz6pFAy/KLaOcF0OUQG2XKtUAm8wiIL28VGJ8adHFi4xWh/eKqzwjP/mtD
	G71w==
X-Gm-Message-State: AHPjjUgpmVbDm/fHDjPhJhRh0q+QcxGpiVPSuzFMKI/w+JHzsemyL6lK
	NmqLDpZAKzrjS+PSY9E=
X-Received: by 10.55.31.88 with SMTP id f85mr16486674qkf.201.1505167097969;
	Mon, 11 Sep 2017 14:58:17 -0700 (PDT)
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com.
	[209.85.223.171]) by smtp.gmail.com with ESMTPSA id
	s37sm6918455qts.27.2017.09.11.14.58.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 14:58:16 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f171.google.com with SMTP id n69so34496734ioi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 14:58:16 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCQZb3jlBsqhKhKFgI6/GSgY47KCmKC4Y3lF0ISc+MiUtjOdaPlYiilA2ax7S0eC6QExlwaBecZPAZyNX4tzic=
X-Received: by 10.202.94.67 with SMTP id s64mr3377799oib.249.1505167096151;
	Mon, 11 Sep 2017 14:58:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Mon, 11 Sep 2017 14:58:15 -0700 (PDT)
In-Reply-To: <CAJTo0LZgBgWL0c9ZaDRFvvKxfULKeDkvGOhAiczGWMXWNrL=Yg@mail.gmail.com>
References: <20170911213326.3480-1-california.l.sullivan@intel.com>
	<CAJTo0LZgBgWL0c9ZaDRFvvKxfULKeDkvGOhAiczGWMXWNrL=Yg@mail.gmail.com>
Date: Mon, 11 Sep 2017 18:58:15 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpmxcObf-re-298t_uLu2HNCnByi+ic_b8EEJDJ-227iQ@mail.gmail.com>
Message-ID: <CAP9ODKpmxcObf-re-298t_uLu2HNCnByi+ic_b8EEJDJ-227iQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: bump PR and fix install-efi and setup-live modules
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
X-List-Received-Date: Mon, 11 Sep 2017 21:58:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 11, 2017 at 6:49 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 11 September 2017 at 22:33, California Sullivan
> <california.l.sullivan@intel.com> wrote:
>>
>> Bump initramfs-framework PR, as it was missed in the previous
>> initramfs-framework patch.
>
>
> There's no need to bump PR.  In the ideal world, the PR isn't assigned at
> all.

there is, the package moved across arches so adding the PR makes sure
it is upgraded.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

