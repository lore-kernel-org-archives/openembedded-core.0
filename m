Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 263296B5C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 11:44:21 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id j21so15859299oii.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 03:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o8C9uXdDThCTaF0549afoNmszMfwHhVik7KygQFJmnY=;
	b=S6+ILxRlHDUUNiFhQi/G6JNtz/JElXf0v26jVpevP1XNI8lALM5T/nd1d+1DJJEj4/
	bfvjAyhUX7E+K4WzBDyadNhk0eyVu94uW2RyMbC/XJsI1We9eIV23OFbScmVlr2tNXoC
	AIUF9EW0gSf5eizFbUlPriNhUSXz1uJtmfj3Vu0z/wXvNtboxgBALIVXT8gC8NopnJ5h
	Ugo8AkpFjw+RckPOaUKcthJE8X5XoOAefZZnCL05n4FUZnNfA9uF8ZF5aKd83RJvjwGG
	6Ftd/xBY7tRYHlimZOPJeoQxDdkfwwXO8ILdEYwyTYFRw9siQYksUdDgzn9mSDowusOW
	Z7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o8C9uXdDThCTaF0549afoNmszMfwHhVik7KygQFJmnY=;
	b=sxesfCIVnBSSPXfmR9OvOCSY7a9Hpt+9omx4+Y3asNiMuOlffAFTv/lGLnJTwQImFg
	L/D7sWN5Ol4n+Y5E8KX1n8GpiPPRuA68JQqXBG8R89PeSyQSRqaI7VBdPxJmT/4A//ls
	iWt0P8uaagIQB8jsTdHrrYryK0EDF8gp1Ittp2O3hzhKJcyLUGp63nnNNOWNBB+eOTpV
	QXvzmEMsJr22rxa6a8Gf7d+g21kT9jZnZupuf/eS2kN3g/2IxMTz89UaJc5lYwiR9Pik
	nfgTShgIiO5qy02CQR6dftPcaWKnHAWT1w6nvl/xMEEIq07EsZV43Ok43CsDq732wxBh
	taJQ==
X-Gm-Message-State: AJcUukeUVnapGkfTGjey9djfswl0x110UiMedlglyVNFAs3+cEqk7/HO
	tkVHn27dmZn6iXuAHCABBcEtEly7VYb1ILqty5A=
X-Google-Smtp-Source: ALg8bN6LyJSXzaCMtQLbVwBCR1DwDt7m3kAlSabuhrjJvTBEIiqpky0Fe+J4dQAV8LhlXm5NKPm9ntfxcCBDtuNDYIo=
X-Received: by 2002:aca:4b4f:: with SMTP id y76mr9223607oia.88.1548762262956; 
	Tue, 29 Jan 2019 03:44:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1548679462.git.alex.kanavin@gmail.com>
	<f26f729ae8292856bc3b1e73af1980fcb11d4972.1548679462.git.alex.kanavin@gmail.com>
	<e027d8fa4a0410d575fb9ff71833c13b626ba9db.camel@linuxfoundation.org>
	<CANNYZj_ziprqCNn09-SCVjUxvZphR4fQJqLv0X7COvxMkGD6Zw@mail.gmail.com>
In-Reply-To: <CANNYZj_ziprqCNn09-SCVjUxvZphR4fQJqLv0X7COvxMkGD6Zw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Jan 2019 12:44:11 +0100
Message-ID: <CANNYZj_EgBK=-OHMB1YSoJvD-7Rjj1PCtQydTHm0zzSpn=vRAA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/24] mesa-gl: do not enable nativesdk variant to avoid clashes with main mesa recipe
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
X-List-Received-Date: Tue, 29 Jan 2019 11:44:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jan 2019 at 18:37, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > I really hate using remove in OE-Core. Lets find a different way to do
> > this please as if we do this, its nearly impossible to undo in another
> > layer...
>
> Sure, I think moving 'BBCLASSEXTEND = "native nativesdk"' from
> mesa.inc to mesa_*.bb should sort this.

Actually, no - mesa-gl.bb includes mesa.bb, so this moving wouldn't
help. I simply set the PREFERRED_PROVIDER instead:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/virgl-gtk&id=b517d2940a19cf19647937ea727959c51fc28c1c

The full branch is otherwise the same:
https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/virgl-gtk

Alex

