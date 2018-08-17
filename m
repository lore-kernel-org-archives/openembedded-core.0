Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8E979362
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 21:47:15 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id o82-v6so3870722vko.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4NFapC+RtOx174Dm0MACU84krK/Y3Z5RrsqyDaveDE8=;
	b=M1UrZTISxoTG/aPckNndK1rQdJ+/z8UhvNVfU3wvEkjxFBkcR2bdNAHghEWM38BYjo
	ADseUvYOYAwxODXeGkQ+yGs6mtsgKGfbnfmlX0le/PHylzEFtFaU7ww9HDhlcQMx3Bfa
	TUARz3SSSlSoMzTRSVeliapzRjmzn9Vo4HGb0aW4zL+JdbNIuo5o0qJSqL6qGQCLAUbL
	g1u9l14uvlzkYCFr8B8q0A1Cn6W3q2lzcSidxjCEkzAjJbQ3qtIcS5bETpfybetEMz39
	lA60++/i204QJlnVHIfX7oW8JC897yxjJUMZ394FEdEp9ODQ7tNpJBMX/9MpmoB+BmN/
	2ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4NFapC+RtOx174Dm0MACU84krK/Y3Z5RrsqyDaveDE8=;
	b=Jol879Zlwt7YodkNciFSE1MEZMtrQ21xlJZaurs92vSMeot3fg9duT7Rf9FVayB2ti
	+9zh7HUkP7XaypmROHjnynIlmKRxGz8Pj0jMg2sESFf9b76806weuruboRe2Ectf2LA4
	L/SDKk7kSYpo6ysJJL38aI5Ospj3bufQXfJGHS+xNHnzHBfy1kw4QAAppGQ/HhTqoZBj
	2pcjqsykfSWwnTl4PLaVgKWGtBZCgIA5Su+HbJoY2AQVFa0TC7bKtZOJtrDG/49ewceU
	nu7cAVYQyGc7a2XsvBSPOU8EN/eeEcQWUlCsaobrmpn1Xw+rmOLokWEb4Rroph9wuxlY
	uHYA==
X-Gm-Message-State: AOUpUlHCV5GgJiTCR02TUXs//eahjxYn/8pnr5YsgP+KNsf+bBJNbpBw
	JxDxDGauz34guhMAz2pXJ9Idjhu3/+BDTnPA8+Y=
X-Google-Smtp-Source: AA+uWPx1PPgJ6+ZukBg3qfMbjZkmsvHMlmJGS+i2YPk4DUrEhrhTqUl8sy0KfaNNiB71jpGUwyi3MxlG+pvWVEawUZY=
X-Received: by 2002:a1f:d844:: with SMTP id
	p65-v6mr24335026vkg.54.1534542436294; 
	Fri, 17 Aug 2018 14:47:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Fri, 17 Aug 2018 14:47:15 -0700 (PDT)
In-Reply-To: <d4b82bdbcbf9b984482f49ec0230646d45898270.camel@linuxfoundation.org>
References: <1534453421-28943-1-git-send-email-bruce.ashfield@windriver.com>
	<CADkTA4OrPcXQEZ+d1HEeNZBrJy_VcyJcv_7DmhnBddmLQPVYZg@mail.gmail.com>
	<3927163d00059d0559412175c903ba60ce383dcd.camel@linuxfoundation.org>
	<e8e403ab1cd0a3e4a5754d4d4079508946da0c3f.camel@linuxfoundation.org>
	<CAJ86T=Xx=QwjS9ZpYyY78E_3sqd=_3JmncJJx6WpufoNQiwseg@mail.gmail.com>
	<d4b82bdbcbf9b984482f49ec0230646d45898270.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 17 Aug 2018 14:47:15 -0700
Message-ID: <CAJ86T=XUR0xK-3M=yAB+P7xyVE0Ui7pmyDRm1SUr7Q86dZ=8rA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Fri, 17 Aug 2018 21:47:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 17, 2018 at 2:14 PM,  <richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2018-08-17 at 12:46 -0700, Andre McCurdy wrote:
>> On Thu, Aug 16, 2018 at 10:53 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Thu, 2018-08-16 at 22:44 +0100, richard.purdie@linuxfoundation.o
>> > rg
>> > wrote:
>> > > On Thu, 2018-08-16 at 17:08 -0400, Bruce Ashfield wrote:
>> > > > I'm getting a strange install issue with x86 that I've never
>> > > > seen
>> > > > before, and that
>> > > > part is unchanged from v3 to v4.
>> > > >
>> > > > .. and then I realized that a file has changed in my builds,
>> > > > since
>> > > > I'm
>> > > > working on 4.18.
>> > > >
>> > > > This is worth testing on the autobuilder, but I will have a v5
>> > > > that
>> > > > adds a test for some
>> > > > files that may go missing, and hence we'll have issues across
>> > > > versions.
>> > >
>> > > Thanks, I've added it into a build with a glibc and openssl
>> > > change
>> > > and
>> > > set it away so its possible other issues may occur, we'll see how
>> > > it
>> > > works out...
>> >
>> > The openssl change caused problems but I did spot qemumips64
>> > failing:
>>
>> What were the problems related to the openssl updates?
>
> SDK sanity test failing where wget is failing to work:
>
> https://autobuilder.yocto.io/builders/nightly-arm/builds/1285/steps/Running%20SDK%20Sanity%20Tests/logs/stdio
>
> I've not definitively narrowed it down to openssl but it has to be one
> of:
>
> kernel-devsrc: restructure for out of tree (and on target) module
> openssl: update 1.1.0h -> 1.1.0i
> openssl: update 1.0.2o -> 1.0.2p
> vala: refresh patch
> glibc: re-package for libnss-db

wget builds against gnutls (rather than openssl), but there's a
dependency chain from wget -> ca-certificates -> openssl so definitely
something could have gone wrong there.

Interesting that this test is running wget without passing
--no-check-certificate (which the wget fetcher always uses).

