Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC1778846
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 14:45:39 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id z3so5866235uae.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 06:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bRBwJjj0pm5P28BsnG/4hUjuFITypEPDsOhZ9XPYNPg=;
	b=OJ+ejIRWuFzEnzq+w74tRdOpIfcrlAhAwVQkZEwytHSsi0V+ZlaxD1ttJW+I93xshZ
	uAbz+glm7jLBN6BNrSzxo0jjmL+oFpbG3BRw2X/RAOk+tGfylIYiYRHQw8C1CsxxexQh
	9VI81XikbV68MFYSEb+2kZBgFeE3jBVe3nNnyNlDvH60ovi3rHsz/Y1kdmVjE9VkEBNc
	0pDmVlTPzwsY6YmTUY0IrqooyO+QuJ9/Ny2778os0iPHyghou8jG6AWDRxf6XDyhgcpj
	/Pv4c/vykWNiaeE0R9LLUUOWA9hcs7NUhDgAzRxeyC4BYnIDpm2jX7pao/1G71aCU7K2
	X4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bRBwJjj0pm5P28BsnG/4hUjuFITypEPDsOhZ9XPYNPg=;
	b=mHEbQAe6RD1+suYJPw8vJTsZSDyHebku2ad4x11aINWJYXIJoajElsJ5DwrotPUurA
	JsSnjCFqBKwMZdS1FHM0H4qg+MSN12sRKzWCRXrYWyvDnxe4v62JipToGfwNHWEZ5KEg
	KqnaEr5Qzlkg0aoiwGqhQItn5N1yvjHd8TrwGCBtkFl/K2v5fhARg+oEmnRWk8EcXjhD
	b/iyIFUyx9f7NdMezUhHrzv5/pLVXmq5emg5/sSuNaqTxb/XqkdLnRJgHnvJX+xJDDlj
	gJaakl37w3mhD3jxzTRwMgK1la612sGLbugKS51ISJNteuMK6rqvwMd/78K69aCUNUBi
	qj7g==
X-Gm-Message-State: APf1xPAm/9iDz/4J84UDtAhO4Xz73R+0MDufFhHDiHcpLcIFADIW0Rl+
	RwdgRLl6ywrsTrtvT60ASeVtRBl+C02WbzsqBtI=
X-Google-Smtp-Source: AG47ELsYtwFQNV2dgzIBnzekx4RzSp+C6+pc4rGVT8rsIVIeDkIgcQCzXqVU+LpiRuP1o8K5oJGDTw0SgRWQFBuj2JU=
X-Received: by 10.176.20.49 with SMTP id b46mr806993uae.28.1519397140636; Fri,
	23 Feb 2018 06:45:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.33.201 with HTTP; Fri, 23 Feb 2018 06:45:10 -0800 (PST)
In-Reply-To: <CAJTo0LZ8ycUQ_SYb3gWYhirHC1nv3MVJsmnas=7a30m3Jp1vPA@mail.gmail.com>
References: <cover.1517524576.git.raj.khem@gmail.com>
	<aa96375d5517a1f0170609aac7283bd71566f46a.1517524576.git.raj.khem@gmail.com>
	<CAJTo0Lax4NpwLPN2Ly_9seKFLYp-qCVJCuyzXhtN6aiXKgVKRg@mail.gmail.com>
	<CAMKF1sp8riyhF=6N_ak-TyZ6_w=aj+az=qx+mjepXPQagV7vqw@mail.gmail.com>
	<CAJTo0LYEO1e2i_dnXDT7sNRyScH_KT3Ge38yWundnr2hk3de9g@mail.gmail.com>
	<089d4714-011d-5cca-5af6-8f7a8e3568c4@gmail.com>
	<CAMKF1spdL49Ny-yqk+n-k0JSU8PGVQyv43MgpZU_fOwVc1Fr4A@mail.gmail.com>
	<CAJTo0LZ8ycUQ_SYb3gWYhirHC1nv3MVJsmnas=7a30m3Jp1vPA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Feb 2018 06:45:10 -0800
Message-ID: <CAMKF1so1HXcc9gTaZuOBCBQ+DPNNqtQqQEoOocb839nP8wLBjA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Fri, 23 Feb 2018 14:45:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 23, 2018 at 4:29 AM, Burton, Ross <ross.burton@intel.com> wrote:
> I've made it work!  See the patches in poky-contrib:ross/glibc, although I'm
> cleaning them up now.
>


LOCALE_UTF8_IS_DEFAULT setting is in conf/distro/include/default-distrovars.inc

> Ross
>
> On 23 February 2018 at 03:06, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> glibc community thinks that the way we are depending upon old
>> localedata while using newer
>> glibc in nativesdk is not a supported usecase, and there is no
>> guarantees of internal data structures changes between major releases,
>> like what we are facing here. The suggestion is
>> to ship own localedata instead of relying on SDK host. You can follow
>> the discussion on glibc
>> thread I added in previous email and if have some suggestions or
>> inputs feel free.
>>
>> I will try to come up with a patch along with this upgrade to add
>> nativesdk locale along and
>> check if this fixes the issue we have
>>
>> On Sat, Feb 17, 2018 at 11:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > Wanted to send update on this issue
>> >
>> > I got to bottom of this issue and Ross you should have known it :)
>> >
>> > https://patchwork.openembedded.org/patch/127105/
>> >
>> > introduced an optimization into nativesdk glibc to let it ride on
>> > localedate
>> > from SDK host. This has now broken in glibc with
>> >
>> >
>> > https://github.com/kraj/glibc/commit/95cb863a1ef7760a11272bbd7ba5fe62dc41be54
>> >
>> > it is recommended for static programs to be relinked if using glibc 2.27
>> > our case is also similar mismatch of libc version and localedata just in
>> > opposite direction where we are trying to read old data with new glibc
>> > instead.
>> >
>> > I have initiated a discussion within glibc community on it to explore
>> > what
>> > options we have, but be prepared to ship full localedata in worst case
>> > with
>> > glibc 2.27,  this might be the worst case option if no alternative is
>> > found.
>> >
>> > Thank you
>> > -Khem
>> >
>> > On 2/15/18 4:12 AM, Burton, Ross wrote:
>> >>
>> >> Yes, that's it.
>> >>
>> >> Ross
>> >>
>> >> On 12 February 2018 at 07:32, Khem Raj <raj.khem@gmail.com
>> >> <mailto:raj.khem@gmail.com>> wrote:
>> >>
>> >>     On Sat, Feb 3, 2018 at 2:21 AM, Burton, Ross <ross.burton@intel.com
>> >>     <mailto:ross.burton@intel.com>> wrote:
>> >>     > Getting there: https://autobuilder.yocto.io/tgrid
>> >> <https://autobuilder.yocto.io/tgrid>
>> >>     >
>> >>     > Just two actual problems:
>> >>     > - The non-gplv3 build failed as the make fix needs to be
>> >> backported
>> >> to
>> >>     > meta-gplv2
>> >>     > - The eSDK selftests all failed with en_US.UTF-8 problems, the
>> >> new
>> >> glibc
>> >>     > shouldn't be causing a problem with uninative so this is
>> >> interesting, maybe
>> >>     > the new one is behaving slightly differently.  Should be easy to
>> >> replicate.
>> >>     > The same problem caused selftest to fail.
>> >>     >
>> >>
>> >>     is the UTF error like this one
>> >>     https://gist.github.com/25a84d23618824f0e5e6857a960eaca4
>> >>     <https://gist.github.com/25a84d23618824f0e5e6857a960eaca4>
>> >>
>> >>      > Ross
>> >>
>> >>
>> >
>
>

