Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 798A16B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:11:00 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id f55so31290805qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 02:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gbblVzAoGsSBeIEq/PHwdAHbHbJI6FelwrN+eJyoJzQ=;
	b=HnRfPXtFL4B+noBZbnlr3LrI/kUW4XUCdNZ6kQne1dGVHtkqQuVvvZWYny1H1Nxpur
	Z2VazeMnJz5tJUdzuKqzmfN/GkgXxAzTNh188JNGuJELZNYKAZMTHSiRXnnxIubvbzf2
	OQ1pl5tq2I4ervPcQasGNwo52pOmYSBjeXOMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gbblVzAoGsSBeIEq/PHwdAHbHbJI6FelwrN+eJyoJzQ=;
	b=flCRoidXyBMQJv5C4QTb+t/t5Xx9PjmFsiZR+Ho1cOTo1plBMm5HI7L0gayOjCmXPc
	YSbA0Q3cRcmNrZZr+bZ8qnExPCinEe9Ue7jB49AtHF/RmU8/bUqlcoBUNtBgrSwR0gJ4
	nRDrsAsywMJDMapxhjQcRwupkalKI6/vJOCS8vDOMRIubf9vUp9rxqwUNEIdCOFHlnX8
	pKlyu102zGIKjzonF0MD+2uU0wYhZIm7n5kK4VkKlKHkThiQY1vwJljBnRESSZlwrK8d
	9QP1swAHR1mT+hRK0+fw3YMrI7PIanoLLvhMfMU5LuaQwrUeSl3Is9sKcCmaUaSBOUYM
	t+5g==
X-Gm-Message-State: AODbwcC+qpkORqaQo3HwmuCd5kSp08lyFQ5ZO1I6UhwYQrc65YnDnLs5
	bPV0pgboZfSeJ3wcZLiG1Jlw0k273uap
X-Received: by 10.200.33.232 with SMTP id 37mr466727qtz.189.1496308261480;
	Thu, 01 Jun 2017 02:11:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.88.135 with HTTP; Thu, 1 Jun 2017 02:10:40 -0700 (PDT)
In-Reply-To: <CAJ86T=Xg7Mn_EPj-z3G6ezbHq_Yrp9R1j9Qdd5UTORUKWnYkdw@mail.gmail.com>
References: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
	<CAJ86T=VS+ThYpfakL=oHDbDt9ogmoq4E6A95S0YVdxXNxfwRRg@mail.gmail.com>
	<CAP71WjwsNYDZZttAqUwxh0+=QkY6H7HVvLbvBXc-po6y6C77uA@mail.gmail.com>
	<CAJ86T=XDeMu5yAvqymWQ3Lbe+FDhLzGobyhx8SR6h9cVpX3OvA@mail.gmail.com>
	<CAP71WjyPL-ZsPnGDV_oq7rkWZpJCGNYyfvXQ9CVKNE6k3w9XJQ@mail.gmail.com>
	<CAJ86T=U73sCUS8uPCRAe5X_c0o-b-ukp9oy0Xr=8=woV9X1TsQ@mail.gmail.com>
	<CAJ86T=Xg7Mn_EPj-z3G6ezbHq_Yrp9R1j9Qdd5UTORUKWnYkdw@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 1 Jun 2017 11:10:40 +0200
Message-ID: <CAP71WjzXGqNfjqU+Ojk0s60hVevSffm1Hx5KEmH21xX+wuRCvA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: KERNEL_IMAGETYPES and Image.gz
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
X-List-Received-Date: Thu, 01 Jun 2017 09:11:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 1, 2017 at 12:56 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Unfortunately this doesn't work if "vmlinux" isn't already included in

yes. correct. i noticed that when I wrote my patch.

> KERNEL_IMAGETYPES etc, so we either need to search and replace as
> before, or add something like:
>
>     typeformake = types
>     if 'vmlinux.gz' in types.split():
>         typeformake = typeformake.replace('vmlinux.gz', '').strip()
>         if 'vmlinux' not in typeformake.split():
>             typeformake = typeformake + ' vmlinux'
>
> which is a little more complex, but has the advantage of not risking
> duplicating "vmlinux" in typeformake, and therefore not calling "make
> vmlinux" twice in kernel_do_compile(), which I guess we sometimes do
> now...

well, i think you are trying to fix 'another' issue here, since we
already have this issue before my proposed patch... so i would prefer
to treat that separately.  this is a more generic issue (e.g.
duplicate in KERNEL_IMAGETYPES) and we could simply remove  duplicates
from typeformake.

I will send out a proper patch with my proposed change.

