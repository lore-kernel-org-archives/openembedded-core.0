Return-Path: <a.manache@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC207C5F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 07:55:15 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id a24so11840542edt.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=tsslRioDYms3CYM6I0XuuON9ynz8nL+YacG8gxhM8gU=;
	b=u7weObVzntXDp6Jxst0HzPsxxi5G1tP4PjddfzvY9N8Pg+Shd+/N7SgJ+RbYCYubXd
	Fap6lLpRKezEryTPoII5FNCcqIREav9i9rIN99bkB/JAM0GmMOPRj8EO15jsMsk/V5Kr
	/H+ERkrnsA5X5EhYjPFWSPv0sA2Qgakwe9lB+9vXPfMxmO+oA9Pp1JKlxFpYdbOIq+bh
	ugRLOePKXsjsQ0Ipgp2lQ1HHdRdA0dHUtLc597+9syc62AhxF/OD1CoWYNGTu+EVpyJa
	xrSeZwpBybqzJna7/c5sGBZ5qTt/w1o72grLil0H+XWFcVllwDogf1KbmpvwhBSRN2lH
	KgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=tsslRioDYms3CYM6I0XuuON9ynz8nL+YacG8gxhM8gU=;
	b=a5SqZwJcWBLJJsnWsPh4cjJ7NGRwrIUSKb9eISZWqsGdJWrtxC2EODbkgnJ+0k6u5p
	5Wc/4K69VnCDsUHuqbacRQCMaGd+Vl4AcR5K16htQ7owI8iXXo8vNfz7R/tbV63U8eoz
	wsUoHpHGRHNRI/zEcwCdtsdokqn/bSX6zDf+5QM2yHjO7BvWxirOniz8tPlvW8kddInJ
	6v1wDrxvg8/vD+FI872iLDavAH79OfLkQgYq10dhNoTf+WWpvmWOIiFQckTwA+XJnITl
	+KV7Jecu9KTeL70dy+MOJHF2ciWDO7y800mLERA92qVJM3aaB42+BUjHPnxNZKH6U04w
	D0gA==
X-Gm-Message-State: APjAAAVr4OZPIfRuR9YoVfO2bv3+1UfDMPPIb9yHRiuKBlKQW3kuaosg
	n/uFSxVqGUwpjiW5CZE6oyN3WlGMxntYOumenKsVAbEv
X-Google-Smtp-Source: APXvYqwF9W2lQFzO5iOJEo+IBnry0cr6v1XXqkkGo65eRg7M/+TkLK5crpNEjrkY8loiOr2LphZfrasKS35q/A0MYjQ=
X-Received: by 2002:a50:eb8b:: with SMTP id y11mr17323983edr.242.1574668515562;
	Sun, 24 Nov 2019 23:55:15 -0800 (PST)
MIME-Version: 1.0
From: Antoine Manache <a.manache@gmail.com>
Date: Mon, 25 Nov 2019 08:55:04 +0100
Message-ID: <CAMu9Sp+wv1Pa5CoJBQ0R4G__PigUdV3B1Cvg778VOP5xuyFm4A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: sdk: backport of ba2df1f on thud ?
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
X-List-Received-Date: Mon, 25 Nov 2019 07:55:15 -0000
Content-Type: multipart/alternative; boundary="0000000000008257a00598271519"

--0000000000008257a00598271519
Content-Type: text/plain; charset="UTF-8"

Hi all,

Is it already planned to backport this fix to the thud branch ?
ba2df1fa43b79c4959911c1b0bcad996f255b7a8
<http://git.openembedded.org/openembedded-core/commit/?id=ba2df1fa43b79c4959911c1b0bcad996f255b7a8>

I see it is OK in Yocto 3.0 but not in 2.6.4, and I have an issue with my
eSDK install on a DISTRO configured with TCLIBC musl.

Thanks
Antoine

--0000000000008257a00598271519
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>Is it already planne=
d to backport this fix to the thud branch ?<br></div><div><a href=3D"http:/=
/git.openembedded.org/openembedded-core/commit/?id=3Dba2df1fa43b79c4959911c=
1b0bcad996f255b7a8">ba2df1fa43b79c4959911c1b0bcad996f255b7a8</a></div><div>=
<br></div><div>I see it is OK in Yocto 3.0 but not in 2.6.4, and I have an =
issue with my eSDK install on a DISTRO configured with TCLIBC musl.</div><d=
iv><br></div><div>Thanks</div><div>Antoine<br></div></div>

--0000000000008257a00598271519--
