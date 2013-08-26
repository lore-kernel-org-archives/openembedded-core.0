Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id D9E146008D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 22:03:19 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id ev20so2823725lab.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2YvEm9Z1I6abSo++iie7EWBMfyGtAakB4K4l7vKkGCs=;
	b=x/qKIj+/2a2sIitBHP1Ifhuk1ZhlEp7Z4V7eIh0OBy+b5wHgsYyFUqTMcwDVz39jj8
	PgdVlY5WC4YEo+LdHnwGzy8LKocYSg1LR7a/51FNyzeLtBGWbhikYnYO2joweDfPS0ev
	eLcs8OgxrPGVPXwU5L+91PpCjqxjPO05g8TpjltufMyBJ31PpFUCsmQkByD6rgAeyPyk
	Fvw0MTodLjTHpHzmLKoYzO6Z1P2j330fzCvQPBtZeq4TF4CZJzUJ0c4plS7A+ABC9Ffo
	lrVuTR/tVj8KPxlmP1ezTfaPAamjcs1SZ3VGcOdg0gYaVe3BrtzJXp9CJ+ln08nmSrcY
	HkHQ==
MIME-Version: 1.0
X-Received: by 10.152.26.72 with SMTP id j8mr15648415lag.19.1377554599985;
	Mon, 26 Aug 2013 15:03:19 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Mon, 26 Aug 2013 15:03:19 -0700 (PDT)
In-Reply-To: <521BCD34.8090003@pabigot.com>
References: <1377251290-4290-1-git-send-email-lpapp@kde.org>
	<CAOMwXhNWFicCJ1C4-Cd+9shAhTGuXkFu+885R8NfMurEZ+6rCQ@mail.gmail.com>
	<521B9698.7030803@linux.intel.com> <521BCD34.8090003@pabigot.com>
Date: Mon, 26 Aug 2013 18:03:19 -0400
Message-ID: <CADkTA4Oaoodzq5525nBXfNnMziM2y8068vj9JGt4v9UJkbSvAg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Mon, 26 Aug 2013 22:03:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 26, 2013 at 5:48 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> I can confirm this also works with the Gumstix Overo in a layer bbappend
> that used SRC_URI_append_overo for additional patches.  Thanks to you both
> for getting it merged.
>
> I did come up with a question, though.  The recipe uses:
>
>   PV = "v2013.07+git${SRCPV}"
>
> which creates an informative but ugly ${BPN}.  I'd like to use something
> like:
>
>   FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
>
> in the bbappend to simplify updates, but I don't want to have a directory
> named u-boot-v2013.07+gitAUTOINC+62c175fbb8.  For linux-yocto, this is
> solved through introduction of ${LINUX_VERSION} allowing
> ${PN}-${LINUX_VERSION}.
>
> Is there reason to create a parallel UBOOT_VERSION?
>
> Is there reason to have some way to access the default ${PV} inferred from
> the recipe name before the base recipe overrode it? (Is there already some
> way to get that value?)
>
> Is there a better approach than bbappend-in-layer that I should use for
> adding patches required for a specific u-boot machine?

That's the right approach. Only when complexity warrants is it worth
the effort to maintain
a targeted git tree that manages changes via branches. So until the
directories full of patches
and conflicting features collapse on themselves, go with SRC_URIs and bbappends.

Cheers,

Bruce

>
> Peter
>
>
> On 08/26/2013 12:55 PM, Saul Wold wrote:
>>
>> On 08/23/2013 09:57 AM, Laszlo Papp wrote:
>>>
>>> Any update? It would be nice not to miss the freeze ... ;-)
>>>
>> This has been merged, and I was informed by the QA team that it works
>> correctly for the mpc8315e-rdb and beagleboard, but NOT the beagleboard XM.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

