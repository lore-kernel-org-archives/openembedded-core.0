Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id ED5B7600BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 15:47:22 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id d19so979647qtq.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2018 07:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5qD6coDIg+vNtwEfPGfH1jSOwAMFlI+5iV2DtbG6VEM=;
	b=HuVg9O5hwy5V6difoUimw//Je2cp6wPkrXA2sIg64URrEMYgoHH5FuModDdhVbTQdj
	mgkf5boIpJo1Lg/HoYOph6KM5ZIQA4pZQ3q1Fl1vNlE/WsFOKt1dHG47nrp7KDYstvL+
	PZCOZ1F/jH6j54yWEodbz1VLihvdaTmd6zpalj5+tExEpfxMgI1IsdKvI/SW9YPznR3T
	3jFcjQB262q1CemspF55rxOiR0YezrJWjFwDIRBau//YwvXow66RVyYh2MoYx/aAnNCZ
	pMcnjdoJ1eKvOM9opVC4wlNLiamL56EEb6w0OVKqgpLKi9DfsA7Wokw1btO+pGQFGzql
	xHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5qD6coDIg+vNtwEfPGfH1jSOwAMFlI+5iV2DtbG6VEM=;
	b=XLZY4u7w0wSxXYg6eCVhMZXaL880M8d2KO1C8QEvi2jF1fW3AwC+KecAKM7RfpiTXw
	dnd5mWKZz7TF52773D6CO7sa8ZNp/Ks0sissTsiWXU6vEUiWENahQQ0bzrptMB46f1jV
	cDi48vKE7hbYXhIQkk4hbY7Wt4Xp1yTf9A8w+Y4Su1gxz9kGCn+FycDRF+w/jXd0I8lR
	c5jDGcoI44cbz9kIsKoEzmepc1NmPzK1Hpm9WT59u/nmUSIhxnGT618SvqWZN8tEVmnW
	4O4UmUZATR0IS0vQTs4t5FpGYe94UQLWiF9BFNH7fcKUMQUYxy7dW/woHzbo+U38amVL
	ZTTg==
X-Gm-Message-State: AA+aEWaKLzeLqjTGOczIAlDzqcgPVaJ/CVOQkBLgmWPLOwDdaGnwm9IF
	EVpksU/FZnRYcnjRbmZo3T9eUXSLx3Tjp9BurAk=
X-Google-Smtp-Source: AFSGD/XXh8zw9yc5ljOaRWRF2bG0ZyZ9UA55k2VPi8b7w8lHUGaWbriXe48/LVu2nICgMRDu3oRE4H+FKgBOYK7PLoI=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr27118584qvd.224.1544111243552;
	Thu, 06 Dec 2018 07:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20181206003355.18035-1-raj.khem@gmail.com>
	<CAJTo0LaLiMd_JWeKxXS7xmvBLiFk4yavE5qSHWL6mLnu0037Hg@mail.gmail.com>
In-Reply-To: <CAJTo0LaLiMd_JWeKxXS7xmvBLiFk4yavE5qSHWL6mLnu0037Hg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Dec 2018 07:47:12 -0800
Message-ID: <CAMKF1spC-dV_pJ8F2LSfz7u3wGN=qO=gvujr_G0TYO6XRpp_yg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipeutils-test: Add missing LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 06 Dec 2018 15:47:23 -0000
Content-Type: multipart/alternative; boundary="0000000000002a6ec3057c5c6af4"

--0000000000002a6ec3057c5c6af4
Content-Type: text/plain; charset="UTF-8"

Does that serve a better purpose? Or just a different way of achieving same
thing

On Thu, Dec 6, 2018 at 4:09 AM Burton, Ross <ross.burton@intel.com> wrote:

> Might be easier to change the license to CLOSED, as that skips the
> license QA entirely.
>
> (arguably proprietary should do the same)
>
> Ross
>

--0000000000002a6ec3057c5c6af4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Does that serve a better purpose? Or just a differen=
t way of achieving same thing=C2=A0</div></div><div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">On Thu, Dec 6, 2018 at 4:09 AM Burton, Ross &lt;<a=
 href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Might be easier to change the lice=
nse to CLOSED, as that skips the<br>
license QA entirely.<br>
<br>
(arguably proprietary should do the same)<br>
<br>
Ross<br>
</blockquote></div></div>

--0000000000002a6ec3057c5c6af4--
