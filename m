Received: from mail-ve0-f169.google.com ([209.85.128.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAibK-00054F-1B
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 16:07:22 +0100
Received: by mail-ve0-f169.google.com with SMTP id 15so646298vea.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=IUFaPJ1iW8btNHZ9Kfvxsz2uCw8HCWaFm35gDgWDX9U=;
	b=IZ1+5z1e5nkRoES4WoV5e9oyG6JwNZFPLJ+guLUfu08bcHaBvnjEPUlOVO47FzJmbL
	7DSWa5iOxiVFjEw3/vz6s3zDnwWrvlzBaT8iKftf5ZU5xMBrmd1vaZBZtw2oqq9rRNvT
	a7HcWQ7txIr1dB2cujEVMG0VuuUscX+Q0VWdVjwQ6XewnjZNIs0D/KsCyLd7a9tWixaS
	7GoijqE2eYc7C0yUZNeKJ2uTcTndvmY6A6rUOgMqrRcAbrCbjJ4svRk/xj31ZFATVjAI
	YmOYGH9e7NkiDKzgb7+yW8aS2bra6Qy65aqEwidIEnCCOZj0JllkDe0CFsKhHIZADh8H
	YLyA==
X-Received: by 10.220.149.81 with SMTP id s17mr970481vcv.31.1361976661011;
	Wed, 27 Feb 2013 06:51:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Wed, 27 Feb 2013 06:50:40 -0800 (PST)
In-Reply-To: <cover.1361857721.git.liezhi.yang@windriver.com>
References: <cover.1361857721.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 14:50:40 +0000
Message-ID: <CAJTo0LaKqwEhb0T5Kue-9LJCfh0rk1+VU88ab9aH3B4zcCxpCw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Gm-Message-State: ALoCoQn6b9NEGoCNm08KxY07QpGHyrOI1H6aU+9+qagnxBAsRK8R1azhaIJC/GMxQjizqiXxci88
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] lttng-ust: cannot find -llttng-ust-tracepoint
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 15:07:22 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 09:24, Robert Yang <liezhi.yang@windriver.com> wrote:
> Robert Yang (1):
>   lttng-ust: cannot find -llttng-ust-tracepoint

Is this also for danny to fix the lttng failure on sugarbay, or
something unrelated?

Ross


