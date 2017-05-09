Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id E364F605FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 13:19:01 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id m91so112141qte.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 06:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c4Vzu4/nI+gc9LlkbisBHUMj/zX6uJ2nx8CCC0AM8VQ=;
	b=Sb1B9j2aml0SxnVqr8woylIK4VyWNf5lr8legzqTY/9jmdRsHm9WWJpSucBPuBW2cT
	+1hbMGxllzC1AP5+Ci9LarmZ+I2LnjZWILCoLk0rgBecc6GhQuCpB/diTfAtPYe7CTtj
	jwnCOegCm7kBdQyUT3SGJUdYZL6/be4T98V2F6HA+18A0GxnNe2v5+ZVhQb65iI57z0D
	M3yrel2+loZNgo/mtFo23gzFXJIEOguHJhrUyJjBLqRhJmtudqJex8Ly5AjnFUGf4VtD
	ZYiO3cIF7YnvUGWRAts8OJzkafh8U0L63bngWU37FecHtQel2JWmQx5SfDhX1p8XA/Dv
	0FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c4Vzu4/nI+gc9LlkbisBHUMj/zX6uJ2nx8CCC0AM8VQ=;
	b=Ws+W4A3DcNaEzXkCVlV2CUGH80EP3MwPrK0qBrT8jWqUghp/I42iBQIwytya8VkEOI
	t2UfZLowFIdeW4OmTUBDPRS1TqosdDQZ2+5PGQ4zh7sd/a9cwj/9rnSDhJSF8a0r7gRi
	iLRFRmhW3CRxc3sqEvMITNOaJEKlyHFp2sMzuzkHpboUDc/8k1AoOfG2Q0EHX4c3OSQZ
	Z7RSzqzb21W5a2jxkn9O4rya9Ty5XGj3AV5bxMiotl8Sc2WwUSzUI47gegqihRE1/lVG
	bXB+8d1INeEIXG/tM1FqPG7Q+VWGHSAAnzEkAuHOq+mKVHpbgsOBx5FodhDho2KFsN8q
	k6eA==
X-Gm-Message-State: AODbwcASFwaNDLc92BoCh/A09yFed1WnApneDXsx0VVPk3qvhIGTBxM1
	XE4wKIZqwbKJnik4dB02mPNKkAHcd6h2
X-Received: by 10.200.42.238 with SMTP id c43mr32492qta.144.1494335942586;
	Tue, 09 May 2017 06:19:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Tue, 9 May 2017 06:18:42 -0700 (PDT)
In-Reply-To: <1494236357-904-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1494236357-904-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 May 2017 14:18:42 +0100
Message-ID: <CAJTo0LawDD1aJZG7ymjBQ0S8fxBMaQPUVwP7hQMCK4o9=+nokA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libnl: 3.2.29 -> 3.3.0
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
X-List-Received-Date: Tue, 09 May 2017 13:19:03 -0000
Content-Type: multipart/alternative; boundary=001a113f40e4088eb7054f1733f1

--001a113f40e4088eb7054f1733f1
Content-Type: text/plain; charset=UTF-8

On 8 May 2017 at 10:39, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
>
> 1) Upgrade libnl from 3.2.29 to 3.3.0.
> 2) Delete patch "fix-pktloc_syntax_h-race.patch", since it is integrated
upstream.


Breaks under musl:

In file included from ../libnl-3.3.0/include/linux-private/linux/ipv6.h:5:0,
                 from ../libnl-3.3.0/include/netlink-private/netlink.h:54,
                 from ../libnl-3.3.0/lib/nl.c:28:
../libnl-3.3.0/include/linux-private/linux/in6.h:32:8: error: redefinition
of 'struct in6_addr'
 struct in6_addr {
        ^~~~~~~~

In file included from
TOPDIR/tmp/work/i586-poky-linux-musl/libnl/1_3.3.0-r0/recipe-sysroot/usr/include/arpa/inet.h:9:0,
                 from ../libnl-3.3.0/include/netlink-private/netlink.h:32,
                 from ../libnl-3.3.0/lib/nl.c:28:
TOPDIR/tmp/work/i586-poky-linux-musl/libnl/1_3.3.0-r0/recipe-sysroot/usr/include/netinet/in.h:23:8:
note: originally defined here
 struct in6_addr {
        ^~~~~~~~

Ross

--001a113f40e4088eb7054f1733f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"></div><br>On 8 May 2017 at 10:3=
9, Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com">huangqy.fn=
st@cn.fujitsu.com</a>&gt; wrote:<br>&gt;<br>&gt; 1) Upgrade libnl from 3.2.=
29 to 3.3.0.<br>&gt; 2) Delete patch &quot;fix-pktloc_syntax_h-race.patch&q=
uot;, since it is integrated upstream.<br><br><br>Breaks under musl:<br><br=
>In file included from ../libnl-3.3.0/include/linux-private/linux/ipv6.h:5:=
0,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ..=
/libnl-3.3.0/include/netlink-private/netlink.h:54,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../libnl-3.3.0/lib/nl.c:28:<b=
r>../libnl-3.3.0/include/linux-private/linux/in6.h:32:8: error: redefinitio=
n of &#39;struct in6_addr&#39;<br>=C2=A0struct in6_addr {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ^~~~~~~~<br><br>In file included from TOPDIR/tmp/work/i586-po=
ky-linux-musl/libnl/1_3.3.0-r0/recipe-sysroot/usr/include/arpa/inet.h:9:0,<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../li=
bnl-3.3.0/include/netlink-private/netlink.h:32,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../libnl-3.3.0/lib/nl.c:28:<br>T=
OPDIR/tmp/work/i586-poky-linux-musl/libnl/1_3.3.0-r0/recipe-sysroot/usr/inc=
lude/netinet/in.h:23:8: note: originally defined here<br>=C2=A0struct in6_a=
ddr {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~<br><div><br></div><div>Ross</=
div></div>

--001a113f40e4088eb7054f1733f1--
