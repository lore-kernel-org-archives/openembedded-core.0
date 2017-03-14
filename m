Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id B2CA37199A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 12:45:04 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id y76so246449467qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 05:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9+MdyXT3cIObvkEvtrTHCWWe3wuPOjGP5vYYqnYTQvg=;
	b=QP9smTiLu4lrjkqJnxfu7Y+5FIT1uBfwU9d/cRjMktSXflZzqz/BOScZYsq7EPM6sX
	Y0sNdPBXNB5aoq9zU/bfPfKYUbEgE1b36t3xKGKQk3YB7ToIak3i5P4ubqN5CSWatTZv
	zJfo0R2JUHgtBC8OksW00SwHbZlnLlbSu85xqNRaS3IugBKbNDOCfhk53+hm8vn5nFmD
	xLQgf980N7zxR8zl/s188RjX8HkNSYjB2G9DyyblnI2TkfgmxzqkByTh/hr1OALjnC1d
	G4Mq0t30qI3l9CmbgBlVXvniUo8fx3SVbybkd6prkPr1u9Sveq3AWDLzmJl3hm5Fb2X+
	Gtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9+MdyXT3cIObvkEvtrTHCWWe3wuPOjGP5vYYqnYTQvg=;
	b=jpXNBVk8wYCPYZk4jeeo87Px6mHMhna9oxCZWlaQFrWDD9vbo5UDtyRnQFG1t4idB9
	g7RvO48L0Z9+p0VVicHRa4REH++qoAfTHYephAh1sqoJlq4CjLQLE0gm44F8/xW3z8Eq
	U8nuQ0F7IZY1HDBwdvvOYgjqthhNnV60HMN0+AwiPev2nOuVZIFOV+zaXd9125ArtLBJ
	L/NQb3InkLr1VyLbTLtAQ0rKbQ/laVcuNmURN+MxK3W5aom9N47DGjPBLxIKjp2V0hNf
	aJovvgfR55UT8RuVtwUXyrpgxY+4FOu/8QUnBxC6188Agib+2mYWh7OxVaFsDFBdcU9w
	/UkA==
X-Gm-Message-State: AFeK/H3Qm4pc5rZem18HauLf1UL/cZEUK61N9ZK2kEXNZnmMbT5hNto11VMpmlsXO1YoiPzuzz58QV+gOh4tt/e0
X-Received: by 10.55.175.195 with SMTP id y186mr36139064qke.26.1489495505584; 
	Tue, 14 Mar 2017 05:45:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 14 Mar 2017 05:44:45 -0700 (PDT)
In-Reply-To: <dabda004-ddbb-0520-cea4-c9bf2b8d6044@windriver.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<a4cc80fb3dcbcf610b5e4b601a807492fcea9eca.1489144807.git.alexander.kanavin@linux.intel.com>
	<dabda004-ddbb-0520-cea4-c9bf2b8d6044@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Mar 2017 12:44:45 +0000
Message-ID: <CAJTo0LaoypQjYY1-oZwgKZze6tHEbXEBHmDR8YJ36_q0nG27RA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 22/44] scripts/rpm2cpio.sh: replace 5.x version with 4.x version
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
X-List-Received-Date: Tue, 14 Mar 2017 12:45:04 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c81d061054ab03204

--94eb2c06093c81d061054ab03204
Content-Type: text/plain; charset=UTF-8

On 10 March 2017 at 17:26, Mark Hatle <mark.hatle@windriver.com> wrote:

> Just an FYI, I was concerned that $(( ))  (in the new script) was a
> bash-ism,
> but I was able to run the script on an Ubuntu machine using 'dash' as
> /bin/sh.
>

http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html#tag_02_06_04

bash adds more operators such as ++, but basic maths is POSIX.

Ross

--94eb2c06093c81d061054ab03204
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 March 2017 at 17:26, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mail=
to:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex"><div id=3D"gmail-:10h" class=3D"gmai=
l-a3s gmail-aXjCH gmail-m15ab9423eeb69b03">Just an FYI, I was concerned tha=
t $(( ))=C2=A0 (in the new script) was a bash-ism,<br>
but I was able to run the script on an Ubuntu machine using &#39;dash&#39; =
as /bin/sh.<br></div></blockquote><div><br></div><div><a href=3D"http://pub=
s.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html#tag_02_06_04=
">http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html#=
tag_02_06_04</a><br></div><div><br></div><div>bash adds more operators such=
 as ++, but basic maths is POSIX.</div><div><br></div><div>Ross</div></div>=
</div></div>

--94eb2c06093c81d061054ab03204--
