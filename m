Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6EF73CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 21:09:39 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so14713757qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 14:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fPeDLsKjfA0RdvWIdqzUMIo2LOSrDnpLzV23WeSWX9o=;
	b=j4Gd9WIKae81imLZPcsUWTwWKlp5JgEX6wWSjkhmM1DtIBJHhoPa5UK6W+x3FnqBTD
	j822eKI+Qv3ysr+j3GWtZp7vfDnDVKaaOOKG79iZHPBKwS3BpQev0MuESBMeNWGuY09S
	Fh2sDzTvBMMumUXmHbhWNFD7W6JIOl6WvPhFMBl52eJ6i4FXEgcJECiVcufZWnGKdikq
	EDJM2CUvd2MMkwWNA1eJeKRpWQixGzpn2UejSM6wvFdaRcCsoOZwqUhQGXiC+wzHyl22
	Z9Q03nHjeHh3a94K5D2N9IkDy4ZQAKkTciiPjjfZzY/hHwe3gy9qpMhi1IEhbMr+Dlbn
	j6YQ==
X-Gm-Message-State: ALoCoQl5unpyVTAPLgFSX1tP3Tqeb7ojMr9Uop63e2pecFyaXsLGG1rfB8MAORdKXKDXglcMUfTk
X-Received: by 10.140.38.82 with SMTP id s76mr26718935qgs.10.1440018579100;
	Wed, 19 Aug 2015 14:09:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.92.9 with HTTP; Wed, 19 Aug 2015 14:09:19 -0700 (PDT)
In-Reply-To: <55D4EC10.9060001@gmail.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
	<55D4EC10.9060001@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Aug 2015 22:09:19 +0100
Message-ID: <CAJTo0LaJ=sUw9-9h4ZHUn3eQrPpODARpWyVB=94kaATi14HMHA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/22] Update webkitgtk to latest stable upstream; replace midori with epiphany
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
X-List-Received-Date: Wed, 19 Aug 2015 21:09:41 -0000
Content-Type: multipart/alternative; boundary=001a11c137eee0b969051db07308

--001a11c137eee0b969051db07308
Content-Type: text/plain; charset=UTF-8

On 19 August 2015 at 21:50, akuster808 <akuster808@gmail.com> wrote:

> Do we have any idea how long this will be before hitting master-next?
>
> I am leaning towards sending an update to meta-ruby while this patches
> series makes it way through the process.
>

I'm actively looking at it now - M3 deadline is next week.

Sending an update to meta-ruby is probably sensible, worst case the older
ruby ends up in oe-core and we update it based on the meta-ruby recipe.

Ross

--001a11c137eee0b969051db07308
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 August 2015 at 21:50, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":40b" class=3D"a3s=
" style=3D"overflow:hidden">Do we have any idea how long this will be befor=
e hitting master-next?<br>
<br>
I am leaning towards sending an update to meta-ruby while this patches seri=
es makes it way through the process.<br></div></blockquote><div><br></div><=
div>I&#39;m actively looking at it now - M3 deadline is next week.</div><di=
v><br></div><div>Sending an update to meta-ruby is probably sensible, worst=
 case the older ruby ends up in oe-core and we update it based on the meta-=
ruby recipe.</div><div><br></div><div>Ross</div></div></div></div>

--001a11c137eee0b969051db07308--
