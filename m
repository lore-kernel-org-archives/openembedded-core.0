Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1D16012C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 08:58:47 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id 2so86401711ioy.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SYqIUl271SeL5HzW9sTCgq6aa2NjaDsjJuiXewBTP1s=;
	b=qSuukE8vb9OzlglZePp1I+UNCHsZumWLmMc5F64dwwQlzWIT6y3boZwvxV7DDWGABy
	9QkJTR09qFRdzBgvPPCZ6jCKfGDqrLPEgUf1jg7rz7jWVxGO8kExBPbQ9IKZVubReBUa
	byK2kojGM9ID5rFlUlkzry3+7UnTsiG33/Z/tW5IKxKRtKCtDTumDloXAOZbU+bLGoYg
	ig0hW7+ppNno+nTvNMRLCzLYo21Xwh6fgoJiuiwrMfCjjuLVfRP2xjR72gbFywyKi0Ze
	UEQ2cg11dX/BZkzMVGkwMT83KU66wS7G7FygDQflLA4uCpF9nMjJPgqhkWGGbMLNbYzy
	/YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SYqIUl271SeL5HzW9sTCgq6aa2NjaDsjJuiXewBTP1s=;
	b=RsEPK8vaG8Qq1rFpzELhg3QZUOZNd/XJwUl4/Qr60xRdC7j8reqvqKOxDDld9BZOfV
	69jLRhbFjKEyb8Tgv/fvYOr8anWzGdSF6u/6zzMMkrMnLCc0NYpdHO/bmf73F8ib5R2r
	1FVQptBnPlvh99iYXhg5rXYZErmWb44cZ4ppEzQjojq8EfopAagcbjeeP6fYpqsshv0R
	6rUZqw15vBzGPi/Exsw9VrWALLE7E1YPOEHCWP+ncZ5yTdfoh36N15RVycYMhEwzR8u3
	a4GrWMOblgozLkrKtk+zQHLSy+BGsYZtNSfHh6j6OubZpedOaCHtrSrC4JcIefRiWNJI
	fgag==
X-Gm-Message-State: AD7BkJKubT34sHAwrpt6QeTkHKuCCgHgKcOeX5hNQ6Op/VVLXDI1dv48z8jc2LY+3Tw3+UWd24vPBceyCzJ9LTVf
X-Received: by 10.107.135.74 with SMTP id j71mr2357649iod.133.1460019528417;
	Thu, 07 Apr 2016 01:58:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Thu, 7 Apr 2016 01:58:29 -0700 (PDT)
In-Reply-To: <188BD465D20643E496811D07CF7FDF9C@RD3>
References: <188BD465D20643E496811D07CF7FDF9C@RD3>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Apr 2016 09:58:29 +0100
Message-ID: <CAJTo0LYhW-_8nC5DEi+uHnpE7TicR+rmrJQ+m5_0b_jdq--sSw@mail.gmail.com>
To: winiston@futuraautomation.com
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>,
	OpenEmbedded core <openembedded-core@lists.openembedded.org>
Subject: Re: Problem in Third party Software (Navit) integration
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
X-List-Received-Date: Thu, 07 Apr 2016 08:58:48 -0000
Content-Type: multipart/alternative; boundary=001a113f92185b5621052fe149b1

--001a113f92185b5621052fe149b1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7 April 2016 at 08:41, <winiston@futuraautomation.com> wrote:

> Kernel is successfully generated. But =E2=80=9CNavit=E2=80=9D is not runn=
ing in my kernel.
> How do I integrate/add =E2=80=9CNavit=E2=80=9D to my kernel ? should I ma=
ke any other
> configuration and package?
>

You're not really giving much away by just saying "not running", but you
may need to install more than just the navit package.  Have a look at the
recipe and you'll see that it generates lots of packages, you may need to
install some more or even all of those.

Ross

--001a113f92185b5621052fe149b1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 April 2016 at 08:41,  <span dir=3D"ltr">&lt;<a href=3D"mailto:winiston=
@futuraautomation.com" target=3D"_blank">winiston@futuraautomation.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><font color=3D"#00=
00ff">Kernel is successfully generated. But =E2=80=9CNavit=E2=80=9D is not=
=20
running in my kernel. How do I integrate/add =E2=80=9CNavit=E2=80=9D to my =
kernel ? should I=20
make any other configuration and package?</font></div>
<div></div></blockquote></div><br>You&#39;re not really giving much away by=
 just saying &quot;not running&quot;, but you may need to install more than=
 just the navit package.=C2=A0 Have a look at the recipe and you&#39;ll see=
 that it generates lots of packages, you may need to install some more or e=
ven all of those.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a113f92185b5621052fe149b1--
