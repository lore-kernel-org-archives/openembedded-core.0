Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id CB6AF609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 12:54:46 +0000 (UTC)
Received: by qkdn188 with SMTP id n188so10510238qkd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 05:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hnTG47rZP+TcIZLYjltz+IF5NiZ6zUUKsecPWiad6Rg=;
	b=A5MD0/eHGS8eGUkKjkq1IymO6l+E3y/YvuJ8eI//QP9keMYZWyajAmY1N0VqnY3iNx
	iHWWsXyLzan5pXB/25ZXKLxbAwDQcQ5GtzSE95RnkMwdpLL97nbgKwnAKTj7TPMohoOe
	CmYRkRB8IRfFzUJoKoStZwmIolV23ABwnworIvOwZ36suSdpv1LFitJKLmWtgFtG/viR
	RG15eIVNkC5vkFvjO3Zk6v4DRKKS8eBU46taNI702x7gGdPCNjTI48zVdmAyCf7iydVY
	k+fNtRjfRD7XyhQu6A7GdYH2FmsN8swa9txc6fq2N3iz3dshweaCXIAkEVxR7omIFxIX
	APpw==
X-Gm-Message-State: ALoCoQmU8ubArx6fUyblSXDri5nr0LmLljzp+sZ1y70A26pIUEA6pHKbEtcxP9CW9ABNnj3dixV+
X-Received: by 10.55.43.130 with SMTP id r2mr17690471qkr.14.1432299287065;
	Fri, 22 May 2015 05:54:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 22 May 2015 05:54:26 -0700 (PDT)
In-Reply-To: <1432297083.4102.5.camel@workhorse.madison.systems>
References: <1432294706-18789-1-git-send-email-ross.burton@intel.com>
	<1432297083.4102.5.camel@workhorse.madison.systems>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 May 2015 13:54:26 +0100
Message-ID: <CAJTo0LYKeXp-8BQWHM3biCbD=pb5DODS9vxFFYz0Pc+y4NvA+A@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] utils: add helper to perform the union of two string lists
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
X-List-Received-Date: Fri, 22 May 2015 12:54:48 -0000
Content-Type: multipart/alternative; boundary=001a1147afb037cd020516ab2ade

--001a1147afb037cd020516ab2ade
Content-Type: text/plain; charset=UTF-8

On 22 May 2015 at 13:18, Matt Madison <matt@madison.systems> wrote:

> This function is returning the intersection of the two sets, not the
> union.  Maybe change the name and the comment here?
>

Union, intersection, what's the difference really. ;)  V2 sent.

Ross

--001a1147afb037cd020516ab2ade
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 May 2015 at 13:18, Matt Madison <span dir=3D"ltr">&lt;<a href=3D"mail=
to:matt@madison.systems" target=3D"_blank">matt@madison.systems</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8r5" class=3D"a3s"=
 style=3D"overflow:hidden">This function is returning the intersection of t=
he two sets, not the<br>
union.=C2=A0 Maybe change the name and the comment here?</div></blockquote>=
<div>=C2=A0</div></div>Union, intersection, what&#39;s the difference reall=
y. ;) =C2=A0V2 sent.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a1147afb037cd020516ab2ade--
