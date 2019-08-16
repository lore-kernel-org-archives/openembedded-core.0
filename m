Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id BACF57F32C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 15:02:47 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id m10so5019438qkk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WiFMMplnQRlXLxEVkXV966Gwh+5GOTPdzb4oxZo5NdU=;
	b=KV/DzNVLXQ4Vb/zXpW+dGEgU2c70PxUhFGzDm49bc/wIc/OoD1qHmJKIwL0uHntSnp
	gjaeQx0jQi/cpYuIAhAUW5tAYEZrCKct/xNbST5yIVUskx+a+wO88XjFyO0lngB2u/v+
	JXpGYNca8fZWaEVZRI75H5ynk2rOZOvOd1wczKoq+Edkf+2Q8RKyJ3xY+ABw+2as87Wj
	AnVLxPahCvc11YpCpO0PrPkWgWB6AYb26+RAA1a4FxZ+br21YNWLzW0mpTgmPKz+cEgz
	Fd5l8VAQCja5LvfmjnPbmk2IW+1zbjoTzeyCnQR6a+d7a33bC+fNQ75pK6UCtBpp9EkM
	XGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WiFMMplnQRlXLxEVkXV966Gwh+5GOTPdzb4oxZo5NdU=;
	b=mn5LHZvOU6L/erOhzXyADdPtdAF3eZWkLEQarjJ/xDsW2OjIECX8wTtizzm9t9FHRg
	VJ70oO5Pj5rlMxBVyeAwsM77C0R07frZJa0sMx37yIEnDg2vAaTAuhfXjQB+xI+sjap3
	sXzzUmn8Bjf7hYF+A33NSYZVfiqcGK7IEyuowYJiDvQJajZr2QmviYu3PKXCwIAJ3HNc
	fai7OsWI/fGekGh9JlmMmNrAKTQKXat/KFWN1ypLTe0tuKUGM/MQ+X/PVhnxGv/zeqC8
	oRBvgWDGRf38G49tYpkGoXZ0+2gA2SsVDYtZBUyHm70d1AMmHT4CIysKxJuzlI48j5P1
	rXYA==
X-Gm-Message-State: APjAAAXvFwczVO6wVJunaNFGt+pNm2Ph7528/CkXm2HoxrkqVqq/NWf7
	XsEVERmR9NM5JsG614fH181VRO064cR1xbC2tMs=
X-Google-Smtp-Source: APXvYqxSvSHMgw7cDsPk9F2oAjxL1T3lpavlIC4OCeaEEdl0iCUtza67Z86keB35Szs2fxNN0zMCkGLfPnSh5R1RfK0=
X-Received: by 2002:a37:a24c:: with SMTP id l73mr6985584qke.9.1565967768445;
	Fri, 16 Aug 2019 08:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190814230057.31103-1-raj.khem@gmail.com>
	<1ff55109be0cdd952967564fe1d5ff026413ccda.camel@linuxfoundation.org>
In-Reply-To: <1ff55109be0cdd952967564fe1d5ff026413ccda.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2019 08:02:22 -0700
Message-ID: <CAMKF1sp1Se0SBRJXYcwLzN_NawEnPzO2AqvG7c0Ht5qG2m980w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] libffi: Upgrade to 3.3-rc0
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
X-List-Received-Date: Fri, 16 Aug 2019 15:02:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 16, 2019 at 7:48 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-08-14 at 16:00 -0700, Khem Raj wrote:
> > libffi 3.1 release has been a bit aged and new architectures,
> > compilers
> > have since been come on stage to compile it, we have been carrying
> > patches, but its better to use the latest 3.3 rc0 which has lot of
> > these
> > issues handled and is in good shape.
> >
> > Use 3.2.1+3.3-rc0 for PV to keep room for upgrade path without PE
> > bump
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Set PV = 3.2.1+3.3-rc0
> >
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/960
>
> Its a multilib file conflict issue, see step5c:
>
> Running transaction test
> Error: Transaction check error:
>   file /usr/include/ffi.h from install of libffi-dev-3.2.1+3.3+rc0-r0.core2_32 conflicts with file from package lib64-libffi-dev-3.2.1+3.3+rc0-r0.x86_64
>

Will fix and send patch soon.
hmmm, I wonder why it did not happen in the past.
> Cheers,
>
> Richard
>

