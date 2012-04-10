Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHaZO-0001i5-9z
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 14:53:14 +0200
Received: by wera1 with SMTP id a1so3181098wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 05:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ekIbTm24X5vheVr2T+tO/hdBWHj1yPsQjVE8klMg+Qg=;
	b=irkFwIF48SCwY0fIHEF5qtrf5XMo2zNvkZkqgFouepB9ohJfRFfXvT6Hsu44FZTs2k
	NM8PkKoa/9/QuY/FZyeFUtHtUtLxJON3QpPWCMsaQYIbxhK/EzE/Qsh0nWb4Yths3kWD
	vfxofs58k6QTk8a8diCCC5odJPbCHQUEM/5OoYTnQ0Hn6WXkAeXDlPYOLLSXbdsRB+xj
	T0qJZxWQ3ji4kKs98HymcPa7BIiALw1oTAJT0EO5rDI81x4cTOMB7367lQ0dgE/BNwMr
	IluoIE/6b7uEU/zsYm740qlc8ZxTOq9YdsMn5doc9YBwO7FuLp5655HmrS80UuWDYndd
	Z0bg==
Received: by 10.180.102.101 with SMTP id fn5mr6743272wib.6.1334061836633;
	Tue, 10 Apr 2012 05:43:56 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm60765198wib.7.2012.04.10.05.43.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 05:43:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334059689.6861.64.camel@ted>
Date: Tue, 10 Apr 2012 14:43:54 +0200
Message-Id: <A198CC49-4A41-4A49-80BF-6FE2E1DD391E@dominion.thruhere.net>
References: <cover.1334027369.git.lianhao.lu@intel.com>
	<0953244152d03d27f6c60729c58484af81f95a1d.1334027369.git.lianhao.lu@intel.com>
	<637B72D9-1F2D-4CD3-8903-36E73E7CC465@dominion.thruhere.net>
	<CAP9ODKrEiLo7DMkNBks8s8jHw=WgTQ3S_zf-QUYSseLqD5tMEQ@mail.gmail.com>
	<3FB0FE38-93D2-44D1-9BFF-2E742A8BEA92@dominion.thruhere.net>
	<CAP9ODKrkEomQ+7G5eRAwhKCWiKezAEKwboTfZG8C3sAEdo9PGw@mail.gmail.com>
	<1334059689.6861.64.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkYMkOHFFMrvQtKtvd12hztawR4nSIrxB57rY5tyUzzfq57EwX8vQ8N5nA6613vQzSL+rcW
Subject: Re: [PATCH V2 1/1] connman: optionally build ofono plugin.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2012 12:53:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 apr. 2012, om 14:08 heeft Richard Purdie het volgende geschreven:

> On Tue, 2012-04-10 at 08:27 -0300, Otavio Salvador wrote:
>> On Tue, Apr 10, 2012 at 08:24, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>> Can you clarify what is your concerns?
>>>=20
>>> It changes the default behaviour. There shouldn't be any behaviour =
changes so late in the release cycle.
>>> And apart from that, it should use PACKAGECONFIG :)
>>=20
>> I agree about PACKAGECONFIG but this behaviour change seems =
acceptable
>> for me since most users won't  be using 3g and will be not affected =
by
>> this.
>=20
> So how about we just add ophono to DEPENDS for 1.2 (since its implied
> and enabled as things stand) and then in 1.3 we use PACKAGECONFIG?

That works for me.

regards,

koen=


