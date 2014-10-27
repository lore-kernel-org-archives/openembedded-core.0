Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id D5DEB71E91
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 13:16:09 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id z60so3856295qgd.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 06:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nffbS83hEOFokzzzpg7gVnfAMbynETCjpShSLhXdUiA=;
	b=kxBPF+v10JGpcDZtD3/JzuiUoVESyPTcKOMJ0HVYLxv11yJJ3F+N8BzP2DOwmgzwpL
	LjmNeWEIWiUCqCNkLZ8BFe/h9jc3Kp79FS5nCfyaQ7XmTqt5Jafs3OrcHjsG4RcTDKoC
	0fYPWLDoypNj3GB/7XkP5JThaNUZosaQWjrolit3tQumNSSxVSjnBtc2X59ZeFJixZGk
	wrS+tfy96xwgoprzQi5W16KCg6Jes/4XN/+xvQVlNCFRPXjYHWZOKLfbNjWOWE1MtKH3
	XHysAxRZ/7p7c2gR+RORl2PKUI3p9UReQe+kNjsvH74ucmScLYnkCgm+DkypasjxY8AW
	d01Q==
X-Gm-Message-State: ALoCoQnHA0Fctzjjy9nb384CpGaQorySDosLwjEnSfegzV9qF3vWZEPCnLcCSgIj5bYwp8K3X8Rw
X-Received: by 10.224.79.79 with SMTP id o15mr32821713qak.93.1414415770496;
	Mon, 27 Oct 2014 06:16:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.92.179 with HTTP; Mon, 27 Oct 2014 06:15:50 -0700 (PDT)
In-Reply-To: <473E6E55-239E-4EC8-813C-8494BEF78CED@dominion.thruhere.net>
References: <1414336254-22707-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LagpRtefUvm_rrOcEyj6hTZRkySk9fVzcYGm+UFFYe_rQ@mail.gmail.com>
	<18631FB3-E9CA-4DD0-BF5A-DB114D3B7422@dominion.thruhere.net>
	<CAJTo0Lam=wC-MBny66h-jC0ieb9tp9nTJUWEQ+KXvLDEqbk23Q@mail.gmail.com>
	<473E6E55-239E-4EC8-813C-8494BEF78CED@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Oct 2014 13:15:50 +0000
Message-ID: <CAJTo0LY5A00MG1hmFL7Smo1sdHnGdfqpun4+kbhDRZ3iAQ2NDw@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base bbclass: add support for tar.lz
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
X-List-Received-Date: Mon, 27 Oct 2014 13:16:15 -0000
Content-Type: multipart/alternative; boundary=047d7bdc78f890e2dd05066755ad

--047d7bdc78f890e2dd05066755ad
Content-Type: text/plain; charset=UTF-8

On 27 October 2014 13:06, Koen Kooi <koen@dominion.thruhere.net> wrote:

> Ah, two different problems :/


The problem that lzip-native isn't in oe-core is only a problem when
there's a .lz SRC_URI in oe-core, but the false-positives are a problem now.

Ross

--047d7bdc78f890e2dd05066755ad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 October 2014 13:06, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:koen@dominion.thruhere.net" target=3D"_blank">koen@dominion.thruhere.net</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ah, two different pr=
oblems :/</blockquote></div><br>The problem that lzip-native isn&#39;t in o=
e-core is only a problem when there&#39;s a .lz SRC_URI in oe-core, but the=
 false-positives are a problem now.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc78f890e2dd05066755ad--
