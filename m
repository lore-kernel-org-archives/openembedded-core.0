Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id AF58F606B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 10:16:08 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id k6so5781489ita.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Feb 2018 02:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cWQYdpOa6YFlXZX6BAKOwkgDp0aLZfSGFJ1vizP6d2M=;
	b=w9pCpU6zOSzf5VoNAM/EgxyMwY2SRPus6yXuEY96rCShX8S2xy2vFZls8Ysul48wIX
	qBfZ+I+eiruali3TJdWJIwx26yZLhBu9PTh/yR/p9TMc0c9x0oZ6F3v5j9V1y03lrdkf
	ddjLeX3P3HZZd/hxftUKjTx2FKrOKtLStsFegIk7ivnWioGgvOBVvOj7aiZJd2sSdgrR
	R321Bg5gKe4iNfNJE9V5Ru0cWjDC8biQOjcKrHl3mtZb/d5i19Q2o2E7AhKPM+XUv2gC
	TgpQzJRUFhOsLE2E9cH0XJU+BA207gO68q1MuNKttap959A6qBaIrxYBMRh5uVI8Pbdf
	bneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cWQYdpOa6YFlXZX6BAKOwkgDp0aLZfSGFJ1vizP6d2M=;
	b=tz4/A7nRirye8m4jYZ/oYpq/ydN+JqmcG64//edB8b4qqUQ169/ZNuM/1gLQD31FQJ
	VMYCbwxO38UuQyrZhS31QHXgjdAen7fF/B9t1IXvZv+ROG2d8gUaiCwn3GUbYGdURvOj
	oCWTDrBZ4GGtD2mp28H35X6z6PnavwCXg8D8/HwJdvbHyq4H8qoRxeW8byx4aCnVRBMP
	js6sHg8TqO6yC2kIAhjyh9WCOAOUhlc+aQEasRa30/4C7jzPExYz9vXY82EdpaHU3DO0
	S9zLvY1zJmWAqovWUnlEek73qi+U/sF+eB2jYiOU1y30voQW54ocb2SILEEmgqiKm0hY
	r1rw==
X-Gm-Message-State: APf1xPDIN4n99Si6C+Rhat8JMD9L064RZ92i2RAe3HM4i4qJe+SbNzfT
	mFtUxqYJ/s8c9674BLbHTOM2APQN3UbktwwZiSx/Wg==
X-Google-Smtp-Source: AH8x224VhpO3JQE/G8MsvCPViwsPwNMNyL67MxRKGITZ2Af2tjXQt8/pb/5DDr4d5yXHMIqD6gSLZZ33ImeYh4nf620=
X-Received: by 10.36.61.142 with SMTP id n136mr732519itn.6.1518084969807; Thu,
	08 Feb 2018 02:16:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Thu, 8 Feb 2018 02:15:49 -0800 (PST)
In-Reply-To: <1518071376-7716-1-git-send-email-vineethchowz.chowdary@xilinx.com>
References: <1518071376-7716-1-git-send-email-vineethchowz.chowdary@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Feb 2018 10:15:49 +0000
Message-ID: <CAJTo0LaD24Zi+uWc+0o0BsNSeEF0Br3Z3WQy7JJnEaC6Jy6vWg@mail.gmail.com>
To: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage.bbclass: Fix 64 bit ENTRYPOINT
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
X-List-Received-Date: Thu, 08 Feb 2018 10:16:08 -0000
Content-Type: multipart/alternative; boundary="001a1144467e5d4e4b0564b0b3ee"

--001a1144467e5d4e4b0564b0b3ee
Content-Type: text/plain; charset="UTF-8"

On 8 February 2018 at 06:29, Vineeth Chowdary Karumanchi <
vineethchowz.chowdary@xilinx.com> wrote:

> 64 bit entry point should be passed in 2 literals ( "0x1 0x00008000"
> ).ENTRYPOINT is assigned with first half only and erroring out as
> 'command not found' for the second half. Adding quotes while assignment
> fixes the
> issue.
>

Does this mean that this expression below is broken too?


>         if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
>                 ENTRYPOINT=`${HOST_PREFIX}nm vmlinux | \
>                         awk '$3=="${UBOOT_ENTRYSYMBOL}" {print
> "0x"$1;exit}'`
>

Ross

--001a1144467e5d4e4b0564b0b3ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 8 February 2018 at 06:29, Vineeth Chowdary Karumanchi <=
span dir=3D"ltr">&lt;<a href=3D"mailto:vineethchowz.chowdary@xilinx.com" ta=
rget=3D"_blank">vineethchowz.chowdary@xilinx.com</a>&gt;</span> wrote:<br><=
div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">64 bit entry point should be passed in 2 literals ( &quot;0x1 0x00=
008000&quot;<br>
).ENTRYPOINT is assigned with first half only and erroring out as<br>
&#39;command not found&#39; for the second half. Adding quotes while assign=
ment fixes the<br>
issue.<br></blockquote><div><br></div><div>Does this mean that this express=
ion below is broken too?</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${UBOOT_ENTRYSYMBOL}&quot; ]; =
then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ENTRYPOINT=3D`${HOS=
T_PREFIX}nm vmlinux | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 awk &#39;$3=3D=3D&quot;${UBOOT_ENTRYSYMBOL}&quot; {print &quot;0=
x&quot;$1;exit}&#39;`<br></blockquote><div><br></div><div>Ross=C2=A0</div><=
/div></div></div>

--001a1144467e5d4e4b0564b0b3ee--
