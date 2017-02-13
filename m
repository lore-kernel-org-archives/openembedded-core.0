Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 72243731C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:36:55 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id x49so86184701qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 07:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YLMZ/WWXysXFlzBOdlnQX25K+7T8GobbXY/yFiQDgBY=;
	b=C8vBctPrIKXbQFf1oRjkrW+uSG798pGca3Sk9buexpmKp/qUB0qXCxH7hgLpwj9Hs0
	z7GKtkycX9CjKiEXRsthOcjEEMjHExTqhmZ+zvV304XnhxpctTCAMZs3pGFjdmi0Xse0
	t5sfEjbk9PP7YYyaHBv7l0gNrxSks/9Ub/SCmDQxXf917IcAxNOJHjEpe/QbgD1f+OMZ
	JdsLEc9vmiSaQydwsvYTKVmTg7+oIEUBWXVL6Njr728OdejdOOm/rHBKBg7zK3BdD42t
	r1wfE8JF3md9N+A3AfplkTVDR5YpQtvckBZAIqNnMtEtOPPl753ZhZKMqslLwXl2ymZe
	iNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YLMZ/WWXysXFlzBOdlnQX25K+7T8GobbXY/yFiQDgBY=;
	b=SEf2nO0EuoOKAQsrROViygJ0aHquOQYyE6TYsAiLK+AA3xmaSLmzhm7lkf5erskdk3
	skiuywfEQDXhWjJL4tnrbtaWpQEsoVaTxLrJvwxlQgLA/gqrPAAkjH5utk6VAX9T3g/c
	MGjQOlra0X3qwa1Tij1fxcIeMyLb1M2EQQiUaeptMnIoj7MA5cSROdZAPyLuj/cAEhiu
	MTgMrN/AjPUG2rHiVKZ9oENk1ckrzma3tQbG7hA1rrWPQxH2BJ2Wgo2lxCFIHP1H7m4n
	P7ZMUcT+WK8LAQ9wcXButwqzi0bfCBriHQt556feAJwVAR82LPS3Ohnhnt1hHQYzZdRe
	r5LQ==
X-Gm-Message-State: AMke39n8ibhDqExCaeKEZFxRFBjlX4I1R18JKqrYb/Aqju7x/wBWoUj+G4JVs/gP4HB/uDUov3MaBgQHop8A13GQ
X-Received: by 10.237.39.148 with SMTP id a20mr22318139qtd.65.1487000215824;
	Mon, 13 Feb 2017 07:36:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 13 Feb 2017 07:36:35 -0800 (PST)
In-Reply-To: <cb62217431175ee1029d3d223e9940886aa0e637.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<cb62217431175ee1029d3d223e9940886aa0e637.1486997986.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Feb 2017 15:36:35 +0000
Message-ID: <CAJTo0LYjW=pgmayQ-kb+Caae7OJggiPf2hQHn3gnboSFZscdpg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 30/36] selftest: do not perform a full build in test_continue
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
X-List-Received-Date: Mon, 13 Feb 2017 15:37:03 -0000
Content-Type: multipart/alternative; boundary=f403045ee6d8a56a7605486b3737

--f403045ee6d8a56a7605486b3737
Content-Type: text/plain; charset=UTF-8

On 13 February 2017 at 15:06, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

>          runCmd('bitbake -c cleanall man xcursor-transparent-theme')
> -        result = runCmd('bitbake man xcursor-transparent-theme -k',
> ignore_status=True)
> +        result = runCmd('bitbake -c unpack -k man
> xcursor-transparent-theme', ignore_status=True)
>

It's still doing a cleanall, which is removing stuff from DL_DIR.

If the test adds a function between fetch and unpack then it won't need to
do anything apart from bitbake -c unpack -f to run the test, and then a
cleanup -cclean to remove the tainted hashes.

Ross

--f403045ee6d8a56a7605486b3737
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 February 2017 at 15:06, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":11e" class=3D"a3s aXjCH m15a3805d74b68f27">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0runCmd(&#39;bitbake -c cleanall man xcursor-transparent=
-theme&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;bitbake man xcursor-tra=
nsparent-theme -k&#39;, ignore_status=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;bitbake -c unpack -k ma=
n xcursor-transparent-theme&#39;, ignore_status=3DTrue)</div></blockquote><=
/div><br>It&#39;s still doing a cleanall, which is removing stuff from DL_D=
IR.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">If=
 the test adds a function between fetch and unpack then it won&#39;t need t=
o do anything apart from bitbake -c unpack -f to run the test, and then a c=
leanup -cclean to remove the tainted hashes.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--f403045ee6d8a56a7605486b3737--
