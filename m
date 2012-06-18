Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Sgde4-0007pl-Uw
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 17:13:37 +0200
Received: by yhjj56 with SMTP id j56so3568462yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 08:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=njoBCKq3AbW5jrL+fR9DIpFlaIt19/ynNz+16bevkW8=;
	b=uoY2d663zfoO0y4jYKpWkn7R7lF3+55dXLyuUyZ0qMC5a4QLgMoK/dUo5BTfjzo/M6
	e2jrGTdWoQSacYl82UOJLIOrfsexA/9zv5+K2L+VPu8TRxnXBNU6wQkBVOF/ZSVmzdzU
	/y1lMVniAYhlh2GtZZ4hWGROEtLHy8ggQRJSL1hInwa2JAU6jETo5z0rEwvHBBYUAPFJ
	IFJ3AIB+vZPaF446eJTVfJxEAqCaczy88BnOTHi5F7WHsG+h7guwtaMT3kpffC8POAAQ
	W+OFNGjfBYKdFbX/dyBoigaz/I0kcuokmR0FrdidixxJ/wf4STvAAZOL70IgjlNcd5Ps
	IDMg==
MIME-Version: 1.0
Received: by 10.50.187.201 with SMTP id fu9mr908023igc.5.1340031774131; Mon,
	18 Jun 2012 08:02:54 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Mon, 18 Jun 2012 08:02:54 -0700 (PDT)
Date: Mon, 18 Jun 2012 17:02:54 +0200
Message-ID: <CAOHjBZs9r6mgch+P2nn6oXm0bVdXKaxRuxzqahdUVfPo9zOcuQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: gnupg depends on pth also for uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2012 15:13:37 -0000
Content-Type: multipart/alternative; boundary=14dae9340a6fe286fe04c2c07518

--14dae9340a6fe286fe04c2c07518
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

although the recipe of the package in subject selects npth for uclibc
systems, the configure script searchs always for
pth. I've created a personal patch to avoid this and to move to npth but
now I can see there are many sources that include pth.h
How can I build gnupg using npth? Creating a soft link in the npth package
to have pth.h (although it is npth.h indeed) doesn't help
because the two headers are different in reality.
Has somebody met this issue?

Many thanks,
Giuseppe

--14dae9340a6fe286fe04c2c07518
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>although the recipe of the package in =
subject selects npth for uclibc systems, the configure script searchs alway=
s for</div><div>pth. I&#39;ve created a personal patch to avoid this and to=
 move to npth but now I can see=A0there are many sources that include pth.h=
</div>
<div>How can I build gnupg using npth? Creating a soft link in the npth pac=
kage to have pth.h (although it is npth.h indeed) doesn&#39;t help</div><di=
v>because the two headers are different in reality.</div><div>Has somebody =
met this issue?</div>
<div>=A0</div><div>Many thanks,</div><div>Giuseppe</div>

--14dae9340a6fe286fe04c2c07518--
