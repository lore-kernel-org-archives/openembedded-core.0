Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id CD6DD71B9C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 12:15:42 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id z190so195033299qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 05:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lZUy5yU5KdmYcQ5QMqybsP8HBz9ycdBHL6tn6PFy3KI=;
	b=S52xmp4bge+/bcOL3NQ289q9H5j3KG1YkJuXHukn+7PgbCkCd2RfQ7vmrgNFnVqDup
	WvjsnB55Tg1K6U/SKMSrW+Y4gWXLq3sMxbRT/sqCGP3cRtggjB2EvgFGJwmpK0knwS+J
	CaWA+B5XptKkqhJeZtZ5M9fN6Pk6oDRTngz9SFZlTje9x3FB8rlEHfhNkePl9Y5e1rQh
	IFbcA0RIpXrRqcppofXB5r77AzSCYKuzGyuhrLJdpqzPKIwZBMExMGFhNdp/1ioS+xuZ
	lp7UyQn7yFIdpkLx82ai9y9SQUvZJ9zauomjUP/Tyc2cYR6y1XajkzNz53SCcjtfMnNu
	gf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lZUy5yU5KdmYcQ5QMqybsP8HBz9ycdBHL6tn6PFy3KI=;
	b=Y96XE7InMOYZYMbZV7aZ7BwPjBWO/jy2NYjdkFL7QcuD3W8DxBzLuCJi/I6d6xXpP+
	QU60Em1pc6qw0ki7+6Uufd8ELLAHejATLMmoo0KxOGijiMGf1DrKQ2l3ECG0zmKaxyxb
	fsYw9JP/Cqj7O8YN6iUDIIorq8mqkBDioMBIZ75NUIXRb/6Al92pHTjT6NB4/6tPoEst
	BVChhTRlOx51McideeuyH03d4oXZuC32uHEe9fDuWysy9pHZm7yI4XWa6Ue0m45uUMXG
	h7CG19SqLUeQ9VOGO4eXiRcIlvfG5p1u+LTK4TJ5B+S1L8TKBVSSCwepVi6WbgLQFQDW
	7fSQ==
X-Gm-Message-State: ABUngvc4+Imfbkm0zW6nogDkzIDLTa+iUacvujJEqrfobrzZ0flBfWMmqLLMi/3VcEDX3COknUdt9g1kuTFTrl64
X-Received: by 10.55.130.7 with SMTP id e7mr32786317qkd.121.1478002544347;
	Tue, 01 Nov 2016 05:15:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Tue, 1 Nov 2016 05:15:23 -0700 (PDT)
In-Reply-To: <fcb641d9-c4ae-bb72-cb96-98ec92e34797@windriver.com>
References: <cover.1477928374.git.liezhi.yang@windriver.com>
	<bc402b553331b622af35b7fea7d30d82c7f2f686.1477928374.git.liezhi.yang@windriver.com>
	<1477994978.23123.46.camel@linuxfoundation.org>
	<fcb641d9-c4ae-bb72-cb96-98ec92e34797@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Nov 2016 12:15:23 +0000
Message-ID: <CAJTo0LYvV_b-A_0J=ms1pGibfys8kdbYRojQKy=gHBDsES0uhQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oe/copy_buildsystem.py: dereference symlink
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
X-List-Received-Date: Tue, 01 Nov 2016 12:15:44 -0000
Content-Type: multipart/alternative; boundary=94eb2c074bdaa2189605403c4851

--94eb2c074bdaa2189605403c4851
Content-Type: text/plain; charset=UTF-8

On 1 November 2016 at 10:18, Robert Yang <liezhi.yang@windriver.com> wrote:

> I should explain why not use oe.path.copytree(), but it was late last
> night, so I forgot that. We can't use oe.path.copytree() since:
> 1) oe.path.copytree() doesn't dereference symlink
> 2) We need --exclude='.git'
>
> I'd like to add two arguments to oe.path.copytree() to do this if it is
> worth.
>

Adding options to dereference and exclude a specified list of files sounds
like a good improvement to me.

Ross

--94eb2c074bdaa2189605403c4851
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 November 2016 at 10:18, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1by" =
class=3D"a3s aXjCH m1581f6dbc50acbf9">I should explain why not use oe.path.=
copytree(), but it was late last<br>
night, so I forgot that. We can&#39;t use oe.path.copytree() since:<br>
1) oe.path.copytree() doesn&#39;t dereference symlink<br>
2) We need --exclude=3D&#39;.git&#39;<br>
<br>
I&#39;d like to add two arguments to oe.path.copytree() to do this if it is=
 worth.</div></blockquote></div><br>Adding options to dereference and exclu=
de a specified list of files sounds like a good improvement to me.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--94eb2c074bdaa2189605403c4851--
