Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4C15171C29
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 21:47:12 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id x186so78305119vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 14:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sJHhmrQQneeKWbnh5oVe0WyrBTLmKsiUMS3/TDzGJW8=;
	b=YwPMUhMXwHq9Rq0Qg/L0dnElc4018gDPbeRgjIvDAMVYtueubX8fTSnFdIeu9JVivQ
	ljJJoKSyLufJTWgr4w66cS1gYjNVUSdE3tvOkJFn7MvMIN5OrrZyTGC45e4oR+WXm2Hj
	hW3BB7QOucS+3s5syPsrP/qkdyL4oOtv9G+eaeetyjRUIEk6PQQbg1KVKycCkQNKTkKx
	fp/+yaclTWT9sVkcgrPsLVtPOQaDG+eY4j5Q+e08GCnYKMuydQS2uw/bpBeqfhKRbmZK
	CjkgioPzEEI97LscZC5NRJosqIM41sQe63iLKkWJ/4NuZLgWaLOXhLVZO2gtB0kWMv7X
	LkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sJHhmrQQneeKWbnh5oVe0WyrBTLmKsiUMS3/TDzGJW8=;
	b=arJfjjcuFve5bDRfkILAJBmff8qRTAFCOz20HINGShI9bCpAWC3ovHEKfWNLCKJ60B
	nzBcjieYSbZDg85IN+ykxsruZoufe8hSU7uOhFdOzsUwWS6PKJRO5UTDD8D0LQzD9krl
	1bXaZTzk1CcYXHC+KS5JsShTBkvtrSWoa8rpD492DG6pGm+UhFJ+0vjiojPGkB0/Zg1s
	6sYnDOMN7r3BtdvT0x/9bUwrE3Ehr5q9N4Y7cNiGPMwnJsPkfNadTkFtsQVXHrQVXfGg
	L/s5jGu5/NPFOnuwPkof5d/s2NEI4EwaPoAQB/SvB7FmEkw2K/KMLOC2pOLisuEsQMrx
	TEGQ==
X-Gm-Message-State: ABUngvdKEzrbkgV2SZsFAxlLlSgQAb1XpD3hSsMnuKsHFOdftdEr3VJaR0SYWxuDjekVH9s4LOCNLFfM8y7HUw==
X-Received: by 10.31.197.194 with SMTP id v185mr13080643vkf.84.1478296033631; 
	Fri, 04 Nov 2016 14:47:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Fri, 4 Nov 2016 14:47:12 -0700 (PDT)
Received: by 10.176.5.136 with HTTP; Fri, 4 Nov 2016 14:47:12 -0700 (PDT)
In-Reply-To: <CAMKF1sp=ZHOP4aY7r11kvURBymq4+uknmeiSGQyP9BUpW_WXBQ@mail.gmail.com>
References: <20161104090719.30795-1-li.zhou@windriver.com>
	<b3c8d5de-1d26-b37b-e28c-f8cca01c9ba3@gmail.com>
	<CAJTo0LY+kSzuoa6Ub2fFweuNBXu6pmOaxs9P_z9EtoqVztdYRQ@mail.gmail.com>
	<CAMKF1sp=ZHOP4aY7r11kvURBymq4+uknmeiSGQyP9BUpW_WXBQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Nov 2016 14:47:12 -0700
Message-ID: <CAMKF1spFecRtpMGu4kRthX-hY=KLQeRAogyxMAZsvgc0GSyLmA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Fri, 04 Nov 2016 21:47:13 -0000
Content-Type: multipart/alternative; boundary=001a114e7294f524f30540809d4c

--001a114e7294f524f30540809d4c
Content-Type: text/plain; charset=UTF-8

Not sure the atomics in newer  compiler and libc has ever been tested in
this version of db

On Nov 4, 2016 1:29 PM, "Burton, Ross" <ross.burton@intel.com> wrote:


On 4 November 2016 at 18:22, Khem Raj <raj.khem@gmail.com> wrote:

> it would be good to keep this for older < armv5 arches
>

Doesn't the C library support its own atomics for those?

Ross

--001a114e7294f524f30540809d4c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Not sure the atomics in newer=C2=A0 compiler and libc has ev=
er been tested in this version of db</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Nov 4, 2016 1:=
29 PM, &quot;Burton, Ross&quot; &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt; wrote:<br type=3D"attribution"><blockquote =
class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"quot=
ed-text"><br><div class=3D"gmail_quote">On 4 November 2016 at 18:22, Khem R=
aj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D"m_1351664721590043198:2pr" class=3D"m_1351664721590043198a=
3s m_1351664721590043198aXjCH m_1351664721590043198m15830a5417ba21c0">it wo=
uld be good to keep this for older &lt; armv5 arches<br>
<div class=3D"m_1351664721590043198HOEnZb"></div></div></blockquote></div><=
br></div>Doesn&#39;t the C library support its own atomics for those?</div>=
<font color=3D"#888888"><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></font></div>
</blockquote></div><br></div>

--001a114e7294f524f30540809d4c--
