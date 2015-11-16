Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 97A3F6E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:58:15 +0000 (UTC)
Received: by ioc74 with SMTP id 74so163777896ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bQ56Gi6TuiMF2uW4pYGUmP04FGeQ8xkq7XVW4p9u1NY=;
	b=cKvKaCRQ2Fw0Ei4A0SRfBWf6+NzwTXUO56KJqiher8/h0S60jLHsrZjkxWkjYO/+k7
	ayfufczVSl3RRS4C51XsxP5fjZIcS4FbQG621q/5+kk9YhBVjT8bW72MeUHVUqh1d2V6
	ROnRwjeJMTe+/JcbNxbD8WxaQ7jx0YfIOI3z94RW31suty/MB/yYt3UDB0ATMCv6LtoQ
	tUutOE0f5SiCdtphNb/FkKlMX5ti8TwhUR2L8SoEMTjjEa7D0hU7p3lhUVrzUQzFMhTD
	nl+76HoCLpTqMhnEm5lap0JYYKsSdHk9BRDZSnXM/I+S9xqus1rJKFCQ+6WlXyMtKlmi
	wjpw==
X-Received: by 10.107.3.42 with SMTP id 42mr32879952iod.83.1447689495900; Mon,
	16 Nov 2015 07:58:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.93.7 with HTTP; Mon, 16 Nov 2015 07:57:55 -0800 (PST)
In-Reply-To: <CAJTo0LZQgEWa0ZT1uoFmBd7C6aXJzqAeofdwN7TgSCbUUAzpww@mail.gmail.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
	<7dfc5c44d99054fd0f087bd1b4102aef0511029e.1447371033.git.chris_larson@mentor.com>
	<CAJTo0LZbY3d718R8WL4mLuS-hxKiWTgHYBNf51VPwUfbbNSeAw@mail.gmail.com>
	<CABcZANnm-hty1_MznJDsLLGWrSA2T+bpMxVG2mgEegeZJtbahg@mail.gmail.com>
	<CAJTo0LZQgEWa0ZT1uoFmBd7C6aXJzqAeofdwN7TgSCbUUAzpww@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 16 Nov 2015 08:57:55 -0700
Message-ID: <CABcZAN=DNx0UgfmgRq3isNKv4oRBCApxy-w=OYHJkJDuoUfiYA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] systemd: drop unneeded $D check in prerm
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
X-List-Received-Date: Mon, 16 Nov 2015 15:58:19 -0000
Content-Type: multipart/alternative; boundary=001a113ed34425fd040524aa7a23

--001a113ed34425fd040524aa7a23
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 16, 2015 at 8:55 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 16 November 2015 at 15:54, Christopher Larson <kergoth@gmail.com>
> wrote:
>
>> Er, yes, no idea how I missed that when reviewing the diffs. That was
>> meant to stay local. Sorry about that.
>>
>
> Don't bother with a v2 by the way, I dropped that chunk when merging to
> mut.
>

Ah, thanks.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ed34425fd040524aa7a23
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Nov 16, 2015 at 8:55 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On =
16 November 2015 at 15:54, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">E=
r, yes, no idea how I missed that when reviewing the diffs. That was meant =
to stay local. Sorry about that.</div></blockquote><div><br></div></span><d=
iv>Don&#39;t bother with a v2 by the way, I dropped that chunk when merging=
 to mut.</div></blockquote></div><br>Ah, thanks.<br>-- <br><div class=3D"gm=
ail_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br=
>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a113ed34425fd040524aa7a23--
