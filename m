Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 192096E672
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 08:57:34 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id r45so106171914qte.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 01:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dhmuO+LYHt9huy0PrRKwduFb0J4BEkexyOqIHpB3G1o=;
	b=ipKP8qr49SVW+AFL+VLSn0zf+9SXDA836sOKwhTYvJwoa4Daa8c3FzAzUJtAErTcTm
	plESFkgAGGzlhn4n/LPIFDBLP7WkwXO3CaNreqWF9gZJry0vmi2bdD80Snmzbyey2lTj
	nldoyFId8V9mZSfYKdnSVxFeOOkmpgky9CFWYwzIzDqrz1/j5Z4kUwV1hPiM7bYAOwqD
	cqp3+vrBkPJxvnXKdPIP4mBCo+XjFbjOJ2YhT2sncQH2zdSuQVbYPYzL7F+UIcvVUt9h
	7W5i45R9ktEhanDx0I9MXaKCsmoFMhkbL/NZq+MSS6rtVpMgVx2i3tY5bweCdu0uGFAo
	yEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dhmuO+LYHt9huy0PrRKwduFb0J4BEkexyOqIHpB3G1o=;
	b=h4MuvUxQqVWiDUVfqEMYP3fDWi3YxGGZtG2Ryquqf++chhhMgULJSoyh0cKG4lWMLR
	vgEQJHqcNYYfqN3zSwqLU5j+C1UqpY9FPue5qThxn63+pEvaNlltldnWbjEgAn2e8HXd
	MlPUpahgGVIsm86B2TBulTllf2111/VbbG8Vp2qQBaEdsEQEPnESbFZxO3VaaW646I2b
	rYapbv0ruAeh1SyxYCpYgWmdJue+no99QQg2uinUnLCV4Op880tVz/kBHxVL/6uD4FZM
	BIMUJ7EKE5DtuhiMnwco/q5CE56nQn5qPyQvViyJeENwAcwquxHhTPcQpjFxhyZJEslu
	0+UQ==
X-Gm-Message-State: AFeK/H3oclXsq3VDVEchUSd7bRzA57/BvVGdqPsneD66DzIH2Rknbg5LtOSJ27mQTRnl0yFcqorWbK5LIJlUDqi4
X-Received: by 10.237.53.9 with SMTP id a9mr14582219qte.188.1491209855774;
	Mon, 03 Apr 2017 01:57:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 3 Apr 2017 01:57:15 -0700 (PDT)
In-Reply-To: <20170402213135.21193-1-pbarker@toganlabs.com>
References: <20170402213135.21193-1-pbarker@toganlabs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Apr 2017 09:57:15 +0100
Message-ID: <CAJTo0Lac+CqnXxzJoanw9iAQii_oeeKum1ebkFCT+3ExJVhAMQ@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ethtool: Switch to download mirror
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
X-List-Received-Date: Mon, 03 Apr 2017 08:57:35 -0000
Content-Type: multipart/alternative; boundary=001a11c0285ebd48f6054c3f590a

--001a11c0285ebd48f6054c3f590a
Content-Type: text/plain; charset=UTF-8

On 2 April 2017 at 22:31, Paul Barker <pbarker@toganlabs.com> wrote:

> The md5sum & sha256sum for ethtool-4.8.tar.gz have changed upstream :(
>

Have you verified with upstream that they haven't been compromised?

Ross

--001a11c0285ebd48f6054c3f590a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 April 2017 at 22:31, Paul Barker <span dir=3D"ltr">&lt;<a href=3D"mail=
to:pbarker@toganlabs.com" target=3D"_blank">pbarker@toganlabs.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2et" class=3D"a3=
s aXjCH m15b30b3474f14117">The md5sum &amp; sha256sum for ethtool-4.8.tar.g=
z have changed upstream :(<br></div></blockquote></div><br>Have you verifie=
d with upstream that they haven&#39;t been compromised?</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c0285ebd48f6054c3f590a--
