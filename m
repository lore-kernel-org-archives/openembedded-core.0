Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web12.3269.1627400899511620728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 08:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=ASYpwV6v;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id B106C2E8939
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 10:48:18 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1627400899; bh=mI5J4k6rUuy81e1kAYg1llFAqxlrghiT254qqGTiUlY=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=ASYpwV6vPLxg3/FsYYIyafpgrZBLQaAoyAFPva6jmdi21ONt1mb2zdSINaVhuIlDT
	 mqLTdHafr0Z0dujsV1mu0Civ8ZqwSFLphEZWOV8b0462rIgDcsBvwobzP12u7uei/G
	 8SHtaaRXK5tYpFT6r+Wnsaza0FH+w+GB3yuApP0cIkUjSzr10P/+eVL+RpoCbm6oP8
	 n00kcYH6VhogNVlf/UeUzoTaE8bAjnGiESlkseCMPzBUpJu5DLzL43XM1W/RrczJqP
	 ocqTyRV+T0BwaE3GW8dYD7oIq0/KqJq3AOa4ZvhU7srSEvgzpxScau4qFEf6ZV/6g4
	 OxVIWsBYQ6SWg==
Date: Tue, 27 Jul 2021 10:48:15 -0500
From: "Seebs" <seebs@seebs.net>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH pseudo 2/4] Do not pass null argument to pseudo_diag()
Message-ID: <20210727104815.0f0925b7@seebsdell>
In-Reply-To: <20210727114906.191837-2-dwrobel@ertelnet.rybnik.pl>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
	<20210727114906.191837-2-dwrobel@ertelnet.rybnik.pl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Jul 2021 13:49:04 +0200
"Damian Wrobel" <dwrobel@ertelnet.rybnik.pl> wrote:

>  		pseudo_diag("couldn't allocate absolute path for
> '%s'.\n",
> -			path);
> +			path ? path : "null");

Is there any actual code path where pseudo_root_path gets called on a
null path? I don't really object to the change, but I think that's
caught by guards elsewhere.

-s
