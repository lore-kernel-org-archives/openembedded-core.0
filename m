Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.59.1591805263700203893
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 09:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Gfz63IJr;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=0vpq=7x=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49hsMF024qz4M;
	Wed, 10 Jun 2020 18:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591805260;
	bh=iZM3E1rPPleNus0bqiQBWBZ/UNoJLWWPhAjFXUf5qqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gfz63IJrjJdVsIH1Mhy0EHM6wDCOXxFJ819yGsDutQENXcFryPoQdwMzyqtTyaoVn
	 9+pQmC4gBWupIlUhvu4IhOtRycYYpf//jWpQmjS4dkOt1bXy+9Nu4fuLVxieWDnmfV
	 AlBiYMFxGf96EtBoa/JH5id8wYuGDtInlIZUWI+NNbzWPmdfb/6f5EUeHuokqVu1mc
	 bO3aYpV6bpZaquMyDSnc/bmrZV1zZAM+iQw1q6hYotrcQTtJUcnl+SA41EkFtkx09/
	 BpOCkJPLsdcXDJQDrPRcEZja8MW1PTApf3QrAluq5xoo5pq76nN2pHH+qJd9FYX4Xc
	 gy5maHBqt2ckf2PPUnTEs3PgBLDuIJozfkdKGqNKxQNrMzrErBDkF1wqCuDcm+0Dpn
	 JQ9NrhQwLRKXbaUTW15/4TFA8YonL+bUgXcBTX/pd4OASmvPwTzJEazGH3Vi0P+Y8J
	 kfThZAcuXdtMOBv5UbkhmjUaZCVudvOK4GIHntbnoTVsp6fM0XUdmTg2WdnFgdIXOc
	 RIWvSy0qvZ1/ZYXdCY1B4oVurJL02X5B0c5uWaWy6veRPTOeu6aQjslexzNBLEuugR
	 OgUejm+Ob+y7pw6SJG6YVUiE7oP1OAg1tczcWUA0eaEj40kLaKuyU68PxP4WfXds7p
	 AGLjdJISq+HY0t4nj81U7qOw=
Date: Wed, 10 Jun 2020 19:07:19 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Openembedded-core@lists.openembedded.org, tmark@isc.org,
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: Re: [OE-core] [PATCH] dhcp: use included bind version
Message-ID: <20200610160719.GD24380@localhost>
References: <20200610143520.2727827-1-uvv.mail@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200610143520.2727827-1-uvv.mail@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 10, 2020 at 04:35:20PM +0200, Vyacheslav Yurkov wrote:
>...
> BIND9 libraries support a lot of options specifically geared towards
> optimizing DNS operations, many of which do not play nicely with
> ISC DHCP's "architecture".  It isn't necessarily practical to build
> those libraries for both purposes.
>...

Providing security support for several different copies of the BIND
code would be a nightmare.

cu
Adrian
