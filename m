Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4319971D31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 17:40:20 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id p22so101511108qka.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 09:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rk1VOLm0BLnGB5XqrymM5Xg4Eu5D+E/D9FG+ttLVb48=;
	b=0E9/KYGJ8JzuHFvTQer3pxkGpdpvcH3o/0pOzAXyCPaDW0LmM+ofv2y7N7i8p7qeEI
	bnAZ1wuMN4ygZrlhmZt09FncrRgtFN3aDRaFQex0u+1edMHNrJTq+mekpTeDk1pfvBfS
	xiaFqSdb8kFbHfWdDM4gC1d3TEKRITY3DWJMmSl/mRZwDKR+S2xZLdjoKWOoS+0ocfU5
	YraC18Fb5TtTLy0X1We2Iuy23cgamW8h37bBOvUt8zk4kj5t828OI+wrxGSZ3TK0j2o6
	1HBYxYngkOfOiktqNJpUmzPKrQ37fLA7N19ZqADsghk1quzByCr/izDxr9D4LzfM4fy9
	1YrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rk1VOLm0BLnGB5XqrymM5Xg4Eu5D+E/D9FG+ttLVb48=;
	b=gUdTP2fKcYVbYXlr6U6iHDRh+gw1e9xJvO1jWz6+IgZ23+KuzOmquUWwd9eU1pcJ/l
	cFZL8A6Zu5jAtv3E4JMfrd5WZEy4DaI/qFcEwidV9RVLzs+NhnnM58wm4OVFEWQ5lJZs
	khnPAzOniyEZVM5p1jMEBkUlaRMNWTcW5psvHtrIt8Rsazl7EcLd50uimaTxOTS+Rv1+
	UjjPt233PoqrYHJtgZXWDQ5vULHulZqyAJK+DxRF+p2IyAzCK/MwY1YsavS5oNdXwdXx
	RQqJZ2AyicalPgxxm08OF5FGxfN9xXTHcnthBFE5scREhr6Ij1qARQJnszUQVQHIwMVs
	hvbQ==
X-Gm-Message-State: AMke39l60SVqXgBZnbqab98+p1UbENZSGZA8wa75zLatk4Jmz96Ix4LzrHe97fukVDD3CMotvCU38GFXuI+IwwMV
X-Received: by 10.55.175.195 with SMTP id y186mr13325548qke.26.1487612421309; 
	Mon, 20 Feb 2017 09:40:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 20 Feb 2017 09:40:00 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1702200654200.27683@localhost.localdomain>
References: <alpine.LFD.2.20.1702191313250.8096@localhost.localdomain>
	<CAJTo0LbM=BKU5CEcr5mVV0cw_VJS_NsCR992Q5RgpH_x8LRHOw@mail.gmail.com>
	<alpine.LFD.2.20.1702200654200.27683@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Feb 2017 17:40:00 +0000
Message-ID: <CAJTo0LYVkVgQ3DgEvRU-Ey+x=3pFJD=t=cddD6_d88bXXD9OYw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: something seems to have happened to "gpgme" in latest oe-core
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
X-List-Received-Date: Mon, 20 Feb 2017 17:40:21 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093cefc8960548f9c110

--94eb2c06093cefc8960548f9c110
Content-Type: text/plain; charset=UTF-8

On 20 February 2017 at 11:54, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:
>   gpgme config.log attached.

cc1: warning: include location "/usr/include/python2.7" is unsafe for
cross-compilation [-Wpoison-system-directories]

It decided to try looking on your host for Python libraries for some
reason.  You'll have to dig into configure.ac to figure out why (or just
turn Python explicitly off).

Ross

--94eb2c06093cefc8960548f9c110
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 20 February 2017 at 11:54, Robert P. J. Day &lt;<a =
href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<=
br>&gt; =C2=A0 gpgme config.log attached.<br><br>cc1: warning: include loca=
tion &quot;/usr/include/python2.7&quot; is unsafe for cross-compilation [-W=
poison-system-directories]<br><br>It decided to try looking on your host fo=
r Python libraries for some reason.=C2=A0 You&#39;ll have to dig into <a hr=
ef=3D"http://configure.ac">configure.ac</a> to figure out why (or just turn=
 Python explicitly off).<div><br><div>Ross</div></div></div>

--94eb2c06093cefc8960548f9c110--
