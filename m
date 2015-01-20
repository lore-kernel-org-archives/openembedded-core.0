Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 987CA71353
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 15:59:01 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id m20so20500124qcx.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 07:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1tTyRHUsoPsftkcHNZYv2MKFXhRfssCTMp0gtzPPM7I=;
	b=NMPFmyMPmjhl1Q0X9A4QiqIE0sn1LlQwThVQ93mzDpUTZRnIEVEVIwPbylVX91YNyZ
	2oQDzaKBIRP0OT1VkgdZ1/MCLXfjdMZKadbdLPFwDzJOc4b4V28GalyXs/iy/NuGWCTp
	G26eU6Z4z80VCyIEjKSHBURE4thysXuyPluscevfkpwmuuhd6EkD/xERndQyN8m47IIf
	wARQMuO62SqbUY5xf3QugyhHY7fIcC0Soins2i3xprzyBCbFqpoJYselrZWHCAyS/wGe
	5og4NSZD8XJ7syb5CZxsYzi83hV+alRZJBuYTw6FrEkdvwPsiIDZtAoI29q7vWTb4ZFg
	/KIA==
X-Gm-Message-State: ALoCoQnDJDZ4N3tGjOF3tmkywJXBFEy5WurL4opaEBeouS3nTHwQ87PQNzIH7Axb2/es/0Fl2XLd
X-Received: by 10.224.92.205 with SMTP id s13mr59246335qam.52.1421769541620;
	Tue, 20 Jan 2015 07:59:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 20 Jan 2015 07:58:41 -0800 (PST)
In-Reply-To: <bc679bdfe35b8c0740f66a5e5f03d8ac69c59309.1421651378.git.liezhi.yang@windriver.com>
References: <cover.1421651378.git.liezhi.yang@windriver.com>
	<bc679bdfe35b8c0740f66a5e5f03d8ac69c59309.1421651378.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Jan 2015 15:58:41 +0000
Message-ID: <CAJTo0LYBoig04-HGxR=0Y0w7oM9yPjZzApJ2+Xqu-wmtARuX2g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] perf: fix for rebuilding
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
X-List-Received-Date: Tue, 20 Jan 2015 15:59:06 -0000
Content-Type: multipart/alternative; boundary=089e015375e47b2b24050d1784ed

--089e015375e47b2b24050d1784ed
Content-Type: text/plain; charset=UTF-8

On 19 January 2015 at 07:11, Robert Yang <liezhi.yang@windriver.com> wrote:

>  do_configure_prepend () {
> +    # Fix for rebuilding
> +    rm -rf ${B}/.*.d
>

As $B != $S, could you not just delete $B entirely and re-create it (as
autotools.bbclass does) in do_configure()?

Ross

--089e015375e47b2b24050d1784ed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 January 2015 at 07:11, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div id=3D":1vg" class=3D"" sty=
le=3D"overflow:hidden">=C2=A0do_configure_prepend () {<br>
+=C2=A0 =C2=A0 # Fix for rebuilding<br>
+=C2=A0 =C2=A0 rm -rf ${B}/.*.d</div></blockquote></div><br>As $B !=3D $S, =
could you not just delete $B entirely and re-create it (as autotools.bbclas=
s does) in do_configure()?</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--089e015375e47b2b24050d1784ed--
