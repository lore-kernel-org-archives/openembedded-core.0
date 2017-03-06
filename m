Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id D55BE6AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 22:36:32 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id p64so60977748qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 14:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JPWHSbXhW8X4o6E+1srEjUMx40TJgzjFV3muj6dEwLE=;
	b=ROiE0rCB8lNtjVX+njXTCfRnUUlNKdPxrXKXfI/FL84vwJyhAmuOCp7BRxXtxL2Gpn
	Rcs9Wt/Vyy/bDAmd/RsUx9Rg0dwIkz2c6WmWGlZ8UFPNEnbz8RW1MmdLSUXY8o4o1LoZ
	Tg9B2DiCQGyRNusRtHvMLhNPqsx+eesPsVuUbHAu3aP6ocNhRW0fMncKq0XF8+HrzhbM
	U68MJ4zjuR8idgunzcDpcy7zdi4bZUqX8xBgzkRuSPkPLSDMw8HR0VAjKk1qBTQefZBk
	DaZ7GWxw/d/OhJDYfTJ8MqF5P/TaDS/iAc++8cxJPHM6GH1ND05xNgcVE7Xi6iQMG5VT
	HJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JPWHSbXhW8X4o6E+1srEjUMx40TJgzjFV3muj6dEwLE=;
	b=myhTjen7EanBtF/H9EnxoArBM01/OkPyvX0ry+ZGrSpBbbB7hiTm1ASFrCOBhL6cSB
	n1mw500vueHktUemdqm3MrPtT867m5BOhYGd3polEb/ew6JSEdlQYX/WZptsNOA6eWbq
	4EUsHIYOMzggJKb6UShhXfBZfNthUDa44szTmTCwLRS/9Mpz/J/Nc8W5YSxfYFNJgcmD
	BanH+hIgIwt+5ScmXVQr4Lx7VcF+ajBZ8oCR5Q5cnh58sYJoM1TwGc+KeuFLTjwT0KVO
	3ADYoEOydZIuI5TElo6W6DDP90lpcOF4LX6h9OPrrkcwASmIHXBFnf3bscI2Ip1zcgMB
	v4Og==
X-Gm-Message-State: AMke39m6ysQbOj8K7ZH/engbn4PKvcl/IOa/fRHyIQnxsFDU484+dnZaoNJyNTpmzv5XksuDmmlfy6RKOU85p7Y6
X-Received: by 10.237.33.69 with SMTP id 63mr9661120qtc.109.1488839793744;
	Mon, 06 Mar 2017 14:36:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 6 Mar 2017 14:36:13 -0800 (PST)
In-Reply-To: <1488839646-19178-1-git-send-email-armccurdy@gmail.com>
References: <1488839646-19178-1-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Mar 2017 22:36:13 +0000
Message-ID: <CAJTo0LaX_0msZv=MZRYCCLZGPQNN5SRL6tUCPpwp0LXW00ruZw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity.bbclass: allow s3 protocol when sanity checking MIRRORS, etc
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
X-List-Received-Date: Mon, 06 Mar 2017 22:36:33 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c7fc808f554054a178710

--94eb2c0c7fc808f554054a178710
Content-Type: text/plain; charset=UTF-8

On 6 March 2017 at 22:34, Andre McCurdy <armccurdy@gmail.com> wrote:

>      protocols = ['http', 'ftp', 'file', 'https', \
>                   'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
> -                 'bzr', 'cvs', 'npm', 'sftp', 'ssh']
> +                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3' ]
>

Maybe bb.fetch2 needs a "list the protocols you support" method?

Ross

--94eb2c0c7fc808f554054a178710
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 March 2017 at 22:34, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3mt" class=3D"a3s =
aXjCH m15aa5c2d65e7e755">=C2=A0 =C2=A0 =C2=A0protocols =3D [&#39;http&#39;,=
 &#39;ftp&#39;, &#39;file&#39;, &#39;https&#39;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;git&#39=
;, &#39;gitsm&#39;, &#39;hg&#39;, &#39;osc&#39;, &#39;p4&#39;, &#39;svn&#39=
;, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bzr&#39=
;, &#39;cvs&#39;, &#39;npm&#39;, &#39;sftp&#39;, &#39;ssh&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bzr&#39=
;, &#39;cvs&#39;, &#39;npm&#39;, &#39;sftp&#39;, &#39;ssh&#39;, &#39;s3&#39=
; ]<br></div></blockquote></div><br>Maybe bb.fetch2 needs a &quot;list the =
protocols you support&quot; method?</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0c7fc808f554054a178710--
