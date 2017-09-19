Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id F24BC65C8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 12:33:44 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id l15so9561943iol.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nq+lZCTIHzZaMXzkf/5OvTLYbtmfMRgs2nLdphC0Gjc=;
	b=M9UvJP5pN4cafRLIEiDkIiDzkBMy+AAqPp8LtSQqzn3FQjXmbBVX7SX5Q98VesQ544
	PUvC6uyu5qpnrK1L6oEql4WGWAgvq5O3gzlEbcg+mhMxg1uR9v5I9cgIwuTa0OiMxTJH
	KvIVSk8KB390PN9Hsama7htzMfH/S8gYX45xa0n7LvpyoRPwXcBMXQ9ZVuZu4NDziyY2
	3PdfmjxXFmwD/xb6aQUCAJoMbA0FHsV6qUtXhauvy8+ua/5s6iJiyKB2teb/qmlyMT2U
	244GSQCBCF8QyD+CrMYAF6VI+nO17uUjZitHA+8anmkItQCMTNLsdgOZCjlg8m6NOQKT
	w8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nq+lZCTIHzZaMXzkf/5OvTLYbtmfMRgs2nLdphC0Gjc=;
	b=ojhpHGkAFzRikI0PJlJ6s2Lty+9HPucjtz+zb4VGvrIN4QIYw6L23Gdybvh6GK5M/j
	h1x+uHN98u7I9HQjwtDtFOXTsQN9itQTUy2pW1n/zuP/p8Qcv8SLLczdRUbhMxjpr3Rk
	5MgqdwfxUqhGEG6Qk+3fIV3ale0wCtZxNPt8t7SVBj5xMrGo0J3mSarlmYJRHJnQJ5L1
	mXo1zMGLwCl7ArKGCYwamY67TNFoTBHz00iz/wyY2X++M98FZ5475Sg4vX8o5SryAKgb
	0TPOxEueywQ5f4P8tj+AztryuvRjUdHhmrhQ2tAoUtaT+HPpiMisP5qPopaJbVnsIgpX
	Q/Vw==
X-Gm-Message-State: AHPjjUiJWPm2Hb6z4IGQ1a5kT4LD7RvgiL7aa+NYIPhQa3DFDGCyOIVa
	0WYt6ry8l2iiaE1FNHXkrtGsQDAR1H8Mw2n7cymCuQ==
X-Google-Smtp-Source: AOwi7QD3J/UORcWAY8JP6jEEN30TymDJKtx4D+wq0Nz0u2FCaYEjUEw5z0TOyI9ir7a0Nt3asFcm2nqk+powlNQ6eWg=
X-Received: by 10.107.32.70 with SMTP id g67mr1765125iog.77.1505824425894;
	Tue, 19 Sep 2017 05:33:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 05:33:25 -0700 (PDT)
In-Reply-To: <de7d5253-ad4b-a9dc-4d53-413a0014a8c0@topic.nl>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
	<CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
	<CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
	<de7d5253-ad4b-a9dc-4d53-413a0014a8c0@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 13:33:25 +0100
Message-ID: <CAJTo0LaxDW8MYZjpF398QUR_UUyBjFbe3avwBhw7nBt+EhYcsg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Tue, 19 Sep 2017 12:33:45 -0000
Content-Type: multipart/alternative; boundary="001a1140ae2cfffb4605598a112c"

--001a1140ae2cfffb4605598a112c
Content-Type: text/plain; charset="UTF-8"

On 19 September 2017 at 06:26, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> My experience is that it does not, and never has. I run serial consoles
> all the time, and if they're not sized to 80x25 weird stuff happens.
>
> Start vi on a serial terminal and it only uses the top 80x25. If a command
> exceed the 80 char mark, the cursor goes all weird.
> Running "eval `resize`" fixes that (until you resize the window). Running
> just "resize" does not have any effect on that at all.
>
> Cannot we determine the presence of "tty" and "resize" commands at compile
> time? something like:
>
> if has_command("tty") and has_command("resize"):
>     install -m 755 ${S}/resize.sh ${D}${sysconfdir}/profile.d/


As part of busybox, yes.  Not anywhere else though.

Ross

--001a1140ae2cfffb4605598a112c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 September 2017 at 06:26, Mike Looijmans <span dir=3D=
"ltr">&lt;<a href=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike=
.looijmans@topic.nl</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">My experience is tha=
t it does not, and never has. I run serial consoles all the time, and if th=
ey&#39;re not sized to 80x25 weird stuff happens.<br>
<br>
Start vi on a serial terminal and it only uses the top 80x25. If a command =
exceed the 80 char mark, the cursor goes all weird.<br>
Running &quot;eval `resize`&quot; fixes that (until you resize the window).=
 Running just &quot;resize&quot; does not have any effect on that at all.<b=
r>
<br>
Cannot we determine the presence of &quot;tty&quot; and &quot;resize&quot; =
commands at compile time? something like:<br>
<br>
if has_command(&quot;tty&quot;) and has_command(&quot;resize&quot;):<br>
=C2=A0 =C2=A0 install -m 755 ${S}/resize.sh ${D}${sysconfdir}/profile.d/</b=
lockquote><div><br></div><div>As part of busybox, yes.=C2=A0 Not anywhere e=
lse though.</div><div><br></div><div>Ross</div></div></div></div>

--001a1140ae2cfffb4605598a112c--
