Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 13F147391A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 08:21:17 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id b62so293593272iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/yaFG8dNcQQzY0do1Ugbh2qqY4q9KZ+j8RDAlV0jXhE=;
	b=wHS6alRBwPpkO0klxkcDrpju+vzRB4CKrz6Qoc6NQZnqf8tfzeVgF949B3LJWNZb0/
	+jRG8szhwButYJfC4wt6z3B3VRBHNsuTJDIhoNo7+YuKF0vpBT+em3zXbNfCMd5bvBu+
	8O7ilsTZQAQaAZkTMn99aezbcH2ylMy9Q4WMYOneGOj/J5fLQnD4Nr7yRWxuy2/YLRfh
	6TWtdjb1UEzyXZIL5sAeH4hq36muXOcK1QYHILxu4uvhzxf6Mmarayhy2U3nR5BGonOb
	HkRhDc2+OjwHfOWfBGTJ3b9X6STFeICseE2jm9zWOwYPJnOM7Vta0VTHafnLoug9NeRp
	N3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/yaFG8dNcQQzY0do1Ugbh2qqY4q9KZ+j8RDAlV0jXhE=;
	b=mvzs3gighpjUP4MdNZvnIZLYwoPyQ8UHRbypZkG/iblXg7amemdO70qJqWm7EaoJBA
	rZ2O9dqBKTG3AnXSXCLnv/8+5tdEUSXGCY/EgCe0IoQwJtg67zWPwui7140IDdsqpvsz
	gkat3LbqdqFmfFqMIsuaLM1T5ubTY64y5k1v+Oje6vY2Q7WK9Tclf5HmiXYYl2n2V/xe
	Yup6gFfhqqn22IATS/RNkR9wKt+Kmo96xoAZGgRmHMeSXcuXFIzibiTlnU1J8myingk5
	ZPziYtkEFj+xZJLIPDcafYXXScf0mJ+BSxd7l26BekQP7Mp9Piw0nMOT3iCtL0h24+xU
	Y33g==
X-Gm-Message-State: AEkoout/UCbOt0s/qCoz0IEC8v7dRJ/AjF9eadoQIPCYB/Peem4cR1C2zCfcYvw6R3e5MlJlnESgdYXItc08rLEO
X-Received: by 10.107.135.142 with SMTP id r14mr87222490ioi.133.1470385278048; 
	Fri, 05 Aug 2016 01:21:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 5 Aug 2016 01:20:57 -0700 (PDT)
In-Reply-To: <57A3FE58.8010704@windriver.com>
References: <cover.1469337362.git.liezhi.yang@windriver.com>
	<07cae7b73779e89d5e038bf48fbfa204d51b4b68.1469337362.git.liezhi.yang@windriver.com>
	<CAJTo0LYCEP1nkeZ9-1i+K3YsK0OMAt+axx-4ezQsbxu+VwvyVA@mail.gmail.com>
	<57980BC4.80208@windriver.com>
	<BF50BCD4-DC5E-478D-9AF3-24C9E99C36A7@gmail.com>
	<CAJTo0LZ_9sp6+tWgoY1NSeh3H-KVWrCJfyCp0LW1YaF6AMS1tg@mail.gmail.com>
	<57A3FE58.8010704@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Aug 2016 09:20:57 +0100
Message-ID: <CAJTo0LbsdQVQ3yCsYdEFOoHSRSbSOmV6dSzAPLsH9P252=Zagw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] epiphany: inherit perlnative
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
X-List-Received-Date: Fri, 05 Aug 2016 08:21:18 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc2e722405394ec03f

--001a113eccbc2e722405394ec03f
Content-Type: text/plain; charset=UTF-8

On 5 August 2016 at 03:47, Robert Yang <liezhi.yang@windriver.com> wrote:

> I can reproduce the problem every time on my host Ubuntu 14.04 64bit:
>

Just discovered that ephy for some reason ships its own copies of
intltool.m4 (and a few others).  We'll need to delete those.  Patch
incoming.

Ross

--001a113eccbc2e722405394ec03f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 August 2016 at 03:47, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ru" cla=
ss=3D"a3s aXjCH m1565899accc76960">I can reproduce the problem every time o=
n my host Ubuntu 14.04 64bit:<br></div></blockquote></div><br>Just discover=
ed that ephy for some reason ships its own copies of intltool.m4 (and a few=
 others).=C2=A0 We&#39;ll need to delete those.=C2=A0 Patch incoming.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a113eccbc2e722405394ec03f--
