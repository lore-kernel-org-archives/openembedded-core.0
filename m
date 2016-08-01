Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 76BB6700F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 17:17:14 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id b62so189089984iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XTDmcGR5ZfTHUN6i38YGZYq4bqRzhuE4Co/BSEH6Yto=;
	b=XniGl6GkHJOF4N4OwEmnu14B3M1FChdEm6KxAQFCSEijOtiKdlW84uXej6Vobtqud/
	w4iDsdzkfUYxy4fTo53eHtXDt27mjdALH1G7xOk6o6jCADFD5VaogUy7FfM0LfPCb8/N
	WRHCINUefWBEqPBmuRWN/k6TUhzoqvh1V/5DIZeFW8Da7+XwN84vMJKyHLJXKWyXo+ZL
	ZwSvKiWXjR+jtQec9pMtqvrFSxEMSK4ISuci6B8IiGAaHzLZVLQr1l1v2wFw1dWBH//7
	iOT6f8VAp0Egk9oOG4rdDv4oPDeVwfnL658jbmgt9T1Y3dOmgFfea5cTrgEJFYbseGGN
	W0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XTDmcGR5ZfTHUN6i38YGZYq4bqRzhuE4Co/BSEH6Yto=;
	b=Jmly26B+GfRWe2bFNl6y9GFj1CZ/DTvLA4pPQfOeAvZMb5rO3JoKdwTJsETiKgSlJV
	/UmIPYlBONtAPNwfKzdDFEoXvB3IsDBoeqGIQb3nLIq+t3Uhwu7F7U+uM8gjOALViN7e
	4jFBlYVKU9xm7cTrAw7k788q5AwKEgEyMMdTZlsNFDP5iupvUQt1uAufA26zopSjKaLw
	+UlRtFzIg+Dj5Iw0xYhtUBQOdK2M8Cf3o0FT7XCdI0spZUvG9jlmWuojQZjfdRyXf0wv
	jEbEJDnsR9+dBX4Aib6Y5aHZM9PfJcVZhYZkT5CXeUOUZDOsZ7QuQxgrJEvZLTx2AAZl
	ODbQ==
X-Gm-Message-State: AEkoout1cedqgqHSESWzGGKvkM5PSyAyMukTHCzdKGiPasfysFP4g5PkNtD1UUv95zWcbJVLUimczVjWpbNu6mVp
X-Received: by 10.107.135.142 with SMTP id r14mr63756382ioi.133.1470071834766; 
	Mon, 01 Aug 2016 10:17:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 1 Aug 2016 10:16:54 -0700 (PDT)
In-Reply-To: <CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Aug 2016 18:16:54 +0100
Message-ID: <CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
To: Stephen Arnold <stephen.arnold42@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Fan Xin <fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH v2] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Mon, 01 Aug 2016 17:17:16 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc818bfa053905c5b2

--001a113eccbc818bfa053905c5b2
Content-Type: text/plain; charset=UTF-8

Hi,

On 1 August 2016 at 18:13, Stephen Arnold <stephen.arnold42@gmail.com>
wrote:

> Thanks, our timing is great (since I just did the same thing on
> Saturday but didn't send anything to the list yet).  Still have some
> testing to do to see if it actually works; recipes are here:
>
> https://github.com/sarnold/meta-small-arm-extra/commits/master
>

Literally ten minutes ago I was wondering if there was any interest in
ripping the obviously broken CUPS/ghostscript/etc out of oe-core and into a
meta-printing layer that someone could actually maintain.  Would you be
interested in that?

Ross

--001a113eccbc818bfa053905c5b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 1 August 2016 at 18:13, Stephen Arno=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:stephen.arnold42@gmail.com" targ=
et=3D"_blank">stephen.arnold42@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div id=3D":1ir" class=3D"a3s aXjCH m15647194fd69b15a=
">Thanks, our timing is great (since I just did the same thing on<br>
Saturday but didn&#39;t send anything to the list yet).=C2=A0 Still have so=
me<br>
testing to do to see if it actually works; recipes are here:<br>
<br>
<a href=3D"https://github.com/sarnold/meta-small-arm-extra/commits/master" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/sarnold/meta-small-=
arm-extra/commits/master</a></div></blockquote></div><br>Literally ten minu=
tes ago I was wondering if there was any interest in ripping the obviously =
broken CUPS/ghostscript/etc out of oe-core and into a meta-printing layer t=
hat someone could actually maintain.=C2=A0 Would you be interested in that?=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a113eccbc818bfa053905c5b2--
