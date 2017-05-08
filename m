Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA9971C7E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 12:16:56 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id u75so49564174qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 May 2017 05:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lMI6jWlF+jQugyys3ChPBa2D7ov4iiGJEXzh1U4p8lc=;
	b=hs3Ewp1JLKUs3WNRj5Hrja8ybf/DbXdsY3I1IqMGeAT1pOi+S9kEpIiFBNP9yGS+ha
	hPLX/2foCHeXZSNnUzsX7SgiC6wOXq3AOjpdRgN9CRNu6eZiZjzxKIUhGXmu5ja71KJW
	qhrjPGehrL7KeQ7qNwTC47HqyPxZTVNdQXCvGpqFdyCK0gXvTo88T3hdDmue/u9DM8bW
	O72bKs45GJpqZ2fTHSdlpHDld2o0w1+UfzKcsf7NGHGm0P6V+rEl5DDVBMLVgpYb2mGG
	zydDoZ5cDVGZTkJVB7JIMWGMmG/3JsgP0+EbVLsQyvad6bzBaMbJfG8ApECe6Y36T1hw
	86iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lMI6jWlF+jQugyys3ChPBa2D7ov4iiGJEXzh1U4p8lc=;
	b=CYbDSRTXXVuerebtEiFW+mKR89J98gJLccOJiAJcqY8ydzv6WLG7ALkYcL9Q5GLcrw
	fj14GXnW58P+9GDUXQmWQ/e7KtowcrHQjaFEJWTzZ+QPqsbbKmnMAIDAjEJ4FiN5pglW
	P2ozNP6q2MsGvQSy7LASn40ZX42zRhe0mOwo6RH0eCWMFEhuLK72zT+d35/hRUeqo2r8
	jhS9ToOPeRWkmV/pRgJGIvnARH4wi4VcFzCAw01Np84lYDQ545hot3Ni+7cYdFTqj+WA
	O2dO7+oqvkFctx6JWhDPS/09UfCh+WWHRAjmVsiRqEJFZYBcT1d+3OxojqTUA6j1bR5P
	pBwg==
X-Gm-Message-State: AN3rC/4VbipPYeRjRAS8VDHNobLDGX0Qed9O4dj8cfvTGWCxagCKNk5H
	j8OwqMvejl72b76/We9cYZFu/3Ua+NJf
X-Received: by 10.55.214.208 with SMTP id p77mr26657741qkl.121.1494245817476; 
	Mon, 08 May 2017 05:16:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Mon, 8 May 2017 05:16:37 -0700 (PDT)
In-Reply-To: <20170508121643.GA7360@mbabyjoh-desk.ger.corp.intel.com>
References: <1494244017-3933-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LZfcvtMKTXbpjVp9v14SOsFLbQZEXKCV_gdJ5ddzkg-wA@mail.gmail.com>
	<20170508121643.GA7360@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 May 2017 13:16:37 +0100
Message-ID: <CAJTo0LZR9m4VrHk_g7jZeRcb0vdViWvZqystMG58R9B4=GYvXA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] connman: upgrade to 1.34
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
X-List-Received-Date: Mon, 08 May 2017 12:16:57 -0000
Content-Type: multipart/alternative; boundary=001a1149d4f82881d1054f02370a

--001a1149d4f82881d1054f02370a
Content-Type: text/plain; charset=UTF-8

On 8 May 2017 at 13:16, Maxin B. John <maxin.john@intel.com> wrote:

> In that case, build fails with " Xtables library is required".
>
> We have provided "iptables" as the default choice in PACKAGECONFIG though.
>

Cool, as long as it fails in a deterministic way. :)

Ross

--001a1149d4f82881d1054f02370a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 May 2017 at 13:16, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"mail=
to:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":kz" class=3D"a3s a=
XjCH m15be7fcc85ba990d">In that case, build fails with &quot; Xtables libra=
ry is required&quot;.<br>
<br>
We have provided &quot;iptables&quot; as the default choice in PACKAGECONFI=
G though.<br></div></blockquote></div><br>Cool, as long as it fails in a de=
terministic way. :)</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a1149d4f82881d1054f02370a--
