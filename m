Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id A703C6017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 15:08:14 +0000 (UTC)
Received: by qgep37 with SMTP id p37so24360035qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 08:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xQLFlC/MYu96KTeeJIIZWKcuRN6/d69S6UMGaAgiess=;
	b=Vsu5N8zjk0pI2cLszyv+c+3Ph+34oqjvfI5pWB17mjafTHNToy7Y7AZZWxKPQYm4Te
	PxuFO84R8jL9vDCmO8OG1d3uDuKWW9U5i/s9sZdFHSqOlzsz6vaZystmYohE229sbtTv
	XWxg0xW4GE+d0i8zMv7w17vEMbQKOBZqP1B7qjRhQkUwMTFz+LyArIBMX3WT6/syAdfq
	0FbNgKVvJkiLFNGv3lWn2b0sEDgDkMXmRkl+k6GnE/T2uJnHQYceMLpRfCEr9RbZZH8e
	+d3ov54fH6ZHL+ZzdmTktDdH4ATu6sBA1skTwo0fQuP1XsnBnL4ghOCN2QoQBUADbsWy
	NEIg==
X-Gm-Message-State: ALoCoQkj7IYTOoEccpclq9XP7Q1FiKs/yImY+XPR7nWqBe7qjxPASkjaHNlPdLnwfCDY/rxh7KZ0
X-Received: by 10.55.18.197 with SMTP id 66mr25557150qks.13.1436454495106;
	Thu, 09 Jul 2015 08:08:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 9 Jul 2015 08:07:55 -0700 (PDT)
In-Reply-To: <559E8C63.20002@windriver.com>
References: <cover.1436178756.git.liezhi.yang@windriver.com>
	<3a571bfe258bda28dd34a61b2a6bf323a06ca911.1436178756.git.liezhi.yang@windriver.com>
	<CAJTo0LZYJEmmPsgiQc8R2whGkOH3vQdAXn9vwXz7W8nYA9KUyA@mail.gmail.com>
	<559E8C63.20002@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jul 2015 16:07:55 +0100
Message-ID: <CAJTo0LZGbRGdJtPjeoQQYRS1nC1-jg2OKVwOgxXU-qgpCeEB9w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc-target 5.1: fix for libcc1
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
X-List-Received-Date: Thu, 09 Jul 2015 15:08:18 -0000
Content-Type: multipart/alternative; boundary=001a11474faaeae5c3051a729f24

--001a11474faaeae5c3051a729f24
Content-Type: text/plain; charset=UTF-8

On 9 July 2015 at 15:59, Robert Yang <liezhi.yang@windriver.com> wrote:

> I put libcc1plugin.so into $libexecdir is because lto-plugin is there,
> do you know more about why lto-plugin is in $libexecdir, please ?
>

No, you'd have to look at the git history to see what the reason was.  I'm
not convinced there'll be a good reason. :)

Ross

--001a11474faaeae5c3051a729f24
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 July 2015 at 15:59, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4k5" clas=
s=3D"a3s" style=3D"overflow:hidden">I put libcc1plugin.so into $libexecdir =
is because lto-plugin is there,<br>
do you know more about why lto-plugin is in $libexecdir, please ?<br></div>=
</blockquote></div><br>No, you&#39;d have to look at the git history to see=
 what the reason was.=C2=A0 I&#39;m not convinced there&#39;ll be a good re=
ason. :)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a11474faaeae5c3051a729f24--
