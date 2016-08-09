Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id D88E965CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 10:01:53 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id u186so8628176ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CiyXqhB/wGTFOZhdQOkRoxvtQorvk/H9dyiIbTmi+HE=;
	b=AtJgohI0X3NGLR/mQzcUgtNCPUpYJDkVcQsQwZA2n7CuEGdtZUSrLuuRyKCyky9T7U
	Bi+OBFEdyp4DBVlvnUPc3HAHL5EqFNmR/YojQjGlSgN2nBUf+zCW3VgCE/5VNiv4fjNr
	uhoaxTFcRG1lJOAAGvNakSW8oOn4BiKCiVYuZQmj92MB1WmObjXciJSUiyjEzrygHC1+
	matBvbL6w+cCCrVb+t+QyvvdgMLl4+E3j5RoJm5Lazj85YePkoEW2atZM5of1Vm4JOUp
	OR6rS5GfJ1P4vdEmvFrDc9AJXyosHzmJbWB/KEdtGAL+0BlX1d9K5Nhslwl4ijKgPJ4A
	p3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CiyXqhB/wGTFOZhdQOkRoxvtQorvk/H9dyiIbTmi+HE=;
	b=bry6Kp3YuC544tYNbMXL0JVFprh/xpL+ESOZsn9tM+umc7j8Ct2XkE+Qg8JzTPnEgv
	Ppc+wyo3vHt4SLpp6Fyj/faYzVLmHHEaCTIIV8tJjdqkXDrZRtVK86eCY/WnGuS/Yrw1
	DukPJW30o2Ca3V3opxq0LfupsyhInuu0txVEbSsvVNlJzupR7T5FkGFohQ7NTyDileXJ
	fedzLWA+DpjGX0k3u1lJgM/0UfunJRKhAlH3/Mm9pDqcgSM/7fMbid+KziBPYkS1naym
	2Jx91cKJXMjtJWLhM2bJEe4T8KmLpdwZIeci4NzHKp8TO+GXgEvkHxo1ka/rVF7HpZK4
	Z3fA==
X-Gm-Message-State: AEkooutEvfcdueI+fd/sdia/CHoV698j6h/zpdik5RvgWGBh/BoWq85Xz+IqiUBmISyakTkM5EXyJGaGoqvgyVa+
X-Received: by 10.36.87.140 with SMTP id u134mr24269025ita.38.1470736914217;
	Tue, 09 Aug 2016 03:01:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 9 Aug 2016 03:01:33 -0700 (PDT)
In-Reply-To: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
References: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Aug 2016 11:01:33 +0100
Message-ID: <CAJTo0LbW8c7V=5vHXML8srwVgzacqGJp2o0M4OOReVE42DnW0g@mail.gmail.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth] systemd network service fails to start on boot
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
X-List-Received-Date: Tue, 09 Aug 2016 10:01:56 -0000
Content-Type: multipart/alternative; boundary=001a1135018c54b3290539a09fa5

--001a1135018c54b3290539a09fa5
Content-Type: text/plain; charset=UTF-8

On 20 July 2016 at 08:53, Kristian Amlie <kristian.amlie@mender.io> wrote:

> on our krogoth build the systemd network service does not start, and it
> seems to be because of missing users, which has already been fixed on
> master. I've cherry-picked the two patches that fixed the problem for
> us. Note that they are not written by me, but by other people on this
> list. I hope they can be applied to krogoth.
>

Can you send the two patches to this list, with the [krogoth] tag in the
subject, and your signed-off-by to confirm that you've tested them?

Thanks,
Ross

--001a1135018c54b3290539a09fa5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2016 at 08:53, Kristian Amlie <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:kristian.amlie@mender.io" target=3D"_blank">kristian.amlie@mender.io<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ih" cl=
ass=3D"a3s aXjCH m156074d2f31971f8">on our krogoth build the systemd networ=
k service does not start, and it<br>
seems to be because of missing users, which has already been fixed on<br>
master. I&#39;ve cherry-picked the two patches that fixed the problem for<b=
r>
us. Note that they are not written by me, but by other people on this<br>
list. I hope they can be applied to krogoth.</div></blockquote></div><br>Ca=
n you send the two patches to this list, with the [krogoth] tag in the subj=
ect, and your signed-off-by to confirm that you&#39;ve tested them?</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Thanks,</div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a1135018c54b3290539a09fa5--
