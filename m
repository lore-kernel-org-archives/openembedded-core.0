Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6F16BB3A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 17:57:42 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id db12so1821697veb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 10:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xrtnC/QCzwjEWD4JLvqvWbmitn6O4+5IFXjZpp8MZyw=;
	b=hY6etfjR1u2rsYsR8ZwbLuXAgL+2lNUPbTDJ0kiA5vfFcCJJ8/WtpcBNjqIt/ozPbO
	fLmzeZDVqfWo+QSZtdb68/Iyqfpj+dLy6LvYidSLICvLI+gG/kJxjwj/9BpVcnoR12Am
	o4KVasRWApMwSsHafOk6yQrzanPPeTmf43v6okNIU2+tmdUcha8WVVYR7LGOZvQ371bM
	HrA4UHMox98J4q7Zq4ELRAtvTdI0beYdT3/mVSsWCJ0TvLdvNsBDJ+yjfAPTpPvZHZGm
	fPAVuNd0IdHfJK7ZmYl+2klSXfXjoMFOq3+40EcUOqT5DToyIyV5HW+9CliHyV5EnY6u
	hYyg==
X-Gm-Message-State: ALoCoQkO7JdPXFs4NJr39JztCTQmucdY3b6zJL4ApQu1Sv3BDWPIPLb1AngImsOzmVCyKUABTnSG
X-Received: by 10.58.44.37 with SMTP id b5mr3495145vem.4.1378490263606; Fri,
	06 Sep 2013 10:57:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 6 Sep 2013 10:57:23 -0700 (PDT)
In-Reply-To: <1378479022.3484.6.camel@ted>
References: <1378478579.3484.4.camel@ted>
	<CAJTo0LZ_bA0ctzS3qrPdoOVhLSLZbVu9Nyk8WKNvaqe517RsCA@mail.gmail.com>
	<1378479022.3484.6.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Sep 2013 18:57:23 +0100
Message-ID: <CAJTo0LZJVu81PPBt5r4mNB7f0T27YgvTR7Crn_HwuT8_cB4U6A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oeqa/qemurunner: Use a timeout in select() call
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
X-List-Received-Date: Fri, 06 Sep 2013 17:57:43 -0000
Content-Type: text/plain; charset=UTF-8

On 6 September 2013 15:50, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Basically, agreed. I've pushed this into master-next for testing
> purposes whilst we discuss what this really should be. I think 5 might
> be a good number.

That certainly seems like a compromise between needless spinning and a
noticeable delta between requested and actual overall timeout.

Ross

