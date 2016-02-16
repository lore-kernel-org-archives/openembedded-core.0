Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id D299A73178
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 12:24:05 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 9so191289651iom.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 04:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WEdZtEN2ECRnWxdM6uLClbm47Jlod6y+Hz6rZL+IGxg=;
	b=dd6ZuQ9fLGSxYBSyfHr0Xj3KvqYelLafykqZepGx+N6yYjx4eB6lRYZJZKOXf3GPuR
	7GBZ19mle5nxA6ipxVY6WdFdNGNgY72UUtFbq6RsF13WDgDLJrMAk+4e/9LCwQLxQvcW
	qgognFlSc9e6LYdxr9dp48p4iLgh9Gd1akQanWtjQSVgNkdhWr9oNG9mLYvioUlfDLUg
	R88dA4uAc0ekQn+XqNIebX6nlFJnAASC5u3XvCDk9GR+MU2LuV5QSjDJpdH012RdxHaf
	+vlrftcVfEBSfY7+dufwhtPpldNWzLmCbf5vP8GEPE4BkSUTqa4H10pkjl62/TRd2d/Q
	m1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WEdZtEN2ECRnWxdM6uLClbm47Jlod6y+Hz6rZL+IGxg=;
	b=mCafVK3de6kUiXFQLWm6b4e0WRCwCZCG/B7ws0PGO3GYIhWnMMQ6KxUhmW78XvLzoO
	pQqH73GGdPo8WLk4mQkgGpTWV35tZOxL6uca45iAQ7Na0/TsKumxOSQCPrZkbx9Scvr5
	1bVhFS1fYbcHnEWCFYyRMTRmXAZ6/gynVnBWAHo2+ObMc20BvD6k/0OtIrU523oEcouu
	z9BY5SbfD7No5YFSh1CHGeRXHSpO9HiTqrEAqVrT3wDmDf4MjwzPbx5McwDPLYa16Gsg
	Evh9rLxbEalgpLtekW0iTUOrC+uonsMIwaFqKJdJlGd9UwcpNpexcAvJwK07DbR0YXZN
	HIWw==
X-Gm-Message-State: AG10YORKh1DrKM888rJVTezGnD/LMztodS0JCs+wXOT7ZzrqvqP0qteq8eqIaTnE68iXRgwp9QpNL2xIwz3QFUcY
X-Received: by 10.107.3.220 with SMTP id e89mr21144300ioi.99.1455625446397;
	Tue, 16 Feb 2016 04:24:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 16 Feb 2016 04:23:46 -0800 (PST)
In-Reply-To: <1455585219-1874-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1455585219-1874-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Feb 2016 12:23:46 +0000
Message-ID: <CAJTo0LaiKYJ3hnRJgP_abrKTRnWy97vXOkFGPm04b2LkRVw8zA@mail.gmail.com>
To: Li Xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: enable httpd su install init
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
X-List-Received-Date: Tue, 16 Feb 2016 12:24:07 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7ca8b997052be2352d

--001a113f0e7ca8b997052be2352d
Content-Type: text/plain; charset=UTF-8

On 16 February 2016 at 01:13, Li Xin <lixin.fnst@cn.fujitsu.com> wrote:

> If you use busybox to create a small image,init and su are needed.
> So enable it.
>

Apart from this defconfig change doing *far* more than your commit message
says, and enabling HTTPD isn't something that we really need in core, the
login-utilties.cfg config fragment sets CONFIG_SU=yes.

Ross

--001a113f0e7ca8b997052be2352d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 February 2016 at 01:13, Li Xin <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:lixin.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4xi" clas=
s=3D"a3s" style=3D"overflow:hidden">If you use busybox to create a small im=
age,init and su are needed.<br>
So enable it.<br></div></blockquote></div><br>Apart from this defconfig cha=
nge doing *far* more than your commit message says, and enabling HTTPD isn&=
#39;t something that we really need in core, the login-utilties.cfg config =
fragment sets CONFIG_SU=3Dyes.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a113f0e7ca8b997052be2352d--
