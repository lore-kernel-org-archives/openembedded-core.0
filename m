Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id AE55060125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 15:02:53 +0000 (UTC)
Received: by qkgv12 with SMTP id v12so11539372qkg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 08:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ig+NBAQMpMVxe5w7Ub3ZABJL2LjBZat0eWOLqoTB2vc=;
	b=BH2Q8pwJ7xwY+OOr5uue30bUJ/xpVTVgsk5fL9X0CwRXkq40sn0iiXZUNI6GdKDksb
	Rwx0IQA7gcFSoX8dLx/BIejUQaGEn7qC+G2Jd7dICL/f2IVLw/+YI8sktDz3Uo7OqFeq
	TYcYVNhEy3lnL74W6BsCvrep4V/LhopTmUIe2EQ1UtCnhPWc3s2IHRWQ2o50rIpaSzVc
	Jjyq46tc3cS9Gwpef3QlwcQUFzhILMpzMd+FSgjDu9kzBmKVHH/n0wReeY0gqxQhnwRi
	xL0n5QgjRF+2+Aywkp/qfYf7I7oGYjnuSBGdYGHmVk2l6qNnh6Mwq4cdydghd98l8hP3
	3JXg==
X-Gm-Message-State: ALoCoQkZp7rtnwm3SW0TSu4vNJln/GG0dnG7d8ZbeffNUcz+SFNXOarBahDCgbrpZya1hxl5zcuy
X-Received: by 10.140.88.35 with SMTP id s32mr35765748qgd.59.1432047773350;
	Tue, 19 May 2015 08:02:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 19 May 2015 08:02:33 -0700 (PDT)
In-Reply-To: <1432047670.1403.4.camel@tkkaskin-mobl3.ger.corp.intel.com>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
	<1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
	<CAJTo0LacJyy9q9NOH5UAW3gihD-uDpAWRiru5mkbpNLrUCPepg@mail.gmail.com>
	<1432047670.1403.4.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 May 2015 16:02:33 +0100
Message-ID: <CAJTo0LZ5cPYknZCdo0PWrhKxoqu2ha_6L85NCDEjkrL3Y8_daQ@mail.gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Tue, 19 May 2015 15:02:53 -0000
Content-Type: multipart/alternative; boundary=001a11c11d02d50cad0516709a61

--001a11c11d02d50cad0516709a61
Content-Type: text/plain; charset=UTF-8

On 19 May 2015 at 16:01, Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
wrote:

> meta-guacamayo and meta-webos were used as references when writing the
> recipe. It's not a straight copy of either.
>

I was hoping you'd say that.  :)  Please mention that in the commit.

Ross

--001a11c11d02d50cad0516709a61
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2015 at 16:01, Tanu Kaskinen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:tanu.kaskinen@linux.intel.com" target=3D"_blank">tanu.kaskinen@linux.in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:9us" class=3D"a3s" style=3D"overflow:hidden">meta-guacamayo and meta-webos=
 were used as references when writing the<br>
recipe. It&#39;s not a straight copy of either.</div></blockquote></div><br=
>I was hoping you&#39;d say that. =C2=A0:) =C2=A0Please mention that in the=
 commit.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a11c11d02d50cad0516709a61--
