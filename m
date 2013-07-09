Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id BCAFA6AF6D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 14:56:52 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q12so4503101vbe.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 07:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=U4QUSiPsAwnMHWm8idbbf5FHCVXoeqpeqpjL/102jrE=;
	b=V2cL/5EbuXYJhLqyOeorELsGvKnACAa8yuMV5ouF/ZFszuTPqqW1r6ArGZyNhFzPmy
	KCIUtn6Nfl+TusQvFcpJZxoTgmRV7WAYzaGEHSifKGmd+1Mwd0cg30BPrb1yQYy6mE+b
	AJdRTPmjy9B9ylbCaOltN3n1ZCC6sJcLmL7EbtedEZ/VJBT3lPC81dzdEd4/LZWoEb6a
	T2SGMBsGjVCLtVnVWhVAMSPs0gJUd3yk6aUdZ95UHPAPaH+PeZ4kJKBaHNvkYXtT+VJD
	6707Y0mWedZKO4crkL96B40LEKs05g9VXKLoaMeFX210Xw6yl0JGrLBeUdbM/LP/MyUU
	cxUg==
X-Received: by 10.52.21.232 with SMTP id y8mr2641867vde.6.1373381813120; Tue,
	09 Jul 2013 07:56:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 9 Jul 2013 07:56:33 -0700 (PDT)
In-Reply-To: <226f2074b7530a82f4cf0e614eecd58f1fd2c22b.1373253853.git.jackie.huang@windriver.com>
References: <cover.1373253853.git.jackie.huang@windriver.com>
	<226f2074b7530a82f4cf0e614eecd58f1fd2c22b.1373253853.git.jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jul 2013 15:56:33 +0100
Message-ID: <CAJTo0LbLGKEea1vfcQH19JU++mTViDeZ2CSyLu3Cof2wqEYcMQ@mail.gmail.com>
To: jackie.huang@windriver.com
X-Gm-Message-State: ALoCoQntd2c7haX4gU3sEjnInp1nUBK//ol08x/lZMtf1MLHZ8KMItuO/t6e2pszu9KZydehc1C1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glib-2.0: inherit pythonnative
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
X-List-Received-Date: Tue, 09 Jul 2013 14:56:53 -0000
Content-Type: text/plain; charset=UTF-8

On 8 July 2013 04:25,  <jackie.huang@windriver.com> wrote:
> glib-2.0 needs to inherit pythonnative because it depends on
> python-native. This has caused problems on SLED11.2 if no
> python-xml installed.

I just built glib-2.0 from scratch without python-native being
present, so can you justify this please?

Ross

