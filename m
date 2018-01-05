Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id ECE41787E9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 18:41:15 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 14so6704122iou.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jan 2018 10:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=utJfigOkSopRWO87d3ovKv/qJhOU9O+odtNEy1rbrWo=;
	b=mDCJz29JuAZJZ9ay9rGsuGN4EuYL63xvNiTHVYgvWSgT456dVCEO1iGTeqzPaWq+Bk
	35lfkMhaJFOoFwuK838ZfY5vcFtFL6AWEEGUf3FaXXHzBoAz7zsuDh8Ps2iqW8hSfCGB
	yfXkwtb5EVq9UbH1cIxs1G+xwKWv070v3is543u7+2QbL0DHQkjgb/4ygPXLC69sDL+P
	MoXKQuuiFMJEmjUFqiEqnf+dr640YwS9BQT3F9nu++TwhaAm/d+edoCu4TbQD4zdCnJ/
	VQdEVKvMsUTAnn4ZRJIPRmUbxq7o+heHSmI0B3v66BbKW8/BolQzG49ZiDSeDTH6LNqC
	T7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=utJfigOkSopRWO87d3ovKv/qJhOU9O+odtNEy1rbrWo=;
	b=QHfPA/Lx9vzDTLs5RMgsOlrliXKnjLJCzU32pga6jyux66NqlOWmGankHKsEb4E2V6
	nGbhJsLE7l9fqXU11i+gIW7zd2amTX8bik8l9rfU74PJS/k3NhaFbasKYigMWgLI/BWw
	ArRshl4OZi9ogCjt0jxph4qC2xLJEAKc1U6oCyI8UzH/gYKhSSxAAU8nFk/FdfglAYAr
	OZZQ2HrvLyHxbAvIkXerl729B+IzBg6Gm2MB9zsW6ydW3OOe3UrSZ3XjgWc8K9eJgxjL
	DjBrsAKVS/8HHfhk25rDlQ1HHsw3LRsDATqWqZzOheEObuKljteP/710LuUDre6ufISJ
	6vHA==
X-Gm-Message-State: AKwxytewOmLTsvT5j1o3KspyPVysUyh1uA/RQJtF8KMRQsIFhjL9KoUq
	g6ZXJm36akWkgi7z9FCqavaU9sLF4kWLboqA2KUhwae6
X-Google-Smtp-Source: ACJfBouYbjqqUhn4bTd2JN4q+lIq7VSvPqJMxb7YKKyMgUJM2vjt59fjmPPH4JhhV0Pr8U5bAJuesPZpjFZN1dE22VE=
X-Received: by 10.107.9.232 with SMTP id 101mr4010134ioj.52.1515177676939;
	Fri, 05 Jan 2018 10:41:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.34.133 with HTTP; Fri, 5 Jan 2018 10:40:56 -0800 (PST)
In-Reply-To: <20171227100158.xjmons3d6qo5xfqp@quelle.benny.de>
References: <20171227100158.xjmons3d6qo5xfqp@quelle.benny.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jan 2018 18:40:56 +0000
Message-ID: <CAJTo0LZQSoPOvpStEUZohgVdEaY91Z+yU9JOAZvH45YWfab0uQ@mail.gmail.com>
To: Benjamin Hagemann <benny@benny.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: licence of enigma2-plugin-extensions-pictureplayer
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
X-List-Received-Date: Fri, 05 Jan 2018 18:41:16 -0000
Content-Type: multipart/alternative; boundary="001a113ecdbe34d20f05620bcbb8"

--001a113ecdbe34d20f05620bcbb8
Content-Type: text/plain; charset="UTF-8"

No it's not, but I googled it for you and https://github.com/libo/Enigma2
suggests that GPLv2 is the license.

Ross

On 27 December 2017 at 10:01, Benjamin Hagemann <benny@benny.de> wrote:

> Hello,
>
> this mailinglist is maintainer of the enigma2-plugin-extensions-pictureplayer,
> right?
> Under which licence is this plugin released?
>
> Thank you.
>
> --
> Kind regards,
>
>         Benny
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ecdbe34d20f05620bcbb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No it&#39;s not, but I googled it for you and <a href=3D"h=
ttps://github.com/libo/Enigma2">https://github.com/libo/Enigma2</a> suggest=
s that GPLv2 is the license.<div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 27 December 2017 at 10:0=
1, Benjamin Hagemann <span dir=3D"ltr">&lt;<a href=3D"mailto:benny@benny.de=
" target=3D"_blank">benny@benny.de</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Hello,<br>
<br>
this mailinglist is maintainer of the enigma2-plugin-extensions-<wbr>pictur=
eplayer, right?<br>
Under which licence is this plugin released?<br>
<br>
Thank you.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Kind regards,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Benny<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113ecdbe34d20f05620bcbb8--
