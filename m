Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2B46476975
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 14:36:24 +0000 (UTC)
Received: by qgj62 with SMTP id 62so115558631qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=A6RkZVWMfh3TbYK4GSxWHJbWgQMJJA9VhdQ+mCaZCj8=;
	b=X/JpiFhCRUDDR8hV2b1RvWiVVzzLnB+TJrDqXP77dQRsbUTlNfqA9t6Lw/smu+ZDW+
	B3bIPWrTfJtSXZDVEdBqN+q3EicKUjelvB80NytnNJLkfMg4zEJqmbYvMOqPEw4iAd4h
	UVJ33noiHZp6AWDSzbt/grPmfbWHpZq4CRWSowYI1s9PrYXWMPE5J0nRyjBzmpOWvlEU
	SeTakSyZoePujbkVxUd2Os8u6yMnlOOfmIjE970LMTFb+DVD3w9qIH33ENhMJizvu3uT
	Xpu80/yL2+1ROmkHKxuE1nSyNlkgn2YaO5/sAJoPeK3q5MAtCNXvuoK87nsjueZ7Aq6U
	k6Tg==
X-Gm-Message-State: ALoCoQkjaV9Qve+aJjYD+W9c5Jg04MfWaXxbjb7wOrH3ROxN5pZqLBJOOZNcJ46jiKQkS8D5W5Sn
X-Received: by 10.140.145.83 with SMTP id 80mr51910215qhr.17.1439303784551;
	Tue, 11 Aug 2015 07:36:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 11 Aug 2015 07:36:05 -0700 (PDT)
In-Reply-To: <55C95B4C.9080505@windriver.com>
References: <cover.1438269391.git.liezhi.yang@windriver.com>
	<50edd6dd2fa86d9a51cc54ecdaa1599a1efc5a43.1438269391.git.liezhi.yang@windriver.com>
	<CAJ86T=W=_iETkpDyVJqUD0g6xkd_xhpXf_jtUCGmXe-Mt+fjxQ@mail.gmail.com>
	<55C95B4C.9080505@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Aug 2015 15:36:05 +0100
Message-ID: <CAJTo0LaaRuJ8FW9K8dH3d_r0Myy+-aVCsC+RsAG6R7Wi9cY9+g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] base.bbclass/blacklist.bbclass: remove doc item when d.getVarFlags()
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
X-List-Received-Date: Tue, 11 Aug 2015 14:36:27 -0000
Content-Type: multipart/alternative; boundary=001a11355bc6cd7e72051d0a0696

--001a11355bc6cd7e72051d0a0696
Content-Type: text/plain; charset=UTF-8

On 11 August 2015 at 03:17, Robert Yang <liezhi.yang@windriver.com> wrote:

> I'm afraid that there isn't any other way to fix the issue (many
> unneeded loops caused by PACKAGECONFIG[doc] which is set by
> documentation.conf), maybe you can change 'doc' to such as 'docs' in
> other layers ?
>

Otavio is right - the commit doesn't explain what the problem is, and
forcibly deleting PACKAGECONFIG[doc] options is very aggressive without
good reason.

Ross

--001a11355bc6cd7e72051d0a0696
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2015 at 03:17, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ar" c=
lass=3D"a3s" style=3D"overflow:hidden">I&#39;m afraid that there isn&#39;t =
any other way to fix the issue (many<br>
unneeded loops caused by PACKAGECONFIG[doc] which is set by<br>
documentation.conf), maybe you can change &#39;doc&#39; to such as &#39;doc=
s&#39; in<br>
other layers ?</div></blockquote></div><br>Otavio is right - the commit doe=
sn&#39;t explain what the problem is, and forcibly deleting PACKAGECONFIG[d=
oc] options is very aggressive without good reason.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11355bc6cd7e72051d0a0696--
