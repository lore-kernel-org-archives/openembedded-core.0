Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1BEC87653B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 19:03:00 +0000 (UTC)
Received: by qkcn129 with SMTP id n129so21510741qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 12:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7W+D2iNvwpP8ZX3yT6thLyuTS7sbnn0oDfecuZG0vQM=;
	b=ibJlE5Eji02EPtPtW30/h8TLZpT4FRU+at903nfvCWEQwY+69EX4jqrJexneyLzqWZ
	H6j/CcDo98xZJ4Cn17tY9OYr60q97YOrNspcxkaPfZpYpbk6KnWxdpBe/HnnZEVxYC7d
	znjit6j+GfAYVvn5P7i8OedDLs5I1kvrxPTeELfz3y3ToOK2xqSE8Wu+URVYT+sj+dG+
	x3YR28CQDMpYLctBPkKHQF4S+3gR1JBaXP+hbM3mtwG4S1eZDQEdWBEWV1/c8MMx6WOP
	YHinVhcTrsl3DxaIbmdnQNwuw54tvVzPQlVPOQZpWg5iX4aMDhWv141mEQrrLv9qAZp0
	3iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7W+D2iNvwpP8ZX3yT6thLyuTS7sbnn0oDfecuZG0vQM=;
	b=l1LVITQ/SoV2Yd1fMjRQeUlPI9nDjPnRs6Aqp5pL3ny9EYWdqHCEdKUUoJ1CiggjWm
	5O6W40A8lYSaTNspWNoU3zyWI07ezpR8Fy9HAPxJMrE58aRsUie1Z3xLzH4y/FW8d2YC
	9EWyCi1SvWyeGq0BN3HSZXgJXWFAdet1wbSLCd1H1WgtJ34q5DjCDUtbzha9s70MoLQu
	qkD3HxANZJAGgcymea5CP57xlmc89ttvSflY6rLsSkwewqIXun2ZtB61AflzpAiwwCfr
	3Q/0GWGwdQdStVa7eVS33l3le1NEaLI4IGPKAUrAJjWC3B0zJPuGVT067Ba0NJKn95/4
	8VRg==
X-Gm-Message-State: ALoCoQlkRYDL1t9/kOeIqHQFYa9m0eTTDySpgDzsreaJMgQS9IHfDEQpE5AtzUzO8DYejj77lj2p
X-Received: by 10.55.72.70 with SMTP id v67mr4495949qka.83.1446145380366; Thu,
	29 Oct 2015 12:03:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 29 Oct 2015 12:02:41 -0700 (PDT)
In-Reply-To: <CAP9ODKrj3XrhrUBjp7VssdqWbeMvKNm_iJSSQY0L7h-S7DmyLg@mail.gmail.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
	<16FB52C0-E87A-40C9-A677-F1220982FB30@gmail.com>
	<1556288.oU3CJGhmjq@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKrj3XrhrUBjp7VssdqWbeMvKNm_iJSSQY0L7h-S7DmyLg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Oct 2015 19:02:41 +0000
Message-ID: <CAJTo0LazGKCMy=_Sf3UjNPvKm0vDC2bfOL-sFNDcQ7a+10q_Aw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Thu, 29 Oct 2015 19:03:01 -0000
Content-Type: multipart/alternative; boundary=001a114a97f6b0e76b052342f5b9

--001a114a97f6b0e76b052342f5b9
Content-Type: text/plain; charset=UTF-8

On 29 October 2015 at 12:37, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Due the memory leak fixes, I think we could consider the backport for
> 2.0.1 after it proves stable in master for some time.
>

Standard practise would be to cherry-pick the leak fixes, unless you can
convince the jethro stable maintainer (whoever that ends up being) that
nothing will break with an upgrade.

Ross

--001a114a97f6b0e76b052342f5b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 October 2015 at 12:37, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":2j" class=3D"a3s" style=3D"overflow:hidden">Due the memory le=
ak fixes, I think we could consider the backport for<br>
2.0.1 after it proves stable in master for some time.</div></blockquote></d=
iv><br>Standard practise would be to cherry-pick the leak fixes, unless you=
 can convince the jethro stable maintainer (whoever that ends up being) tha=
t nothing will break with an upgrade.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a114a97f6b0e76b052342f5b9--
