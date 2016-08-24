Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id A777160125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 20:17:21 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id x131so232314611ite.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 13:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=APgKv7QuSSiWDXAyHWem5DooFWpw/fHLLiaSN57PX9E=;
	b=Y6TYR8YAErSvHOUzPNJUrRO0HXIL/TYhn/N9bibg5U31Ah1TspdzBmY/GWjhegg//z
	a71zeSC0+K4XuG4OTlsPW+5xVPW8QJcJIxj1BbPH0sEbIhUaRY0U1btpSDZDSJei4EBW
	TxTZijLCRpswT8D9LoVE93TK9OHEezY7dHgt8LOjSGuTuxPS3ZLFKwh1V1ofVj2zO+ih
	8OYh77ObzOn5ucYDBsSgiH7r+BbVL1zDDyRk5prQz1BoMRb+ES9uTP/PscsaQ4keoJ8s
	cTsB20YO4ym+MGH2qPJoFKrEspkt9LFcLFLrpfrpi1aCpCMsdUcLBNxrPHVZVcgByyj0
	p9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=APgKv7QuSSiWDXAyHWem5DooFWpw/fHLLiaSN57PX9E=;
	b=N/EJo6duCVWUP595cVZUBa4gdmvJG/EYI7O+6HasSvOke1pndR9BzMQeUsIE5L6i3B
	zHSsvBBx8IW1XDOauADauz6kPn8CVXxu2eDLJIZ0p8FZEEGHl6JDY8WPo8vaaDhHQtm7
	A2nqfEEvj4wD+rz6RQhAUDRR5gkWIOp00+c2+dH1rPyCqUO9rWaThusJW7ALlfz+z/0A
	tzqGrq3ccMpwlw7I9d6RemAzDWse9jjOD+bR3oOVIsqTgrb6yVJOIXN37wBWb0bhyMfr
	qpPqLgx70IcyL0YyWwyRBtguTRgtG9XINumnIX1EoUIbXnrwhdAjiloIn2qZ5uQOnyWD
	Pqsw==
X-Gm-Message-State: AE9vXwPPZ0d50glgGd72UhZVfmva8PHORvoaE4gAe7x9Fj5Jy6FsNsQJwA4kV9MpaBQ75AsF8DZSJXlGr+Esjict
X-Received: by 10.107.135.142 with SMTP id r14mr6671098ioi.133.1472069841868; 
	Wed, 24 Aug 2016 13:17:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 24 Aug 2016 13:17:01 -0700 (PDT)
In-Reply-To: <1958d06a6f3885b5d7f767c3eb955054d2b40ec1.1472030722.git.kai.kang@windriver.com>
References: <cover.1472030722.git.kai.kang@windriver.com>
	<1958d06a6f3885b5d7f767c3eb955054d2b40ec1.1472030722.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Aug 2016 21:17:01 +0100
Message-ID: <CAJTo0LZVkqHztCrpi9nc4E_vq6Aa4ibi5SBOc5QRWrBVt+7wPg@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bash: fix interpreter of ptest script
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
X-List-Received-Date: Wed, 24 Aug 2016 20:17:22 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc0264fd053ad6f8e2

--001a113eccbc0264fd053ad6f8e2
Content-Type: text/plain; charset=UTF-8

On 24 August 2016 at 10:26, <kai.kang@windriver.com> wrote:

> The interpreter of bash ptest script tests/getopts5.sub is
> /local/bin/bash which is not suitable for oe. Use /bin/bash instead.
>

Presumably this test is executed under bash explicitly, so is this really
worth fixing?

Ross

--001a113eccbc0264fd053ad6f8e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 August 2016 at 10:26,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.ka=
ng@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":146" class=3D"a3s aXjCH=
 m156bbe1983a7dd13">The interpreter of bash ptest script tests/getopts5.sub=
 is<br>
/local/bin/bash which is not suitable for oe. Use /bin/bash instead.<br></d=
iv></blockquote></div><br>Presumably this test is executed under bash expli=
citly, so is this really worth fixing?</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a113eccbc0264fd053ad6f8e2--
