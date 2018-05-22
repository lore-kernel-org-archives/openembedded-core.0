Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 110A474616;
	Tue, 22 May 2018 15:47:50 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id x12-v6so17139517wmc.0;
	Tue, 22 May 2018 08:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WTHADMSwxRA6eGwYtbqbkYwMQlxlJEeCinsKDE7hc08=;
	b=eoy6dKBdY2KJYooSogr1YAzl8TGxYwwhMeIKaEYiywASZMOH3jPz1yQkGYxm4dd0V8
	3aO5Dqf5XYN1CTbW4b3SB4tTBMlCJ5DEGQgowuu/0ucpEwZeUDawQ3YES3QG8+J23/Yv
	yLPA8P9HsRfXNzwhP4HPA0AJ0I0XW7Sbj427V9vTFzW8kOXJA6+WFzjxBsScSS5EqswQ
	yRPGhGeHQbJk1Y8v1wP9H93zPVcKk2ElcRoyGkX7/auOh59bEL+lgXqUXn8iZN/zkCB2
	gF64mVcotm/guzNFqyYA6X8cCPJJ4PvvSRVIxXFYR6Xf8NEPuEvAbtmUkYZ1zMw7jMFg
	ISOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WTHADMSwxRA6eGwYtbqbkYwMQlxlJEeCinsKDE7hc08=;
	b=Uo9r98mor3qIzfTqPqKpl8/Q6HCdsqEl0scFppHAapucSTc+DfC8cgV1pwDWlcoGWH
	1BcN46t8sokd24bdk7gCHl/jDqgNLvP/zK+fWq5NFhi8fOcRCfj2u4qvrqGqhBXynKEt
	44H8S6fJbWXKuPp/4CJvUKEkmlyfayhs6dP/LJKzHIx0By/vClNfu+NEs3r5rkRlTLLr
	2HVzxWF0oX4+nFQWjG1A+RGLugtKZfOhkEljdq3Il7VKwF5X2wD5rLV+09kCDIVm25Zr
	S6wsJi/4uVgj31vumHSMepurHJVokKO/NrmYosxIfQj1kf/zdDV4ipWOsrswny3TitP0
	EJ8g==
X-Gm-Message-State: ALKqPwecBkVBbX+j3zPRgEchOVMB50KUd3BY3MDYgp1Z/K5ExgVYeHCP
	/jzPJxyOkB4GbsnDdD2GAsgbQHBGzEkESephpbI=
X-Google-Smtp-Source: AB8JxZpgiWoWpjA40EHpMpfwct6zgHpWejztooe8Q/ScP4sdinYIWSPTWeEtnUru8bqHYSAWrjxvQaOpOVXgDVEEbYY=
X-Received: by 2002:a50:c359:: with SMTP id
	q25-v6mr3079209edb.178.1527004071273; 
	Tue, 22 May 2018 08:47:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.157.72 with HTTP; Tue, 22 May 2018 08:47:50 -0700 (PDT)
In-Reply-To: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
References: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 22 May 2018 17:47:50 +0200
Message-ID: <CAAQYJAsOB6tr2SLEOP1CBsYw_MT9sC0ryfu0LmnWeNYVDhssmg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-openembedded maintainer ship change.
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
X-List-Received-Date: Tue, 22 May 2018 15:47:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 22, 2018 at 5:40 PM, akuster808 <akuster808@gmail.com> wrote:
> Hello all,
>
> After much thought, I have decided to step away from being the
> meta-openembedded maintainer, patch wrangler and builder.  Khem Raj has
> kindly stepped up to continue these activities. Maintaining this was
> consuming too much of my free time and I need to focus on other things
> in the community.
>
> Thanks for the opportunity to have served you.
>
> Kind regards,
>
> Armin
>

Many thanks for the time you've spent!
Andrea

>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

