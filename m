Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3A46462132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 17:14:19 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id w20so128610368oia.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 10:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nfN1NYEf4u3Cz94o9Yw9oVQ5XB6kRN2T/ATtbzhIkhQ=;
	b=oDkGi+5ZfzX5Zjdx7/MJHNZK97P8gCeelu7AE9Do8lFUe1V4V+xXGbeCpvRZ/Lk7XM
	HAczCIxQ/jBnZcsHhRqncVOXG0IsnsoyiEQCglMEAdIoQqshKbKibynojSJrk0abRcJe
	2nzIRkdp4cdpCIFn5IqU42qS4YlR5cP2jk/uDTax524M1vQUpo4V2VAucw5nEHmcjfcs
	rWkSeTpCHnObOYiacAEOjewuJXAYoOgIcIjsve9tJzk4M5ObazF7LpqPprOrwMaRc1Rm
	WoTD12bXzX88cCfq5WD0Dmja9N7/bQYsxvumsxBn/qGw98ppTNVaM/VDw3rfUYG9dDV0
	hqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nfN1NYEf4u3Cz94o9Yw9oVQ5XB6kRN2T/ATtbzhIkhQ=;
	b=LC4rK/k33P9EYmoD+5kj7LX6szt8scvS5YbmSAablsgC1Z2w6E8BtnHZCbAPe+syx7
	pAkugSRwXeSFTk5tJ9HU7hMYhFZH5ygZKO52SOKiwyvSu6vCtf3tTANUpbOPEk78IaBt
	lb8aSQmglTZimuyRTAEULtHkfKY2Ok3bCZKCXh2/8KYM1CJ3HsmiZQMEIzRa+tIwC8A/
	XvX1m1HQgt8vSC0UPsGKAZumSTiZpwdhBa5AhfWHm8JQAAEzlPAl+VvB8LkPxqeEYJqh
	urIuJH4mX1PmqCO7xdMdbaexGTUiQiVbJKA0hgbcEogKPF8+7h6FhlyvhcSyIb4+e1+v
	meAQ==
X-Gm-Message-State: AD7BkJIOOLDNfnhL0TYa3Y6y0UCpW6APd4XxHXVt8ClguN2HkdbOVKQjVcT/mtvVbdnFsjRlb+GBH40Xk2HoiyBn
X-Received: by 10.157.32.112 with SMTP id n103mr3786227ota.9.1458666860405;
	Tue, 22 Mar 2016 10:14:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.90.134 with HTTP; Tue, 22 Mar 2016 10:14:01 -0700 (PDT)
In-Reply-To: <1458666367-28283-1-git-send-email-raj.khem@gmail.com>
References: <1458666367-28283-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Mar 2016 17:14:01 +0000
Message-ID: <CAJTo0LZoLPo3rpCn8zqaJYYxuJd17j5AwH+ww3t-46FSB7dqHw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] libunwind: Fix build with fstack-protector on musl
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
X-List-Received-Date: Tue, 22 Mar 2016 17:14:20 -0000
Content-Type: multipart/alternative; boundary=001a11379eb40f76b6052ea6584e

--001a11379eb40f76b6052ea6584e
Content-Type: text/plain; charset=UTF-8

On 22 March 2016 at 17:06, Khem Raj <raj.khem@gmail.com> wrote:

> - Move SRC_URI to bb, helps with devtool workflow
>

<insert moan about bb/inc splits for no reason here> :)

--001a11379eb40f76b6052ea6584e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2016 at 17:06, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":cs2" class=3D"a3s" style=
=3D"overflow:hidden">- Move SRC_URI to bb, helps with devtool workflow<br><=
/div></blockquote></div><br>&lt;insert moan about bb/inc splits for no reas=
on here&gt; :)</div></div>

--001a11379eb40f76b6052ea6584e--
