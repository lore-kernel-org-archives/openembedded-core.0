Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7994077D1C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Apr 2017 15:22:12 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id l43so125241400wre.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Apr 2017 08:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F1mLn8T4n1/qPqrJaMAwrmkeYMvQm/8e0PaCjm41y74=;
	b=M4IH5K4pU2hRyIvtnhLNz9pB+D8GkK4cU0RSaD9yp6nMuqlrzsStEgliTnC/f6omfb
	wGK7fw4wlv/1CUBhHf/IokIcSrGam9Z3itMpPF70Q81U26d1HJwwRJKHtCcui46cnv3I
	Z0y4ggdzKmcRy20xFa0zBc6a7y4YgomNy8q2EecShgfS36PYYAsSjnM78DxZuT4+No9y
	CzoU6B2awRqAMMHNjtrTj2kty06xangedGfqS01b3iVjCz5iwWQEv36wZnXd7ao23SxI
	aiVm+/5fS6ziO3BS0sfc6Q43pdk5HyE4b7QJqIsCMQj5dadIm3YWGGbXt/F8YaLmvPOK
	Y7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F1mLn8T4n1/qPqrJaMAwrmkeYMvQm/8e0PaCjm41y74=;
	b=hGkmcRw5uxbUVD821bGLOe7xwjxTcH32WOaErY0kgVK0/aQsmfFXib5vtJG7GOVuOq
	o/9zevRLky4YYFcBJzXIGbVvgfICZr8BUVSirgxO6FeI76gn1KggiOGjri2nkF+ixQQa
	7/Fs/2rVBf+fX0xlxpMVCXVC4NORGUVuk5bdjv+l7VEdy3oFWf5zI1QnZ+ghmZpoAvLo
	NVUpZwbqKcwQ/nKN9IAZXHIfdj68UFUB4ru9yntmNyAzqAZob+eyTQa7xcEsFsNsT2L7
	6qd2G1NY35i9I07jNxufEaGpIss7T3zI0WwwdLa5e6SdVdpljrO5M7pIBhpgDB+tn+TP
	P9QQ==
X-Gm-Message-State: AFeK/H0MDIzApaUNqeYQbqhO5Wh8j/epy/W93lksmfyas/1litrLubrDTfAUE8GKeormT0V5QkSUVp4V0S6CwA==
X-Received: by 10.223.132.129 with SMTP id 1mr7892242wrg.172.1491060133265;
	Sat, 01 Apr 2017 08:22:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Sat, 1 Apr 2017 08:21:42 -0700 (PDT)
In-Reply-To: <CAJTo0LYhay4KTF6zP_dAXr5Rj4rRZ_WO496a+9usxSEXxzQveA@mail.gmail.com>
References: <1490995693-19005-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1sp=tgkByXMiELBa+K1=mQ5=ggr-7TwkTdK9m7ieGeeEPg@mail.gmail.com>
	<1491000595.13980.375.camel@linuxfoundation.org>
	<CAMKF1spaeG0a=fg87UmAZF+Z9KPDqFzGCM62TKriURf2T+yMzg@mail.gmail.com>
	<CAJTo0LYhay4KTF6zP_dAXr5Rj4rRZ_WO496a+9usxSEXxzQveA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Apr 2017 08:21:42 -0700
Message-ID: <CAMKF1sqrR_KYsZe+8DuOP4aVy9vXVYcCL9AWO-qrf5UQen8gfw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses_6.0: Improve reproducibility
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
X-List-Received-Date: Sat, 01 Apr 2017 15:22:12 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 1, 2017 at 2:14 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 1 April 2017 at 01:42, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Not this case obviously but I was reminded that this should be default
>> option from tool gain if not specified
>
>
> Yes, and it already is.

right. Andre confirmed that yesterday so settled.

