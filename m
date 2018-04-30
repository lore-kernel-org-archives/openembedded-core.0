Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id BF22860102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 14:17:56 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 82-v6so6403443pge.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 07:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PskzulJ53yCwIvr1jF4MvQypHFt4OK2RZB1unJm6VZA=;
	b=ilvY8bvejTBi/6XI05WtYUiILDff+gPlA+Pa+QNh8hVFXHJ1N9ureKo/WoW6fpaQ28
	ij6IskAIeramRDShuHFWZwSomgnC/DSF+INdgKs7PlTbx3q3beWLjWInTC4iXqF3BEEr
	clnr7QAFAb5+pBjPMXzGLzSk3WMSet8+pdc0MVfddtBToHPEqNm415PNu5stw4SzIoDw
	+XMDOS8sv9uw2tvsII+xta569w2QpV1+ID172ocD9t39kUIrxPd9TgUPrDvSgVspKEau
	/piCKNBLwaeYPwviWisQYnE+L57JZ9PJym9kAmLKWB2u5/2RM/MfzNh9fOQ2iWdbUg4d
	jSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PskzulJ53yCwIvr1jF4MvQypHFt4OK2RZB1unJm6VZA=;
	b=TIWxU43E9W1lAvDRa2/FYvaba3jQ1gSkdWAK02fjh7JSM1ja/DhLcvavqboQyWEfyb
	FXL5B3+wqyaUAXeaDiPsgBbeZ+uZw80x1DDGy2uPqQN850I8BDOSP5ntiRCd9rrIanEe
	pBGVZ5M80V6+moAWSI3Rd2WEK0Wrbey9D8+7kDlinHnW3H4bXyiqSbs1HjxsaGHUCTYq
	gBfGUTmWVTGw+oRhCj4E4nqPcp+sDe6XmASAVh9YSrcDQrI/iFspCqgQPL2128HuOXMr
	uf39dA5iCDDa2P9TSzPC+gJD8Z499PALhEs2Yz/gse9FZ1ztxpnTgVRehYP4+aan4VMl
	DS4Q==
X-Gm-Message-State: ALQs6tD2C27fDVMI4ZcFOtZA88/It3ujBkO8LRTIr3DGpcjK2eXMGuza
	JhuyHdoieJuOUITlZMgQbJ7sKoxMk9tRDGy35wY=
X-Google-Smtp-Source: AB8JxZqtis4Ezc9JAnx2CMeioJ18xIYPFM0Sv9B3wpTKQXFy+8uvCdNsJ1URjHR/YDTTmYPI4jQgQDdzz2Gd4kXonxs=
X-Received: by 2002:a17:902:b7ca:: with SMTP id
	v10-v6mr12567908plz.275.1525097877328; 
	Mon, 30 Apr 2018 07:17:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.182.141 with HTTP; Mon, 30 Apr 2018 07:17:26 -0700 (PDT)
In-Reply-To: <CA+chaQfD_1=ah5efH99s=hMjALHh-WMk1w=eRvbiujh5S=VgEQ@mail.gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
	<65f84677b46cae1369973753fa7a9bc732248a4c.1525029885.git.raj.khem@gmail.com>
	<CA+chaQfD_1=ah5efH99s=hMjALHh-WMk1w=eRvbiujh5S=VgEQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Apr 2018 07:17:26 -0700
Message-ID: <CAMKF1spz+g0wnVv_m6FPVj6tHb84+zw=bAc8FxFHEDuykoMG7Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/24] ruby: Upgrade to 1.5.1
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
X-List-Received-Date: Mon, 30 Apr 2018 14:17:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 30, 2018 at 6:35 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> There is typo in commit summary, it's 2.5.1 not 1.5.1
>

yes, fixed in v2

> On Sun, Apr 29, 2018 at 9:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> License Update:
>> https://github.com/ruby/ruby/commit/322d0d93adfe42fc89c574f67bcb9acb9b82f251#diff-c53151ffd180a17416e8f09b1ca4bfc3
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/ruby/ruby.inc                   | 11 +++++------
>>  .../ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb}             |  4 ++--
>>  2 files changed, 7 insertions(+), 8 deletions(-)
>>  rename meta/recipes-devtools/ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb} (90%)
>>
>> diff --git a/meta/recipes-devtools/ruby/ruby.inc
>> b/meta/recipes-devtools/ruby/ruby.inc
>> index fd3911ba75..a366e93f66 100644
>> --- a/meta/recipes-devtools/ruby/ruby.inc
>> +++ b/meta/recipes-devtools/ruby/ruby.inc
>> @@ -7,12 +7,11 @@ It is simple, straight-forward, and extensible. \
>>  HOMEPAGE = "http://www.ruby-lang.org/"
>>  SECTION = "devel/ruby"
>>  LICENSE = "Ruby | BSD | GPLv2"
>> -LIC_FILES_CHKSUM = "\
>> -    file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \
>> -    file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
>> -    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
>> -    file://LEGAL;md5=8f871f3f03732c018a5fa9b185958231 \
>> -"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \
>> +                    file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5 \
>> +                    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>> +                    file://LEGAL;md5=23a79bb4c1a40f6cc9bcb6f4e7c39799 \
>> +                    "
>>
>>  DEPENDS = "ruby-native zlib openssl tcl libyaml gdbm readline"
>>  DEPENDS_class-native = "openssl-native libyaml-native"
>> diff --git a/meta/recipes-devtools/ruby/ruby_2.5.0.bb
>> b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
>> similarity index 90%
>> rename from meta/recipes-devtools/ruby/ruby_2.5.0.bb
>> rename to meta/recipes-devtools/ruby/ruby_2.5.1.bb
>> index 1ac7f2aa5a..91048284c1 100644
>> --- a/meta/recipes-devtools/ruby/ruby_2.5.0.bb
>> +++ b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
>> @@ -5,8 +5,8 @@ SRC_URI += " \
>>             file://ruby-CVE-2017-9228.patch \
>>             "
>>
>> -SRC_URI[md5sum] = "f4711f856fe14de222b9da3d3b8efa89"
>> -SRC_URI[sha256sum] =
>> "46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab"
>> +SRC_URI[md5sum] = "23867bc8c16c55e43b14dfe0614bcfa8"
>> +SRC_URI[sha256sum] =
>> "dac81822325b79c3ba9532b048c2123357d3310b2b40024202f360251d9829b1"
>>
>>  # it's unknown to configure script, but then passed to extconf.rb
>>  # maybe it's not really needed as we're hardcoding the result with
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

