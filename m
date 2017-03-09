Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 109907300F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 21:06:29 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id q7so78724012uaf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 13:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VNCAiEd+XLViobZDL5zjkB89pojGxF1Nm/59Q6zmIqo=;
	b=DC1NQ8WhoPUU9IIBVt645Eq74cRI/Qml8oP4JnBYweuVHVBaZrDCaqwLwmJOkLzVBf
	XOzB+jTKMl/RpbjSsIZ5N6R1AkdlF6sczl0vsYB7bU2NwAhok0t6Olyf0SJyeXQLfKWh
	2PxyVUHjy6LR7hmeEIBokDNxCIVFhSKmt25+Y8mA6evAMrYACgHm5Jy9imcbwk37lgOq
	B+aM+CH/xPaWVqxlkJ6YlXH/uZxJtTTBChDBiH8uYVl9fR8CuqeTHumKqh6xFoR/pjON
	4qQVmwTZNz/ps9j/eQ4YUS0K6MfJ4Nb/5DYrODJ8uk4Kxtn1Gaj2724ccrmCdmIbmCM5
	cS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VNCAiEd+XLViobZDL5zjkB89pojGxF1Nm/59Q6zmIqo=;
	b=VCw9oby8y/zQNoeqg3FxGXlFAzWPaBJduqLGCikMPSKeTFfVRrQ3Ua7X6q1AUb0q4W
	V/iupVMWOSdCHtSzdWmxLLH5l8fI6fmsW97HijG0dwdcuyhxcjLGC+XXQIC7Day6iEsg
	Jer0tSNsDE5vEHrLpEmoPobfa2cwKwYIqhSXKg8Dx/dW2e9ZYFaU5wjn0K/YcrGJ5iS+
	3h8QMwByaHw+PB9D7eNxMurC4XCO6et9nkFpybxdneoHxSisoBubddChklG+CnQ0rVpL
	RT9Cww7mqjxiKQo430aZrE5BLtRkZR6RtbliAGS8EICr7GI+cDIWeTle7qvN1i88gyhU
	vOBQ==
X-Gm-Message-State: AMke39lWeB+zQX9JlmLleLzm+Ru58Zt6dd5hFhbWtFIh8BI886Utt95uVUOy5MgNJ2CN2uQxvo7wpRCmUqL+Mg==
X-Received: by 10.176.69.201 with SMTP id u67mr7900439uau.101.1489093590561;
	Thu, 09 Mar 2017 13:06:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Thu, 9 Mar 2017 13:06:00 -0800 (PST)
In-Reply-To: <CAMKF1sqAw-rwkKYuEsY4QN1rA-YyQcx5hjpzux3cLk+4qxAemA@mail.gmail.com>
References: <7f8eeb62-a767-0882-dcc0-9a6882192d82@xevo.com>
	<CAMKF1sqAw-rwkKYuEsY4QN1rA-YyQcx5hjpzux3cLk+4qxAemA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Mar 2017 13:06:00 -0800
Message-ID: <CAMKF1spRq0quE-B+T5Wio_z5FmfGNkeGrE=dcd3H-KT1KNP4HQ@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang] LLVM shared library support
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
X-List-Received-Date: Thu, 09 Mar 2017 21:06:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 3, 2017 at 12:09 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Mar 3, 2017 at 11:15 AM, Martin Kelly <mkelly@xevo.com> wrote:
>> Hi,
>>
>> I noticed that meta-clang builds only static LLVM libraries, unlike the
>> meta-oe version of LLVM 3.3, which builds shared libraries. In fact, this
>> appears to be the LLVM upstream default as well.
>>
>> What is the reason for the difference? Shared versions of LLVM would be
>> useful for reducing the size of programs linked to it and making smaller
>> filesystem images.
>
> meta-clang has only provided static compiler thus far, so using shared
> or static did not matter as much in fact it could be helping with
> faster compile
> times that we see with clang. However, there is no binding to keep it static
> link. Feel free to send a pull request to change it.

I did try this and I see a considerable slowdown in compiler speed. I changed
two things at a time so may be its the other

diff --git a/recipes-devtools/clang/clang_git.bb
b/recipes-devtools/clang/clang_git.bb
index 6c6e66a..7de2be1 100644
--- a/recipes-devtools/clang/clang_git.bb
+++ b/recipes-devtools/clang/clang_git.bb
@@ -73,7 +73,8 @@ EXTRA_OECMAKE_append_class-nativesdk = "\
                -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
 "
 EXTRA_OECMAKE_append_class-target = "\
-               -DLLVM_ENABLE_PIC=False \
+               -DBUILD_SHARED_LIBS=ON \
+               -DLLVM_ENABLE_PIC=ON \
                -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
                -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
                -DLLVM_TARGETS_TO_BUILD=${@get_clang_target_arch(bb, d)} \

>
>>
>> Thanks,
>> Martin

