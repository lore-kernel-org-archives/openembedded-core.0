Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 45AD175265
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 00:12:34 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id s187-v6so9244971vke.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 17:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XVHspoKvxMvg1lVyPbwGj8VJarjxEE2QhO/1WLYfg78=;
	b=qGtK8J+ry2S7h+K7L+IjZZZdIk8cw9Fl07cwXXnYWxY4cjt9NwTFJOJgeUYCjmNaCG
	bnNmDvSgylv0gYyWVwL17Skfl9uUKA40d0wUT7p8sjTXItLP12hw2ocQfVhOhpypu43q
	aaM47BQ5pTfB6LWFwvohE18s664m1YvldKKpyOlANhmzzbraqMZAA8ounhG9DBaiItHg
	86Jburg6OQdxjCmPSIWPpqvlkmydW9X/HXnvH96nd4eblLjjR8mkrmpT7bWknpvWQ04d
	bmn5jEyDKbNlbF0W6PjmUlQHFJ+Tch6asWizM8qA8t23OQN3iLRHAQVLbMApQYh638IP
	UGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XVHspoKvxMvg1lVyPbwGj8VJarjxEE2QhO/1WLYfg78=;
	b=bijkx5h6Bg2k8ciV2+mCTSwertE9778YeJb7NB2I36Y7s2eynhFXODW0q5tE7mgndf
	bfQB2TFNFQlgzylTS3FD+gQSuuZnOMz3NaL9jhGQs+PBtno3J8Z82JNieATKk3Szh9Fn
	RY/SiChxlLyKhn52IwCs9ybQ2cTIbbPTKqhavI9GCxNYvuzuCT0PL+vjU5rR2yi79dQY
	IAx8ek7a/tTSgNZjUvwMOA/EkQmM/NctYHpp0nfXcIgTa7YmH/hLRFP73jisLp3ChG/W
	jXVUIfH0nTMKYQJ812jXSO8vBAtI7svxKFEvwTM1cvpKvAK/nzj8zoMil17HSMEwjkff
	hX2w==
X-Gm-Message-State: APt69E3rEynqWfC7ilXkYTHDKmzVI4Vae7MwSrlrkdTijJhsPTVb+Clq
	gcclFCzFNWEqLpvWLqK3knSrYrFunbONK0AxVRE=
X-Google-Smtp-Source: ADUXVKKIglQHA4m5g6Tods4+2KtD31eHcs//rZLXylHofa0Upzodn6hqL01cHan1BAfDPtpPuNVl34jYg6+Kt/eKTZE=
X-Received: by 2002:a1f:142:: with SMTP id 63-v6mr5119386vkb.2.1528503155115; 
	Fri, 08 Jun 2018 17:12:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 17:12:34 -0700 (PDT)
In-Reply-To: <CAMKF1sp2axHTjq5JvcwmbzPcZi=nvDuSMhL+xQHCQ=3vAEhk+Q@mail.gmail.com>
References: <cover.1528442551.git.raj.khem@gmail.com>
	<5cd02eb482d16a30056d860dc3ef24b365eedc88.1528442551.git.raj.khem@gmail.com>
	<CACS+7ZSGxyfMhN0SRti8m1h9t1n_HCGfQC1-myiFj+UnkjAGbA@mail.gmail.com>
	<ca098509-8af1-4fa8-f037-ba4f93142998@gmail.com>
	<CAJTo0LYopp=23x3FUduKLWm8mnh4_BiDsk=RLc=ucc_4cS4Ftw@mail.gmail.com>
	<CAMKF1sp2axHTjq5JvcwmbzPcZi=nvDuSMhL+xQHCQ=3vAEhk+Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 8 Jun 2018 17:12:34 -0700
Message-ID: <CAJ86T=USTdxArSKkayo+Fn+qRZkfaTeQC21SRjhauqw9=M0ENw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] tcmode-default: Switch to gcc 8.0
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
X-List-Received-Date: Sat, 09 Jun 2018 00:12:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 8, 2018 at 4:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Ok, thanks.
> On Fri, Jun 8, 2018 at 3:42 PM Burton, Ross <ross.burton@intel.com> wrote:
>> I've already tweaked this in my branch to be 8.* (as there's a
>> wildcard), so don't bother changing it unless you need to send further
>> changes.

Doesn't it need to be tweaked in master-next rather than ross/gcc8 ?

>> Ross
>>
>> On 8 June 2018 at 23:28, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> >
>> > On 6/8/18 3:26 PM, Dan McGregor wrote:
>> >>
>> >> Should the subject read switch to gcc 8.1?
>> >
>> >
>> > right or better just gcc 8,
>> > Richard do you want a new rev ?
>> >>
>> >>
>> >> On Fri, 8 Jun 2018, 01:29 Khem Raj, <raj.khem@gmail.com
>> >> <mailto:raj.khem@gmail.com>> wrote:
>> >>
>> >>     Signed-off-by: Khem Raj <raj.khem@gmail.com
>> >> <mailto:raj.khem@gmail.com>>
>> >>     ---
>> >>       meta/conf/distro/include/tcmode-default.inc | 2 +-
>> >>       1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >>     diff --git a/meta/conf/distro/include/tcmode-default.inc
>> >>     b/meta/conf/distro/include/tcmode-default.inc
>> >>     index 8e15f694d0..cb17061706 100644
>> >>     --- a/meta/conf/distro/include/tcmode-default.inc
>> >>     +++ b/meta/conf/distro/include/tcmode-default.inc
>> >>     @@ -22,7 +22,7 @@
>> >>     PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =
>> >>     "${TCLIBC}-initial"
>> >>       PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?=
>> >>     "nativesdk-glibc-initial"
>> >>       PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>> >>
>> >>     -GCCVERSION ?= "7.%"
>> >>     +GCCVERSION ?= "8.%"
>> >>       SDKGCCVERSION ?= "${GCCVERSION}"
>> >>       BINUVERSION ?= "2.30%"
>> >>       GDBVERSION ?= "8.1%"
>> >>     --     2.17.1
>> >>
>> >>     --     _______________________________________________
>> >>     Openembedded-core mailing list
>> >>     Openembedded-core@lists.openembedded.org
>> >>     <mailto:Openembedded-core@lists.openembedded.org>
>> >>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >>
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

