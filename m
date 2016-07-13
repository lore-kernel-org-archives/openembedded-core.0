Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 700A06067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 19:17:45 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 38so55558111iol.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 12:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GpNdXFhyRQhamC/DxBMbiX2KkN+Dc+3wpieOtXHny0c=;
	b=IjZcrk7nSyZJK9fXs1FG72Z63js7FOwD/tbtGXMeDtC5hopNlkROvga5rNKcUATzwi
	CNkABES2gnU7/44FViyTkPRD56iYJU+nPczFLxFPosBHIQjQzifi7+AMUOwFxv8lN6aT
	zMycmXy3CyJC42GzraQYoXD2NPf+Rh1l/56LsJpVSF0BXfyCWHe5+YUPzFSQoX3XJkEa
	nJwaBAAI7JSd3yZEjU6pY7FmaMxvt2RrCwksNVnR14LE/9oPQIeE7uj1bFPLOc/KafON
	DS6lsZHDpKtdtHXsGd25raZjXVYsg4LUPaDtwfriQfvuSQOU3TwHFfZXla2p6C6FPlia
	fBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GpNdXFhyRQhamC/DxBMbiX2KkN+Dc+3wpieOtXHny0c=;
	b=V3q95VsQJpJTPux+CEC6gKAg8he4hzdo/Ufw9UZF0sxXEV9E/XZC4l8vNqbdjXcgKQ
	xEEPUJcAPNh0c+oNBnJ856aNBmozrEXM5/9BLn4C7EoBYdG9vsLcPXoijwgJJEKeC53q
	dcJ6/nyY/hb2aOZvuM1FbLq5YbCF/W7qu9yussK6Org/JKTsw1vjG62wvaY1OwXR44U5
	3nr0d1DAmierc+fZKHzPSsuNtCSLR8/zHiD/0Dvk46uabM17R4roed2s1USVVrs9N1yj
	qk6Y3Azjqs8MmOEVz6x+8RSFjPIy5ZEeecP//sLrRcLw3JRPktzDcrrUC0qQska6c8Ar
	SqtA==
X-Gm-Message-State: ALyK8tJw72a6MFIsBhy2ieuU3rh08XLCe0diorCc9lIFHKWS7632FRXdE9znFhKvHHeoX4IVOunUOmfHMgbFqgbK
X-Received: by 10.107.154.210 with SMTP id c201mr10065685ioe.99.1468437466640; 
	Wed, 13 Jul 2016 12:17:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 13 Jul 2016 12:17:27 -0700 (PDT)
In-Reply-To: <20160713144758.rojziiocjimyuy3d@jama>
References: <20160713142422.aihj4b5qmni7uair@jama>
	<57865303.30805@mlbassoc.com>
	<20160713144758.rojziiocjimyuy3d@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jul 2016 20:17:27 +0100
Message-ID: <CAJTo0LYv2W9MLgP1NLX8Bb0ngaCthz82XpjB55GqnfQ7wgViQg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Gary Thomas <gary@mlbassoc.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Downloads from sourceforge.net
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
X-List-Received-Date: Wed, 13 Jul 2016 19:17:46 -0000
Content-Type: multipart/alternative; boundary=001a1140fab6931ce80537893daa

--001a1140fab6931ce80537893daa
Content-Type: text/plain; charset=UTF-8

On 13 July 2016 at 15:47, Martin Jansa <martin.jansa@gmail.com> wrote:

> Not for me, I'm seeing it repeatedly for many archives over last 2 days
> (in job which intentionally runs without premirror to verify
> download-ability).
>

Our autobuilder does something similar (although it just does checkuri
instead of a full fetch), and we had to make it try again if the connection
timed out specifically for SourceForge as the majority of runs would fail
at some point...

Ross

--001a1140fab6931ce80537893daa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 July 2016 at 15:47, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3as" class=3D=
"a3s aXjCH m155e4baffd15054b">Not for me, I&#39;m seeing it repeatedly for =
many archives over last 2 days<br>
(in job which intentionally runs without premirror to verify<br>
download-ability).</div></blockquote></div><br>Our autobuilder does somethi=
ng similar (although it just does checkuri instead of a full fetch), and we=
 had to make it try again if the connection timed out specifically for Sour=
ceForge as the majority of runs would fail at some point...</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1140fab6931ce80537893daa--
