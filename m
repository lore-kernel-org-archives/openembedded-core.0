Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id B46E9607AB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 09:51:27 +0000 (UTC)
Received: by igcmv3 with SMTP id mv3so114024989igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 01:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=s7Fl12TRQXJwF/lBcZuh4k8TokggTxfU+gYHA0/dM84=;
	b=nWFzeC9Z0ExJJxqSqNr0sIqp5cfOdkmmY0S2OYhuLM+NcUDmZ0wKC1nHWDB5SzMGDF
	ucIzOJqnZtgVxUuxIQaEMJDvrRdiVQkrOIOHZ7P5DHTjVsGibOpQlnKlqQINKLupdl5M
	4qyoPEqkEwOvlWzaXLE0zeC/iVpzAHeSaD/ha3WIHADaAaqkgBM0vuiccxdDN6JRMvAX
	4zkFYHJb7GwN1eZTjE9tbU0lSh9ihFXfSr3Dr4US3LLswiSE0W8/rJavGvnTCCPGcr5P
	2b44TKk1fgm34jS9N25fEnayvfU+D2+gsOg1tnQuPWjk4/ZvI9/CqxdOpLlpoyry017u
	3XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=s7Fl12TRQXJwF/lBcZuh4k8TokggTxfU+gYHA0/dM84=;
	b=ODLwAERHWEgg9I/02EkOgLDJJ9LLM4A2xu9I8aBsMxvqOJewBBCciBatiRA5t8fooV
	j15GcbCIxSEvANGK+2Btpe4Q6B5iO+5qYCk/rtxJqOVVm1An3k9bzT4A5nocYC6nup5s
	/hxrVdRh6DGp+7jGbhAlIIG/wwo1ro803ttF37FbMBSL/vVm2PG4sQ5qwmQYPzu30ZSN
	YgDwstbnO7/kMnsx/gG7mJsAcL9xrcV1CxW/GUoyMgkim2NfyyP0Rrdqp9GJ2d1LDH9S
	NafatVme9BrvJ6E2ZRd7Q8O16dRLr0K1769r3q7j0ZgioVHd9y7O8KbBLWAv6hwr2szg
	+4uA==
X-Gm-Message-State: ALoCoQk8Gfpz9Zw94/sUPZEaqoU+HuZHFcLJV74/OurHig6rQlQWt6vb3E064sgBKfO4nm3Tgo6/
X-Received: by 10.50.60.2 with SMTP id d2mr7631629igr.52.1449049888122; Wed,
	02 Dec 2015 01:51:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 2 Dec 2015 01:51:08 -0800 (PST)
In-Reply-To: <2CF57A644018A745B8FE029C7223E16E12EC04D0@SHSMSX104.ccr.corp.intel.com>
References: <1448618616-30204-1-git-send-email-wu.zheng@intel.com>
	<CAJTo0LYJCYcDtG1AR3WL-kd8T0=E2nWnhMyucGoZxt-r3JX_0w@mail.gmail.com>
	<2CF57A644018A745B8FE029C7223E16E12EC04D0@SHSMSX104.ccr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 09:51:08 +0000
Message-ID: <CAJTo0LbW_n3EBFtSo=CXqUcpg3Mg6FtU_kxBe3hocoREo0f9yw@mail.gmail.com>
To: "Zheng, Wu" <wu.zheng@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: FW: [PATCH] bluez5:upgrade bluez5 to 5.36
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
X-List-Received-Date: Wed, 02 Dec 2015 09:51:30 -0000
Content-Type: multipart/alternative; boundary=047d7b15b117d802270525e7378b

--047d7b15b117d802270525e7378b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2 December 2015 at 09:50, Zheng, Wu <wu.zheng@intel.com> wrote:

> I mean that can you help provide more log info for it?
>
> We can get the log of bluez by =E2=80=9Cbluetoothd -dn=E2=80=9D. Thanks.
>

Not right not, I don't have any qemu images to hand and the builds on the
AB would have been removed by now.

Ross

--047d7b15b117d802270525e7378b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 09:50, Zheng, Wu <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:wu.zheng@intel.com" target=3D"_blank">wu.zheng@intel.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":5m2" class=3D"a3s" st=
yle=3D"overflow:hidden">I mean that can you help provide more log info for =
it?<br>
<br>
We can get the log of bluez by =E2=80=9Cbluetoothd -dn=E2=80=9D. Thanks.</d=
iv></blockquote></div><br>Not right not, I don&#39;t have any qemu images t=
o hand and the builds on the AB would have been removed by now.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b15b117d802270525e7378b--
