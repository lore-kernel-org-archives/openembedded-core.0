Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB7775C40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 14:43:15 +0000 (UTC)
Received: by qcbcf1 with SMTP id cf1so43506207qcb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 07:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=avmzgx4+HTlz/l1juzYjqJXACZSM/Bx8sMN7RSrNhEI=;
	b=RYPkinUxQhQ+SQffDvWyt0uCHO1ZDn5i3Nr1A/ocwCtmRde8Qi3FmF6DXATY8WFd/5
	DG2ZH/z80+bX1Fu8e1IjQ2julKjPVutHBlrkw2rEHRTAN4NB+QqMPlaYvqQnUqOap+vA
	G0Y5dGBeiakdj+zg4hFBLD454dOo7YSzFybvLRovADsiaKuHntEW0p0ZkvYSfW38fSeS
	1xmKtblN24WY4mZxXBbBSrDO1QU2FTLukLun45Rher9qBm/5BAxPlz1ku/G8zjIMiL8v
	yeP8uXzgBmX/+hFd46rhQqydgHAsntON2AYfYsVZkzQtrxYqkIVN3H49oQBNrN2sBVsz
	yD5w==
X-Gm-Message-State: ALoCoQksB3xTmj6wr+fP2PZtR/LjaCnIj/2GtH4yfJJPAu28jAM2Jqj9po2HU2C9K7uBwhh9jl+v
X-Received: by 10.55.18.158 with SMTP id 30mr31556753qks.17.1435588995865;
	Mon, 29 Jun 2015 07:43:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 29 Jun 2015 07:42:56 -0700 (PDT)
In-Reply-To: <20150629124512.GE2393@jama>
References: <cover.1435297800.git.mariano.lopez@linux.intel.com>
	<e70f95d9bb6247ec0f305966894b22f681135013.1435297800.git.mariano.lopez@linux.intel.com>
	<CAJTo0LZrsr7u7a-jRhoG6nKP51vXBGCiuRsm51YoySiK_YSxsg@mail.gmail.com>
	<20150629111839.GB2393@jama>
	<CAJTo0LZ4fC8k889WXqfgvqLxGMZgZvQoCe3RGZTEvYxaf0xjow@mail.gmail.com>
	<20150629124512.GE2393@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jun 2015 15:42:56 +0100
Message-ID: <CAJTo0La8ntx8ejNG0Dg_V34aBMXCRGJCGMMXUYAXmW+0P89AyQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] report-error.bbclass: Added file syncronization.
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
X-List-Received-Date: Mon, 29 Jun 2015 14:43:18 -0000
Content-Type: multipart/alternative; boundary=001a1146f48224759a0519a91c11

--001a1146f48224759a0519a91c11
Content-Type: text/plain; charset=UTF-8

On 29 June 2015 at 13:45, Martin Jansa <martin.jansa@gmail.com> wrote:

> Even the last task parses the file before appending additional
> task failure and dumping it back to the same filename.
>

You're right Martin, turns out I can't read code...

Ross

--001a1146f48224759a0519a91c11
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 June 2015 at 13:45, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":22c" class=3D=
"a3s" style=3D"overflow:hidden">Even the last task parses the file before a=
ppending additional<br>
task failure and dumping it back to the same filename.<br></div></blockquot=
e><div><br></div><div>You&#39;re right Martin, turns out I can&#39;t read c=
ode...</div><div><br></div><div>Ross</div></div><br></div></div>

--001a1146f48224759a0519a91c11--
