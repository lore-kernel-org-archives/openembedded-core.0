Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id BD16877038
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 20:51:52 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id g6so29082264igt.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 12:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SyZDSZVM6d6vbZ+Dmb1yIVfhXs/P3BTBAM44E/6vQmE=;
	b=emJ3CSTigrqrJZlhtp0m66+uwWRw+Q2n0HoHDQEgpecwvCemv+Bxev9zMCTx9k10gt
	r8JghB46OOPls8hX89sN0PyCbyITZKHh/GqjbBeFT4Zb3lkh0BmP5RIJfSiZOOkt4TzL
	FwEIRs6FvzfzKRHeTIDNF+eapnRqGH7cQXA+Pwm4B6rRpyH0r++TBMh+fCWTsGWy9AL+
	lyuCxnkIEOjLFqdmrhecn0EX+HwC7FOy9GiS1KkfQqbcBKghAM//SA57PSbikd1wRjyU
	EW2IkI5oZIJs8j53g9XrkAZO2FeHdOWLkTt7dyU6VJSK/lfFxm/6qO1nESktMnq5FBOA
	ewzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SyZDSZVM6d6vbZ+Dmb1yIVfhXs/P3BTBAM44E/6vQmE=;
	b=hOuE5oEWxMNuhpFWY2rfm/8fLQa5u6ESA4+bEqIfZpbgKxtNJiEkqDyOkYPFLQcbWv
	RzrI62OvkfP1V6vk/W1C1EpWCYGFjCYmMcqHeHHLSPF+imyAbIGqtywn9y0pZY2I5CQv
	Fv7awqxRHPvWqtRhWhPkqrDsQQKtTWxZDhOTB8Os2uMPMlsfC5o5vsF6TOKDjDOIRH6k
	NZ+yyGxLW0ZIx9Pm2XeqibIaw96tqJJF8jQcGWweXR/DAuH3YXlRUpsCWkty6t1L+3Gf
	ON0eYjceIsJ9KSkzLNyQrfjKa/OIlgM1mrtYmLbk51WCfhNe1ReTivekG8eR2AGJqihB
	WLSA==
X-Gm-Message-State: AD7BkJJD9wMj53x9Bb0QKO+je/vsliyfm/yXS8CZ7aOc35/6R8JnOgy2FNlggyy40dqJgwqUWDTMKvWzJRAsvFxz
X-Received: by 10.50.112.101 with SMTP id ip5mr1138551igb.52.1457038313515;
	Thu, 03 Mar 2016 12:51:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 3 Mar 2016 12:51:33 -0800 (PST)
In-Reply-To: <CAJTo0Lbuy6FTWVvtia_+ux03PazpDx0k65Ksu3EWz+9g23VzgA@mail.gmail.com>
References: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
	<1456778449.11498.183.camel@linuxfoundation.org>
	<CAJTo0LZ6RabE0C2o4wjuKQRbgikjc3f+CH8RF=j4RdVP2nu=7w@mail.gmail.com>
	<CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
	<CAJTo0Lbuy6FTWVvtia_+ux03PazpDx0k65Ksu3EWz+9g23VzgA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Mar 2016 20:51:33 +0000
Message-ID: <CAJTo0Lb5H-OAFYWS+BO0tC7PF5Gq_+O3ZL4+Oxj8m2V82k7DFg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Thu, 03 Mar 2016 20:51:54 -0000
Content-Type: multipart/alternative; boundary=047d7b3a84581a2eba052d2b2b2b

--047d7b3a84581a2eba052d2b2b2b
Content-Type: text/plain; charset=UTF-8

On 3 March 2016 at 17:19, Burton, Ross <ross.burton@intel.com> wrote:

> Would it be possible to force a -static argument into the link of the
> internal readline to ensure that a static library is built?
>

Answer: yes.  And it's upstreamable as it's obviously right. Patch incoming.

Ross

--047d7b3a84581a2eba052d2b2b2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 March 2016 at 17:19, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">=
Would it be possible to force a -static argument into the link of the inter=
nal readline to ensure that a static library is built?</div></blockquote><d=
iv><br></div><div>Answer: yes.=C2=A0 And it&#39;s upstreamable as it&#39;s =
obviously right. Patch incoming.</div><div><br></div><div>Ross</div></div><=
br></div></div>

--047d7b3a84581a2eba052d2b2b2b--
