Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id F005B7721D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 19:15:09 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id f6so5388559ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+xDCWkjakDZCf9B2BmGtSh96qNSY3RW9xceYcY6HyyA=;
	b=s5RUjOED1RLjyXk220pA7Nn3+tSsGCe9q+CN6mQYlOFkR5d7B3B/n7OBwAncg6SG4C
	eAfSYsy2BjKKwCyF0j1pojbcInZMmYZPMXaG2vswULqb3DSiAdsqAqiSVwM/q6yyARve
	r9xSWiRs9e1y9S9gy+NQ/VCdPviO438JlIzvkdnQkR+VMKNc0lGS/pwZYIp2RrWazRm4
	YzM6FQfhEY/TD3VycacRGBG6inOxRb6pugPpG52lNqwXlSljibPQHZThwHv/91rHL8nV
	Znxf4EaERriFhA1z1C5e/oPqC5F2oZSPq10NTdSSg5maYLH+ah4OkHtAFXe6wSxuMvdO
	UAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+xDCWkjakDZCf9B2BmGtSh96qNSY3RW9xceYcY6HyyA=;
	b=P+mjeCzUcMEIdXb5VplGDfLLq1m159LexIq/ycatvzloUsKMjWip0hIOKHBxVxUSCz
	kwEmd6VX9hUZrb3DNE+zE+FDP30oLo0YOZEBK6gEKBlEWUwZOuZizIff4WgOXJPT77bD
	eHzh4H3VNyulQx8f6/AyNUCjxnU2wMKz6/nSldIZMxIdSHbJgeQ5LEkWu2uBCpLNzxpl
	/0+lECgfRd6imqgeQ61kiWiA652InFVy5fgFmwCFliU2C9rZ0Z4FGhdpRKQaDdNTCX2M
	+AN7K+ZDWAD0K8QqFFS5FFtiGjXLDpP2eCbt7e+fbX+N9/ENrIMZpdystPyTqrBkHYE0
	7luA==
X-Gm-Message-State: AEkooutEAVmXhFeKDAq636y7gQI5N/fr+uiN1ZFr8BJPPd6er6mmZ1bUCWDSmPtpVYxZmYo8pxpUA7fYkXu4/sHJ
X-Received: by 10.36.129.213 with SMTP id q204mr12189121itd.38.1470942910154; 
	Thu, 11 Aug 2016 12:15:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 11 Aug 2016 12:14:49 -0700 (PDT)
In-Reply-To: <6cac214c-b73f-af4d-655f-f911788cdc3e@windriver.com>
References: <cover.1470636212.git.Qi.Chen@windriver.com>
	<8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
	<CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com>
	<6cac214c-b73f-af4d-655f-f911788cdc3e@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Aug 2016 20:14:49 +0100
Message-ID: <CAJTo0LZ__iBciY-YgeDXebKBXUVh4Snapz9+Yj0QDME34U783Q@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: change localedir
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
X-List-Received-Date: Thu, 11 Aug 2016 19:15:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fca52ca40539d09532

--94eb2c08b1fca52ca40539d09532
Content-Type: text/plain; charset=UTF-8

On 11 August 2016 at 18:11, Mark Hatle <mark.hatle@windriver.com> wrote:

> Binary locales have an endian and alignment setting to them.  If a platform
> supports both big and little endian, this common locale would not work.
> (That
> is extremely rare....)  Also if a platform supports different alignments in
> different libraries that could cause an impact as well.  (This is also
> extremely
> unlikely.)
>

So by that logic this patch should be rejected, right?

This path is for the compiled locale definitions - LC_TYPE etc and the
locale archive, right?  So it's only glibc-locales that ships in here, not
other packages (just trying to check my assumptions)

Ross

--94eb2c08b1fca52ca40539d09532
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2016 at 18:11, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2fc" clas=
s=3D"a3s aXjCH m1567a96d46492747">Binary locales have an endian and alignme=
nt setting to them.=C2=A0 If a platform<br>
supports both big and little endian, this common locale would not work.=C2=
=A0 (That<br>
is extremely rare....)=C2=A0 Also if a platform supports different alignmen=
ts in<br>
different libraries that could cause an impact as well.=C2=A0 (This is also=
 extremely<br>
unlikely.)<br></div></blockquote></div><br>So by that logic this patch shou=
ld be rejected, right?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">This path is for the compiled locale definitions - LC_TYPE=
 etc and the locale archive, right?=C2=A0 So it&#39;s only glibc-locales th=
at ships in here, not other packages (just trying to check my assumptions)<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--94eb2c08b1fca52ca40539d09532--
