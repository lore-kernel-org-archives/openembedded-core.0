Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3979371DCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 14:27:28 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id l7so21128090qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 06:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3PIEgU0fS0uwvhplUBBRDumhL7JB4BoTLKBcsD/SEyQ=;
	b=ehKLjg30mpqmul3Wzdgxd3IzcgwaNuEc/eLlfIUIRl1ClwxHDL8SXQpJkcq+09yuf2
	QoLBY8i5dZQ/Urg0IpbwNWjw8CQ/CYGHN0YaUuIkPnEkTSaD3k5NfMqQO4nWM2rku9Le
	7Jt1nfeQCHw3iFGguDIHJ8Fyi25WuQrHnM07rA9xvyMG+RtYu5VGIHcnHvGXy3AZWpPH
	oKFwI3ZhSFE/ck/BYsnoLnKgB3KjdAwt5B7W41P64o0XbN5fJcQe+mvOQvkJKLoNAgqx
	zTm0hrc68TtRryifVfmEtC5hnF1oBCPQKstf6bdvuANp7Gte1btkCaB1juNDPG6Kyb/k
	4m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3PIEgU0fS0uwvhplUBBRDumhL7JB4BoTLKBcsD/SEyQ=;
	b=UAcebe11o4E6syGpUm2aN1O2LukK1eotzH5iY/w0VpV20ageh8d/i9i4cc6EuD1UcM
	8CjfqEWgTseLGD4zAiqb7KlKG1hiWRXFeKhIPTBtB9eEnERj+MfjCiSMYW6LPZb9UOBU
	G7O97d1IRXTA7MUnosDGk/1UrfVXreuGhuDp+CFidQq9HDud8D24A6c5eKVJRPeZCQlt
	lbuVGhlqLDyVKdZqNNKuFcgDOD7bsXAQh8EwN0O74cA6l4K1yoEjIdBdUiLyH3uCXX4G
	zntaX+MGsLPbrepc9cm3UuRTSpy1EiH18xFLy4pN5//IeqEjbcjhlX1ibOgvznX5cdBS
	xkkA==
X-Gm-Message-State: AIkVDXLgIdjk6DjXcX8bZP7heWwnb+yXUaor3Dy/Yi+XPr72EKyg9L2uni2bJIzcrwcuD+LgDlj6jlRpUgoZdTPH
X-Received: by 10.237.36.208 with SMTP id u16mr35950178qtc.105.1485354448953; 
	Wed, 25 Jan 2017 06:27:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 25 Jan 2017 06:27:08 -0800 (PST)
In-Reply-To: <CAJ86T=WEmxqwL-8FGqs52hJHHbOi2h383fnCqsiHpy2+HmsUPg@mail.gmail.com>
References: <1485288900-19603-1-git-send-email-jslater@windriver.com>
	<CAJ86T=WEmxqwL-8FGqs52hJHHbOi2h383fnCqsiHpy2+HmsUPg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jan 2017 14:27:08 +0000
Message-ID: <CAJTo0LYBDOqrTTqq8tAPdyqG3ZSadPbGr2ni42Nk0con_MdJBA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Joe Slater <jslater@windriver.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gnutls: avoid accidentally using libseccomp
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
X-List-Received-Date: Wed, 25 Jan 2017 14:27:30 -0000
Content-Type: multipart/alternative; boundary=001a114104ce4bced10546ec08c8

--001a114104ce4bced10546ec08c8
Content-Type: text/plain; charset=UTF-8

On 24 January 2017 at 20:52, Andre McCurdy <armccurdy@gmail.com> wrote:

> A configure option is not a requirement for using PACKAGECONFIG. e.g.
>

Yes, this. Please rewrite to use a PACKAGECONFIG.

Ross

--001a114104ce4bced10546ec08c8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 January 2017 at 20:52, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":9o" class=3D"a3=
s aXjCH m159d240240fc098b">A configure option is not a requirement for usin=
g PACKAGECONFIG. e.g.<br></div></blockquote></div><br>Yes, this. Please rew=
rite to use a PACKAGECONFIG.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a114104ce4bced10546ec08c8--
