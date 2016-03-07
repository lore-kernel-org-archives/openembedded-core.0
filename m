Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6B54B65C5C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 20:38:30 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id ig19so34357527igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 12:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=icuZSnnHU+iuiasfcU2W29OBxlzviMOd4c7jVTn2jUA=;
	b=sy6zDM5GqwoiceRrcOWlOyRX8IkXXUpEV+Nfj6ghWDlDVxxS/TZnqRDmFh8m2NtjUI
	TauVU1d7IAFYCQWoPfjCZS/oShkXcX6ghtGAgIFRxyjeLf0BypIt0x14xsdQHvwBgwhC
	qUK7XKjSd0SvhVmEd2vs+P/afOYH9Gwl6ByYgHWbXlakHHcGrHi/lojCNWfZjVCVXZjc
	x+sjidtqX6GF60uP/7OEtIqKApUAhvuSo/ElZLQ4N1c1LfQmQvsBSiikn1XaJ4md5Bqb
	SrV/vSoLY5S/ehcKjKXjheK8M7FkyWS+PdeZiQF8dz3D8i7+hbNHILpbNLM+vO7S6uwD
	2Llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=icuZSnnHU+iuiasfcU2W29OBxlzviMOd4c7jVTn2jUA=;
	b=H8V+1dO7+uqT23HE4TW7/kQ81RuBGBMqkcoLARwvZNMcOZ5eTn1vvOKdkz2KMafnSx
	+LImBbNU8GCg3tLC2kpReSYYNXVKW2u5RzXp7vN0lPwuXSHrBw1p7L+GY0Y6xH1NQ/zC
	PqUcv1n5EJ0MvtTdjUhtXSE++wuKjgC9vg2gQIrAMwgpvh5fXoNiPfg3+hXSSiCIhg6N
	65Bj8Tibf4T8iWQoqaLAGFfIDGQTv6LrHsis1YBCgKGXMdvcqw4NtfknqP8lB+JtPHQD
	OXYQATTX18PwPkqn7nJh9to0WRAalz2Ggv3F1vOwaVyFC5vnGZXrsZMrpWaED+jdVvC6
	fQqA==
X-Gm-Message-State: AD7BkJLeBZdtWMHbAh3V/ogD5Z9AfA2GNJY7ueaNinDBqz2muOw7x8DDfx/qs83EgSAb6rfX7tILpG4e6xEI+afE
X-Received: by 10.50.43.226 with SMTP id z2mr14697682igl.78.1457383111545;
	Mon, 07 Mar 2016 12:38:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 7 Mar 2016 12:38:12 -0800 (PST)
In-Reply-To: <1457115676-11034-1-git-send-email-bruce.ashfield@windriver.com>
References: <1457115676-11034-1-git-send-email-bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Mar 2016 20:38:12 +0000
Message-ID: <CAJTo0LajsWP8e8r-FUXnTirm7RyF2Ss=MwWUqpzWux_zWCQ2NA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto/kernel-meta: ktype refactoring: move DEBUG_KERNEL, EXPERT and EMBEDDED
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
X-List-Received-Date: Mon, 07 Mar 2016 20:38:31 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4aa70e0052d7b725d

--047d7bfea0f4aa70e0052d7b725d
Content-Type: text/plain; charset=UTF-8

On 4 March 2016 at 18:21, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

>   Some coordination is required for this change, as existing BSPs WILL be
>   affected, and will either need to accept the changes in the standard
>   ktype or move to the developer ktype.
>

As qemu machines are never going to be used in production I think we should
enable some of the new ktypes.  Currently qemux86 produces this:

WARNING: lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0 do_package:
lttng-modules: no modules were created; this may be due to
CONFIG_TRACEPOINTS not being enabled in your kernel.

Ross

--047d7bfea0f4aa70e0052d7b725d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 March 2016 at 18:21, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex"><div id=3D":gl" class=3D"=
" style=3D"overflow:hidden">=C2=A0 Some coordination is required for this c=
hange, as existing BSPs WILL be<br>
=C2=A0 affected, and will either need to accept the changes in the standard=
<br>
=C2=A0 ktype or move to the developer ktype.<br></div></blockquote></div><b=
r>As qemu machines are never going to be used in production I think we shou=
ld enable some of the new ktypes.=C2=A0 Currently qemux86 produces this:</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">WARNING:=
 lttng-modules-2.7.1+gitAUTOINC+45e0ebd91f-r0 do_package: lttng-modules: no=
 modules were created; this may be due to CONFIG_TRACEPOINTS not being enab=
led in your kernel.<br></div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--047d7bfea0f4aa70e0052d7b725d--
