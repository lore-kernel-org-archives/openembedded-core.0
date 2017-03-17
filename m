Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id DDEA377B13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 16:53:35 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id r45so67326335qte.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 09:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0H7uwla4RbFYqWfiECgAaoEUopTdvJzrFg1Ka61trh4=;
	b=iIfM3fHNKr7gMSgg2uUvqWXugHk9dlPmD0TZUrcc46nZwGmspomxXYAtryvvdJqvtS
	Xx+XXRrZ5JUjkihMpLoRY/y7BRpF0OaI/+BzRlpdmvodSp2+DABx1Khf53+m/7w61nzw
	h7TK4o5vi/i+OcSzR8LR3UWPQ3u/to8bfG5q4wXqhiGh1NRkop/6XBiFzLnLruffS4Sb
	bL50Xlv/ILN+uZDCqLdQa9juKi1tsvDt4Kl+9HdqncrNXE9evbbq1IKKICIijrHAj5w4
	vbUz3jmy5b156VZQ3l+JNfpadlyfvQ9vWtn94y2oGMJPSLmgHTdVsuU3+239VNeyz7w0
	PyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0H7uwla4RbFYqWfiECgAaoEUopTdvJzrFg1Ka61trh4=;
	b=ncpaxnA//p1LfAD5Xytnk5pucNFRN3YP5CkfcOPTj4u2fjDi6pwOUsEtraTQ0IS20O
	BqUDBQb4FtUh6JgIggvLbOpkuUvvDD0xBU3nBXt+ryIFW17wMrXYQf4DCNgRRIP3X6h/
	1Ud4GyOYJqteha6IGvoo1osRS/rvgh803eYsxqucIX8WKD/FOjYnActeXAa/bb/4nwN8
	jD+35QCHoV5p22ahQRa7lAXKk9fdyjlGQUQXBDOOOMfG/ZsssHaVaBKjMOR7roXEHW7R
	rC/j/6sPx6WdLSYmm0Vv4R0Q2OFPuYiPKxgmbFAPSpIGTnCrQGkCLsJT3JZX6ZLcrX+y
	Z8iA==
X-Gm-Message-State: AFeK/H1OwjGTAAxXFfbmerBFLxIA2bZl+4+XD4aY/VTjmglL7dEgwPQKuqlXrzUkZiwcVF4JpdNtiXSPkf/pFmnQ
X-Received: by 10.237.53.9 with SMTP id a9mr14255247qte.188.1489769617000;
	Fri, 17 Mar 2017 09:53:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 17 Mar 2017 09:53:16 -0700 (PDT)
In-Reply-To: <1489459188-15332-1-git-send-email-akuster808@gmail.com>
References: <1489459188-15332-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Mar 2017 16:53:16 +0000
Message-ID: <CAJTo0LbJyOUHk8g512UZ_ZVJz9eXecghzMLKLwVBvHUKLF=T+A@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pinentry: update to 1.0.0
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
X-List-Received-Date: Fri, 17 Mar 2017 16:53:37 -0000
Content-Type: multipart/alternative; boundary=001a11c0285ed1c3cf054af004c1

--001a11c0285ed1c3cf054af004c1
Content-Type: text/plain; charset=UTF-8

On 14 March 2017 at 02:39, Armin Kuster <akuster808@gmail.com> wrote:

> add pkg-config support for libassuan and gpg-error
> updated config options
>

This didn't quite make M3 so strictly speaking upgrades have to wait.  Can
you backport the fixes to 0.9.2, or is there a sufficiently good reason to
make an exception for the 1.0 upgrade?

Ross

--001a11c0285ed1c3cf054af004c1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2017 at 02:39, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5fd" class=3D"a3=
s aXjCH m15acab19bc74744c">add pkg-config support for libassuan and gpg-err=
or<br>
updated config options<br></div></blockquote></div><br>This didn&#39;t quit=
e make M3 so strictly speaking upgrades have to wait.=C2=A0 Can you backpor=
t the fixes to 0.9.2, or is there a sufficiently good reason to make an exc=
eption for the 1.0 upgrade?</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a11c0285ed1c3cf054af004c1--
