Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 55C2078267
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 10:38:15 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id d16so17313654ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 03:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eeqjGUyfIZUX31bzR/RdO4IqrMo5nVVKZsWHUP7D2yg=;
	b=0VShzzxynjE2EY18jlWrLSiKdyXnktwRkl4KD+dFkb0LaXtIWBUs7OqD5Dn9nHwOkS
	yzykfiu7Ybc4jbtUZgmg2z2+slYAh1xZdwUcmsAglihjRSZsks4ATsgJ46c0TnRhqh9E
	LGBRaC3qsf21aXC3D05vh7Zz/Ibc1tWvlYSCu0wvVB/aDkZzdoj7ficM7vfyKoQ+JumU
	2WxUyHhEgjLj+C88gXKG4MywCMcoeWVjHD8N2LOId9w1N8EPueAuEj042A/x1j+iEsYB
	yrIl8JfgkYlsyCY3Pqhdn2Rv3Hq3WaLVc1Rh0mDQt5I73TjAyw+AM354ioDV99pWanI2
	ZNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eeqjGUyfIZUX31bzR/RdO4IqrMo5nVVKZsWHUP7D2yg=;
	b=VxVXZdW1910o7RL56xJItwEgGG+AOrCv/3RdK5rrhZsfrenvFYFpNpJ2G5XaXH37Mj
	/NbmTZt6kKfYzJkZMKkmvqpUPnnA/4Yy6uxSSeM27SXwFJAMNDBXVoRcuDKhnFW4V+bH
	SdWy0CkBys7IzlWAPaekWr6dxbj8qypRlZC3eTby1xfpQDg0KtQmh/VBDc9QqIFaK2jg
	OBfVI89MpkVJtI6GHbdnbQZu6XK5QShU8hov1enlPF39D0umazvA4gqtAbJ4ZxKe9zBX
	a01XsJm6Qw1R/Mnk5x63aBPCLvkrO0DB3L9/6+ZE2uZDEV4XLTfhUDkQqMF99v4V/uQE
	EPqQ==
X-Gm-Message-State: AHPjjUiz0/XZeV5u8JbBZ2S01syvXbOUzTNmJS8NEsA2v/i6uosOPWtX
	nxn2/oKPJNHIlZW6gJhHrELIWYm1doyIH05oZ0zxow==
X-Google-Smtp-Source: AOwi7QBcJZGW/jl3hN26070zKwnwHQ9HFrUNsi7PKC9WiaMBVWjTznOUMXSiDSy0yRni7maj05tZZLd5Uk6282QOSio=
X-Received: by 10.107.135.72 with SMTP id j69mr2133328iod.210.1505385497448;
	Thu, 14 Sep 2017 03:38:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 14 Sep 2017 03:37:56 -0700 (PDT)
In-Reply-To: <c460da5b-bda1-fc4b-45cb-6ff5c3c51902@windriver.com>
References: <1505342415-93152-1-git-send-email-mark.hatle@windriver.com>
	<c460da5b-bda1-fc4b-45cb-6ff5c3c51902@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Sep 2017 11:37:56 +0100
Message-ID: <CAJTo0LaL33j5AB32GvTpAAGgt40TM2S7Zq9dgzY2_yfGCiB0Sw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake.conf: Add default FILESYSTEM_PERMS_TABLES
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
X-List-Received-Date: Thu, 14 Sep 2017 10:38:16 -0000
Content-Type: multipart/alternative; boundary="001a113f8e70d36093055923df35"

--001a113f8e70d36093055923df35
Content-Type: text/plain; charset="UTF-8"

On 13 September 2017 at 23:49, Mark Hatle <mark.hatle@windriver.com> wrote:

> On 9/13/17 5:40 PM, Mark Hatle wrote:
> > If FILESYSTEM_PERMS_TABLES was not defined, the default was selected by
> the
> > packages.bbclass.  This made it difficult for a recipe or layer to
> 'append'
> > to the default.
> >
> > Copy the default into the bitbake.conf, allowing future _append and +=
> style
> > actions.
> >
> > Default was remove from package.bbclass.  If a value is not set, only the
> > built-in per fixes will be used.
>
> per should have been 'perms' above.  I can send a v3 if needed.


Fixed up when merging.

Ross

--001a113f8e70d36093055923df35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 13 September 2017 at 23:49, Mark Hatle <span dir=3D"ltr=
">&lt;<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.ha=
tle@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 9/=
13/17 5:40 PM, Mark Hatle wrote:<br>
&gt; If FILESYSTEM_PERMS_TABLES was not defined, the default was selected b=
y the<br>
&gt; packages.bbclass.=C2=A0 This made it difficult for a recipe or layer t=
o &#39;append&#39;<br>
&gt; to the default.<br>
&gt;<br>
&gt; Copy the default into the bitbake.conf, allowing future _append and +=
=3D style<br>
&gt; actions.<br>
&gt;<br>
&gt; Default was remove from package.bbclass.=C2=A0 If a value is not set, =
only the<br>
&gt; built-in per fixes will be used.<br>
<br>
</span>per should have been &#39;perms&#39; above.=C2=A0 I can send a v3 if=
 needed.</blockquote><div><br></div><div>Fixed up when merging.</div><div><=
br></div><div>Ross</div></div></div></div>

--001a113f8e70d36093055923df35--
