Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5212B731DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 16:07:10 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id w20so86892375qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 08:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SvhCVdN2qDhPpbEx7GiL7Nakb8NaPVIsb9iI3uFt/bc=;
	b=v2RUfVKK/dnV9aqxZSA5K4uJom6VMmmtNFyypcpddTh7yjfcMfWkT/N8WCCt/Tywf9
	FjsPi+FZD5IY7IpJeTPeMwrg+wtni5lGyW6j23ZLs9U4g6x2NnZxcg520PFDzRJsQAJa
	FWhNcZ08WJT/chaEuLkDmzW4MsBm+6TN3pNrhVWER7mLib84oNvwGCDgAURMYWo7pOyo
	woQDJui6C7gR0rbW9y7yaSysrlm3lxtevFWWr29NDTH/o/zsAcVFPsQSMwytSlLhgAL6
	E1jEI4Yjz2QhH6lcLxOvPQqS4vddSwFJS/HKXaPU8eLOmulimAzVNF+zJvVGxQidoYJW
	tR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SvhCVdN2qDhPpbEx7GiL7Nakb8NaPVIsb9iI3uFt/bc=;
	b=RUxYaM9AMxuhsX8RLIOWvB5NC4MAW3iFBmAayqwHvbzd/xxp9Q2ZRBlYF/5iNEv17j
	2gGCpPeRVch1HuKEQ9qWiUqhUB85tFxooR5zCzd+NSsLeamMXKMwuHxR6tXudzdOgCrY
	JKuwQZsDXjxrGsVI0nEjuK2jlMeelWtFqxluMvKdB5B4DoiCNQc/+c8OnZJP5vJXKtmQ
	Uyrz1IkIZS2LXKE0yqaGypj+Mn/3VuQEjn8C6U5NqL2NNLtkkEvarhp3EB6BdQ3bx3Do
	z1T+hNeRHZxWcDvmBUEpEdFGyNSk68PYrA1JF7KIWADFMqxBtMRUSwzfYEjUOVtKZsLX
	SCvg==
X-Gm-Message-State: AMke39lKrVFoPxDuXhEc43G6akBxD23v+VWEQVUcH/3n3DVlxGL+fEOq7f/78Qk33c7uGKKiwNP9Gv9fHDyz4+N7
X-Received: by 10.237.62.232 with SMTP id o37mr20741839qtf.188.1487002030977; 
	Mon, 13 Feb 2017 08:07:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 13 Feb 2017 08:06:50 -0800 (PST)
In-Reply-To: <4c74e0c7-0e2c-0d3d-c252-3de7c4b146b4@windriver.com>
References: <cover.1486622006.git.hongxu.jia@windriver.com>
	<f3c4e388c57e638701c92b4a152817d77b6bc469.1486622007.git.hongxu.jia@windriver.com>
	<CAJTo0LbJHaDUaF3AWzSYyOFCcCH0yYutEctaQ_p7xt+cKyktHw@mail.gmail.com>
	<4c74e0c7-0e2c-0d3d-c252-3de7c4b146b4@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Feb 2017 16:06:50 +0000
Message-ID: <CAJTo0LZVrm4WLPFtexDNcKqHZaHhAtCRS6_+yAfGvRSaQwjHKw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 11/13] bash: update patches for 4.4
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
X-List-Received-Date: Mon, 13 Feb 2017 16:07:12 -0000
Content-Type: multipart/alternative; boundary=001a11406f0ed64ba405486ba35b

--001a11406f0ed64ba405486ba35b
Content-Type: text/plain; charset=UTF-8

On 13 February 2017 at 01:35, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> Could you accept the upgrade patches except ncurses and bash?
> If yes, I will only resend ncurses and bash.
>

That's fine, the rest of the series is staged already.

Ross

--001a11406f0ed64ba405486ba35b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 February 2017 at 01:35, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FF=
FFFF" text=3D"#000000">Could you accept the upgrade patches except ncurses =
and bash?<br>
    If yes, I will only resend ncurses and bash.<br></div></blockquote></di=
v><br>That&#39;s fine, the rest of the series is staged already.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11406f0ed64ba405486ba35b--
