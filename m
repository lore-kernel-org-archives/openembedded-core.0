Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8D44974153
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 19:59:46 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so77645631qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 12:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9K/SetIWZekdfJxTWljIuuw2fAN9+fr/f5EYUpiXbog=;
	b=YqaAs6A67On3NnxKkMUl+g9jJ0MZNFZFsgElLXPsHYpnjjjRhCPl9T9D9aliVPwh7r
	0BdSWmmJUo9FM40pnpM45fi0SbjcbCnl7lHyHly7edLO/KYThz1NS1/X4wMt40cXu9Ox
	t0Bv4fCHXqRAAY08mw37KHQI7muEwhLzT1XOTNh35f0ouyHpX/ubBT7nrzp/Y9x6yGOq
	dr6afxxsHzpV2reQwhmFVEiiuv3w3u1QL6VEoS5XfViWl22zFJj9bORyhv8P+fRzPWgP
	mKQzV0pS1OPw6raBUUGSd1xleAxjXWIGEOGQaFzwm1/n+FJaORNH8KmjTG4q5ZBLRtBG
	vs6g==
X-Gm-Message-State: ALoCoQm32YCnCLIpNBmAdWejvtn+u6xHtKBN/No/umys5zvNCnGRdZHvCZ0QoYOuDo9/rTH/Y4RP
X-Received: by 10.55.43.130 with SMTP id r2mr14655934qkr.14.1431719988049;
	Fri, 15 May 2015 12:59:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 15 May 2015 12:59:27 -0700 (PDT)
In-Reply-To: <84a0731e7204cfb400610c3abc871894b7a03a39.1431324180.git.liezhi.yang@windriver.com>
References: <cover.1431324180.git.liezhi.yang@windriver.com>
	<84a0731e7204cfb400610c3abc871894b7a03a39.1431324180.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 May 2015 20:59:27 +0100
Message-ID: <CAJTo0LZNd142tRVh36yatiRxhwHdVwDYC4pVv_V1xNbebtmmSQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/12] libsdl: depends on libglu when x11
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
X-List-Received-Date: Fri, 15 May 2015 19:59:47 -0000
Content-Type: multipart/alternative; boundary=001a1147afb04e4c6d0516244925

--001a1147afb04e4c6d0516244925
Content-Type: text/plain; charset=UTF-8

On 11 May 2015 at 07:08, Robert Yang <liezhi.yang@windriver.com> wrote:

> Let it depend on libglu when x11 rather than opengl, since libglu can't
> be built without x11.
>

But you can build libsdl with X11 enabled and OpenGL disabled, which then
refuses to build as libsdl depends on libglu depends on virtual/opengl
which refuses to build.

I've just sent a revert for this, but was there a problem this was
attempting to fix?

Ross

--001a1147afb04e4c6d0516244925
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 May 2015 at 07:08, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8p2" clas=
s=3D"a3s" style=3D"overflow:hidden">Let it depend on libglu when x11 rather=
 than opengl, since libglu can&#39;t<br>
be built without x11.</div></blockquote></div><br>But you can build libsdl =
with X11 enabled and OpenGL disabled, which then refuses to build as libsdl=
 depends on libglu depends on virtual/opengl which refuses to build.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;ve jus=
t sent a revert for this, but was there a problem this was attempting to fi=
x?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a1147afb04e4c6d0516244925--
