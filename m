Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id F0CA5748D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 13:32:48 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id bi12-v6so429030plb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 06:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8RC7L+H7aMmw5fnbNpaRrsMCGRe4VYBaJO1WbCmwS5w=;
	b=gWTlagOYg7WBVeQljvGV7RJZD0+8P3q5jDtBzxkIxMBv4nDAjkMQgY7fetlLo4T7OR
	7e36ZpKHOszO2K26PlIujo939lgLDpaAoYYRRZndr0ZxsuPsutvWqLq1TrqQnFhc0MSS
	MbkYHrDtCS0MD3YVUDlZJreVfSxi4OhDKz3nIUtYYnQRSyOKipdiV1Jk20LDZoOSBq+h
	DysM9s1mvy4a7cqX6pVLnTyrrESm/WFFEXaA7n6ZKfhYCPp2+HSIhsZB8TrdbJXTf5+H
	7gctSdvIic4WtMQNd1DB+tRGxNEBErvAOYjsUTZy5zF9HjJEdsJZHYRm3nfCKCzSP7zG
	r1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8RC7L+H7aMmw5fnbNpaRrsMCGRe4VYBaJO1WbCmwS5w=;
	b=B3k3v1wMHRd/oLmR4P7mCYvRMEfpwnvWj5PFwluPGIMFY+qNPz8EwQrRXMbd7fJFvG
	PqyXyrpFHMnzJEKqPwwqAxajOOwN+1+2mF75GvjiyftR1zw5xI0xIfHXrwUG28y1HXlO
	EveZEjuPGRPIFmEA+dXeCEQRlZf31PslCi6Zb74Ng2AQqxP4E75P4jAPgMjmtzNTrDno
	ybOC6iizK43sKUaNiiuAM366yeffArfTyaFbVyahzTtoSypCTshhM3Dmt3t/EDavi2tg
	pKe6JcFUGbFSs4SFbH/kWII3M7vVs3Ye1DW3D+pHrixN3ZbCn5NLir2N7W8vzwjU6OLo
	CBAg==
X-Gm-Message-State: ALKqPwcesMtQRruSWqUtxxBuMke+zXfplcH/fOAfxQkW701vm34bNYCZ
	EqoBXxoTDyf5a98alk0uGWHKR/n3u6egEAmB1cg=
X-Google-Smtp-Source: AB8JxZpIqzwY7DhDMCaW1Pm83W82BH5Ck5FM1Q3Ev5EUeiDyroCI65CYZa6UC7jnv6cIbZ3BnASki0mLeUkM5D6nxdo=
X-Received: by 2002:a17:902:59ce:: with SMTP id
	d14-v6mr982748plj.253.1526477569573; 
	Wed, 16 May 2018 06:32:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Wed, 16 May 2018 06:32:19
	-0700 (PDT)
In-Reply-To: <CAJTo0LZL0Fs7i-+tm2KVw7htYkgFJFpYfEkCq1=Dda_0n9rpYQ@mail.gmail.com>
References: <cover.1526452205.git.raj.khem@gmail.com>
	<13936651721b14a74b51c673c35c2b514299ca6c.1526452205.git.raj.khem@gmail.com>
	<CAJTo0LZL0Fs7i-+tm2KVw7htYkgFJFpYfEkCq1=Dda_0n9rpYQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2018 06:32:19 -0700
Message-ID: <CAMKF1spJ-jTxMw4c65mqwH18P=CvLrJzA7Crcizfbr-pEM58Kw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] musl: Make dev package rdep on staticdev
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
X-List-Received-Date: Wed, 16 May 2018 13:32:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 16, 2018 at 4:09 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Surely if you want to support static linking in the SDK, you just need
> to add staticdev-pkgs to the SDKIMAGE_FEATURES?
>

In some usecase, compiler runtime and c library is only required everything
else is external. Adding whole staticdev bundle would conflict with that

> Ross
>
> On 16 May 2018 at 07:32, Khem Raj <raj.khem@gmail.com> wrote:
>> This is needed for enabling static linking with SDK
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-core/musl/musl_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
>> index a0a098f5b4..d7d201df9d 100644
>> --- a/meta/recipes-core/musl/musl_git.bb
>> +++ b/meta/recipes-core/musl/musl_git.bb
>> @@ -66,7 +66,7 @@ do_install() {
>>         done
>>  }
>>
>> -RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
>> +RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev ${PN}-staticdev"
>>  RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
>>  RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
>>
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

