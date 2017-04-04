Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id B8D5C71D87
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 16:14:44 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id g195so73920107qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 09:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+gDS/1q5KOxQNFwpqf8MlkkfB3bSZF3D/88HV18R3bM=;
	b=FZxuDrj7D7ZlhUPQYsWjcsDEMs1ncVTiA7NR1e6U6N11xlmHv6/JxyCrEu8tb79kYZ
	iY3MWr78VsmSDpnrUkvMyRn9gTisDFZfoBvWHgRU5bqVmr/YdcStRMQ/P+kpcrE+K/Tc
	aVoaDngkU+GAHybwXYsnTvHz4cjsvHt/o+ts0FRE04n1khhkJQbQnjqYKVl6HQGWLdCo
	zJFRmx1Ra2MJfSdJSH2IAcWD3k+g1ArwCH8cz5uq3aO4yB4MUbm1O4Zq7axH4N9nrcYz
	OVszMb2rMPmJgvLo8akQJgNJ+ZJ0KHi6h/+VcToB6jdcBovfK4QQR8pBsB7iaAriaGrb
	5cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+gDS/1q5KOxQNFwpqf8MlkkfB3bSZF3D/88HV18R3bM=;
	b=E1KfzqKG4/ddjEhm6LNl8BHsbX4fuhSooN9TBMaqz5YN6qeH9NeUv4xa4lDXBlE2PC
	rVEbpnYZhTKPpTAeIu6txthU0qQ7UJYfh1QcW1imRxmoJ385IQKGLthl6EadQidC1J6V
	Q4AJ8hWhbqalvgVtY/CtBIMorz8mhpFZlKN1T6geZy+S4m761A9ggUU+N6DdEtKE8BGq
	hKimygbqFCUUQBPI9lSzy3DHwxwZBsnBbvKYFPOcfMFHacQtDKDEYNsyGT+B0xBVxQIT
	qphHRK/ktmFP2SgGfSZqsBxw4zyYt+fO5eLQ8JrlXixPCNErbsKcLoUwe4OUY8A7AwSe
	LgSA==
X-Gm-Message-State: AFeK/H3qhffK6VyArJ607Rr5iRxDf6Sr1ANaZCiMxbVoBR9IAhldOiKItenO3rbDodQD7L2GZ95e6TT1oHcElFhO
X-Received: by 10.55.78.80 with SMTP id c77mr8301776qkb.221.1491322486256;
	Tue, 04 Apr 2017 09:14:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 4 Apr 2017 09:14:25 -0700 (PDT)
In-Reply-To: <CABcZANn2e_b4dgdr9=LNMuAUtby5r0OoODv4CVFj0DUTno_wKw@mail.gmail.com>
References: <1491315753-17805-1-git-send-email-ross.burton@intel.com>
	<CABcZANn2e_b4dgdr9=LNMuAUtby5r0OoODv4CVFj0DUTno_wKw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Apr 2017 17:14:25 +0100
Message-ID: <CAJTo0LbDaovDW5YynokiF42pUYLdcMXoJi_5NcZPtZokOie3vA@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: explain where TMPDIR is if we're telling the user to delete it
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
X-List-Received-Date: Tue, 04 Apr 2017 16:14:46 -0000
Content-Type: multipart/alternative; boundary=001a114a896e0a29a5054c5993fa

--001a114a896e0a29a5054c5993fa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4 April 2017 at 16:13, Christopher Larson <kergoth@gmail.com> wrote:

> This looks good, though I wonder if we should explicitly state that it
> should be removed. I could see someone wondering how they =E2=80=9Cclean=
=E2=80=9D their
> tmpdir :)
>

Good point, v2 sent.

Ross

--001a114a896e0a29a5054c5993fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 April 2017 at 16:13, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">T=
his looks good, though I wonder if we should explicitly state that it shoul=
d be removed. I could see someone wondering how they =E2=80=9Cclean=E2=80=
=9D their tmpdir :)<br></div></blockquote><div><br></div><div>Good point, v=
2 sent.</div><div><br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a114a896e0a29a5054c5993fa--
