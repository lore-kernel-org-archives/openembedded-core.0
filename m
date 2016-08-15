Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7995B7713C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 09:25:54 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id u186so33684745ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GdrhQveW8WkdNaxbIkMnEIRXeeuRuOvHCjdnaLWrrcg=;
	b=FQVzQZD1T6ebxBSnEscPegQNuhXnW8MfRGvWCmTHQ/mGWjRAEZ1Aeqy5KO0ldpSvCY
	D3Jj2EjjDtH+zVrftrtWpO5q5vH5nZS9niOb7y05JDiGd2bAMVhGt6d6/S5W3C6ruYsq
	Nwv9s+LsMsMky9u8vOX3v1pw8JMaGUhgIooxkLqxapaqENEZ1MdayW4BCX+i4WU265w9
	jMvY/pW1RLWK2/TEeQuiTeRY8275F7vTC5cxfDh7Hctnhx+2x1Dc/S8zchicero36J5e
	EyAq5nONSY61GM/d5voUbkQ0jXrlwr6n4kEjl4Y7LJamJFwweqMBJApD8jOI9zCAPxgu
	pGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GdrhQveW8WkdNaxbIkMnEIRXeeuRuOvHCjdnaLWrrcg=;
	b=PwJqZVDq+IeYuyEpDI619Rg4DgV+1+/+RM47SNkRHdflIBoy0dy7rwv1evGlwRl5Io
	M4rtn5IhFCb/BjdFAXWtZozWEeuYgZ3bn+gghT+LrveuR0aCGtngqb3yG6ZB3qCXMVHR
	zAaePswu1Nc3MRyeLaVJz+iBioaTHhpKPBFRWy/gY7W9QdWOMzWCLV2rEulfU7jlaT4h
	+u4GQgKKmc9aLgVYXwbsbKVNpF7b3AKa/vrsfGAPVvRzHvcFNl5MqJAxrZcgvJ0wfGbf
	bcSN2PcXZ1WsJVLatwPeU2MVicgmRbkCZcJrsQCqKcYWZxCwNIMjoF8U/Z3yycsXXiZ2
	8EGw==
X-Gm-Message-State: AEkooutS5OVTdSAkkpnFpG4LZRsebdzRuh5NG3HvUCRVjsYV1N/epeqUILbmsdYeeqUL1KpPxijEAcQYd/qvhvpf
X-Received: by 10.36.237.200 with SMTP id r191mr3107931ith.0.1471253155449;
	Mon, 15 Aug 2016 02:25:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 15 Aug 2016 02:25:35 -0700 (PDT)
In-Reply-To: <1471244547-1816-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <1471244547-1816-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Aug 2016 10:25:35 +0100
Message-ID: <CAJTo0LabQxr69EodUwHuuzjbrdi6kWDumjvYpYHpk3n5VPWugg@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] adwaita-icon-theme: 3.18.0 -> 3.21.2
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
X-List-Received-Date: Mon, 15 Aug 2016 09:25:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c041a2cb4b116053a18d1a8

--94eb2c041a2cb4b116053a18d1a8
Content-Type: text/plain; charset=UTF-8

On 15 August 2016 at 08:02, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> Upgrade adwaita-icon-theme from 3.18.0 to 3.21.2.
>

x.[odd].y are development releases, so this should upgrade to either 3.20.x
or 3.22.x.

Ross

--94eb2c041a2cb4b116053a18d1a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 August 2016 at 08:02, Wang Xin <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:wangxin2015.fnst@cn.fujitsu.com" target=3D"_blank">wangxin2015.fnst@cn.fu=
jitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1tj" class=3D"a3s aXjCH m1568d2c6f3c5c7d8">Upgrade adwaita-icon-theme =
from 3.18.0 to 3.21.2.<br></div></blockquote></div><br>x.[odd].y are develo=
pment releases, so this should upgrade to either 3.20.x or 3.22.x.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--94eb2c041a2cb4b116053a18d1a8--
