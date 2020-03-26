Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.3515.1585249967628009410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 12:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=QC1zbzcL;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=rbqv=5l=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48pF4B0tP2z3Q;
	Thu, 26 Mar 2020 20:12:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585249963;
	bh=vUgNi+otLxQ7sfEQfnYTz3EWFo0RSJfiJ31x5KVb4wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QC1zbzcLm3vi3WfXLy2oKGWJ1P3hnSHHGeeuuDV8MDge1ecrdbJ7Ce59H0iRyfExI
	 b1DF4DK42zWQkHPWgQE9vbhnXZBmMLKrulpJwtXMwRknrRje8T2WKKNHlnazX5JU44
	 gHy6d8PSgwMLfJdCr0jB3txqu2UZzc4w0Wo4DKx1fEQvaaBZ85ko8eGzfzMUnJ3B0C
	 Y5JgEQ7/75L14+6hf4Tha41Y+60o81jVDycdNPHAby7Nx8eDxFFkWIBBlWt4fcazzC
	 SMCWJcq57Heq1m9aaMBq4MEbO/sN63KbswDildVs7mEhdoyONpa9Dd3RX4Z75w4UuA
	 CccGEzLrkdJoNEwiFBuhLJ8TngE65uSY+EjuEHQVZhHugmoihhnLLoaa74ViiMhY4L
	 gOHMnRxlXPM4xn2t75+yURtj+AVgterzU/FC+rpxlGSA0lzFYkztJ+4Lw0alTC/aZ8
	 sOzzVS1yDMYckb7zYJT7YJZllMJR4QLQsFQLeAhAHb6208hagIXg59bUfAMSN8wYTG
	 PUGC7BuU6YfXvby1ozvJYnoKOjsPoFDlH0bUGNG5jFtXoSjyXu0CXvTrppafSeJuDL
	 aVAiMDNkU1ROQR+mfiWm+ys9/oE+O/A+vDCCTXbtsu9fc7rfwBlG7TRmq8bIbCvqn7
	 pBOjRVhovme2sTTVFtR/lAUQ=
Date: Thu, 26 Mar 2020 21:12:40 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Andre McCurdy <armccurdy@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][RFC PATCH 06/13] systemd: Add PACKAGECONFIG for sysvinit
Message-ID: <20200326191240.GA5401@localhost>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>
 <20200326085426.117209-7-alex.kiernan@gmail.com>
 <20200326145614.GA26693@localhost>
 <CAO5Uq5Qz2EpUZUFGfRy-6BTrLZuK9sm7bTarmkCwZM9RA5eysw@mail.gmail.com>
 <20200326173258.GA31846@localhost>
 <CAJ86T=UWhfdQ9-F8QfbbHHW9r8BYGUgQhWjj_1Q6J4m1g482tg@mail.gmail.com>
 <CAP9ODKqAc3sqEZDFfS7J1NXuBrNCu4YSBVXt6_8Ve+Mrzbo41Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqAc3sqEZDFfS7J1NXuBrNCu4YSBVXt6_8Ve+Mrzbo41Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 26, 2020 at 03:32:21PM -0300, Otavio Salvador wrote:
>...
> The patch seems ok for me. Besides, you can override it on your custom
> distro if you have a weird requirement.

The "weird requirement" is that recipes that provide an init script but 
no systemd unit file should continue working when using systemd.

And in any case such a major change wouldn't be appropriate after M3.

cu
Adrian
