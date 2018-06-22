Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6A30275545
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 19:56:35 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id w8-v6so4587200vkh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 12:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3Nt6hqR0+8XKZ3QhMEqfyPyu0zxetqjaKNTgjYiOsiE=;
	b=Mr7JYAsYzzvmRHVzzQegSMAKxzPVL3WM7I6rX0JdasO3Gy7QVDfOb/N3TnIU2muWe2
	PbbJtF6csGunnTPpwg+Q9PMA+e9XmVhmRQR8EA2jmNdaa56iWZy+ntwyeTOQNxdS5HaX
	CypT5/gGQsra3ReJjI/G05Ne005gbgf1NzDobnv17fUfTJyGc3/6r70R7E3rm9E5WIEd
	ufXibJJlKX+MZPg/CjwnraFxjgSxNum5/JQk5wwW+rlmDM7QPJZsrBqV0dva+WNzwHRQ
	G5s2nRGaldJk20IqH7tMZgkaH8sf7R63QrF5rXLISiyDRWmoLMlvV+QLzT0Q0p5n7XcG
	qDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3Nt6hqR0+8XKZ3QhMEqfyPyu0zxetqjaKNTgjYiOsiE=;
	b=F4S8L2JcCn8lEXN19Hzj+4TrNrU1BLb2fJENHWs0F6llgwi5+aVKZjid9cLe+gUPHK
	/xTndjdCzbcKcUkvoH92HULG8av712W9k70DTzYNKlH1cXTIuLusHLOAe6D9tZMlZbx9
	Ew+cMgkZvPFNo2n1sApFCMP5DxaRHT7PnT+8GgmfuxGJekDTYb1rkCtfpVtK03SqAeM2
	iehLLbETzMzVbA8wUfCQ7gXkxd+/3+vX4nugV9QSUbo1pSX26VU5b0+yQdeYxGhhixZs
	WhZKNVAKQS0ZVX9TbwFPd1o5p7PSm25yDIrofhMcztciPUeZuVM/6MnlSRSqdZQ2nNNP
	oZCg==
X-Gm-Message-State: APt69E36xuy/4bt8wbQCM21bkJKwEpMlHYZMJ80wbb4tOXerO1XV72qR
	UoynnIEEOP7au+0+fFbgxSgqyjWkYph5Vdqh03U=
X-Google-Smtp-Source: ADUXVKI90E4FQcgcl0297S/zDqmyWJhbasK9CUXhE6kNUqAToIyHVE6VIp+0kLumjjZNDS2hMPrV+cizCQFirLgRoy0=
X-Received: by 2002:a1f:b08c:: with SMTP id
	z134-v6mr1837987vke.194.1529697396207; 
	Fri, 22 Jun 2018 12:56:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 22 Jun 2018 12:56:35 -0700 (PDT)
In-Reply-To: <19c2948bb4636236596fd89ca6e940dab96a1323.camel@linuxfoundation.org>
References: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
	<1528397320-32269-2-git-send-email-armccurdy@gmail.com>
	<19c2948bb4636236596fd89ca6e940dab96a1323.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 22 Jun 2018 12:56:35 -0700
Message-ID: <CAJ86T=Wi8PY6_BoWgvP=iKA3Dc=Eba6B=b-ii4VakheU9tejrw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] openssh: stop manually hiding libutil etc headers from configure
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
X-List-Received-Date: Fri, 22 Jun 2018 19:56:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 15, 2018 at 3:15 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2018-06-07 at 11:48 -0700, Andre McCurdy wrote:
>> Since we now have recipe specific sysroots, drop old workarounds
>> for non-deterministic detection of sysroot header files.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 8 --------
>>  1 file changed, 8 deletions(-)
>
> Even if we have rss, I think showing/documenting these recipes
> configure scripts autodetect is a good thing so I'd prefer not to drop
> this kind of code if it isn't causing problems.

It looks like this has sneaked into master-next via mut.

