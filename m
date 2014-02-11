Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF1C6E8FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 15:29:40 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id f11so11801108qae.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 07:29:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=M54ITzUAAjjgQeTQcRToEn84bggKyqDJS4q5tOaoQjQ=;
	b=cSA4F6dj34rw93xNg+Upn6cNXP8otaRYJKuhJyaiPRYYIUcpOt3nHtM8KvrEgrf++O
	29pWuIdahstBusRzQ+ZvWmeHlRqZW7mlW2krJRAq2atzHhLwOnJIx/VxkWqlErWE1+vm
	MK4wzv/soZ7povhZqhkzOColVZQgnxSrU6+cz1RK668f7evfffF9J1aZWhLYJr01i6ES
	wONwwIC5gNA8MzIBb1QPLDduhX8UkhryE2rbKTMovUCZSseZPvCDGmey2eXIXT4OJZJo
	b8PVNCGlCQDkUBYymMiXWF4tWQ9nAh3EWddILkHzdhsBksYJaVWAdu+aK36HeXIb5oGo
	SdoQ==
X-Gm-Message-State: ALoCoQnIv6ac84MH4BkRp1Uj134h5RSov0W6EcQQwG8n2ksYZgL4XhLy16LRsocIIYREAp9sI3rm
X-Received: by 10.140.106.225 with SMTP id e88mr54540733qgf.66.1392132580907; 
	Tue, 11 Feb 2014 07:29:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Tue, 11 Feb 2014 07:29:20 -0800 (PST)
In-Reply-To: <CAMKF1so-_a8437RrW9FYbENVys5D6Qv8dxd1kNDF9TzZ0OKyng@mail.gmail.com>
References: <cover.1392089446.git.raj.khem@gmail.com>
	<5eeeedfcaec0bd520449d7926da70085eb033991.1392089446.git.raj.khem@gmail.com>
	<CAJTo0LYuEX-3iYUVcwKu_pppBN5o9bPDSwaJ870zHr1uZ_mjCg@mail.gmail.com>
	<CAMKF1srNpswQ2doGgkAeHDHnS=JuK1E4MGKqjOYRbP+TK3qSVw@mail.gmail.com>
	<CAJTo0LaD4=NZTeLRKD=pOfi5sqGBVacKA-ObWmXkT0JbT2=Xwg@mail.gmail.com>
	<CAMKF1so-_a8437RrW9FYbENVys5D6Qv8dxd1kNDF9TzZ0OKyng@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Feb 2014 15:29:20 +0000
Message-ID: <CAJTo0LaB9HsxiYxRH3yA=f1pa5Xtp+EW2ofgwGHH3Uok-35v_Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemd: Enable building microhttpd
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
X-List-Received-Date: Tue, 11 Feb 2014 15:29:40 -0000
Content-Type: text/plain; charset=UTF-8

On 11 February 2014 15:07, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Feb 11, 2014 at 7:04 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> thats the default one can add --disable-microhttpd too
>>
>> Please add it for clarity.
>
> Do you suggest to add it to configure cmdline or in comments

I meant this:

+PACKAGECONFIG[microhttpd] =
"--enable-microhttpd,--disable-microhttpd,libmicrohttpd"

Clear to the person reading the .bb, and if systemd changes the
behaviour when the option isn't specified (to enable, or automatically
detect) then our build doesn't change.

Ross

