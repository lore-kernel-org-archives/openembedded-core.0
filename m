Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.4292.1591075816085954854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 22:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=BmZBnBJ1;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ahm2=7p=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49bgbn5kS0z2Q;
	Tue,  2 Jun 2020 07:30:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591075814;
	bh=D1OYksPgZqtx1PKbUxR1lOL61QYz9jXjh7Duqqn7QNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BmZBnBJ1g4TaKEzEz6AzPr4IXRzfFx61NpQBHeZToEJMIfQndKBrO+MEZxsjAIwvM
	 nQYKQWCPT7QGf54gaeWVqKMSmoVvCCQRLbiTs3phj6udkr0qQBxsRNVaRO/xx0+wp9
	 U5iVr14WAdlVaD7BS4etkJjc1WUHVKyFQhF6a9olX9KTT6ZlVMQw6lP6qk6CPBekcn
	 LvlcKVq4dmscyRGPCStvXj9YFi5U80XVAy5Giuv07Sm1o9OmMb3fz0WZBs8wHvZ/51
	 mfh8T8UbpmbUx7dJXhM8kTdoAFcV/9TI3kLATNeuhk452XhArJ1/KkUyQDoMzsiknN
	 DbjngfJNPjUOoU+CMAfz4tue2xGhRhSS98yboCqwGQ4m3ttfd0yw5/ccLQNNEqKj0e
	 Wej5pb0VmhvHq19n8B2hbaQMcUODmxv9dwXmBMpdQGyOerpXsSLQBqSKQ6M67X/+et
	 T8kNEKKlph4Gj7sPdb6i0dAmks8lGLIhKaQzkD1azR1o40UmM5FXbl3p3fWS5YwD64
	 StPHj9M1JjklR8qiomDu+pjiqdNU11Pp3hsCefal6rfQRGmhaw4s3/Wqoghztc8UF3
	 0S6+iICSVXfzf4X2GnguC51g0Lf+hj7foeGzOr/4b42SPAegVt7rF1ojdNaHSNQeWC
	 21zrelpgjme8c621BXQp9N6E=
Date: Tue, 2 Jun 2020 08:30:11 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 18/70] vala: upgrade 0.46.6 -> 0.48.6
Message-ID: <20200602053011.GD14631@localhost>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-18-alex.kanavin@gmail.com>
 <CAMKF1spJJn+ZvGwtau_QzQiJT52_rRkj56Ys4Dt1pp=_rSJ--A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spJJn+ZvGwtau_QzQiJT52_rRkj56Ys4Dt1pp=_rSJ--A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jun 01, 2020 at 09:51:40AM -0700, Khem Raj wrote:
> gnome-calculator fails https://errors.yoctoproject.org/Errors/Details/414868/
>...

This is fixed in the latest stable release of gnome-calculator.

cu
Adrian
