Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 501EB795B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 08:39:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id o37-v6so6787769wrf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 01:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AphQ4mChQfHVGGla8D92BitB4sJhVgCVJfehjeXc+wE=;
	b=SVawD3+5UbWS4G+j5f021lT+bsKqLVR+WQsHW5QQzBzJycEQhGGEoPAFDCnjphHOvU
	1dnUWNKpc4AlX90ts0qKQJNZK20TyGZTOdJcp2kCakCkAQvW8kE7IZJvubwLNc/i2qnx
	4bcZkuAXXoIOMj6V1Ld0SWdNo2R759HFxnzk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AphQ4mChQfHVGGla8D92BitB4sJhVgCVJfehjeXc+wE=;
	b=gJCAATenUwE32kViSVbVw7Gutr0LMCpGTi+BxfNmyLvzVXbocNdZol/AgRUhoQkq+C
	zXHZV4WQY8vWp9JHwnv5Fyj/mbLjyquHW2x86mezYfrsW84OGEQR7Rsa1AVzG3BPGFgY
	URJpP04RWH9n+3d+DAF4FL7mkeEefYBM6G0RUtDkVgaSIxr95vyuVl5PtqhRRhm9kHYX
	bBYNTUfK4Ggf8kB3ETgld0xk0Obu2rhOFD27lRsXXykhxq+c5wUxNP46gnW/6PHRlJVx
	9xJUIsJ/puLZvdh7lDGPuPq2ASzf8cWpg9zJtWM5e8m/7Qx11OM8MfFQ0GohjnJqZcsE
	QDGQ==
X-Gm-Message-State: APzg51Ds0WxfUwUz6v8QorcRyijwGKBaxAxuW403Zs6tjQaI7cm1WcGG
	o2UZjxsvOTVfwnKWUKi6wq6xog==
X-Google-Smtp-Source: ANB0VdZMkf9BW8XbbUBhV+CGQq6BziGckxtwFUhr2EVoHyTLLi9hj/9/49d/bEp7UMJbPdmCVyIoaw==
X-Received: by 2002:adf:f1cc:: with SMTP id
	z12-v6mr533209wro.214.1535099989085; 
	Fri, 24 Aug 2018 01:39:49 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m68-v6sm1142193wmb.10.2018.08.24.01.39.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 Aug 2018 01:39:47 -0700 (PDT)
Message-ID: <8ab2dfe5f21ed72bbf4da87126e6172b6d413ee2.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2018 09:39:45 +0100
In-Reply-To: <b6ef0030-8c15-7dee-e993-681b2aced85f@windriver.com>
References: <1535094031-35363-1-git-send-email-hongxu.jia@windriver.com>
	<b6ef0030-8c15-7dee-e993-681b2aced85f@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH] package.bbclass: only one hardlink of separated debug info file in each directory
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
X-List-Received-Date: Fri, 24 Aug 2018 08:39:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-24 at 15:16 +0800, Hongxu Jia wrote:
> Hi RP,
> 
> With this fix, we could not use yesterday's workaround fix
> `git: create symlink rather than hardlink between bin/ and libexec/',
> 
> But it is no harm for us, btw, Ubuntu use symlink in git , and Fedora
> use hardlink in git

Thanks, I was thinking there probably was a problem in package.bbclass
which your change to git was working around and you've now fixed it!

I think I'd prefer to leave git using hardlinks so that we can
potentially spot problems like this in future. There are other recipes
that use hardlinks where the breakage may be more subtle (e.g.
e2fsprogs) so having some recipes using hardlinks is good.

I wondered if you'd fancy creating a new additional oqea test for this
debug hardlink issue so that we'd detect any problems in future? The
test I added was:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=318595754b66e8e4f3db1bce1ac086a2409e2eca

and with the addition of a few directories, it could probably be extended?

Cheers,

Richard





