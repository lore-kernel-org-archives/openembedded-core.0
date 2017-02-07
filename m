Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8F223601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 07:40:50 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id f2so9544861uaf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 23:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FGmbvKdRG+oqHC2Bg2sqyHknQ4nmWWaPYS3eqU7JUKg=;
	b=AybQY5wBIHPrEzDypq03AqmmNtx5CNyFsnH9SxKpOtlBckqBpUxKN4OjSNLUXxY7ap
	UjZEWsAyNn7UY7RvhIpxXV9CtSv5VIxn7k7/KL2LMy3wQXI+/aX7fgmxmMK0OherYQG8
	Gk4pwC2ZlXxlU/abmnE714rbHQcsz2bsQG1IBavt0l9JUFrbJmCMiWy0KW3TWaGanO7B
	UOVRtKpPGOxZBDNB8C8bS31JxzxWPBZsKuwB15WapqkvRc8GpOBKVTC7ogH+cvGQHRpv
	CjjF7XheWjHP8qZMhOhKBus73glXGBAKotLos6k/K3eSZCpQ5R2Ti+kKBU6VWHwJQL+7
	XNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FGmbvKdRG+oqHC2Bg2sqyHknQ4nmWWaPYS3eqU7JUKg=;
	b=BMKtDDrb2/b9Rent+aQ3cuvd3gdxWpFnsJpbVpyMfSMOXolurI8QANkqvqqAHZG/pS
	z66Xa7s81epn7XjntWSgW3DqkyR6hpasnHsJ4OYcwQhLFy/4z0cCSNUhyj/YeoyvAkl4
	weT9o14FYx/K7BpxjN6jekr+xPbe/8e+PrI2FuQVnujpvU+hLD4T52tuRL3qpIvEmwpc
	0pvYxVjOljuRaFl9QjcfzW/NT+dnI5OCZW0Jk5FKJmkpbC5OQZK8etRYg3MWGDTQkjFR
	+1a6KrolwR+odDfGfbGI5LXEaIocBkutVQmzvtgDJymFDpvy+BP8VCfuwDk6+8t8mEUF
	0ZJQ==
X-Gm-Message-State: AIkVDXLflr5N5sSZBS6gEb+WgPc10HEb7AHT+1sqN0wfHZeGIfMjMyLMuaVJnvpzSxjC3mzS8dBERGrP+Hi3KQ==
X-Received: by 10.176.92.26 with SMTP id q26mr5820514uaf.88.1486453250466;
	Mon, 06 Feb 2017 23:40:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Mon, 6 Feb 2017 23:40:50 -0800 (PST)
In-Reply-To: <1486423594-13790-1-git-send-email-ross.burton@intel.com>
References: <1486423594-13790-1-git-send-email-ross.burton@intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 7 Feb 2017 08:40:50 +0100
Message-ID: <CALbNGRRikJJR9HDiT+py43+=45PUtPFaJRuOWAoZbSKoCa-zpQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: upgrade to 1.4.0
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
X-List-Received-Date: Tue, 07 Feb 2017 07:40:50 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 7, 2017 at 12:26 AM, Ross Burton <ross.burton@intel.com> wrote:
> Drop the two patches that add the ability to disable GLX, this has been added
> upstream.
>
> Drop the Python3 patch as the code generator works with Py3 now.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
Wow that was fast :))

Andreas

