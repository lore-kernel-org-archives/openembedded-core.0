Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id DB94877045
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 13:33:12 +0000 (UTC)
Received: by qkdv1 with SMTP id v1so8457852qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 06:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=X2VkEtJQoWgkn2g6CTblYSLLaFj9rkrEcV6Vv4eH++Q=;
	b=GoRdC0WZEFFrNRE0LQzQF6S1VuIrwkuK8T3fLRKF9hOTGP7RtVpjqtevqxD6R3xWhe
	BkSafrQl/x+cIBRER5siLnRybAUZ85/VeOebcyH8jNuPFknXxGmiCYi+9LFVF765GQfY
	Id4F0dBgdAVOXgW5LceZqv6OdgUhXYrMqSOWouMvR5Mj3JoV/F6Etug3mATZmx48MKyo
	2kMLW5Ig0b/AK5aWzm1oJYOn+alORLJ8nT3WFaItn3E+rcRnZi6U5hTvmeewAesE77A7
	QQjsNA6MNSQLJxGE0uNt4xZwjcN8knt2Lvw96r4UQ4d0GIy8Tzb1iipyMyuujal/lFLK
	Tt3w==
X-Gm-Message-State: ALoCoQn6V13yuiHFEXNXRpeNYtK8llt77FTYx45FJfS0/95n0330etnGtYvk6I65WupdWD+OlDtC
X-Received: by 10.55.15.3 with SMTP id z3mr5139755qkg.29.1441373592789; Fri,
	04 Sep 2015 06:33:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 4 Sep 2015 06:32:53 -0700 (PDT)
In-Reply-To: <55E98AC2.7050107@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
	<f5f4a16fdb097b19fb45e9f667f59f99e9f04ef5.1441293149.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LYdE-XZkCASy9n3uuL_HrrFTZKC5a3aA0Mj4FU4kOPnew@mail.gmail.com>
	<CAHiDW_EOBOQEzZbQRa7kyapoNWTod-pNDtZQ90u6e0fVv+=OSg@mail.gmail.com>
	<55E98AC2.7050107@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Sep 2015 14:32:53 +0100
Message-ID: <CAJTo0LbC_DB0gskfx8Rc4iG=SKhLkRB7dtFv1iVZ-y2J0oPeNg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Fri, 04 Sep 2015 13:33:14 -0000
Content-Type: multipart/alternative; boundary=001a11474c60fcf8da051eebf025

--001a11474c60fcf8da051eebf025
Content-Type: text/plain; charset=UTF-8

On 4 September 2015 at 13:12, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> I just did some tests and indeed pcmanfm looks bad when there is no icon
> theme at all, or when there is gnome-icon-theme, but looks ok with adwaita.
> So it needs a soft dependency on that, and gnome-icon-theme can still be
> dropped. If we find any other app that needs icons, then adwaita is the
> provider (which reminds me, I need to put the same dependency into epiphany
> recipe).
>

Excellent, thanks.

Ross

--001a11474c60fcf8da051eebf025
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 September 2015 at 13:12, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":3nc" class=3D"a3s" style=3D"overflow:hidden">I just did s=
ome tests and indeed pcmanfm looks bad when there is no icon theme at all, =
or when there is gnome-icon-theme, but looks ok with adwaita. So it needs a=
 soft dependency on that, and gnome-icon-theme can still be dropped. If we =
find any other app that needs icons, then adwaita is the provider (which re=
minds me, I need to put the same dependency into epiphany recipe).<br></div=
></blockquote></div><br>Excellent, thanks.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11474c60fcf8da051eebf025--
