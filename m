Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.32106.1623686782212003185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 09:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 33C922000C;
	Mon, 14 Jun 2021 16:06:19 +0000 (UTC)
Cc: Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [OE-core] [PATCH] musl: Set UPSTREAM_CHECK_COMMITS
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20210612221006.2888173-1-raj.khem@gmail.com>
 <8825b363-ef7b-626c-908b-a2c6405410ff@bootlin.com>
 <CANNYZj_3wjJSczi0pNAoHxhGF=TmyH9Tgz0nR3GR1TdY0Qrv2w@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <7dfedf94-c702-0be0-5c65-5e414a14516b@bootlin.com>
Date: Mon, 14 Jun 2021 18:06:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj_3wjJSczi0pNAoHxhGF=TmyH9Tgz0nR3GR1TdY0Qrv2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Alex,

On 6/14/21 3:17 PM, Alexander Kanavin wrote:
> That would be very useful, but you should check if the entire
> nomenclature of UPSTREAM_CHECK_* variables is documented as well
> (_COMMITS, _REGEX, _URI, _GITTAGREGEX).


Great, many thanks for the advise!
I filed a bug to keep track of this need:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14431

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

