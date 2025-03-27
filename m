Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699E6C36013
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 19:01:48 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.4353.1743102101843105895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 12:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EgZRKaqV;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224019ad9edso37448655ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743102101; x=1743706901; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UHd20QuVf9/0uFChlVr8l8EKt9WckiSM0v2w+s6U5Jo=;
        b=EgZRKaqVWxWVMXZ/q4CgzLWCHV59upvHyV+o3Xo41vQCJuBlVDQH+LIpf8RcbHD/rR
         8pivlvI0z7gjx5WD2gLQJqVRL00BshNGwaU2gQVszcNb+n81cosuER7A91aihL7P3jMR
         itnQa4ikDueEsHJo3MBpn9hjOpITiWMzur2RdRUpPH7XfmdT6T2PLUderFgHDxjGuTON
         m5MVbslDWK++EnEFlzV0YlQOZfkjWaKQofIuv9zOYjcuuUjTjF+aB9BfADzAHcY5kFTP
         t9tcVZbe+0D9kZBOERTKybCM0M/jwN4zTephC5HoXMYmd2xLr7MFfxNDvXrZDCuWQD1g
         aqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743102101; x=1743706901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHd20QuVf9/0uFChlVr8l8EKt9WckiSM0v2w+s6U5Jo=;
        b=aYJfLkJMQjIbEaAhYHRXIoblAmS36PzAllchYcPvTAYIwe9TBv+ts2YGJlTrDYgJbs
         yF8al8tECAMTlvRoJ/OWcaFU33X4XQz6mCAcbNR0FxFu2quVxyZCLIgJWwOtsuVAnri3
         MFS7WtHRULWwLm+DNXtYNNcI7Acz0huArM3n5oKE+fu9CrWLWNQEcYSScEFMm3D/CTUT
         kOXuykP01eoHgw5t9gyImAT41Mr+q8s0jK1iswi5O9GgukGoaZG0Sp0ta8gV+dpDsDJx
         Ch0ysaLlCjDHE6cYlwJFgNIYjR9YNk+CQdo4niOeHC5L61Jg3qh2Seh71WxwP9cezNrk
         pJOw==
X-Forwarded-Encrypted: i=1; AJvYcCVOOMqANdxZKqyaXu/q9eSbIc/elKmdMb8Z+vQJUOEGVNdHX/C+vkseWfD9iQGSGHM5TWdiHufP9qj/MlhdjHRUHg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJQ0G0b7S8HxyxKn1mzPVG+REWYDlDJU/eVwKxBjibTfM+o+mh
	IjhDlX+1/tNG44BJs4rBdEJOmroMwYtyFOcA6iSA06qCI1F3gsGh
X-Gm-Gg: ASbGnct3jHjdc57JS4FPTC+ZikapvfA+NFbMCQ2Eeu1OALPHaHDhrFxI19HGTSJiXGQ
	MjI2Wz/vDF0eec9lGCinEtHSeKwB53LooW3oWaAWl1UcZYniGAwgZM85U0vdtZhmXsSyjMZJ1xj
	z64h1jtRsP5oCXPvesvCE7TS3uH250C3wgSoLa83MjmYVQ2Jcf8aJKs+G6s2CvvUIbA/u9d7UoS
	YxlXtAhhJfsHPAx4ak7W59z52Ojil3AdIKc5m0cG3ot3t3jbToKkE5WqZiDGccSpvbAGTF3x/dv
	vxMrembY1Zy59iAsA+Z513bcEey8IxOR38koVfGmNY0gld5pSQGi4g==
X-Google-Smtp-Source: AGHT+IG9wLpEtcRyK+LzeX5ie/3hShSzM1F5u30GFPW474vl+V6Q+C5pDADtAV5OjqqmkMjLG7yTSQ==
X-Received: by 2002:a17:902:eb8d:b0:224:b60:3ce0 with SMTP id d9443c01a7336-22804882d89mr80726825ad.5.1743102100991;
        Thu, 27 Mar 2025 12:01:40 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1e9b46sm3130245ad.211.2025.03.27.12.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:01:40 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:01:37 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [styhead][PATCH v2 00/31] linux-firmware: upgrade
 20240909 -> 20250311
Message-ID: <20250327190137.sfgisyjocd3ktje6@hiago-nb>
References: <5a7b5f6c-1be9-4c5d-bf2e-59e115762d6a@cherry.de>
 <CAOSpxdajP0E0uVMR3QmRCqqmmRMAMnXiZM3bPmOXHGyRrVTfDw@mail.gmail.com>
 <20250327171239.kvs4jtetjkcs3i2u@hiago-nb>
 <CANNYZj-+2ESLmCUjGR9ZXK62=wJno85DgFdU3tjsu1O7G5DPGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-+2ESLmCUjGR9ZXK62=wJno85DgFdU3tjsu1O7G5DPGA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 19:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213775

On Thu, Mar 27, 2025 at 06:29:18PM +0100, Alexander Kanavin wrote:
> On Thu, 27 Mar 2025 at 18:12, Hiago De Franco via
> lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
> wrote:
> 
> > What do you reccomend? Should I try to keep the patch with minimal
> > differences as possible?
> 
> You might consider adding this to meta-lts-mixins?

This would be another option, but before going into this direction, I
am still wondering if the bump on Scarthgap is valid.

From the git history I can see this recipe was already bumped in the
past, until it got to 20240909, inside Scarthgap. From the bugfixing
point of view, it would be good to incorporate these changes into
Scarthgap directly. I am not sure how is the policy/procedure to bump a
LTS branch, maybe you guys can help me understand this a little bit.
Then I will be happy to propose a patch and try to work this out ;-)

> 
> Alex

Thanks again,
Hiago.

