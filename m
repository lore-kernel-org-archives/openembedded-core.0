Return-Path: <wbourque@gmail.com>
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
	[209.85.210.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4C9177EBC7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 16:29:34 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id d17so6482083oth.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 09:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9ThI19HwSWVvH00nuEOUEBnL42EiBVkQ6xQU+BjdE30=;
	b=dVoV0c9G+nmBYv5LDEwhhk4degKe9lRP7fvWrHPSEM6xtZvUtMAGKz8rWHjnSeiBez
	AepYrW9y4o7ZEXc2pQRz20sj0750CHJyvVJ2pCgMHPb1ZRVhALq5QQzyb9v0aLresDtF
	SswzucQUbgnrWRW4W6r2gLLDd9jCDN+8cKF63LCKJ/6zd85T5oMFTKNt2CDJIMp1uDEJ
	BEEv2PFk1RhKHtZdgn23ONiEyuoaWMcEXCpBucBC/DQXn4VzMpIFua740QnUwAv/qpSW
	iZAP6fmEz44R6ODj3XE/3pBNo/Y1JqScK76IpnnbRrrshq7kdCynB0+QLt9VyZ8JwLYe
	5L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9ThI19HwSWVvH00nuEOUEBnL42EiBVkQ6xQU+BjdE30=;
	b=k25YieHzfvlgBAaOaFYOvQm2rkvpwDzGRqoNPoHX5Uow+L/D9XvFEmfO9bI8DfO1UX
	mgJ/4UYkdqjvgBnnu7iyQHE73F71GzLjHXWO1q03TKzowtM9wU9B7dyY8UMedkib8oYe
	G3QLeY8752VP8CasgZumEjGwQaad2/oz0eztoXUBEc8iTAQHl+3l0V09nKHWLWiHHivo
	9wWbAiDzOyCSH0ZQpzWyjXSqRuPQ2Xx33jxIvrHMDHqz5yeLfSFbou8cldLDo3/zlkpz
	tDv94JEvAbjcJwfDfP6kWbeKuNc8Kkqv+X+K77UvDkWv2LkCgu6+9QCbpHFSRpkAlhvV
	NxDA==
X-Gm-Message-State: APjAAAUstsxyxSj2suHvmgm9ZR7aXYSGJd+lA7zB38X8AgMS0tRxaBZ/
	m/xxfZqf/HvxCgfDPNp+POOs38Dfqpplxe8xcCw=
X-Google-Smtp-Source: APXvYqwkIqWeXvq5EjyWOXqDpVUaHS+e1AN20ZJ9X1vzUA55WFbjmLKdbyklj1h8uG8pMnzoa0xl5HCMFfMdC930k80=
X-Received: by 2002:a9d:76d3:: with SMTP id p19mr12443672otl.18.1562257775187; 
	Thu, 04 Jul 2019 09:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190702182403.24099-1-wbourque@gmail.com>
	<20190702183053.2330.89816@do>
	<CANBSh+N4AL=o5bsuVEWJRUX+VzpsLv=dPBSo=OWCZBZnx_vrpw@mail.gmail.com>
	<ab85111307d8ed9b93c0fb8026a91ae5f24c4ed3.camel@linuxfoundation.org>
In-Reply-To: <ab85111307d8ed9b93c0fb8026a91ae5f24c4ed3.camel@linuxfoundation.org>
From: William Bourque <wbourque@gmail.com>
Date: Thu, 4 Jul 2019 12:29:24 -0400
Message-ID: <CANBSh+NZ_Owp4+ANhJPAOK7O7h+O8kJGhWjSp2=W7ZGLHEA_tw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHdpYy9wbHVnaW5zOiBTb3VyY2UgdGhhdCBzdXBwb3J0IGJvdGggRUZJIGFuZCBCSU9T?=
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
X-List-Received-Date: Thu, 04 Jul 2019 16:29:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 3, 2019 at 3:51 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-07-02 at 15:22 -0400, William Bourque wrote:
> > Hi,
> >
> > The error "scripts/lib/wic/plugins/source/bootimg-biosplusefi.py does
> > not exist" is a bit puzzling : this is the new file my patch is
> > adding.
> > Is this test failure expected for new files?
> >
> > I sent this using git-sendmail; should I submit using a different way
> > (pull request, ...)?
>
> I think the test is broken so we can ignore that. I've cc'd Sandy so
> she might be able to look into this issue if possible as we've seen it
> a few times.
>
> What I did wonder is whether we should be adding some tests to wic for
> this new plugin though?
>
> The existing tests are in meta/lib/oeqa/selftest/cases/wic.py and can
> be run with "oe-selftest -r wic", would it make sense to add something
> to this as part of this change?
>
> Cheers,
>
> Richard
>

You are right, some tests would be a good idea.

That said, I am a bit confused on how to integrate in
meta/lib/oeqa/selftest/cases/wic.py
Most tests in there check generic functionnalities, I'm not quite sure
how to use it to tests the new SourcePlugin() specific
functionnalities, instead of just the generic.
I will come up with something but it might not be great... but "not
great" is better than "nothing" I suppose.

Do you want me to resubmit the SourcePlugin code and the tests together?
Or would you rather have me submit the tests separately?

Thanks

- William

