Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE6B7E8A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 11:10:42 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id r6so13856720oti.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 04:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9jCQIJj3wocjpkrU7AS4/1N5I8VoeRilenBdOtPp4tY=;
	b=bXh949i6OwnQBORg/wku71usSM/R/PNCB2+XiqDR23+lHNy7GF6Xr40LZWy3pV+e+G
	PCyfRmyClRvOGdoF/NCq/qVfG6Cidhe9PsyuZxMDl+Sa47BTRBKJableHWKCO3AIVGnM
	1kl35dAANoOZqbohWqWEu/jeUiziK9nbvJT7Sf1nPQ6bBks198wLvqUHqL17mveehI0R
	reE6kWtBBibFAbDVwfFyEkGfET3sGFYT8ROlc5EpBqCAwFYrgchh3kUPrnIxZjCSiObM
	JA71SnF/Hs8z3Ius0khwpZKtvZqu4rLW5rq+TMjRulOxF8uHIFcws63Lb+FrdusluezE
	ZmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9jCQIJj3wocjpkrU7AS4/1N5I8VoeRilenBdOtPp4tY=;
	b=l2mvkn45/zRqIn7UeptLnobQz9/hKsvWKnNl4Mnc71VB+wYp5ib4NjIUhZOaS2jysl
	bkGMuAVi4bCQrv8IcqOUIgDY+7MsZj+ufny/XngQjypLnUzJk/ZXqJt5SwNP7kIKRGXo
	Q4VcxF5ClTtOn68XMHzfd4PX8oofn40Zo7XAsFuuI85oQ7gjeAaxpvNZ7o0F+WOWrXpJ
	EGXMNEIJc5zmlGQ0M6rF29p+/nLHM2zX2FIIYUkxgoXtdqwYsDZaPMdP78o6XykwlCrx
	Id3/rxpJSFpxX5/JaqlMyuJFTeF5VK8uwI9kIYzS1KdYUU2SIaBsXZxJ0MIk+Nwns34+
	YUSA==
X-Gm-Message-State: APjAAAURy7B0xIBiI9MpLywh/ZeQ5/RHnTDO1I5cbs0kboKOoebobWUU
	goiYem5rJoI2P9qada98Rxt833U+KkV+bl54DHk=
X-Google-Smtp-Source: APXvYqzACyJa+SocBl6HFBawmNlGyWdudwxaPZfex2labuD0dq0UU0mBXFEG9HcIKooRqEp/d3Uveht1in533JE/S5c=
X-Received: by 2002:a9d:4b8d:: with SMTP id k13mr60778141otf.61.1560856243486; 
	Tue, 18 Jun 2019 04:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9rVD4cZ-AN7rvF=0fuc4d99brU_Tt_wQeRMGm=L83M2w@mail.gmail.com>
	<201906171422.x5HEMKtf012735@dan.rpsys.net>
	<CANNYZj_vg_jzcMRhfQ35C_2kDnyH-yxVj52pKk2WpfZxfo5iOw@mail.gmail.com>
	<591c1c8752c4c0526d18d5cd6596a35bc41c6645.camel@rpsys.net>
In-Reply-To: <591c1c8752c4c0526d18d5cd6596a35bc41c6645.camel@rpsys.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Jun 2019 13:10:32 +0200
Message-ID: <CANNYZj-6ZbpdR9WHkhrjFL77U290ZM=B_c0W12b1aVT8oKjG3g@mail.gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>, "Eggleton,
	Paul" <paul.eggleton@intel.com>
Subject: Re: [AUH] lttng-ust: upgrading to 2.10.4 FAILED
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
X-List-Received-Date: Tue, 18 Jun 2019 11:10:42 -0000
Content-Type: multipart/alternative; boundary="000000000000f044a5058b972996"

--000000000000f044a5058b972996
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Jun 2019 at 17:26, Richard Purdie <rpurdie@rpsys.net> wrote:

>
> I think that perhaps:
>
> a) we should have a bug for this as devtool shouldn't be giving
> tracebacks?
>

Bug filed:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13404


> b) we could add some kind of "reset" command that AUH could run between
> builds which would clean things up?
>

There is such a command  - 'devtool reset' and AUH does run it, however in
this case it does not work because the recipe in devtool workspace is
half-complete. (I think devtool reset looks up the recipe to be reset in
workspace/appends, which is empty because of the traceback).

Alex

--000000000000f044a5058b972996
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 17 Jun 2019 at 17:26, Richard Pur=
die &lt;<a href=3D"mailto:rpurdie@rpsys.net">rpurdie@rpsys.net</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><br>
I think that perhaps:<br>
<br>
a) we should have a bug for this as devtool shouldn&#39;t be giving<br>
tracebacks?<br></blockquote><div><br></div><div>Bug filed:</div><div><a hre=
f=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13404">https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D13404</a></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
b) we could add some kind of &quot;reset&quot; command that AUH could run b=
etween<br>
builds which would clean things up?<br></blockquote><div><br></div><div>The=
re is such a command=C2=A0 - &#39;devtool reset&#39; and AUH does run it, h=
owever in this case it does not work because the recipe in devtool workspac=
e is half-complete. (I think devtool reset looks up the recipe to be reset =
in workspace/appends, which is empty because of the traceback).</div><div><=
br></div><div>Alex<br></div></div></div>

--000000000000f044a5058b972996--
