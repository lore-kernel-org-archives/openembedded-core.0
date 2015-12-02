Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2026FF64
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 22:25:04 +0000 (UTC)
Received: by ioc74 with SMTP id 74so61725836ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 14:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wrmlZVd0R0/w7HM3LjXm9dL8dfVQ0LEoKbuWnP6yzOQ=;
	b=iIavb9YOmNG98oRCR0EETmqDrqBjJyDiXLhbz+afoCPwypByBZlguyXWRw3qzfgP7X
	C4inidvIzGj7l0nyGH+7fVYSi+QxdthZ3CfUmujVZfsNCwtgRioZ/2trHOGGlbGdxWlf
	gwgJpEPOntv94HhK2Ef7ko/NwrCOlwvrzqJE0ViFSoqUxPhQofHTka5MTULDM+jJb2di
	KWqhi0O8xVPegZeSvXgAWE8bY424fU8tCsMaYOheYx45R0/u6QCaUW4/hu9zzuG/O15M
	fJpWKPbVQsvD9EUQnGHQiahQP6FnUb883AYmY/57MwusXkXccEa7y1Y19wDyHDYK1bWc
	wEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wrmlZVd0R0/w7HM3LjXm9dL8dfVQ0LEoKbuWnP6yzOQ=;
	b=LMN3ujpIcwmrRz/l6LI6Xa8EOfA9Jepuuwp4conelM1IuyhAyxMj978nRdkqVBLV7y
	7JceS3Vsb7nrmHy5QjxlKLIOEWt1b6XoPOar5fs1mZdj9jxlWr1PFIo9ktpYDWlMUQXB
	9kxOxUWXuT081X5Ak+aOaUPL9qHoIM0+qeyuc6A+mnu+Rs0jmqxohuJ8JAF2JQMc4WMV
	WeVjn+eaS9pX2dSProjcnkykVC3eLp4KDFM8PsrCCTa4F6fAViSPylwM8tb9Efd28Yq3
	KqF+FbWTHkZO921uGEol8OmDdknGPzQ2wQFcs8k4WfJN3ewAEoUUmolbFCp/o+OBetFu
	s2hQ==
X-Gm-Message-State: ALoCoQmjz6dmV/ymGn8N6M/+sSme+5A9ihMpDJbjq4dSAWIoDqHZUq2XDClRoBT4tlJI/2eOHUgr
X-Received: by 10.107.3.144 with SMTP id e16mr5498388ioi.99.1449095105240;
	Wed, 02 Dec 2015 14:25:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 2 Dec 2015 14:24:45 -0800 (PST)
In-Reply-To: <1449054232-18730-1-git-send-email-maxin.john@intel.com>
References: <1449054232-18730-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 22:24:45 +0000
Message-ID: <CAJTo0LbW7Rb9BYdJJv1PxLSkp1_8ifH3WqBZE=Hw78m1ATba9A@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libical: upgrade to 1.0.1
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
X-List-Received-Date: Wed, 02 Dec 2015 22:25:06 -0000
Content-Type: multipart/alternative; boundary=001a113ecf40fe8c100525f1be94

--001a113ecf40fe8c100525f1be94
Content-Type: text/plain; charset=UTF-8

On 2 December 2015 at 11:03, Maxin B. John <maxin.john@intel.com> wrote:

> 1.0.0 -> 1.0.1
>
> libical switched to CMake build system
>

I discussed this patch with Maxin earlier on IM, but for everyone else
Jussi sent a version of this in October which doesn't have the perlnative
requirement but is broken in multilib builds as libraries go into the wrong
directory.

Ross

--001a113ecf40fe8c100525f1be94
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 11:03, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6s0" class=3D=
"a3s" style=3D"overflow:hidden">1.0.0 -&gt; 1.0.1<br>
<br>
libical switched to CMake build system<br></div></blockquote></div><br>I di=
scussed this patch with Maxin earlier on IM, but for everyone else Jussi se=
nt a version of this in October which doesn&#39;t have the perlnative requi=
rement but is broken in multilib builds as libraries go into the wrong dire=
ctory.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a113ecf40fe8c100525f1be94--
