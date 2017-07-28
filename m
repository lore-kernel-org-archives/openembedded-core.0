Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B264E7847B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 11:27:41 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t138so8190919wmt.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 04:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9Sd3twHy2XWdPKop1H834vxZrmH/fKkVp6GMpCnfEsg=;
	b=mjE/EAJWmOHU30aMuXb6mQOHLzQhdWKZyRrnYUTvBAZA18NAVck7v/b/rRiGUNrHcS
	e0y7nmp17NciF879NcszrsWTJflRUX+nAgnK3dnGsXeBXYnAJ+IDXqb9KZHnRGilWdwV
	Bl/+BGlDOVIa2UAy5dJ5ib5y66LFfEHaZNOkbUfykBuYvYzZ/MZiOONKUZ0VCP6EY4CR
	Bs6scznuntk7shhUrNKi/3K4ojsFHSnih5V6I2DpMdvFNZds+eFgvo0VTmXQOMO2HaPP
	BXSlm9FU5lNkWkakEKnsiTqYEJX9ulmyyYGWaq3y/V6upVLyrgZlyGK+YeLngWgyFRY0
	Kjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9Sd3twHy2XWdPKop1H834vxZrmH/fKkVp6GMpCnfEsg=;
	b=crYGr5Gc6W/kzHhTxgZCTyh0/e5+rkk70zByvJI4wiXGVKZYySUOpDdq/irzp6idf1
	vhKBbngcrbgVR/jnqSegs0yy82Lnk1V2OkwbeY8jmee+BExvwDJwRi8XkVk23puSYrNX
	WkOSb8NYABbo8WbwLCrormaG8FaCdTUILC4B3R5c5XL4PvN1H24ltHhCPIso51bWX3f9
	4Lg0H/5ZibiAgC5XjWPejnbNqk2qOIxIc5p4HJyfcWfP12MOfoMpcV9xWWQwLCa8isQl
	I9NRAD9qrgh6mDyGzFjsA9QDDyJq0xX5NxtlicdklDEJonnMcewgFQQ0uwfGy6LPR6Kg
	vmkA==
X-Gm-Message-State: AIVw113hIf8QSgLhZqUSob9XGQmuQOo+jWohqVVDp+XoU/3XqQ+rNOom
	3qeX0BFtor1dMHI+13R0mpWtS38EDQ==
X-Received: by 10.80.145.38 with SMTP id e35mr6692049eda.8.1501241262290; Fri,
	28 Jul 2017 04:27:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Fri, 28 Jul 2017 04:27:11 -0700 (PDT)
In-Reply-To: <CAJ86T=Utv6Lo-6u40ZODR-1jQfsDSC61BYrULA4ouNaBbCqZAQ@mail.gmail.com>
References: <cover.1501217624.git.raj.khem@gmail.com>
	<e178ab56ae1af5a5b840e933c74f8a10a4e3c794.1501217624.git.raj.khem@gmail.com>
	<CAJ86T=Utv6Lo-6u40ZODR-1jQfsDSC61BYrULA4ouNaBbCqZAQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2017 04:27:11 -0700
Message-ID: <CAMKF1sqo725FrF4FobWsKKp6B0fhp79FD9kdcpxSDgx_5Oui3g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ninja: Add recipe
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
X-List-Received-Date: Fri, 28 Jul 2017 11:27:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 28, 2017 at 12:04 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Jul 27, 2017 at 9:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> llvm is using it, therefore move it from meta-oe
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/ninja/ninja_1.7.2.bb | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>  create mode 100644 meta/recipes-devtools/ninja/ninja_1.7.2.bb
>>
>> diff --git a/meta/recipes-devtools/ninja/ninja_1.7.2.bb b/meta/recipes-devtools/ninja/ninja_1.7.2.bb
>> new file mode 100644
>> index 0000000000..20dca2f0af
>> --- /dev/null
>> +++ b/meta/recipes-devtools/ninja/ninja_1.7.2.bb
>> @@ -0,0 +1,29 @@
>> +SUMMARY = "Ninja is a small build system with a focus on speed."
>> +HOMEPAGE = "http://martine.github.com/ninja/"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
>> +
>> +DEPENDS = "re2c-native ninja-native"
>
> Should the re2c recipe also be moved to oe-core?

yes indeed

>
>> +SRCREV = "717b7b4a31db6027207588c0fb89c3ead384747b"
>> +
>> +SRC_URI = "git://github.com/martine/ninja.git;branch=release"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_configure[noexec] = "1"
>> +
>> +do_compile_class-native() {
>> +       ./configure.py --bootstrap
>> +}
>> +
>> +do_compile() {
>> +       ./configure.py
>> +       ninja
>> +}
>> +
>> +do_install() {
>> +       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
>> +}
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.13.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

