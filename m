Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8812877D30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:41:49 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id d201so15232529qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R32SGX29vKJtHQZ72M6ioyGvj7SFXGiRhH6Pj139X9E=;
	b=u5DuMZeAyy0zth05HnSbLWJtPnmRFpWWnab4mmeUUiqy1pc16E7+w7QHJeM7UFrNkE
	EU253H8KUQ11cW6Osa2Cr+UBx7iWxM4jDl9chG0buUpdn+G4Co590GrpwQQB2r9PFYTj
	EYLZOGzvVxkS5+7g2fSeVi8Z7OHlmN1sm9X1S2lwlXVOET3SpNmNBxVceVFFqXyg9jyK
	ZDnmyUhfTNo55lvmLfT2iWWStAkddeUInDTizUWDR2Q5KoI6JVCruMLeUyx7bGJxb/x2
	iidlr4rNoOwSrE4Dz/ecxZ3z2F9EOj6eZIxZ70mEgpp+WV5meS4gxR6ViCuW61VgZIqQ
	r8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R32SGX29vKJtHQZ72M6ioyGvj7SFXGiRhH6Pj139X9E=;
	b=SbQ/7eQCPnVa8VTxHot3e0c3wpabx3WONm8EqD+269lNZkA5iAbm4QXW3Hi3nCGcsl
	wh6cXezExpKX/O6+TneWII8VZeQgcfdLsk1jEw3feZFKeiJfJ1KXpUD2zKEEg0CFsuJa
	7q1+nZ/PzNM7+7mvrpP4LGdMppiL+f+N3LCDv9FxWBiOORs+avpuewUvFNoljkUhM0M/
	poksiZ2zpSwYCJh9bPv/2Y1x6J1ex2bj+WZB1o/odQba1xCChWblS1LBz/oI33vQ63v+
	TEoknDGj7wJ+8TlxaffeQ6oclMQ94blUZnI+s5xgqg5rLgYAj/qLQNpokUlBiMfSnUK5
	3VXA==
X-Gm-Message-State: AFeK/H178PVltYd4PSuzrfqQeS+o1Rck+qlfrJNI29D5NQAqL0trTqC06Opt2H4o3E/HOzA25VlvuneofVUb4g8Q
X-Received: by 10.55.20.100 with SMTP id e97mr708186qkh.3.1490892111025; Thu,
	30 Mar 2017 09:41:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 30 Mar 2017 09:41:30 -0700 (PDT)
In-Reply-To: <a0db5863-003a-ab83-aa85-c719656ddc62@cisco.com>
References: <e1eee1aa56e1dc59a55a9cac25a00a1ea2f9375e.1490727568.git.spopovyc@cisco.com>
	<CABcZAN=pYQH82T4Gxi9VneWQtRQYZyeu+Wrr+4V7iWeXW+_RvA@mail.gmail.com>
	<a0db5863-003a-ab83-aa85-c719656ddc62@cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Mar 2017 17:41:30 +0100
Message-ID: <CAJTo0La9kxbzE4drCC5YP-2sZb+6WeBqwH1jw8yGgzaYLi+EWw@mail.gmail.com>
To: Serhii Popovych <spopovyc@cisco.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [PATCH] ca-certificates: Fix symlinks to the certificates in nativesdk
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
X-List-Received-Date: Thu, 30 Mar 2017 16:41:51 -0000
Content-Type: multipart/alternative; boundary=001a11401104ad3ac7054bf55e22

--001a11401104ad3ac7054bf55e22
Content-Type: text/plain; charset=UTF-8

On 29 March 2017 at 13:51, Serhii Popovych <spopovyc@cisco.com> wrote:

> That's great. What the subject of this change in openembedded-core?
> I wish to test it.
>
> Because with current *master* I see problem is still here.
>

"    sysroot-relativelinks: also consider links to dirs on the host"
oe-core c5b522378fff13962a5187d9d09979866f805cb5, now in master.

Ross

--001a11401104ad3ac7054bf55e22
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 March 2017 at 13:51, Serhii Popovych <span dir=3D"ltr">&lt;<a href=3D=
"mailto:spopovyc@cisco.com" target=3D"_blank">spopovyc@cisco.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb=
(204,204,204);padding-left:1ex"><div id=3D"gmail-:43x" class=3D"gmail-a3s g=
mail-aXjCH gmail-m15b1a2123c621a3a">That&#39;s great. What the subject of t=
his change in openembedded-core?<br>
I wish to test it.<br>
<br>
Because with current *master* I see problem is still here.</div></blockquot=
e></div><br>&quot;=C2=A0 =C2=A0 sysroot-relativelinks: also consider links =
to dirs on the host&quot;</div><div class=3D"gmail_extra">oe-core=C2=A0c5b5=
22378fff13962a5187d9d09979866f805cb5, now in master.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11401104ad3ac7054bf55e22--
