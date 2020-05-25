Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web10.30560.1590410828680821854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 05:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49VxgY0T8tz5tlC;
	Mon, 25 May 2020 14:47:05 +0200 (CEST)
Date: Mon, 25 May 2020 14:47:03 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Ramakanth Kesireddy <rama.kesi@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Meta Qt5 Qt 5.6.3 compatibility with Yocto 2.4(poky)
Message-ID: <20200525124703.qrdrgubsxpur2zvh@qschulz>
References: <CAFi1RNj7=wqUK1ebdfKSpUs8uQkXe_=wDvPJDqPHOHBn7xr5mQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFi1RNj7=wqUK1ebdfKSpUs8uQkXe_=wDvPJDqPHOHBn7xr5mQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ramakanth,

On Mon, May 25, 2020 at 06:06:34PM +0530, Ramakanth Kesireddy wrote:
> Hi All,
> 
> Can anyone please  let me know if Qt 5.6.3 LTS is compatible with Yocto
> project version 2.4 ( poky ) or not to build meta-qt5 recipes of Qt 5.6.3
> LTS?
> 
> If so, where to pick up the meta-15 recipes for Qt 5.6.3 LTS open source?
> 

We're building meta-qt5 from krogoth branch on thud currently. This
branch has the latest version for qtbase (5.6.3 release).
We've a few bbappends but they do not seem to exist for fixing build
issues :)

So, try and check for yourself :)

BR,
Quentin
