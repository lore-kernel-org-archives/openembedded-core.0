Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5EE6011F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 17:46:56 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id q21so293299294iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 09:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=S/sNsUkYXgwHb6um/uc2nMv+/x8L/Gy+Ykg6JZ9B2Jc=;
	b=rRalvqpYT+2E0lrB+ZeGjLpVO+pgxtbEqHztO611kmX2yOsimg70FjP80kGDXnhOay
	ddlBiG9/9/+BzxDCMStbk3wJ8Dy+jktcuaxmgrHgscgLn+aM4jWIjMRjDFygW/rJKipk
	eZA0WT6ra2y8s8tHHrtk7wCr8jEmtfMmHyJA8b85Sc9GyyHtIz5ToeUcwT8Vr6cXkns+
	e01R6AMiT3dmeDN7BRBKgKfmdZf7pbbGVkkpj81fh2K7GYQVRVkpz1eulWqtJrskWlAU
	+SFbiFv7k4Jeq0jxOUEfvMjHQ9+2j9Jy2bxtUSeF/7w5WWZwntbVldYgano1NynuhbNc
	N1ow==
X-Received: by 10.107.9.224 with SMTP id 93mr98231799ioj.112.1452275217744;
	Fri, 08 Jan 2016 09:46:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 8 Jan 2016 09:46:28 -0800 (PST)
In-Reply-To: <CAJTo0LZZhpUtmaKpkHf-NCtRBAt2KRx8cVoSpOQEH9eheFTP8g@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
	<CAJTo0LZZhpUtmaKpkHf-NCtRBAt2KRx8cVoSpOQEH9eheFTP8g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jan 2016 09:46:28 -0800
Message-ID: <CAMKF1srb-7voEc3EpLxEfm2EPiDBWASabV4JwAKyz27fHmnKcA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 17:46:59 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 6:12 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 January 2016 at 14:00, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> |                  int flags = FTW_DEPTH | FTW_ACTIONRETVAL;
>
>
> ftw != fts, of course.
>
> Looks like FTW_STOP etc are glibc-specific.
> https://github.com/commodo/openwrt/blob/master/package/devel/oprofile/patches/100-musl.patch
> seems reasonable, assuming it works.

Its changing the behaviour a bit. e.g. where its returning errno
instead of FTW_STOP but since its an error case, it will work most of
times.

>
> Ross

