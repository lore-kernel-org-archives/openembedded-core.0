Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 263B8606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 10:42:49 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id u12so56380160qth.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 03:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P2nWRfzGRuATnZzPedfkzFAFUa/KvfyjbgSxVlr8eDM=;
	b=ojdWsPaskv5PeAVIGzvP+MUrCUBjDpYeeTX1eajAO5gyVOVzkqBQq3bIpgv3bAPPMy
	+KHcR4TbyDOsN/ww83BYm0yKhjrZzLTTCw/to01uiK4Ye8ILJ94gnjAs4Vdh++9ubsQ+
	7xOB2tPOQnu3yLGuMVr0vGYq8cu8+qyPVpLXLE6uDwJzQpRFa9BziO18/JvYOAdwKTg9
	nIsB+0ARdrmQK5TQo+YDOPHj5rWhuNtGjqUMmTtO9absFimHFMSdZF4xBr8/1GH/z9eL
	Br5yWwMiT1PikgOKH4Nh16FjMin/pFpO5C/dKt+ri5IYG+Ir7dbkZ5Ft1MJZBcI8d2X6
	9Jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P2nWRfzGRuATnZzPedfkzFAFUa/KvfyjbgSxVlr8eDM=;
	b=KR6gHFYzxBVhg887whW27VsVVg6OoJKgKCC28YiEaJnjYpDjXLDTJdT0XqAptRqRa3
	KDlU68FaJhslUNWg8cAvJ19GWABCw+N2DUNEIaJtZ9nDe6mXc1W/jg1JWY0Q61xiU016
	eEX5smKv3hxEySMz3ZSf5EkckgWJYhtA0xEcGONvTMczs5BRiQJrWo15gDaX5kM5hA42
	CBWv7qvQ5/DGnsDvpxfKKdMFURfg4JLmUJ3ZLaClTAePJqx6mFmbqBB4sMhYiVXWeuw1
	cFWnJrZVXbZwMpwMwE7prN7OG5jzCJeELvdyCvKPi/L5UjI2ItFV87wO4f5I8dmxGgzs
	sThQ==
X-Gm-Message-State: AODbwcAwhD5s0+P/lhUdJsJ2DVocW7OASO7c85BmSxm3kSwT1ettg0lh
	qs+DvG25Cz5JOyB+7tjmRvimqrGL4HXL
X-Received: by 10.200.43.99 with SMTP id 32mr24547005qtv.6.1496659371151; Mon,
	05 Jun 2017 03:42:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Mon, 5 Jun 2017 03:42:30 -0700 (PDT)
In-Reply-To: <b326ca76-61c3-d11a-c497-5e773e590815@siemens.com>
References: <1496235309-30694-1-git-send-email-andrej.valek@siemens.com>
	<b326ca76-61c3-d11a-c497-5e773e590815@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Jun 2017 11:42:30 +0100
Message-ID: <CAJTo0LbQR=NCQ9QyAY+R5QZTGFxiAx610s_GsaeZzvzUhSBwuA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] srecord: add collection of tools for manipulating EPROM load files
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
X-List-Received-Date: Mon, 05 Jun 2017 10:42:50 -0000
Content-Type: multipart/alternative; boundary="001a1146fb462ae8340551342ac0"

--001a1146fb462ae8340551342ac0
Content-Type: text/plain; charset="UTF-8"

On 5 June 2017 at 08:55, Andrej Valek <andrej.valek@siemens.com> wrote:

> For explanation, this utility is used for EPROM data manipulation.
> I think, it should be useful for development of embedded devices.
>
> Is this the correct mailing list?
> If not, which mailing list would be appropriate?
>

I'd suggest that meta-oe would be a better place as this doesn't appear to
be universal enough for oe-core.

Ross

--001a1146fb462ae8340551342ac0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 June 2017 at 08:55, Andrej Valek <span dir=3D"ltr">&lt;<a href=3D"mail=
to:andrej.valek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":23i" class=
=3D"a3s aXjCH m15c774d8007f9e24">For explanation, this utility is used for =
EPROM data manipulation.<br>
I think, it should be useful for development of embedded devices.<br>
<br>
Is this the correct mailing list?<br>
If not, which mailing list would be appropriate?<br></div></blockquote><div=
><br></div><div>I&#39;d suggest that meta-oe would be a better place as thi=
s doesn&#39;t appear to be universal enough for oe-core.</div><div><br></di=
v><div>Ross</div></div><br></div></div>

--001a1146fb462ae8340551342ac0--
