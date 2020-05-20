Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.15431.1589989462038261244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 08:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WLfgB2ka;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: sakoman@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id m185so3385427wme.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 08:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=we7xTO6V5dlUWQQM850z7JzXlAk32MNfv697DJ0AzNM=;
        b=WLfgB2kaHblgVrTEs4KBKLEg73FpLu8NJq4leLcUNklxikYbc/neOj5X38xbOVZL5P
         8720d2XQP3fXwSEtb3BjDqA16du6w6rzv5srT3WJp5vDQgDOr/m4rASy0T/YYY1mSixW
         6x1oMjtXj0/J0zgbnksYTrhP82WuEcvkYHPQg9pqwt4QsZJgJp0q872nkZ0vqp9/oIVh
         0hjpWKvSLkvhu5n1p15UwIpWoLdULL+Wn3LTYGCaIjKq5+OHMYnm36ezBR0kzKEZDAAF
         JFjXwkdN7opuqe2llcfsa+/LjG86eZzAj9eS/7PNk52Ms9b2H+N65KMkHaOoNxwD4z2t
         woEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=we7xTO6V5dlUWQQM850z7JzXlAk32MNfv697DJ0AzNM=;
        b=dbqgc0prApCKqTo8CaGxDr6DWnePEnPljQwvogk+ArpygxzR7o5c4hxTA3RBQp5Xuy
         pjsGx5FWAKouuGXs3cvwYfczScpzx4eOUfTnzwhGUv33yGLcmAvyi6eO8B3g0UoCamIh
         8FasV2lmTOpodZEKTIY/gCX313DYrPAI52xqJ6K3kTcHGQqyKScABogQqhXscxd7Ijau
         ZStcNMJ8bbHjz3nQFo+IeI2L2ZOeUZtTD6q1yBS2f2IVDkef3Zc16CGQ8+F7a/WhpZP6
         KL3AJxCpi7eNvlf0GdzSHtKWl3vM0uwkUsQvvoJkafLO5J0GqVcE4byaJpwkDwEJlV/I
         4ymA==
X-Gm-Message-State: AOAM533zhETlClmbwoo3KKOc0Y2DpYuOTPZTxnXbuU4TF3vRge45iedv
	1lg3mI8nL6GpYSaZdroOJF+EMUZFrV2qvfxBZU0=
X-Google-Smtp-Source: ABdhPJwEe0iuv2eqv+Xwnl+FHtZhkLU4xIkdNw/5NtXWNsV+mLfO0Kopu9QhTLyJG+weuJKnYq92aMNQ6djSeShQNZs=
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr5164165wmf.188.1589989460498;
 Wed, 20 May 2020 08:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqLxWZD6U1YHrr3Ngb1Vh8JpjCvUXRD7ybarit9wz5KfA@mail.gmail.com>
In-Reply-To: <CAMKF1sqLxWZD6U1YHrr3Ngb1Vh8JpjCvUXRD7ybarit9wz5KfA@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 20 May 2020 05:44:09 -1000
Message-ID: <CAGDS+n=taO-HkbecAKihO_oD=WGusAjoL4UoJV-7mgmYwXa5ow@mail.gmail.com>
Subject: Re: Dunfell backport request
To: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 18, 2020 at 12:21 PM Khem Raj <raj.khem@gmail.com> wrote:

> I would like to request backporting following master commits into dunfell
>
> https://git.openembedded.org/openembedded-core/commit/?id=fd4a454b5a357c7a26792bf486212957c698839c
> https://git.openembedded.org/openembedded-core/commit/?id=882df891e13ce5c64718c364efb9ef2bf189eabf
> https://git.openembedded.org/openembedded-core/commit/?id=2c7e0e0bf32eb1ed0b7d8acddb16c0d1e93f2aa1
> https://git.openembedded.org/openembedded-core/commit/?id=48b6f7e31ff042a4900307e830f9ed9375a8041a
> https://git.openembedded.org/openembedded-core/commit/?id=ce6c50ea68c34e02b487d54fdd9288e04833cdef
> https://git.openembedded.org/openembedded-core/commit/?id=886333c5d1c336da99300d24fb3c15ab0b37d1cb
> https://git.openembedded.org/openembedded-core/commit/?id=03b04fcfa5549a54fe6f335df14433934a7d5128
> https://git.openembedded.org/openembedded-core/commit/?id=e114c670d1e670397c1c04292688b7550f54027c
> https://git.openembedded.org/openembedded-core/commit/?id=030cd9021ef50d71482f6acf0e05fe425038c822
> https://git.openembedded.org/openembedded-core/commit/?id=a5331c5a8bbe63c6c2e56ebec496b28968d4663d

These changes are intrusive enough that I'd really like to see some
discussion on the list before I decide to take them.

In the future it would make it much easier for people to review the
backport request if you sent it as a traditional patch series.  A list
of commit IDs is much less likely to get the attention of the right
people!

Steve
