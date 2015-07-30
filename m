Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0DFED762CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:09:48 +0000 (UTC)
Received: by qged69 with SMTP id d69so23364215qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 06:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4sygy4dc7zfooFJy48v10yskkgNvhRBfLSjhi44dNaM=;
	b=CHnaeiT8IaUYeIU06JvvC8L1zeUr3H2WPJJd9IsYOCdakff9Hc742/1X9ZRTTtF5bK
	sOazrOoGi7GrRMCNdkOBJQopVCp2Xa6sX9s0GduWFNjdNoTMJ9WvSCt7eZYxit+9LGXy
	fJ9rg/45X5hQONxEzT/+XPaLV8hc/8K/YfZu6lHKMYhQvgwuDMDtEHbw2oc0jEb9LfSc
	SKzEl1sNvSkpBvWpztdK0wJJ9yjsxnN+xpvJtE9Txy9vKNmfXqrok0M3m2YP3x7+noTz
	944xdDywwCjOA2Oz/Zoaw7z5Xf2PV+cD5Mt6AfXapn7LDpwu6DL6n9Pr2e4aPtbo9Q4l
	7Dnw==
X-Gm-Message-State: ALoCoQlQG/shkJ0t7yygVSa6/3pSAC54y/Y4mSz1VAsP742xKUYPsRcxrLuDQ51n90tgh441PSkr
X-Received: by 10.140.88.80 with SMTP id s74mr69210790qgd.59.1438261788295;
	Thu, 30 Jul 2015 06:09:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Thu, 30 Jul 2015 06:09:28 -0700 (PDT)
In-Reply-To: <1438239038-1664-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <CAJTo0LZV=hEGUzn1_Z1XY9mXVhwbGUyg7=6fF1Lg2bME+HkyKA@mail.gmail.com>
	<1438239038-1664-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 14:09:28 +0100
Message-ID: <CAJTo0LaMhpAjhDfWZLieDE7UN+qVC47yOaTQVpTDcZ6fRiRifA@mail.gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] mdadm: 3.3.2 -> 3.3.3
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
X-List-Received-Date: Thu, 30 Jul 2015 13:09:54 -0000
Content-Type: multipart/alternative; boundary=001a11c114c4fc6113051c176a7c

--001a11c114c4fc6113051c176a7c
Content-Type: text/plain; charset=UTF-8

On 30 July 2015 at 07:50, Li xin <lixin.fnst@cn.fujitsu.com> wrote:

> 3) Add systemd support:
> add systemd service file mdmonitor.service and install conf example file.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-extended/mdadm/files/inline.patch     | 39
> ----------------------
>  .../mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch   | 26 +++++++++------
>  .../mdadm/{mdadm_3.3.2.bb => mdadm_3.3.3.bb}       | 28 ++++++++++++----


The patch doesn't include mdadm.service.

Ross

--001a11c114c4fc6113051c176a7c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 July 2015 at 07:50, Li xin <span dir=3D"ltr">&lt;<a href=3D"mailto:li=
xin.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">3) Add s=
ystemd support:<br>
</span>add systemd service file mdmonitor.service and install conf example =
file.<br>
<span class=3D""><br>
Signed-off-by: Li Xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com">lixi=
n.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/<span class=3D"il">mdadm</span>/files/inline.pa=
tch=C2=A0 =C2=A0 =C2=A0| 39 ----------------------<br>
=C2=A0.../<span class=3D"il">mdadm</span>/files/<span class=3D"il">mdadm</s=
pan>-3.3.2_x32_abi_time_t.patch=C2=A0 =C2=A0| 26 +++++++++------<br>
</span>=C2=A0.../<span class=3D"il">mdadm</span>/{<a href=3D"http://mdadm_3=
.3.2.bb" rel=3D"noreferrer" target=3D"_blank">mdadm_3.3.2.bb</a> =3D&gt; <a=
 href=3D"http://mdadm_3.3.3.bb" rel=3D"noreferrer" target=3D"_blank">mdadm_=
3.3.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 28 ++++++++++++----</blockquote><=
/div><br>The patch doesn&#39;t include mdadm.service.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c114c4fc6113051c176a7c--
