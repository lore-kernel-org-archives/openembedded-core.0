Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id EC1F560017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 01:24:22 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z73so3890864wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 18:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Js56i8Hrtakpj4dMdT7LXOejiowTA5SXIgAYHJ82MZU=;
	b=BGfM9FWZjJOGDdClHVuiRZHE1tYVXW9sbfHNamJxe6lLxK+ol+uz+0DTm81HlvI0x8
	n1AAEV3h+SyC0cyxdrXJWPjEs3Zl2JHGDaX6qGjgGjfj0+sHLQcFQWLdWLlw2df4uWao
	0YyyuAXfY1bOyLRobOnLkJHZwCaGc1nGe+MVAHe1LGeJsDZ2ceNfvXpT/WWCD7AWLqy3
	FskgR/b3hIeQrega5k+ZVwgLWk2heboHCUbIRX2Rso956RMrNiLudk3OrwGM4iWO4Piz
	/P6BwD4MPyZc15ZHn6/iIPl32tAfldKTs28xRqlQpwu0cj7n4GiXBu+rK51vxH8LyRiJ
	3IMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Js56i8Hrtakpj4dMdT7LXOejiowTA5SXIgAYHJ82MZU=;
	b=YwaDpr+7VqxE6r7xJhm+0moAeT109y7XzGjuSloOMbsMki0iGRwEkZNLsnEEKVIsL+
	nZE/eDo0a0jMSYFuEFwQFuh59TCbowP5e/ttqQ3xauPjcntzwKM9+Ci4CMxdrrnBgQc2
	wx5DbjJ/sU8wNOfar4AuWWMyxTxKV9evL4m+1chBl42k9JIafyTFAzWto+oFK46+y56/
	pTcZQmMuJVqgESyvi5YkrPd9XFHbcoWo78UAzSFTvNFTap2Mwzt0fu/3GBUkapqUUSbW
	6W2J8IXy92UyqgXOR3a2e5PZS0bTlGwDkclTsFXYs97e7CcZxlDqnUGOp8WD4yoO4Dwg
	D8eQ==
X-Gm-Message-State: AElRT7EKJ3WJup+KCyvdafv1pmWmqmTk8D2o4p3npfzosWV8bEPW2sau
	64hvadGstl03KfuF0thufvdsUwoJcYpmS4VdJZM=
X-Google-Smtp-Source: AIpwx4/4QxNSihiauprln2Duzuqpu0O194weuuLZQoxHfWaXlKqvlaUMvomzosOBRVQT9K8FY9xXH/j4fQT3RWhK7JQ=
X-Received: by 10.223.175.201 with SMTP id y9mr4627185wrd.107.1522286663413;
	Wed, 28 Mar 2018 18:24:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Wed, 28 Mar 2018 18:24:22 -0700 (PDT)
In-Reply-To: <12dbba60-2346-0020-64c8-db2dac948684@nedap.com>
References: <12dbba60-2346-0020-64c8-db2dac948684@nedap.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 28 Mar 2018 18:24:22 -0700
Message-ID: <CAJ86T=WE6khW6vfL2_z3HdXjB-pxSSaTAb=Fz-NSczhTGxV=HQ@mail.gmail.com>
To: Ryan Meulenkamp <Ryan.Meulenkamp@nedap.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] CPU Load
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
X-List-Received-Date: Thu, 29 Mar 2018 01:24:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2018 at 4:44 AM, Ryan Meulenkamp
<Ryan.Meulenkamp@nedap.com> wrote:
> Hi y'all,
>
> I have some questions about CPU load and performance, but first some
> background information.
>
> We have small embedded system running an openembedded classic (Angstr=C3=
=B6m)
> distro. Now to get ourselves up-to-date we started working on a new
> iteration of the OS based on openembedded core and Yocto. It is nearly
> finished now, if it weren't for one problem: The CPU load (/proc/loadavg)=
 of
> the core/yocto based OS is more than double that of the classic/Angstr=C3=
=B6m OS.
>
> So the way I see it this could be caused by a number of factors:
>
>  - loadavg's calculation changed
>  - certain newer versions of applications run heavier
>  - The kernel itself is heavier (we upgraded from 2.6.35.14+ to 4.9.28+)
>   - Possibly caused by some configs
>  - ...
>
> My question: is there something that changed since OE-classic that you kn=
ow
> could be the cause of this? If not, how would I go about finding the caus=
e?
> I don't think the top command is sufficient for this, because it's precis=
ion
> is such that many processes' CPU usage just become 0%.

You don't say what the CPU doubled from or too. 1% to 2%, or 50% to
100% ? Unless the absolute increase is very small, you can probably
ignore the processes which top reports as 0%.

Does the new build have any significant processes running which
weren't there in the old build? Or is it the same basic set of apps
running in each?

> Also, both top and
> htop cause huge cpu loads themselves.
>
> Any tips and tricks would be welcome!
>
> Thanks in advance!
>
> Ryan
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto

