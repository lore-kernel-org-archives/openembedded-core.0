Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 23443719AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 17:52:02 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id q130so186186071qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 09:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ovvS2Aer7xxYwfsrKsmsuu5Iittws5eIUcv/+/Zc+1U=;
	b=DZDXY64Ke/8OcsBleqfwKFxA0jcvfs4m0sacd2gmCJB2JmYy6f/VMlRzb0Ru3JHGE/
	RUwcRBNXFMbKV1TUlY7HOtdeQEPTgpWgc9ok7XM6bq43wnu205bu3L418F+tQ7MXlATH
	TxGl3uKLsXYYpAcfMXY2Zr/i7UDlKpfsBMe4tgGQN3GP7dQfdYyRMKY86Holx4iuCJib
	TzCYuqjyPMQ3kcxs5hBcOvgFoqzut/zoi24cLeDrjg96aIPBcKpaVnxVrUG22a6Dj+P3
	9DPJ+uQMnLlMx/Wu2s04mOgmZ7onlpgg+JupiuFN3HyUuFq8tngpCnbdCbqe9tQmuMJ8
	UPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ovvS2Aer7xxYwfsrKsmsuu5Iittws5eIUcv/+/Zc+1U=;
	b=BexDoaCg551IUuP7nqmxIWpi/TJfCbKjS/4zwjR1a52DRITWnZmt4GQrt4NAHPUDJ9
	+PAATDXt0XVr64aGMaukEFiVA+9wNgNMzXE8//3AlEAFXsa3faFgYg+R5DIdK5iCGEna
	I11dJWOQnq585TcRXMJ153BO6OljkHV/y1HIlcEJj2tiOx3Z0p7k2ATFV2MdesPAg/H3
	dWsgssD5zJS6IIgAbeE3Au54GbaiNmQxXksU+VkZye6ADdH3+2TlUvVd37VhAGVj4rHY
	jjROVecRxiRh7RAKnn1l2tEYL1CS3LzrI5/ZJraPZ8qKHjinQAJS7iqYqLNmFrXqVYKl
	mj1A==
X-Gm-Message-State: ABUngve1oneBI3uWa7ucRe6DQ7Mb2iJ06DIetwX8pqkADtovxOMt92VTSTFhndGFE0Z+LyUQ2Y6BWDwfiUDEKGTe
X-Received: by 10.55.31.157 with SMTP id n29mr7639204qkh.221.1478541123850;
	Mon, 07 Nov 2016 09:52:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 7 Nov 2016 09:51:43 -0800 (PST)
In-Reply-To: <20161107081541.14964-1-jackie.huang@windriver.com>
References: <20161107081541.14964-1-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Nov 2016 17:51:43 +0000
Message-ID: <CAJTo0LZXAuCirjLnZQVgPVZP909rBVLnYVi4tjHiZ4MJ_U_eaQ@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-core-sdk: Disable sanitizers for mips64el
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
X-List-Received-Date: Mon, 07 Nov 2016 17:52:03 -0000
Content-Type: multipart/alternative; boundary=001a1147f228791e8e0540b9ae16

--001a1147f228791e8e0540b9ae16
Content-Type: text/plain; charset=UTF-8

On 7 November 2016 at 08:15, <jackie.huang@windriver.com> wrote:

> These are not available on mips64el yet, so disable them.
>

This was just superseded by the MIPS arch override, so this won't be
applied.

Ross

--001a1147f228791e8e0540b9ae16
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2016 at 08:15,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jacki=
e.huang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":fu" class=3D"a=
3s aXjCH m1583df2bbd0877f9">These are not available on mips64el yet, so dis=
able them.<br></div></blockquote></div><br>This was just superseded by the =
MIPS arch override, so this won&#39;t be applied.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147f228791e8e0540b9ae16--
