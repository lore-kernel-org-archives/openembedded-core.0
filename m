Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id C17B660107
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 19:33:24 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id t75so10185643oie.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 12:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Bfylatp57vmHxbuuEv07MiAcgZ7sMCeYY70ispwvE08=;
	b=sHFo5o2QORpGxzgYqjjm54EcsFruzXIV+nRMe1Lx8zlxtehk4KC92Rlh6xahqt7HfZ
	ZdkS5SlquwDmOY6DcTsjCToe6ArGaxlWPdyl60di6ItM6yN8E23LPXvPCGUKf73XO1rw
	/tbJDLIlOqv7f7tYpNGiLiF4JpdNR5YeTofZMejrBTEL8VvJv3zKUCERN7WxkiTUHJfH
	DCjAQqDSAYNGPqtYjkmOcQaKxaQhUC44TBblP04m8XgJtWlWsdhkDw/qgx5si2lMrKwA
	zjaU+OSNhERWORBB9Ecg5Px2DVuIQwW2rO3yWAxnphX0amab4449d9gKtiYfAygW2KPA
	f0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Bfylatp57vmHxbuuEv07MiAcgZ7sMCeYY70ispwvE08=;
	b=j3sTRsACafdnwd0uugMNjLMQbDeq3/0Fts8wbZobix2AdFDvZRKqMfkTpx8fI/xnM9
	rm2P5NtmMF3xjKC+/WltWY9rIYyBqhuDYURMd4bPKnOSHiTaM6MVJwuzG4OhQbFtWX7o
	s0Wk3Sc+rAR/E+KtY4i7kyej3kbaSo0xK2x0B2bzW7w3r9tfLoVuQQ6+oEP3v9kGJIyI
	Nmzvmvh1X+PIQEqfWwUPxJvOyLktPTZSDOFShjBF014WjJ0/DXxcePDa5CUrJCdy6NaE
	QatRq1oCbmVwZL2JdY/qazlaS9o2bgkeTRmdq8/KS8BBVAZ/Lk/ADzkh0+WFg8Pky3Kk
	rCAA==
X-Gm-Message-State: AHPjjUif/4P6q0tuitoxPVih1q620zlBTr2cepXOoDLf/Mz0nQB77Say
	y1TBd8b90cxvQiFD2co=
X-Received: by 10.202.85.138 with SMTP id j132mr1519999oib.273.1504553605479; 
	Mon, 04 Sep 2017 12:33:25 -0700 (PDT)
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com.
	[209.85.218.47])
	by smtp.gmail.com with ESMTPSA id a9sm9699322oii.11.2017.09.04.12.33.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 12:33:24 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f47.google.com with SMTP id n18so10296933oig.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 12:33:24 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7yONBXLWXC4jRCMvau7wIeZOyf9EvBLLzCeduclgh3Wai8IvdNFGrqsAxtQTGIEZO96+IftuWA17g8X6OXjzQ=
X-Received: by 10.202.117.201 with SMTP id q192mr1660852oic.274.1504553603710; 
	Mon, 04 Sep 2017 12:33:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Mon, 4 Sep 2017 12:33:22 -0700 (PDT)
In-Reply-To: <CAJTo0LaUnzQ8jpgHnGw0M+HscQ=u8EY=tABLQrgvDAoyFq6WAA@mail.gmail.com>
References: <20170903192536.491-1-otavio@ossystems.com.br>
	<CAJTo0LbPBn=TmjGb6ozkVjsMdF8H+MaYF32DhZi8Evs7N=n5sA@mail.gmail.com>
	<CAP9ODKoTRR0e-7MrkN=u5rt928y=Weh2VV_wwdqBSzpV0rK7zA@mail.gmail.com>
	<CAJTo0LaUnzQ8jpgHnGw0M+HscQ=u8EY=tABLQrgvDAoyFq6WAA@mail.gmail.com>
Date: Mon, 4 Sep 2017 16:33:22 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp9hmC+K46OuxDpYMyhMjr2+M1GP9N2pzEv00oMyj7Y_g@mail.gmail.com>
Message-ID: <CAP9ODKp9hmC+K46OuxDpYMyhMjr2+M1GP9N2pzEv00oMyj7Y_g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] go-dep: Add 0.3.0 release
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
X-List-Received-Date: Mon, 04 Sep 2017 19:33:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 4, 2017 at 4:29 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 4 September 2017 at 18:46, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> On Mon, Sep 4, 2017 at 7:09 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > On 3 September 2017 at 20:25, Otavio Salvador <otavio@ossystems.com.br>
>> > wrote:
>> >>
>> >> This is the Golang dependency management tool under development; it is
>> >> ready for production use and intended to be merged onto Golang
>> >> 1.10. Until that, projects are starting to use it and making it
>> >> available on OE-Core reduces the Golang integration work for new
>> >> recipes.
>> >
>> >
>> > ERROR: go-dep-0.3.0-r0 do_package: QA Issue: go-dep: Files/directories
>> > were
>> > installed but not shipped in any package:
>> >   /usr/lib64/x86_64-poky-linux/go/bin/dep
>> > Please set FILES such that these items are packaged. Alternatively if
>> > they
>> > are unneeded, avoid installing them or delete them within do_install.
>> > go-dep: 1 installed and not shipped files. [installed-vs-shipped]
>>
>> I know and this is an issue with our Go toolchain support. It fails
>> when we are building for same architecture than our build host.
>
>
> (CCing Khem)
>
> Sounds like a serious problem.  Presumably different tooling is used to
> build go-hellworld, as that doesn't have the same problem?
>
> Do we need a bug for this?  How critical is it to fix before 2.4?

Honestly, Go support needs some love for 2.4. I am investing some
quality time reviewing what is missing when comparing to meta-golang
and there is a lot to improve.

The error is nothing obvious to me. However, I am cleaning up the
integration so we have it in better quality for the release.
Eventually, I will end fixing this error.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

