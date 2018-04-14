Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1E8776FF80
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 14:17:28 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id h69so8253883pfe.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 07:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MW+rInZLLZmCN7NjzlwBykgQqse+A4cY9YNbmDRT2sg=;
	b=CnAtJg0mQSKY4welvQP7UKinP80Gmi/HXdHlFwIXYL1faWhRDhqq0Q/YzpOEt7DAr4
	+l8tREVFALqj1rXhIIircJdTWD9NPt8YxghkYsaZqbg8Coh82F3+LkV0JSqqDetkUxdy
	vDucORCWorAOQmkMv1PpHS8OxBw1yzWK1bB3HVavz3p0pWka0IQ8qOjU5v+Jp1no6by1
	9Mi3gqQoEpYxQJEs6YsANYlGV5Zigw8Z7otIgSwc2304y9yZhz8PBkSQWspEVzJztfK5
	6PAxXVvQ9WEAuHratr/huEhcLjIeE3edi1mG4u/vjdavNXEYW41mrnVlBwaZGBWULmes
	q9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MW+rInZLLZmCN7NjzlwBykgQqse+A4cY9YNbmDRT2sg=;
	b=B//9Mi6FIyDnXbyKq2uoMXCxAmR3u5a7y80kOhcHSMHWcGzjRtgvtXDQHXpLz9cvHm
	ynZJjXu4jTeE1R/nsvBH7xZ79kPZOefyvrWZ6TNynzdY8rRMBm0bkr4QylE8rq2cgf46
	u4FNtSZsT6WPxlUlXm3TKWnCWWMljNG4enxMfcWEj48enJkdugXLnoAlQKys7BwCd52z
	eslRFRfHEVuzQy/i996RFHNtW4Zvl5wdAXAWl0mcNNlGM8gKE5UR+cLEmA7w7oyybM4l
	jnoX32RyKnKnkBs20vm1dPbZGses+/zVY0P9dSHrLpqalEmsjBz21fPjmOLclSKiDxJM
	xqRw==
X-Gm-Message-State: ALQs6tDFnRvqU3juGd0/SSnw36MNfm9nMjaaQ3n2BzEkqUlGjmbhnWvl
	+TWOgViDLS7PPoDlamSqltn7zJANVXU2w5qtLjAdeQ==
X-Google-Smtp-Source: AIpwx4/zquT3wj2Zxb+jY4JZr113QHWn5gnFQxj8q/HTBXCb/GfwEk9kD4ORs456nFDoF68Lu1GrNo4gGyw26UnBOJI=
X-Received: by 10.101.97.15 with SMTP id z15mr7320382pgu.393.1523715449833;
	Sat, 14 Apr 2018 07:17:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.183.207 with HTTP; Sat, 14 Apr 2018 07:16:59 -0700 (PDT)
In-Reply-To: <6c43a914-cf60-6d05-766c-1c1bfc92d13e@pseudoterminal.org>
References: <6c43a914-cf60-6d05-766c-1c1bfc92d13e@pseudoterminal.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Apr 2018 07:16:59 -0700
Message-ID: <CAMKF1spKY4WjXg1c=70w0TjMwqVNGQD3FdLdL_A7La5rEdh7kw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: dropping commerical flags in mpg123 and lame recipes
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
X-List-Received-Date: Sat, 14 Apr 2018 14:17:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 14, 2018 at 1:30 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> The lame and mpg123 can be built only if the commercial flag is whitelisted.
>
> However, the remaining mp3 patents expired in December, and no more
> royalties exist. This is why in GStreamer, the mpg123 and lame plugins were
> moved from -ugly to -good.
>
> So, can we drop the commercial flag in mpg123 and lame?
>

We probably need more clarification see
http://www.audioblog.iis.fraunhofer.com/mp3-software-patents-licenses/

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

