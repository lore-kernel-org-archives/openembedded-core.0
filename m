Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6993E60249
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 21:02:20 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so59479202igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 13:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=t7AJW7ao/mrAI6472hU+U4Hey+OiEkkXJKbYk8Us9O8=;
	b=mU0PwlWtCj2qtL3wqB1SkmmOn41+e71V74NUQldacuvwknlEam9rSZFPlc7QXFitMO
	yMIiXR4LbVTQyY9cg+rq0Gyud05DqZPnR6ca29+5xD+yInT99YhYggWgGVhWrtSkqb7S
	0EbXkcjffcP5P3Fm9frD7M1sJnztUgQ1lCCP+cLHzBQl9oWP5zk95ZMUVLhJdeiS/1z9
	W+8LRDI4mZUZsn0wMdMqZCl579x5feB/87JgizdPwEb9oWEEr0ZyI7erlE5wlRTY9SXv
	JSo+BHTIRw0cVAspjElmHSl0jsAXj6LonPOtCaDaI+C7E9OVinlRD1RZb+GqkAgCWIik
	iTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=t7AJW7ao/mrAI6472hU+U4Hey+OiEkkXJKbYk8Us9O8=;
	b=S8IFPAE4Fz4eI3FBdtpRhJjXlXenJkRe0ftITkbf5sPZ4tlPeP4RwkxLh6nPaRRnr0
	QxrMq6OxJmJ95piLrdc9JhqhoelrACQiJcsq42+WwT7Z4xHEsHJzvS1kpmRFGSdAjFu6
	Rec+Wv7UIjSD7QhHFTJS4ytiXZU9h5PsakUvkwpqXTr/18EvCZ0mjQf5Sh3+iVLelUP8
	IufzXL9ji2cx8z/oYoFhu+6L3AbaLCERBC10xT0KtuzToPGqeNDt5j+TmCZPF0NE3DCs
	wcOfuwfMot9L6Xq7NHGCkaqV03bo+seJDsgSKsn9YTevS6ViU5rHgGJl2JuPQCc1evhP
	iE0A==
X-Gm-Message-State: ALoCoQmmg6sTgt+sdPIZb2oojiSvVTmgx0W4ZicbXWUq8pqv7ajwn0eyRjvstnLOfcP0C9dX/hbL
X-Received: by 10.50.155.33 with SMTP id vt1mr9403556igb.64.1449349340912;
	Sat, 05 Dec 2015 13:02:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Sat, 5 Dec 2015 13:02:01 -0800 (PST)
In-Reply-To: <1449194500-9664-1-git-send-email-Yuanjie.Huang@windriver.com>
References: <1449194500-9664-1-git-send-email-Yuanjie.Huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 5 Dec 2015 21:02:01 +0000
Message-ID: <CAJTo0LZvawARZVJORYhoAcNKUgdF-YMoyMq4GJ_i=5a3j8iyuQ@mail.gmail.com>
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Security Advisory - gcc - CVE-2015-5276
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
X-List-Received-Date: Sat, 05 Dec 2015 21:02:25 -0000
Content-Type: multipart/alternative; boundary=001a11343daa9ef6fe05262cf0bc

--001a11343daa9ef6fe05262cf0bc
Content-Type: text/plain; charset=UTF-8

On 4 December 2015 at 02:01, Yuanjie Huang <Yuanjie.Huang@windriver.com>
wrote:

> The std::random_device class in libstdc++ in the GNU Compiler Collection
> (aka GCC) before 4.9.4 does not properly handle short reads from
> blocking sources, which makes it easier for context-dependent attackers
> to predict the random values via unspecified vectors.
>

I see from the CVE that 5.2 is also affected - will you be submitting
patches for that too?

Ross

--001a11343daa9ef6fe05262cf0bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 December 2015 at 02:01, Yuanjie Huang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:Yuanjie.Huang@windriver.com" target=3D"_blank">Yuanjie.Huang@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:axo" class=3D"a3s" style=3D"overflow:hidden">The std::random_device class =
in libstdc++ in the GNU Compiler Collection<br>
(aka <span class=3D"il">GCC</span>) before 4.9.4 does not properly handle s=
hort reads from<br>
blocking sources, which makes it easier for context-dependent attackers<br>
to predict the random values via unspecified vectors.<br></div></blockquote=
></div><br></div><div class=3D"gmail_extra">I see from the CVE that 5.2 is =
also affected - will you be submitting patches for that too?</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11343daa9ef6fe05262cf0bc--
