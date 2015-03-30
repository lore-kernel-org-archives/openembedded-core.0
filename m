Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id D85F673C71
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 10:47:58 +0000 (UTC)
Received: by qgh3 with SMTP id 3so167901627qgh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 03:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Y0R/mTQuz6ZmYP12Noz3vMp2BtN4NN068pho3kfAmIs=;
	b=jmmsIXEuosCgCZJqG42LCAHMST2JwQDuV6bWlp0/xocze/BMzxxyR/b0bzfdwyfz9H
	kEh4k2ArpXoPzEJdzmvkw2NYfctVPyapOri1JJirHgJqZ6Ek+QYBsTLJL7GR7h5PhkFH
	lzir/ijEw/iIgj+x48pvuHIcfqnV4oN5M651xIzdYpr+qiOZS0/fTcCXq5vABLoVJATo
	rDP5xTRMfrt4egHFnK1kqPvKY2CdpZs+vlDMBBKgx4mWGWEzxkhCktmaCvqTc7Uq+Jfa
	SHYax7QsS1f9BIIsaS9QcBOKIuddET2lYT8wjRd754qFXmUvmI7P9uX0JxKDJ++dL8H2
	c1Dg==
X-Gm-Message-State: ALoCoQnLJ3jWsQE8cB9X9lZzq0ryqTQhoMAOS1ozd+OSJ9tJAJV4VKpngt52lOpuHf9hGH4CdFzO
X-Received: by 10.55.18.8 with SMTP id c8mr66035660qkh.25.1427712479335; Mon,
	30 Mar 2015 03:47:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 30 Mar 2015 03:47:39 -0700 (PDT)
In-Reply-To: <1427592440-2658-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150329002843.GE2343@jama>
	<1427592440-2658-1-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Mar 2015 11:47:39 +0100
Message-ID: <CAJTo0LapenBOp41wqa=rBaekDOO3urO5EvoHoiG68eNiC+p12Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fontcache: allow to pass different fontconfig cache dir
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
X-List-Received-Date: Mon, 30 Mar 2015 10:48:00 -0000
Content-Type: multipart/alternative; boundary=001a11475ccc2c285a05127f3745

--001a11475ccc2c285a05127f3745
Content-Type: text/plain; charset=UTF-8

On 29 March 2015 at 02:27, Martin Jansa <martin.jansa@gmail.com> wrote:

> +FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
>

So how is fontconfig told to read fonts from this location?

Ross

--001a11475ccc2c285a05127f3745
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 March 2015 at 02:27, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1xq" class=
=3D"a3s" style=3D"overflow:hidden">+FONTCONFIG_CACHE_DIR ?=3D &quot;${local=
statedir}/cache/fontconfig&quot;<br></div></blockquote></div><br>So how is =
fontconfig told to read fonts from this location?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11475ccc2c285a05127f3745--
