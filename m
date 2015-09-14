Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id A038473CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:10:22 +0000 (UTC)
Received: by qgev79 with SMTP id v79so118765844qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9IBjBFO1vWgZI0N1kBg7e++gABMEKbTa5iaZFs5J9R0=;
	b=hDPsL0vl5YddbxtQ/HUxSsc3UfsLsFocoeyfgyUC/HxVGBdlAIxkLpaDiLiiX/l5R5
	E2wO2Ubl22Qi3BL+BYa+rson6xv4lgLvo93vZhUxCvxNMXTYV3VfiWodG8/ZJS52LOh/
	W2VxFijS1CjcVovTeyaauRINJZtta+G+y2fzE7eM3aA2yVjwIaPV6IHJy0ArH/iuA4zc
	ufaA9B3OTLGz2JEcADcQYm8PYzCUKUmlBc/5+DR7oMMV/4lF0p32Hv7+mggyI8oNjztl
	szJEUzTVspBHKTZt48Q6yI6pynqrgF1hsadwSJxxHEnO9Lf8S43a/9h+WhtJCNcF1Nem
	0RSA==
X-Gm-Message-State: ALoCoQnfctbMTw6szju2T5LLP2ir4WCnhnMvuqtLzw4RELb2iD1QPNf5oO3SetDbDJ4+6geXnEet
X-Received: by 10.140.132.71 with SMTP id 68mr24762687qhe.64.1442247021871;
	Mon, 14 Sep 2015 09:10:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 14 Sep 2015 09:10:02 -0700 (PDT)
In-Reply-To: <FE596366-AE31-43F6-9EF4-B25CFB1B6162@gmail.com>
References: <1442246267-35258-1-git-send-email-ross.burton@intel.com>
	<FE596366-AE31-43F6-9EF4-B25CFB1B6162@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Sep 2015 17:10:02 +0100
Message-ID: <CAJTo0LbSuE+C1R3pmd=G1xuroqgn0Yn4G+mLdOu8hOW_tYwQSw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: don't require bash for nscd init script
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
X-List-Received-Date: Mon, 14 Sep 2015 16:10:24 -0000
Content-Type: multipart/alternative; boundary=001a113510d46b031c051fb74d63

--001a113510d46b031c051fb74d63
Content-Type: text/plain; charset=UTF-8

On 14 September 2015 at 17:06, Khem Raj <raj.khem@gmail.com> wrote:

> it used to be like that and then changed to use translated strings. Do you
> see any downsides of removing it ?
> locales related or otherwise ? if not then it looks ok to me.
>

When given the choice of translated strings in an *init script* with
enforced bash or English strings with no bash, I think most people here
would go for English and not enforced bash.  Nobody noticed this as the
bash dependency wasn't declared (and thus was a QA warning with Poky at
least).

Ross

--001a113510d46b031c051fb74d63
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 September 2015 at 17:06, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":20a" class=3D"a3s" s=
tyle=3D"overflow:hidden">it used to be like that and then changed to use tr=
anslated strings. Do you see any downsides of removing it ?<br>
locales related or otherwise ? if not then it looks ok to me.</div></blockq=
uote><div><br></div><div>When given the choice of translated strings in an =
*init script* with enforced bash or English strings with no bash, I think m=
ost people here would go for English and not enforced bash.=C2=A0 Nobody no=
ticed this as the bash dependency wasn&#39;t declared (and thus was a QA wa=
rning with Poky at least).</div><div><br></div><div>Ross=C2=A0</div></div><=
/div></div>

--001a113510d46b031c051fb74d63--
