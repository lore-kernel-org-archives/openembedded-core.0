Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id BAE1A6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 16:28:13 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id e124so31077380ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Sep 2016 09:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ljZZK+PO4cutm6J9EcknjRWhejWwdUZfFgDgqwq/YYU=;
	b=XYatPIYN/o75AJTYCPzz79UZIQ1B+mnHmZim3yZYB2ADI+L2toDYfOP5QK/4zzzTSK
	fKc8ARPj79KN6hm/wvaiEMeh6eNxgZ6547xHekhlCWa00ljlooOvR5BLl2EH9JkBJiKD
	SVo35cA/EBlK8E+ch4Stju5Bpxhzrt4YiiHM4o+5SRd1YH3R5VitSpwmUT2feafcwknE
	2tgpbU1lIdAZWfl+KAZT1v24L6rFJHJyJxQbQybVL/pfdm5OoIJJJNfgIwO4UXrtcu9/
	3nt1q45POFhn/LGOu063Y4l06RFF3O+n9xrwK72kcKPa6T6Dc85fWjIeVxSfRv4SUIl1
	G2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ljZZK+PO4cutm6J9EcknjRWhejWwdUZfFgDgqwq/YYU=;
	b=ComanEbGoqah1gxNcqFUY/HezqESnSTvebHPQG7aGUKEqlEm3M2mdmfNwCrBeSdNdB
	CQCmJSycwJpUurpq4tm8ucqRBE5y5vld6f8yTNuo0QEA6es2NCThVXvO143XdOqZ+4CR
	FY/P6iikks+ABxd3kl+F3/jslhQWM5oQn2n0xVxB1f0+i7E89qLHvPDGh2dt9AUjhxEF
	HygM5/7iOCSk9rPRtst+LUqiYfaN/fMQTH9lp5EdL8WILChiLAhOKuYpUk5/KfDfvrui
	MQGoNwj1up2zrJLyya58UetVKOzz3JgI9mdb6Lw1R0a2JbZazok1Wco3GWaJZuUTVje5
	YlrA==
X-Gm-Message-State: AE9vXwOUr9D5wiCxg3M3JiyAiVahoasGzGeQBPkN39Pir8vSATKeiMM/nigiukH7oQr9arMNweZ0q+ZAG6uy0mcW
X-Received: by 10.36.124.141 with SMTP id a135mr7380081itd.25.1473265693818;
	Wed, 07 Sep 2016 09:28:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 7 Sep 2016 09:27:53 -0700 (PDT)
In-Reply-To: <1473199905-13645-2-git-send-email-henry.bruce@intel.com>
References: <1473199905-13645-1-git-send-email-henry.bruce@intel.com>
	<1473199905-13645-2-git-send-email-henry.bruce@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Sep 2016 17:27:53 +0100
Message-ID: <CAJTo0LYK5DPCSzhtWtexBe6Y-tZKu61EeEHzPcVz=qkrqCj_Jg@mail.gmail.com>
To: Henry Bruce <henry.bruce@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] utils.bbclass: Added error checking for oe_soinstall
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
X-List-Received-Date: Wed, 07 Sep 2016 16:28:15 -0000
Content-Type: multipart/alternative; boundary=001a114a967a5768fa053bed66ec

--001a114a967a5768fa053bed66ec
Content-Type: text/plain; charset=UTF-8

On 6 September 2016 at 23:11, Henry Bruce <henry.bruce@intel.com> wrote:

> +       if [[ "$libname" == *.so ]]; then
>

That's a lot of bashisms in one place ;)

[ not [[
= not ==
*.so will need to be escaped in case it matches anything in cwd and expands.

Ross

--001a114a967a5768fa053bed66ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 September 2016 at 23:11, Henry Bruce <span dir=3D"ltr">&lt;<a href=3D"=
mailto:henry.bruce@intel.com" target=3D"_blank">henry.bruce@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":52o" class=
=3D"a3s aXjCH m157018f8dd3eefcc">+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [[ &quot;$l=
ibname&quot; =3D=3D *.so ]]; then<br></div></blockquote></div><br>That&#39;=
s a lot of bashisms in one place ;)</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">[ not [[</div><div class=3D"gmail_extra">=3D =
not =3D=3D</div><div class=3D"gmail_extra">*.so will need to be escaped in =
case it matches anything in cwd and expands.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a967a5768fa053bed66ec--
