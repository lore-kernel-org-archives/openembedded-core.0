Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9182976947
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 20:29:03 +0000 (UTC)
Received: by qged69 with SMTP id d69so147938603qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 13:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tyeJtYIfpNIAsNr9et86bKUE8ItP0ZVq64rDRlNTVYE=;
	b=lbKUtP5f5TIN0G5olWpCx6KMyLOXC2Ut6AevEc/5M9Ek2Y2uvakuPljJNfQ5f9aVPl
	AQZnj3Yzo5cb0CfuBwp0oCCudMllM9zU8jpmwMCfa7072qUfLIXEUuWE5HoAddW7MWw+
	ZewHu+2SJWjP18L7fpLH6FhRfytCPQezFaBFtEycGJPyFCBC048FmlgtTQakdL13/7Yz
	YsafaDtQP8FG0eHLS23DSuNkZ1pS5liEZ4e6d2mEWSxtC4WXMVpSSEdvfEzdXAbcCV7G
	paZVQHvJgntKiKHkkPZlAEqDbdk+47uWDleqJZrzRzgzSjlRZgFrfOP6Ax6ZL+rOcaS9
	jegw==
X-Gm-Message-State: ALoCoQno6naTWB0POF4dMeiVwezt5eQvcdOHXOsjF/gFI0qnyDMsczmtfIPUSNwTrkWbaco6porb
X-Received: by 10.140.33.164 with SMTP id j33mr43171939qgj.77.1439324942981;
	Tue, 11 Aug 2015 13:29:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 11 Aug 2015 13:28:43 -0700 (PDT)
In-Reply-To: <CAJ86T=X3H8irDHCkohwFCdqou_-BuZLqHz7CYiAA9dqD5LruDw@mail.gmail.com>
References: <cover.1439204506.git.jussi.kukkonen@intel.com>
	<bf492f53a8df38b0f7d51f9e5409167d022dc291.1439204506.git.jussi.kukkonen@intel.com>
	<CAJTo0LZPwjPuxgnnjvAyqhBWoK8JWJdMOO2G6MGGgj1An6FxUg@mail.gmail.com>
	<CAJ86T=X3H8irDHCkohwFCdqou_-BuZLqHz7CYiAA9dqD5LruDw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Aug 2015 21:28:43 +0100
Message-ID: <CAJTo0La5e49wG7u4FquPpmRz-dBP4o4yH1kb3B_K0R4VaEFdNQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] screen: Add version 4.3.1
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
X-List-Received-Date: Tue, 11 Aug 2015 20:29:06 -0000
Content-Type: multipart/alternative; boundary=001a1139bd9cf188df051d0ef302

--001a1139bd9cf188df051d0ef302
Content-Type: text/plain; charset=UTF-8

On 11 August 2015 at 20:54, Andre McCurdy <armccurdy@gmail.com> wrote:

> > Is screen considered sufficiently core that we should maintain both GPLv2
> > and v3 recipes?  I'm not convinced it is.
>
> Is it sufficiently "core" to be in oe-core at all?
>
> Or maybe it's time to replace screen with tmux?


screen or tmux is a separate debate, but I believe that something like this
is good for oe-core as it's so useful when all you have is a serial line to
your board.

I don't believe that's enough to keep two versions of screen in oe-core
though.

Ross

--001a1139bd9cf188df051d0ef302
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2015 at 20:54, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"=
mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; Is scr=
een considered sufficiently core that we should maintain both GPLv2<br>
&gt; and v3 recipes?=C2=A0 I&#39;m not convinced it is.<br>
<br>
</span>Is it sufficiently &quot;core&quot; to be in oe-core at all?<br>
<br>
Or maybe it&#39;s time to replace screen with tmux?</blockquote></div><br>s=
creen or tmux is a separate debate, but I believe that something like this =
is good for oe-core as it&#39;s so useful when all you have is a serial lin=
e to your board.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">I don&#39;t believe that&#39;s enough to keep two versions of sc=
reen in oe-core though.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a1139bd9cf188df051d0ef302--
