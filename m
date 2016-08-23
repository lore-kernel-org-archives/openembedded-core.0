Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 91312731D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 16:33:29 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id x131so158050524ite.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=07sMoj2ps2msi2FezgrwTVTu+cLtxYbWSn41Pc8kDRA=;
	b=o40qMmPakz/Kejid0SPLVdVnbswEmT/B7gZ9kP64bDlkkFu109tzJhDJ4WmkbH0MPa
	RK+FjTNOjk/MVq7foyhFnGplXgPMNoCFrzb5wEkGmWSgqyORWKR9CS7bEG85vTUgxbOK
	d8F6Vb7GDHTu2XGP7KQCKBo/3lssGMuOvz56/aXInlBX2MtBZV5V0b9q8wTcIg6am3bX
	KB9FhF4J3uyEC6ZDN7V3fjgkomvOtVsv3zDJwB2ojUm3CvTL+b6RCi6WhHhB2T3V95cx
	DstTu2KFtbMymzX+lscwLTwPvmWT5y0tdtp96bnzdYA8IoFC9lAF77JWkCVpX7J14HCi
	uRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=07sMoj2ps2msi2FezgrwTVTu+cLtxYbWSn41Pc8kDRA=;
	b=cd1T+uo1Z0hbCt1axdHkvG8cd+LeW1fwxNLEKcZXQDMz1MmelDoFp3dBygjkhatZtK
	388h4mZmgReIDsHFLPaEDsmAD4R/V/THf/t2wJqUv8OOVhwnvR4cwx3CvlytcG1SX13/
	pJtWZrmkyeE2NN2TV6u8QQeQgWqE+RTHdtSKz5p90ufqmjy/spsKTYUfH2/ZSQ4r3o0E
	vRQWH0v/AwnP6fYx/yQa6XNrdb35YiEtmBO7NGnGZBZmsexlm1UDvTDmpmQSHJQ2PUKq
	VqSiRYVF9wfSmJjNEE3RMJFbGuHJuy6CrbRvFFuOVTrxbSu/Mtw/n6TprdTiaeRZU7Mr
	6PAA==
X-Gm-Message-State: AEkoouvbmu6qfvrhVEn2aUi3UEhq//hsHUdn5F271vW2w7wqV5fXtYYy3mNDtjd+jUTsy5xD1L7PkRDtu54Y623r
X-Received: by 10.36.129.213 with SMTP id q204mr29264578itd.38.1471970010258; 
	Tue, 23 Aug 2016 09:33:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 23 Aug 2016 09:33:09 -0700 (PDT)
In-Reply-To: <9e30df083af2d4888f3aa500a34e4f9663e21996.1471857211.git.kai.kang@windriver.com>
References: <cover.1471857211.git.kai.kang@windriver.com>
	<9e30df083af2d4888f3aa500a34e4f9663e21996.1471857211.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Aug 2016 17:33:09 +0100
Message-ID: <CAJTo0LZ+_JhV6L=NSgKaVGzWTjibuGzp0GhEANaa2Go=ASdf_A@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] openssh: fix CVE-2016-6515
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
X-List-Received-Date: Tue, 23 Aug 2016 16:33:30 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fc951935053abfb993

--94eb2c08b1fc951935053abfb993
Content-Type: text/plain; charset=UTF-8

On 23 August 2016 at 02:59, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Backport patch to fix CVE-2016-6515 from:
>
> https://anongit.mindrot.org/openssh.git/commit/?id=fcd135c
>

We've already had an upgrade to 7.3 in master(-next), so this would only be
appropriate for the stable branches.

Ross

--94eb2c08b1fc951935053abfb993
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 August 2016 at 02:59,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.ka=
ng@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":1hy" class=3D"a3s aXjCH=
 m156b5222ca2617c0">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver=
.com">kai.kang@windriver.com</a>&gt;<br>
<br>
Backport patch to fix CVE-2016-6515 from:<br>
<br>
<a href=3D"https://anongit.mindrot.org/openssh.git/commit/?id=3Dfcd135c" re=
l=3D"noreferrer" target=3D"_blank">https://anongit.mindrot.org/<wbr><span c=
lass=3D"il">openssh</span>.git/commit/?id=3Dfcd135c</a></div></blockquote><=
/div><br>We&#39;ve already had an upgrade to 7.3 in master(-next), so this =
would only be appropriate for the stable branches.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c08b1fc951935053abfb993--
