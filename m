Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC5765C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 19:16:23 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id g18so4043163itg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nYKd6ezZYSuVb6jum/Q5NGzz686N7yETLKxjomc0Ttg=;
	b=05y5NndiI11uPiRcPl4/y08LSxKLaAysoWqVHa0BU2/xqfzFBqCq2uSFnTvEfN2CWM
	SL0x3JjbXqiUBHYA+43suPPIDKx3M84WvF5cWhbq7a2kHGdhRtHhpWl/MTWk2SkgfA3U
	r37pQvMSuioRBVY7qhuXvYXAyHQvMPHHpdibqSCrNmBqcgCsIoLAgQ3qEbP7w0R9GjH+
	SagSY7arQUbAy+RYccjiMXB7jDDTkMmr0swqykF3BM4hcV4HNePHozc43qnYxYtWKPzR
	XUNYOD/AgrpcwafsQe0ZbneK51rE/tpnjTUNKPOOVnzZAM+qSNctQOdMsKxWdklUqgEQ
	r9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nYKd6ezZYSuVb6jum/Q5NGzz686N7yETLKxjomc0Ttg=;
	b=oOhqodWnuYkYorRrtiLA7m6OBBduYvPl5FLOmwFd4gvyWpOFdV2EuO5M4PtXlwMFCK
	FmkN+AkelbycXfLZb5dSXqQYCCBWsuPS7yT5xbHJSlqCNxvfED6FuZAjBzu6OO6oeOoV
	M7u1tonGcYlZAMaMRF9M3wqAuPTGZsR43blXr0mb3czdZZmB9d0S4/4mvxSj5fK7ywnu
	gW1o02vdSiv9Pn16cNWA+J3arbPQXLT+shJjNwBLAFBcbbOdl8drJC9UYLYnQFunurG5
	NA2+oQFOdYXxsKS6NsL0Z/C6yZFe5DSi4FOTGEvYLvFlDwxhO/c+mw7bq77+r8e3SHPG
	qpbQ==
X-Gm-Message-State: AHPjjUjWV3hOJ1uozUouKjQWD4QbHl4uNpp9cXzQCRrlXp2e2M8XjfXr
	LuRBqgIxxs9k/RlKSeHgDf3uaj0GERjIBnBbCZNFuQ==
X-Google-Smtp-Source: AOwi7QCJ1/73mVI9vI5Dj4/TQco/kdzqCM5599HyKetJLJVMQyViz2A+eanYGDmfW025SSc02wfxiJs1pOSxTgyyTQU=
X-Received: by 10.36.162.67 with SMTP id o3mr8157397iti.27.1506453384782; Tue,
	26 Sep 2017 12:16:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 26 Sep 2017 12:16:04 -0700 (PDT)
In-Reply-To: <CAP9ODKp6tsZd34jS1QzDnEpi=0ALSs8GaHFPC9iVO-5wjkUD7A@mail.gmail.com>
References: <20170922110243.10454-1-fabien.lahoudere@collabora.co.uk>
	<20170922110243.10454-2-fabien.lahoudere@collabora.co.uk>
	<CAJTo0LYMQ9NAvK+zNegmtbPQnPao1rx6wQM1q48TRP6FDUopHg@mail.gmail.com>
	<CAP9ODKp6tsZd34jS1QzDnEpi=0ALSs8GaHFPC9iVO-5wjkUD7A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Sep 2017 20:16:04 +0100
Message-ID: <CAJTo0La3fRSYaQAgWZt-qWB-noNsqvgO8Q2G4wYgqj62qB8Mug@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/4] wayland-protocols: Fix installation patch issue
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
X-List-Received-Date: Tue, 26 Sep 2017 19:16:24 -0000
Content-Type: multipart/alternative; boundary="f403045fb2a2df1ae8055a1c822f"

--f403045fb2a2df1ae8055a1c822f
Content-Type: text/plain; charset="UTF-8"

On 26 September 2017 at 19:04, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Tue, Sep 26, 2017 at 12:29 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > Does this depend on the upgrades, or should it work standalone?
>
> This works standalone. I've been using it.
>

In which case I should report that when I applied it, building weston
failed:

make: *** No rule to make target
'protocol/xdg-shell-unstable-v6-protocol.c', needed by 'all'.  Stop.

Ross

--f403045fb2a2df1ae8055a1c822f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 26 September 2017 at 19:04, Otavio Salvador <span dir=
=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"=
_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-sty=
le:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail-">On Tue, Sep 26, 2017 at 12:29 PM, Burton, Ross &lt;<a href=3D"m=
ailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; Does this depend on the upgrades, or should it work standalone?<br>
<br>
</span>This works standalone. I&#39;ve been using it.<br></blockquote><div>=
<br></div><div>In which case I should report that when I applied it, buildi=
ng weston failed:</div><div><br></div><div>make: *** No rule to make target=
 &#39;protocol/xdg-shell-unstable-v6-protocol.c&#39;, needed by &#39;all&#3=
9;.=C2=A0 Stop.<br></div><div><br></div><div>Ross</div><div>=C2=A0</div></d=
iv></div></div>

--f403045fb2a2df1ae8055a1c822f--
