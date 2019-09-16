Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id E27657F92B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:36:14 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id r5so1971174qtd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 15:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kuw8lj41XXTxJe/wLelnWA5mgJ732As3lHCkEMHzXog=;
	b=Q9tobEReRSbXxdORcaD3k7598IRqQZxPy8XKtJQRWWo6QlJyVBQQTFnv7g61lo7/QH
	uQPbdJAnbgoDgu/acLOLUwZk6wZ7EZ/7kfZL228G3ZMAyOylQWq1lVGP5ULwtKPXxyTJ
	shYilWeRsUiNA1uDLYtiwXIiYQJeD9eBBDzG/Eql6axcklzZGZrTIW+CMQtYKFhf8kqO
	H2GmjsSLRvUnG0DCrPCQWWsQX2s8p0iH7D28BhBaUUgfY7aynWCk9yGzpUgZfZ9ifF5m
	2FPKBf1S3r4KKl08jAvfSoq4WZBbTiFExmWour3yD5MckcwcsBKYRIrklLi0rW/K+J3h
	fArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kuw8lj41XXTxJe/wLelnWA5mgJ732As3lHCkEMHzXog=;
	b=F1gHkI2PBT427s90cd+g/NB3LZNqeqrmDl3J1M77ZLelm0tTLaKJRZC+fg09nStlEs
	gX7SXuMcrQrvtFENO3TYXKJEvI/giRDxUjde44ma5zYq22akvG6Gcnd/8Exv3CkNKPXT
	qGyLC3yE/8y86UkciWzj/A9FTCmr+Y5MKFkf6lX524R5xaOi6ZxIKUBmYfLYoOUvg4de
	MmOYu6mo3WO9O4BcO8hEZ/3eTOnXOloetOpcZB9f4pXIAsuf5wMr4ivr6eXptnRdUCKY
	aUSwAKOo9Wt5OAcUUpE0ow9uwWGsrQ+3kQwIYOmoNw4ndjesZDwF7Mxtmqb+PuVeVSHg
	bMRA==
X-Gm-Message-State: APjAAAUitIwuACCdZEkBzJ0Muo5irl+sGM04jFYOEXqiQ7fsHCNdAIUi
	RQUSd9nNUJnQFbMA10mWvMhgXOVMgHfNjwALOUg=
X-Google-Smtp-Source: APXvYqwkyH2t8R1uuC7/N3j53WV7rV3nlx81pSL2nx5KMeQRNrfzh4rJtA0d9XDoygI2L90Bo6q8sK5nTZ971vwimJI=
X-Received: by 2002:aed:3576:: with SMTP id b51mr811766qte.378.1568673375573; 
	Mon, 16 Sep 2019 15:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190911042903.3047253-1-raj.khem@gmail.com>
	<984e3147-bddd-56a5-ea90-eea87d8a792c@intel.com>
	<CAMKF1sr9S=7H5_2QL7eeZFnGfNAo=PeHMkSX5B+CJ=WnoQE_Sw@mail.gmail.com>
	<ea9b12e8a04445f0a3f36f84b00ca3f420b86802.camel@linuxfoundation.org>
In-Reply-To: <ea9b12e8a04445f0a3f36f84b00ca3f420b86802.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Sep 2019 15:35:49 -0700
Message-ID: <CAMKF1sqDBx+wfrw45oEmoAtOo_t4cxYVh5-gUavpV=wnGsdZww@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] weston-init: Add possibility to run weston as non-root user
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
X-List-Received-Date: Mon, 16 Sep 2019 22:36:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 16, 2019 at 3:19 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-09-13 at 06:41 -0700, Khem Raj wrote:
> > On Fri, Sep 13, 2019 at 5:27 AM Ross Burton <ross.burton@intel.com>
> > wrote:
> > > On 11/09/2019 05:29, Khem Raj wrote:
> > > >   .../wayland/weston-init/weston.ini            | 74
> > > > +++++++++++++++++++
> > >
> > > core-image-weston now fails:
> > >
> > >    file /etc/xdg/weston/weston.ini conflicts between attempted
> > > installs
> > > of weston-init-1.0-r0.noarch and weston-conf-1.0-r0.qemux86_64
> > >
> >
> > on x86 qemu right. Sent a V4. give it a try
>
> Fails oe-selftest:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/383/steps/8/logs/step2d
>
> oe-selftest -r statetests.SStateTests.test_sstate_sametune_samesigs
>

Its expected to be machine specific now. Since we are housing
device-specific weston.ini files now see
weston-init/qemux86/weston.ini I have sent a v5 addressing this.


> Cheers,
>
> Richard
>

