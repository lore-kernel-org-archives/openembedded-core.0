Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.48981.1590493790047281222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 04:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49WXLz4bdCz5tlC;
	Tue, 26 May 2020 13:49:47 +0200 (CEST)
Date: Tue, 26 May 2020 13:49:46 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Ramakanth Kesireddy <rama.kesi@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Meta Qt5 Qt 5.6.3 compatibility with Yocto 2.4(poky)
Message-ID: <20200526114946.a5t6vqm53y5yj7qr@qschulz>
References: <CAFi1RNj7=wqUK1ebdfKSpUs8uQkXe_=wDvPJDqPHOHBn7xr5mQ@mail.gmail.com>
 <20200525124703.qrdrgubsxpur2zvh@qschulz>
 <CAFi1RNixUb9p+Lfp+XfDMdLw21gEv95J9xGg+=ByYcahFPBTTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFi1RNixUb9p+Lfp+XfDMdLw21gEv95J9xGg+=ByYcahFPBTTg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ramakanth,

On Tue, May 26, 2020 at 04:39:26PM +0530, Ramakanth Kesireddy wrote:
> Hi,
> 
> Thanks for your mail.
> Do we have
>  Meta Qt5.6.3 recipes for Yocto 2.4 Rocko branch?
> 

As I said, I'm using qt5.6.3 on thud with the krogoth branch of meta-qt5.
So a meta-qt5 meant for krogoth, but used on thud (2.6.4). There aren't
always backward/"upward" compatibility issues, so really, just try and
if there is an issue, ask about it. It takes you less time to try that
to discuss this on the mailing list.

The only change you need is to add rocko to LAYERSERIES_COMPAT in
meta-qt5/conf/layer.conf and a way to do that outside of meta-qt5 (when
you'll want to distribute your layer or commit it) was discussed yesterday
on the ML.

BR,
Quentin
