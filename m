Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 09E3772EB7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 17:41:00 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v13so9011611ljk.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 10:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=M3DXmKN0nuls6FXf+tebFQ3j68RHnhoN7vmUSxpXcgE=;
	b=F3hdZhigTAMatHOeWtNZ8rjBctXzGhpDmbQ5W+AsQn7grn2oGmVw757OvVPLVztaBa
	YSpAOJyKGZoRqlE5ScjxSYxmtxZWiS7HARecsT6GTkMSQAVPz8naBIiKm1lvWREGY6XO
	sO87dgR7MLyGN4FaILEbNpsTyOrDpef2CeKP8ra17yseAZaE9hw/tJu6bCCiKEhXvY31
	/ZmdDV3ewAIdOgKUQAAjLbIs/qvVXpujxgbI3/7ZmQFV113WVPDlFsewKtb3z4TEwxUR
	MUFeOLcGO6yZUzKNtfcL01PWiil1h/jSw2qA+7aAOCNwVYpFSCuio7kXytp24UDGyt0/
	0ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=M3DXmKN0nuls6FXf+tebFQ3j68RHnhoN7vmUSxpXcgE=;
	b=cPyrpokkZiIY3a7PX36JfShXawrhweb73U7z+iZFzcIF9m6hC6k8i8z4l9oNpGNzjP
	o3hmdXfiNFtOla8hi/6dvF6NQBtH/3/xnzSKjvn7vVR82y1bUarz8/cpjBSfZjSKc5Wu
	SZ7opz88u52wCPab2wOyBIc7HgNgtTKeFPreqY2VrYuSOfEMWORFsFp8HzrmMUPNEC8p
	hlwhBbW5mmaG1UaKCtutAlJC8WRvnhaJfBsGvDAXIzlFCioOa4KGzT+4ybQILY3TY3HR
	t44+pdtSDPPLqRzlvflBHv+96vN9ZGeHytkU6+jVbhdNRpRwl94vUmlZFOTiiAlFmRG9
	DqOg==
X-Gm-Message-State: APjAAAXJaGh/brA00reXiOrTHEesj9cdylHvzMkY/FFYZNQON7YoeP1S
	Twejhn/YFn5XCbO8RMcL77IjfEw263g=
X-Google-Smtp-Source: APXvYqya8UUBZD9I3lfvgPSrnHCcZNl9u0LqdScm1r3mqfSPnLR08AbRBao7o9mRU2Ofx/U8UnLzqA==
X-Received: by 2002:a2e:7215:: with SMTP id n21mr38154893ljc.105.1554140460939;
	Mon, 01 Apr 2019 10:41:00 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	x202sm2065069lfd.31.2019.04.01.10.40.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 10:41:00 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190330224908.2108-1-open.source@oleksandr-kravchuk.com>
	<25e816bb8ab33d104be3feec92080bda3ee60f99.camel@linuxfoundation.org>
	<09ee1ada-c90a-c04d-5032-dcd94e7bb864@oleksandr-kravchuk.com>
	<CANNYZj9rmK_hmgT9gS_tbZpOdMepq_F58=ux_N5F1oY7zwy_KA@mail.gmail.com>
	<CAJTo0LY-zE3PaRRs0gguBJJtacOBAM716GDWLchgVD-dFpNrQg@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <d21b331b-2cec-1cf0-a3b9-ca3493f0d623@oleksandr-kravchuk.com>
Date: Mon, 1 Apr 2019 19:40:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY-zE3PaRRs0gguBJJtacOBAM716GDWLchgVD-dFpNrQg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ofono: update to 1.28
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
X-List-Received-Date: Mon, 01 Apr 2019 17:41:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 01/04/2019 18:04, Burton, Ross wrote:
> On Mon, 1 Apr 2019 at 16:58, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> It does not look like a hard dependency.
>>
>> configure.ac has:
>> AC_ARG_ENABLE([external_ell], AC_HELP_STRING([--enable-external-ell],
>>
>> So you can make it a PACKAGECONFIG option, disabled by default. It's
>> fine to have oe-core packages conditionally depend on things in
>> meta-oe, if the condition defaults to disable.
> That's not right: that's the toggle between "a system-provided ell" or
> "you have checked out ell into the source tree".
>
> https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=8452a7f34907472c5e21c334673afd10df409eef
>
> We'll need to bring ell.bb into oe-core too.
>
> Ross

Alright, gents. I am rather new to the project, so just instruct me how
to proceed here.

Ofono is a great piece of widely-used software that would be nice to
have up to date.


