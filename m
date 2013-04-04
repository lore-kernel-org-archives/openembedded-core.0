Received: from mail-la0-f45.google.com ([209.85.215.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UNpOc-0008Nf-2v
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 21:00:27 +0200
Received: by mail-la0-f45.google.com with SMTP id er20so2803561lab.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 11:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=MjbVfZttMxkZ4et0UT86aeOGTsljoQ1mpvwZYFX+CjY=;
	b=jf5dx3MFFL2oTz92wlthrEdhECHjjwO/90+7LEImwKT7Wj1LEI58Pa240AyiSJoW1Y
	kXZqBeZdIz+14pzNYmryyj4J+K8vnmUWubhct8z0xhfvKziZ1P2Q50dFsBhahgU3RXN8
	NhsPq9DNig9VHsi2rodaKP1napM4yYJ9FvX5hI6seh2lVTSviqFPgPVRHzhfsZr7IBCr
	w2vn4wsXplTGCRgB/61EkbNCGwZFbrkMHFAY0LMawcwjTcmOm+FJHpChSASRjzr4+5Sw
	vvpYp6Xo8Hb7dl6C/7MMaZAdU5vtzK6NaGZs+Crc6VqQamUB6UXZiA6ILZjtmyEFXHvp
	oVfA==
X-Received: by 10.112.8.164 with SMTP id s4mr4060995lba.106.1365100992923;
	Thu, 04 Apr 2013 11:43:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.125.38 with HTTP; Thu, 4 Apr 2013 11:42:52 -0700 (PDT)
In-Reply-To: <1365100897-14142-1-git-send-email-kergoth@gmail.com>
References: <1365100897-14142-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Thu, 4 Apr 2013 11:42:52 -0700
X-Google-Sender-Auth: YQVTwQLSFLFYrvDpNR69YVnfoqw
Message-ID: <CABcZAN=b_72vtPwg3ohg+VZ16bcHyJuUqde-LdwA+Teaj0t+cQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] oe.terminal: add tmux classes
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
X-List-Received-Date: Thu, 04 Apr 2013 19:00:28 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe293cc4133904d98d57cc

--e0cb4efe293cc4133904d98d57cc
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 4, 2013 at 11:41 AM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> This adds two new Terminal classes. It's separated into two, so that
> opening
> a split inside a tmux window is preferred to the other terminal types, but
> opening a tmux session is prioritized only slightly higher than screen.
>
> - tmuxrunning: Open a new pane in the current running tmux window. Requires
>   that the TMUX variable be added to the env whitelist to use it.
> - tmux: Open a new tmux session
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Bah, ignore this, accidentally sent an old version. Resending.

--e0cb4efe293cc4133904d98d57cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Apr 4, 2013 at 11:41 AM, Christopher Larson <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;=
</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1hd">From: Christopher Larson &l=
t;<a href=3D"mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt=
;<br>


<br>
This adds two new Terminal classes. It&#39;s separated into two, so that op=
ening<br>
a split inside a tmux window is preferred to the other terminal types, but<=
br>
opening a tmux session is prioritized only slightly higher than screen.<br>
<br>
- tmuxrunning: Open a new pane in the current running tmux window. Requires=
<br>
=C2=A0 that the TMUX variable be added to the env whitelist to use it.<br>
- tmux: Open a new tmux session<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br>Bah, igno=
re this, accidentally sent an old version. Resending.</div></div>

--e0cb4efe293cc4133904d98d57cc--
