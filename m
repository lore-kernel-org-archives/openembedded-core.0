Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id E584476497
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 09:53:58 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so15990644qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 02:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kmHyZ8ZGuaVTzvvBd6cwPD1t4pSXXnkEm1ZE/U9XJwo=;
	b=V3+0kMKGIynNvqSDHi5kVXTQbteFopZ9gJGx9jIaK3EbNFNG1fTAxUYuj4z+8XWKvM
	w2RQIKlNNgx+CzMnEY61GeVY8NTIy49nkPnWBOxzHfPiZC30uVONL9y+XOFLKWWb0kzz
	RCZwpZzQMHCKbg2b0yiNzylsph0UlXPEQJLjLDYVGF047j1SKjIcsEhM4VJMOBi1wx8K
	dVZKnQNhZ8C0+HWC8ATHxwIhKx1+XJqEkKejtyxqUJUXCpHDbd1uuGDYqLiEF4EiOW7c
	PP/2eheaRebssGIyC1pvXmRIfbk7G8Hfsr3oWiS58WvIIFSHqmWvcjeifr5n2C/w93Av
	c49w==
X-Gm-Message-State: ALoCoQlKNGUGri18DQDg+A924DW93zZBiILLBOxsJ4a/B4Ipm+JYpfD3za0PqJapQKhBky1s/JVy
X-Received: by 10.55.53.193 with SMTP id c184mr66330314qka.62.1438250038766;
	Thu, 30 Jul 2015 02:53:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Thu, 30 Jul 2015 02:53:39 -0700 (PDT)
In-Reply-To: <1438249425-5423-1-git-send-email-olofjn@axis.com>
References: <1438249425-5423-1-git-send-email-olofjn@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 10:53:39 +0100
Message-ID: <CAJTo0La3miv94cfGvYYu6sDDyzw0X7e7-E7yosuKQb6FiQW9Ug@mail.gmail.com>
To: Olof Johansson <olof.johansson@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Don't warn about "invalid" PACKAGECONFIGs by default
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
X-List-Received-Date: Thu, 30 Jul 2015 09:54:02 -0000
Content-Type: multipart/alternative; boundary=001a11476f14a8c5f4051c14aef4

--001a11476f14a8c5f4051c14aef4
Content-Type: text/plain; charset=UTF-8

On 30 July 2015 at 10:43, Olof Johansson <olof.johansson@axis.com> wrote:

> The recently added warnings for recipes that try to use undefined
> packageconfigs isn't compatible with the PACKAGECONFIG approach of
> exporting a common set of configs and letting the recipe look only at
> the configs they care about.
>

Can you elaborate on what this approach you refer to is?

Ross

--001a11476f14a8c5f4051c14aef4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 July 2015 at 10:43, Olof Johansson <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:olof.johansson@axis.com" target=3D"_blank">olof.johansson@axis.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":yu" class=
=3D"a3s" style=3D"overflow:hidden">The recently added warnings for recipes =
that try to use undefined<br>
packageconfigs isn&#39;t compatible with the PACKAGECONFIG approach of<br>
exporting a common set of configs and letting the recipe look only at<br>
the configs they care about.</div></blockquote></div><br>Can you elaborate =
on what this approach you refer to is?</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a11476f14a8c5f4051c14aef4--
