Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.3922.1585049880895431901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 04:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=McRPOsSG;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=etaf=5j=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48mq4Q5dRhz4J;
	Tue, 24 Mar 2020 12:37:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585049879;
	bh=qXhkjxlRHCEpcqC9AKPFQewIWP0h1mqonCZ6AJOo9xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McRPOsSGI+j4lkj2cOpip8Am3Dg6E12XqxQXdlMDOqBgobf8f1WiYRRSpkBWuX9vY
	 yD8LgSLWf+4UuqCjGPDqbg3xZ6Lyqpc6p23AjGhhKlPWe5erVOj8HVBnjTD0d/d4Nb
	 Wgc+N6752zAlLfPS65847HKzOU2XhSFROjRL3D06U7l2xquJMpWfF6DUGAaauNCKi5
	 k/QUu6nDDjlaYzehvuOIVrlNfwBr2NPdiFkwYP/bi+tKDzgnMMOP1Ozm11BZbWZTAs
	 uvNj2DNDw0W585eGNRUqLVn4QarFbtXLZ6AoUx9oGzDFwFTIVkGzRmEFVIw0wvuYX+
	 6ibscd2aBgkl5hbfXtE7pWKVncn6NV35VU0feSoV54mCeqtGz72j91Uk6lVMMrW/3G
	 yENNyfIhyn6eyv07O6wdO8JB2NjjWse6SUeFjn5GCsmPWyhxFsm5XN4XYBbihEqhav
	 Pz+2f5teu5MYLj00hzfx4nz7tWgvQ5vMs+zLNrduOHqehfgvhIYPG0+tK6DGyjQ7yE
	 Hxaj8CN+cOpw5mdk8lDzRBkzXPyRiUCk87ywOxUAfxq4CjM1nMS1T2MasZsv5CF6VD
	 teIjpnlYfrk+5DY4J8mO9bLvY3DGiymR+/LUyJsXLmiZ2IA7zyjcFEqvH/kWTs/+NR
	 rKLT/o6+eDLNyP67zEdaZKhA=
Date: Tue, 24 Mar 2020 13:37:56 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lto.inc: Add global LTO distro policy file
Message-ID: <20200324113756.GB10278@localhost>
References: <20200323232529.3658577-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200323232529.3658577-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 23, 2020 at 04:25:29PM -0700, Khem Raj wrote:
>...
> +LTO_pn-python3 = ""
>...

Building Python with LTO works by passing --with-lto to configure.

cu
Adrian
