Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 172DD7C160
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 15:53:50 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id p197so3489900itp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 07:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3Y1mNC9CGPMeIP7AMLFI/nRawVxK9aQBY0pVkQNEeuQ=;
	b=nvB3xjwBzqBdc7Jp+FrP4pRLSSEtjrPLqzc8BtpSK2y2a/wiWX5JOTyYF8XWew6GhD
	+xX+nDseA44uHp27bs/H40Jm2YruWieLV4rUysDw+D2YcbBuzX4Ev9loUjWkb7o2Ocn9
	zD+kw8st+69IuwyuBqr4QLI6t0DlEb481xGcSqEM7E0IN8VyUy56mrpUFo9NvV1uEpEl
	3A/zUi6ebhoUM4MvkxcE8gF6jLRxqJ6+EU4io8W8qj7wTfIdQ5Jm46BJpjmbb8V+oFW6
	P0TTHcTLfm+uetWXTj4bGfONHzUdPjhjjGFsNYGYVmzhZbYbVTck45ppgF3lTnIC/dNJ
	JstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3Y1mNC9CGPMeIP7AMLFI/nRawVxK9aQBY0pVkQNEeuQ=;
	b=XPbK3oW8KOjawZmcohFQSbbuo8St60FNsfWuZ0LTVYBItMgcCAt6iQwUCx/9dYXg/P
	ac+MYytYFpVP9ktiD3sguKz6xyW3OadTN3L1cac70d7rO98k9/+xkp4silFdvSl32qT8
	0HjHzlNAL/FwPqI3K4kCec+E1ttao6RkZWvsCihLzkidPQpVmyvgqem0TQdkqWubjvEx
	1XZ/MFUJdYymD8G3LbWJZYZDms9kSTP7NpOjxPZG77YR4pEufufqKyNnWiAFMM8BoSkZ
	JUHe/OAiJFLjA8kxpZUaYeAdKWBy6CmQRRq+Rqh2kk99LOsXQImRuudSTpLXxUZsG/JO
	3r5Q==
X-Gm-Message-State: AJcUukeSHY131/+0/+IpsBkTwizRnKcWVhUFWiufEXcGwiU7NAqJI90A
	5lMYP8JbKYsSPB0ScqnkSWKpMhKDwJZAXVMrrJUWaQ==
X-Google-Smtp-Source: ALg8bN6LijNQ3E4B+uyPpkHhcbFe4fFsGO3BZHXTv9egpqzovxeOTtofrbxuYK0wMbBiK1S4798bX8muOi7KQFH1wm0=
X-Received: by 2002:a24:c601:: with SMTP id j1mr1685044itg.130.1547222032151; 
	Fri, 11 Jan 2019 07:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20190111104349.33960-1-alex.kanavin@gmail.com>
	<92392218-ceb5-7166-7bb1-64127b46df41@windriver.com>
In-Reply-To: <92392218-ceb5-7166-7bb1-64127b46df41@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Jan 2019 15:53:40 +0000
Message-ID: <CAJTo0LbSNEeLoax++2BX2tyYUUffsKaWm2AsiLoMN9OAW08DtA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: produce sane amount of logging when creating a rootfs
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
X-List-Received-Date: Fri, 11 Jan 2019 15:53:51 -0000
Content-Type: multipart/alternative; boundary="0000000000009d90b0057f30b36b"

--0000000000009d90b0057f30b36b
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Jan 2019 at 15:50, Mark Hatle <mark.hatle@windriver.com> wrote:

> I'm slightly worried that this will break on-target RPM users.  Since info
> is
> commonly enabled during on-target installations to track which packages
> have
> been installed and what their progress is.
>
> Has it been test that this does not break dnf on the target?


Easy fix: make this specific to class-native.

That's probably sensible even if it doesn't break dnf, because then target
RPM behaves as usual.

Ross

--0000000000009d90b0057f30b36b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 11 Jan 2019 at 15:50, Mark Hatle =
&lt;<a href=3D"mailto:mark.hatle@windriver.com">mark.hatle@windriver.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">I&#39;m s=
lightly worried that this will break on-target RPM users.=C2=A0 Since info =
is<br>
commonly enabled during on-target installations to track which packages hav=
e<br>
been installed and what their progress is.<br>
<br>
Has it been test that this does not break dnf on the target?</blockquote><d=
iv><br></div><div>Easy fix: make this specific to class-native.</div><div><=
br></div><div>That&#39;s probably sensible even if it doesn&#39;t break dnf=
, because then target RPM behaves as usual.</div><div><br></div><div>Ross</=
div></div></div>

--0000000000009d90b0057f30b36b--
