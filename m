Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 02BB16EE8E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 14:50:25 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id c10so8788956igq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 06:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zXDnfOH8t+hJYVO38jV/UwpGs7QvxygKXvzFcMgPTnk=;
	b=NZtxbISao8bmzUtDZh9LAaDwBhoH9FepSEYS7yQybwCLC8NYd+yqS7R/1KyNuUYCmn
	qiLzylneNlyTYkNdGAJO7J5POYWPp+ESNol6rMpSA/zykihJjrz9l+bkuqdjnLjS853j
	FtNLTq0W9crYTF2C9oUEjzBCRRo9iZxyMYNDziqYS+UawGB41vNC/0aWTsGROOe8TQVA
	zNW0KGalFvn+q2oRsFROsbCkxmRvtwRyqopb3Z8G11a/8l2Ab3IMQpGKYbQb8PsL4iJx
	lipEzemGSFad7niQs6w4HEGuYO7uMJztxlcMNcoVTnIuyjqiRYNa/OQHhR3GO7zyJeA1
	f1+g==
X-Received: by 10.43.153.68 with SMTP id kz4mr20352116icc.29.1392130226751;
	Tue, 11 Feb 2014 06:50:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Tue, 11 Feb 2014 06:49:55 -0800 (PST)
In-Reply-To: <CAJTo0LYuEX-3iYUVcwKu_pppBN5o9bPDSwaJ870zHr1uZ_mjCg@mail.gmail.com>
References: <cover.1392089446.git.raj.khem@gmail.com>
	<5eeeedfcaec0bd520449d7926da70085eb033991.1392089446.git.raj.khem@gmail.com>
	<CAJTo0LYuEX-3iYUVcwKu_pppBN5o9bPDSwaJ870zHr1uZ_mjCg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Feb 2014 06:49:55 -0800
Message-ID: <CAMKF1srNpswQ2doGgkAeHDHnS=JuK1E4MGKqjOYRbP+TK3qSVw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Tue, 11 Feb 2014 14:50:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 11, 2014 at 2:43 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 11 February 2014 03:33, Khem Raj <raj.khem@gmail.com> wrote:
>> +PACKAGECONFIG[microhttpd] = "--enable-microhttpd,,libmicrohttpd"
>
> There isn't a disabled option here,

thats the default one can add --disable-microhttpd too

 and you don't set PACKAGECONFIG to
> enable it so in theory it's disabled by default.  Is this sufficiently
> "core" to be in oe-core?  Alternatively we could have the
> packageconfig blocks in oe-core but libmicrohttpd in meta-oe.

I am fine either way. It just makes life harder for folks who don't use meta-oe
but hopefully there are handful of them. I can resend remainder of
patch to meta-oe

>
> Ross

