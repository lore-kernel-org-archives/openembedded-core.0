Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 265ED60169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 12:23:51 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id i17so10980900qcy.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 04:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Om3hT84R4EnE3ivy/AXnxqj2RpRIS2tpk7PmQ4g83YM=;
	b=KXfiF9EvCUlXt2fP+pXNu61gpyD03tio7ncUBb3e5HHI0pELicOLg+EQQ55TrdFaLS
	/icN6bk5gPVqu9k2oN2o18LfZEzkfhOCcym4CRj9nmKe6NUllSE0iHYBonmIm9Mdz+lI
	TSf7xCg/dqsY9hXEuq7Iv4lwbVlaNuHjnhBDEsI1a4Lduu6uG+0qe+8r5lHPSW1j05jl
	VKoVu2MNlfApxfSiMPKruaYNYJqJjsJL/4iiddnREXKxE0YKPOUeiqlLHRzAvG8AnYaV
	UwjY+2bMItLlmc/r0Peieoc73mAyn3NzmIXBL96IMKCyutxDZKOXSbzz2PABtU6Nnr+D
	cqIA==
X-Gm-Message-State: ALoCoQlv1e1BmjfJGoFFbcyuQFKCU4DY8dBTRmDuen4FUTcd3TyEn9xPepqO6u4AdN44TowTfGF3
X-Received: by 10.229.176.198 with SMTP id bf6mr7616243qcb.12.1417609432388;
	Wed, 03 Dec 2014 04:23:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 3 Dec 2014 04:23:32 -0800 (PST)
In-Reply-To: <2d5ed9ff99319e5eb332b5008b39ee8d6e381dd1.1417499998.git.Qi.Chen@windriver.com>
References: <cover.1417499998.git.Qi.Chen@windriver.com>
	<2d5ed9ff99319e5eb332b5008b39ee8d6e381dd1.1417499998.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 12:23:32 +0000
Message-ID: <CAJTo0LbG0hoAN5HnWMjU8n+7AWEoHN3j6fATHsMaXMwBaGNOTg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bind: fix conf.patch to remove configuration that causes failure
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
X-List-Received-Date: Wed, 03 Dec 2014 12:23:54 -0000
Content-Type: multipart/alternative; boundary=001a11c3057ea5f3fc05094eeac1

--001a11c3057ea5f3fc05094eeac1
Content-Type: text/plain; charset=UTF-8

On 2 December 2014 at 06:00, Chen Qi <Qi.Chen@windriver.com> wrote:

> conf.patch added db.255 confgiuration entry to named.conf. However,
> We don't have db.255 configuration file, so remove this entry to avoid
> the following failure.
>

Can you explain why the correct fix is to remove the reference to db.255,
and not add a db.255 configuration file?

Ross

--001a11c3057ea5f3fc05094eeac1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2014 at 06:00, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6nu" class=3D"a3s=
" style=3D"overflow:hidden">conf.patch added db.255 confgiuration entry to =
named.conf. However,<br>
We don&#39;t have db.255 configuration file, so remove this entry to avoid<=
br>
the following failure.<br></div></blockquote></div><br>Can you explain why =
the correct fix is to remove the reference to db.255, and not add a db.255 =
configuration file?</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a11c3057ea5f3fc05094eeac1--
