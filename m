Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id C3246731FE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:08:56 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id z14so72077081igp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6tgNOoDE/J1Fxpm7fZyDZiJyBv4qWIAcre+52KP7070=;
	b=ckbFgemtwUgLqDpvY3uFWhDmSOM4EZjtvRtoBFgCDycRs59AVXbOw7eUiDqXqODQas
	F0Er/dOBfx7MNysYkTbdikRh3QOQ30lquWsVIMFOyfpIe+K/Kj4sbSTfgwUFFmAyhRLo
	OtqPUbLJyCwPpQEEZ64lOKOKaoXTrHWNG9x7lAluIGbMR/7mceHhcp9mB9fDJWx+eMi+
	IUeWVORYXRaGsCRRnWVaz+eoPLM9Pd5zfIVVjAwWIGNhPpGd+tTvSM/mTfvnXknRkDjZ
	Zr9njhQzE0jLCHRNJMOYxDlNsOGh33UIlAbpDmuk6Hd0eW8zcdsVPkvod8KetdeqNv2q
	K0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6tgNOoDE/J1Fxpm7fZyDZiJyBv4qWIAcre+52KP7070=;
	b=lmuR9LBoNLW1GNbl6eKZOaV1Kzg3uUdPT5TNs2Rrp573mHRWBZfmvwMcrlue5lBpCd
	pCmbFEO4qdWpX52801QPF1impuLjEOpH2zJKFImwWUI8x/TMuIpZ3DyM9JDINE2nYusu
	0RPp9zzNfPIujWF5+p/krM3xKhOBWA5pIqn+Otn51kTViloAZ7IGRt/ZIhYPsOUzJQID
	hkvjipqhxA9kiz3OkBUif+uwUe4s+ylBXIi/rT8eBgaPfgwXV/60hAxucDVC+faX3Y8C
	fqJeN9eI1giU98IjDOgtoGvH/3AV7U2sftWdvDibdsKfaJq6k+4itk4N0c0Pq7kDl9D8
	YrAA==
X-Gm-Message-State: ALoCoQlqEpFVnNQTklYF0sYWCyq7cXcpvrdlitvXTEj2qE67JH3ygoWy1NlqPstQmIxSaQPh6ES+qE8A1VXNGXzbbB5wInEy8Kjc6GhcOUVFr76I5skolq0=
X-Received: by 10.50.43.133 with SMTP id w5mr15628924igl.52.1452247737249;
	Fri, 08 Jan 2016 02:08:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 02:08:37 -0800 (PST)
In-Reply-To: <ee95a08b80d625c652318c77b351495cc9077a15.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<ee95a08b80d625c652318c77b351495cc9077a15.1450568936.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 10:08:37 +0000
Message-ID: <CAJTo0LYqycLpdqna-6ivGgYHENmnw73sT97yknxo+T9g+oFxeg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/17] connman: include config.h for HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
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
X-List-Received-Date: Fri, 08 Jan 2016 10:08:57 -0000
Content-Type: multipart/alternative; boundary=089e01175f2b8153d80528cfc66a

--089e01175f2b8153d80528cfc66a
Content-Type: text/plain; charset=UTF-8

On 19 December 2015 at 23:52, Khem Raj <raj.khem@gmail.com> wrote:

> We now check at configure time of libc has pktinfo struct
>

| In file included from
/data/poky-master/tmp/sysroots/intel-corei7-64/usr/include/linux/if_tun.h:20:0,
|                  from
/data/poky-master/tmp/work/corei7-64-poky-linux-musl/connman/1.30-r0/connman-1.30/src/inet.c:46:
|
/data/poky-master/tmp/sysroots/intel-corei7-64/usr/include/linux/if_ether.h:137:8:
error: redefinition of 'struct ethhdr'
|  struct ethhdr {
|         ^
| In file included from
/data/poky-master/tmp/sysroots/intel-corei7-64/usr/include/net/ethernet.h:10:0,
|                  from
/data/poky-master/tmp/work/corei7-64-poky-linux-musl/connman/1.30-r0/connman-1.30/src/inet.c:41:
|
/data/poky-master/tmp/sysroots/intel-corei7-64/usr/include/netinet/if_ether.h:96:8:
note: originally defined here
|  struct ethhdr {
|         ^

connman still fails to build with musl for me.

Ross

--089e01175f2b8153d80528cfc66a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2015 at 23:52, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D":5hf" class=3D"" style=3D"overflow:h=
idden">We now check at configure time of libc has pktinfo struct<br></div><=
/blockquote></div><br><div class=3D"gmail_extra"><div class=3D"gmail_extra"=
>| In file included from /data/poky-master/tmp/sysroots/intel-corei7-64/usr=
/include/linux/if_tun.h:20:0,<br></div><div class=3D"gmail_extra">| =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /data/poky-mast=
er/tmp/work/corei7-64-poky-linux-musl/connman/1.30-r0/connman-1.30/src/inet=
.c:46:</div><div class=3D"gmail_extra">| /data/poky-master/tmp/sysroots/int=
el-corei7-64/usr/include/linux/if_ether.h:137:8: error: redefinition of &#3=
9;struct ethhdr&#39;</div><div class=3D"gmail_extra">| =C2=A0struct ethhdr =
{</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div=
 class=3D"gmail_extra">| In file included from /data/poky-master/tmp/sysroo=
ts/intel-corei7-64/usr/include/net/ethernet.h:10:0,</div><div class=3D"gmai=
l_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fr=
om /data/poky-master/tmp/work/corei7-64-poky-linux-musl/connman/1.30-r0/con=
nman-1.30/src/inet.c:41:</div><div class=3D"gmail_extra">| /data/poky-maste=
r/tmp/sysroots/intel-corei7-64/usr/include/netinet/if_ether.h:96:8: note: o=
riginally defined here</div><div class=3D"gmail_extra">| =C2=A0struct ethhd=
r {</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">connman still=
 fails to build with musl for me. =C2=A0</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div></div></div>

--089e01175f2b8153d80528cfc66a--
