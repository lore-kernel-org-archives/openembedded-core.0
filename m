Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id E0A70772E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 15:00:33 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id u25so40170472qki.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 07:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n3kRlJnEAuLCLmtzr9ugDCPCNpr/HyxRKbWBvuLp3KQ=;
	b=krXsA7g0ts0PQp+gHlYqYV9FKM37GLfJikJE61AabBCZ/K5p28geUsKGINNPsVXA/B
	F8qP56aA/HZHPScP9CHVOd1r1nwTbpLJEoJg4OVU2vF7KFgXI3KiClOjsBQ5BvJy8r3e
	FY++3E4mq/OEa7bE5exSf1qD/R7PyL7yGh4fRnCsiHEw7AgkSf4DCjXkHy4z01glbDCm
	tkrlAN81iIIvO+UP86hQqf1TlHBFkneuJAVolJ2WZl1MnmRqUh7t50HrKge2qX2twZYB
	CXZNGwevj50dQlbdF+9xB3tVZqNBQIbTqbKOGrKJWd5i3t3NDuVc6Q50iY1s+s7k3kIM
	fHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n3kRlJnEAuLCLmtzr9ugDCPCNpr/HyxRKbWBvuLp3KQ=;
	b=t7DvV9928OCK0j94eieuAEih28QT0YvPImVZ8QyRu1GLnQbZ5aM53K44C86zRJxP95
	IAR5Hgegh+ghjRSTKmyi5juV3fKYdhH6vZgMabAqthvOG8g1oDI7LwkmZG5tIJP4nlzH
	Wn7hL8ksRpBOLVjq6dEMl7zOQo8BHIJclnGOYc9bBctkaLDfbfx89ErqyEkTlfMKBlcS
	jZtxY+4RXckwXP225eAhkYwsv/jFD1JXbqdz0ka0ydn85wCmG+P0n8S+VKSvq+4uPmG1
	jMIYIluAgXy3EtS3lv6iW3sU4IS24z/cuJ1hmZpVzRgYSZRJf4YuZg0ArJb6s6t95QHS
	HyYA==
X-Gm-Message-State: AIkVDXKOuL92i789QBx5tvBQY9op/hPdPZ8hU51kPidYzDFbQtKMbu1nbk4idruxIMvrYAvfkuqRN9nuQl2Xn/GR
X-Received: by 10.55.75.17 with SMTP id y17mr5501317qka.26.1482246035181; Tue,
	20 Dec 2016 07:00:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 20 Dec 2016 07:00:14 -0800 (PST)
In-Reply-To: <20161220145554.GA11748@openSUSE-i7.site>
References: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20161219152324.GA1056@openSUSE-i7.site>
	<CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
	<20161219214258.GA16333@openSUSE-i7.site>
	<CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
	<CAJTo0LYuH==F4jbo3chSbaJHkCu8VWmOS+PxT3A6qwTzJoxwXA@mail.gmail.com>
	<CAHUNapSAEd4zuvQCna+QOMxaGDFck5OQbjvsVe6hr9voN7o1=w@mail.gmail.com>
	<CAMKF1sq7fePZCEaZdcN1P_VmZ3Sb8UNmAcCyUDALaRy0p7yfeg@mail.gmail.com>
	<CAJTo0LbZYcPK-9E=+pw9ZB-H9Yb7gNxeQMxLQsoRsZ1CWU4pgQ@mail.gmail.com>
	<20161220145554.GA11748@openSUSE-i7.site>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 15:00:14 +0000
Message-ID: <CAJTo0LajFQ85DckLMqS7Tbza4NJNNc4A6QMuACa4XDb6PiHJnQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Tue, 20 Dec 2016 15:00:39 -0000
Content-Type: multipart/alternative; boundary=001a114a88c865e1e50544184c5a

--001a114a88c865e1e50544184c5a
Content-Type: text/plain; charset=UTF-8

On 20 December 2016 at 14:55, Trevor Woerner <twoerner@gmail.com> wrote:

> The biggest one is probably the last one (line 8662) where something is
> setting NCURSES_CFLAGS explicitly to /usr/include. I'm looking for that one
> now.
>

This would be the autoconf macro UL_NCURSES_CHECK in m4/ul.m4, which calls
ncurses6-config.  I thought the sysroot was ahead of the host so it should
find our broken script before the hosts...

Ross

--001a114a88c865e1e50544184c5a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 December 2016 at 14:55, Trevor Woerner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div id=3D"gmail-:v3" class=3D"gmail-a3s=
 gmail-aXjCH gmail-m1591cbbd92f42a06">The biggest one is probably the last =
one (line 8662) where something is<br>
setting NCURSES_CFLAGS explicitly to /usr/include. I&#39;m looking for that=
 one<br>
now.</div></blockquote></div><br>This would be the autoconf macro UL_NCURSE=
S_CHECK=C2=A0in m4/ul.m4, which calls ncurses6-config.=C2=A0 I thought the =
sysroot was ahead of the host so it should find our broken script before th=
e hosts...</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a114a88c865e1e50544184c5a--
