Received: from mail-la0-f54.google.com ([209.85.215.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UObeO-0004wt-Bn
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Apr 2013 00:31:57 +0200
Received: by mail-la0-f54.google.com with SMTP id gw10so4420917lab.27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2013 15:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=sVLbj7eEZv9mSFT+4aG9Zt5An9RyDXZrmuiPj4ApR7E=;
	b=DolAh5/k/z9RD1YhGr8JAEpmRGLh2j4vSEJUN+ZiZ1kSZvmQLFrgRCssCrf9NPFncD
	XInmBbzHBtDv6HNU+qSW2Yt3ivIL16LOkXC21qA6KLWx6fPEexeP5gBUBGXTQlO6pdzD
	zcy75mWMaU7kTkC0seGHtJm/NA3SxE6Bh1bMo0VnTPw8DWhH1OThnyFYkyKO75Skt6dU
	nPLzlXDWQbXpSoCpDQKKJwxJ759ZxfbsqZ6N4MQN/xwTemVvqFSRLLba5Pj4obI+icLr
	14RKzPJD4LVd9hV9hOry0ObLVKHcxvG3isKscBy8oIao+MmkyAPz2sgY2VYLy2CauQ5I
	CSOQ==
X-Received: by 10.112.8.164 with SMTP id s4mr8636019lba.106.1365286480098;
	Sat, 06 Apr 2013 15:14:40 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.125.38 with HTTP; Sat, 6 Apr 2013 15:14:20 -0700 (PDT)
In-Reply-To: <51601264.7060807@mlbassoc.com>
References: <51601264.7060807@mlbassoc.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 6 Apr 2013 15:14:20 -0700
X-Google-Sender-Auth: cISbDbeXA67U2VIasb9fGmNZ3Wc
Message-ID: <CABcZANnh=K=H-gGFbTTHH0hJsxyK_F+m4Z7k1oFZ2=+wzFbFBg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Incorrect FILESPATH usages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Apr 2013 22:32:02 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe293ca9c12d04d9b88738

--e0cb4efe293ca9c12d04d9b88738
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 6, 2013 at 5:17 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> I have run across a problem where a main recipe is written in
> such a way that makes using .bbappend impossible.  This happens
> if the main recipe has an explicit assignment for FILESPATH.
> In this case, the .bbappend is unable to add to that path, e.g.
> to add a machine specific patch, etc.
>

If the explicit definition calls base_set_filespath, then FILESEXTRAPATHS
can still be used.
-- 
Christopher Larson

--e0cb4efe293ca9c12d04d9b88738
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
at, Apr 6, 2013 at 5:17 AM, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> =
wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":o8">I have run across a problem =
where a main recipe is written in<br>
such a way that makes using .bbappend impossible. =C2=A0This happens<br>
if the main recipe has an explicit assignment for FILESPATH.<br>
In this case, the .bbappend is unable to add to that path, e.g.<br>
to add a machine specific patch, etc.</div></blockquote></div><br>If the ex=
plicit definition calls base_set_filespath, then FILESEXTRAPATHS can still =
be used.=C2=A0<br>-- <br>Christopher Larson</div></div>

--e0cb4efe293ca9c12d04d9b88738--
