Return-Path: <ticotimo@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id ED6A66FD36;
	Thu, 29 May 2014 21:37:47 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id j17so1014077oag.27
	for <multiple recipients>; Thu, 29 May 2014 14:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5QAu2B+9+U5QwjV89IBolkGs4VCJ7J9YJpISOId/M7Q=;
	b=y3Modx6ZnSl3RrZ63s42T541d7MkCSiTZrWwG9onnb04QGi5Fjb/Gh5cHaAxqJ5q9/
	V+ffRsHpBM/YXOOewZvEFJ/M+zU+vz+f1GR6L0NNgaN7fNL1Lft+1rPwheQuo/Ws5Vqj
	7FLnQUkNOx9csKXQ3+y3/xwpIybo35XeJl1lWD8y/MK1UDOHjCR/hMCQghHiM8/8L7Em
	l5JN/gkVH+rdYTe6yqBvaoy/6tiusDVJWL5QvR9pKbw0eHlTQs8Wgx4L4mPigJMa9EWV
	fX65X+ndFANwzkeNftxN8rfBkcmTeCnvbeKV09okJWWB4CN5pVprRGPBkxOaDGToylw2
	lWsg==
MIME-Version: 1.0
X-Received: by 10.60.146.167 with SMTP id td7mr12154957oeb.6.1401399468072;
	Thu, 29 May 2014 14:37:48 -0700 (PDT)
Received: by 10.182.240.136 with HTTP; Thu, 29 May 2014 14:37:48 -0700 (PDT)
In-Reply-To: <20140529204641.GG2426@jama>
References: <20140529204641.GG2426@jama>
Date: Thu, 29 May 2014 14:37:48 -0700
Message-ID: <CANx9H-CqcZvRKkCSzh6Aa1TGpuaYbBzdWD=Td+rEQmgPBWsEBg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, test-dependencies 2014-05-29
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
X-List-Received-Date: Thu, 29 May 2014 21:37:54 -0000
Content-Type: multipart/alternative; boundary=047d7b5d376c7ba47a04fa90bd7f

--047d7b5d376c7ba47a04fa90bd7f
Content-Type: text/plain; charset=UTF-8

On Thu, May 29, 2014 at 1:46 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> This time it wasn't "incremental" build so it took 14 days.
>
> Complete logs:
>
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.dependencies.20140515_124327.log/
>
> ...
>
> Found differences:
> ...
> weston/weston/latest lost dependency on  lcms
>

This is fixed in patch to v1.5.0 submitted today.
http://patches.openembedded.org/patch/72963/

weston/weston-examples/latest lost dependency on  libpoppler-glib
>

I will look at this. Might be fixed in v1.5.0 upgrade.
http://git.openembedded.org/openembedded-core/commit/?id=7c40efb62f34f866c98a0b2df50d66c60d76143a


>
> --Tim

--047d7b5d376c7ba47a04fa90bd7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div><div class=3D"gmail_extra"><br><br><div class=3D"=
gmail_quote">On Thu, May 29, 2014 at 1:46 PM, Martin Jansa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">This time it wasn&#39;t &=
quot;incremental&quot; build so it took 14 days.<br>
<br>
Complete logs:<br>
<a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/lo=
g.dependencies.20140515_124327.log/" target=3D"_blank">http://logs.nslu2-li=
nux.org/buildlogs/oe/oe-shr-core-branches/log.dependencies.20140515_124327.=
log/</a><br>

<br>
...<br>
<br>
Found differences:<br>
...<br>
weston/weston/latest lost dependency on =C2=A0lcms<br></blockquote><div>=C2=
=A0</div><div>This is fixed in patch to v1.5.0 submitted today. <br><a href=
=3D"http://patches.openembedded.org/patch/72963/">http://patches.openembedd=
ed.org/patch/72963/</a><br>
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
weston/weston-examples/latest lost dependency on =C2=A0libpoppler-glib<br><=
/blockquote><div>=C2=A0</div><div>I will look at this. Might be fixed in v1=
.5.0 upgrade.<br><a href=3D"http://git.openembedded.org/openembedded-core/c=
ommit/?id=3D7c40efb62f34f866c98a0b2df50d66c60d76143a">http://git.openembedd=
ed.org/openembedded-core/commit/?id=3D7c40efb62f34f866c98a0b2df50d66c60d761=
43a</a><br>
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br></blockquote></div>--Tim<br></div></div></div>

--047d7b5d376c7ba47a04fa90bd7f--
