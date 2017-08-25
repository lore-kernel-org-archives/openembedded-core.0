Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 73A9178493
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 22:43:13 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id a7so1500880pgn.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 15:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uZBOfXJZo3pU2MzgwJxMl+dXf9qUynAErJ31B0IJcjc=;
	b=oVs/8gQGi5wvdyFexmQQxJbVN7/pbUSqfTLZwdrcRXyaF+Ix/3FS5P4yamGz+FM19B
	a3bN/a8UOQuMAoQYbt2vM3QnA6+SzR4YVLQ7tYmJAKNJvNCaPvkzN87Me+iRkAtEfUqE
	t1YCHkm/038LpTkoBWWvTMzbvSyCrefmF3IZbupBUJWkFBurlcwgQTFKxKl8Uz0eZga5
	ZdshuIR1o+leKoVvId5a7r/rYAobybGK6oP3Je0FgxKdTK65bPio10mX/Uqy8SuG6/a+
	gMxdlv6p0c5UW3dWdfHzUyGkvQ2qGC+oTYjOYAnFQdRjXrwBraFYTOm0isXYaxbJIypr
	jCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uZBOfXJZo3pU2MzgwJxMl+dXf9qUynAErJ31B0IJcjc=;
	b=eU8zZhYM6paCjt2PPHfE/MBHFIACVpg3i1oZuSaS0JtfI7Lmy63sskKIfI/TLCBzKQ
	82hbR5krBAr5sCPacVi9PKEywj68VCRAdWVr8BnlSdFvtMnA7ThJz7I6fEx+T+RM8imD
	2NhfZIbGSzCy3e+NSaEpgQNtyh2pvjI/r2JwI894jfGKVGh6Vu/nAFv6DPTy4AlvfwuB
	d/15lNTv+GPHF0rgX+BXJIMTwGn0mzYnE+h0l92DAcvc5oJyBO6L5eh+XMhX6LZHDrh1
	JQ+aydB0Ar5NL1vawtTYMyXhaywOeeeoXMWVx03kfZFT/AKjrOYVQFD6QuHnbfreiNlw
	iNGA==
X-Gm-Message-State: AHYfb5i4wVyXACtDJgw1zYozqsDlLGJsacNqXP6SCqLHtfC7ZqTswAwU
	5eWgj8eFCi76U25QWntpnaq4aNdW0w==
X-Received: by 10.84.133.14 with SMTP id 14mr6495plf.440.1503700994598; Fri,
	25 Aug 2017 15:43:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 25 Aug 2017 15:42:44 -0700 (PDT)
In-Reply-To: <CA+chaQcvg_rktq4iOazbzJzWGa6m6EdDA=RM-x8yg=4_aMtqyg@mail.gmail.com>
References: <20170824053753.36121-1-jose.alarcon@ge.com>
	<CAJ86T=Uip8WChxD_q_jWxCPPmUqw87yJLyn5F29ztbJfMpVMOQ@mail.gmail.com>
	<17938e56-c1d0-5316-0263-b954006f9015@ge.com>
	<CAJ86T=VczP+UyDTzRb8zcRreNVp7Ez43cfDquh2ysKy_fqGnFw@mail.gmail.com>
	<1a320d13-7d4a-7412-5377-e64a728afdfc@windriver.com>
	<CA+chaQcvg_rktq4iOazbzJzWGa6m6EdDA=RM-x8yg=4_aMtqyg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Aug 2017 15:42:44 -0700
Message-ID: <CAMKF1sos=AR9916RZgoDMjNYTrOyo8uka6cKfPB2wLujjg3n5Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: EXT: Re: [PATCH] libinput: remove obsolete touchpad patch
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
X-List-Received-Date: Fri, 25 Aug 2017 22:43:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 25, 2017 at 11:59 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Does the patch cause any harm when used on newer kernel?
>
> If so shouldn't the patch be fixed to work correctly even with newer kernel?
>
> Or what's the main reason to remove it?
>
> On Fri, Aug 25, 2017 at 8:55 PM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
>>
>> On 8/25/17 1:48 PM, Andre McCurdy wrote:
>> > On Fri, Aug 25, 2017 at 12:09 AM, Jose Alarcon <jose.alarcon@ge.com>
>> > wrote:
>> >> On 24.08.2017 20:45, Andre McCurdy wrote:
>> >>> On Wed, Aug 23, 2017 at 10:37 PM, Jose Alarcon <jose.alarcon@ge.com>
>> >>> wrote:
>> >>>> This patch was a temporal workaround needed with 4.1 kernels.
>> >>>> Remove it.
>> >>> OLDEST_KERNEL is still set to 3.2.0
>> >>>
>> >>> How can you be sure nobody is using 4.1 ?
>> >>
>> >> That's a good point!
>> >>
>> >> I didn't know about this variable. I believe we should not integrate
>> >> this change.
>> >> I will resend it once OLDEST_KERNEL is set to 4.2 or bigger.
>> >
>> > The original patch has been merged to master so a second patch will be
>> > needed to revert it.
>> >
>>
>> It may make sense to selectively apply the patch based on what
>> OLDEST_KERNEL is
>> set to.
>>
>> This way if a user or distribution sets a newer 'OLDEST_KERNEL', that item
>> can
>> be removed automatically.

OE-core minimal kernel has been bumped to 4.4
so at this point I think its fine to remove it since there
is no reliable way for OE-Core to test out validity of
this patch

