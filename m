Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id AFF7C6B59C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 16:29:56 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id c41so7764418yho.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=A8kWvNiA6Ihy6Eg8If6L9wHMbk1ZDqRqQsnNpAE7LG4=;
	b=l+ECjdwV+lVrIMLkpnzo7KEq4HubOq09a4n/mvboReUNHESBiRGbF/3w1vYkRD+dEY
	M6hVVsRuZKP4EkV9eWO60B4oXfR1TBXKqpca+6eHT/gxm8pe4T41e/lfe5mq2ex9Qvcc
	GRg8WdIgqnwe2BoinGG+dFuX2PRNv5MxAZ1B65XaJyaGZ5NWr79qMvTIygow2MLojVmd
	r7UMiEZGDuzQ5RAO5VWpbgq4d8tv7SUXW8YlJILaj4O5NMpkT6cZM3W2HuJp/GMNqwkM
	GYyA8aFavm6OIkhk2fEgGVo6kwBRLmhsdVb/5MsrXX+QzNiJCur9Rat/FN5ZlaOP2G1N
	s9xA==
MIME-Version: 1.0
X-Received: by 10.236.41.165 with SMTP id h25mr3522961yhb.126.1396283396844;
	Mon, 31 Mar 2014 09:29:56 -0700 (PDT)
Received: by 10.170.140.138 with HTTP; Mon, 31 Mar 2014 09:29:56 -0700 (PDT)
In-Reply-To: <1396276792.11878.24.camel@empanada>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<CAP9ODKoAeOS46F4LqnaMGfJ_5QJKo=vnnRLOgHU0sRC4imRz3Q@mail.gmail.com>
	<CANFVK7_uz3pr=WTdjqg8eXnfQzCSPnvaQq+kymud=YTj-8AV9g@mail.gmail.com>
	<CAP9ODKqVPgoyH_XveWsJugSyHfBd0q0cccKWD2wkTMg7dKJd-Q@mail.gmail.com>
	<5338CA5F.2080104@gmail.com> <1396276792.11878.24.camel@empanada>
Date: Mon, 31 Mar 2014 13:29:56 -0300
Message-ID: <CANFVK78UNgCNtazXmFC=sUhtL9up1rjHgMJi1GyBx5YKNVF6Pg@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Mon, 31 Mar 2014 16:30:00 -0000
Content-Type: multipart/alternative; boundary=089e013a0116dfefc704f5e98f39

--089e013a0116dfefc704f5e98f39
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 31, 2014 at 11:39 AM, Tom Zanussi
<tom.zanussi@linux.intel.com>wrote:

>
> But I think you could accomplish the same thing by just allowing the
> indirect string e.g. rootfs2 to resolve to either a full path, or as an
> image name, which would be treated as an instance of '-e image-name' for
> that partition.
>
> For example, we have the unmodified parttion in the .wks file as usual:
>
>   part /standby --source rootfs --rootfs-dir=3Drootfs2 --ondisk sda
> --fstype=3Dext3 --label secondary --align 1024
>
> Which could be resolved as either a full path to the rootfs dir:
>
>   wic create directdisk-multi-indirect-both --rootfs-dir
> rootfs2=3D/home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/c=
ore-image-minimal
>
> Or extracted from the '-e' ROOTFS_DIR output from the 'core-image-minimal=
'
> image:
>
>   wic create directdisk-multi-indirect-both --rootfs-dir
> rootfs2=3Dcore-image-minimal
>
> Does that make sense for this?
>
>

Yes. I think that is the point.


--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

--089e013a0116dfefc704f5e98f39
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra">Hi,<br></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Mar 31, 2014 at 11:39 A=
M, Tom Zanussi <span dir=3D"ltr">&lt;<a href=3D"mailto:tom.zanussi@linux.in=
tel.com" target=3D"_blank">tom.zanussi@linux.intel.com</a>&gt;</span> wrote=
:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
But I think you could accomplish the same thing by just allowing the<br>
indirect string e.g. rootfs2 to resolve to either a full path, or as an<br>
image name, which would be treated as an instance of &#39;-e image-name&#39=
; for<br>
that partition.<br>
<br>
For example, we have the unmodified parttion in the .wks file as usual:<br>
<br>
=C2=A0 part /standby --source rootfs --rootfs-dir=3Drootfs2 --ondisk sda --=
fstype=3Dext3 --label secondary --align 1024<br>
<br>
Which could be resolved as either a full path to the rootfs dir:<br>
<br>
=C2=A0 wic create directdisk-multi-indirect-both --rootfs-dir rootfs2=3D/ho=
me/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minim=
al<br>
<br>
Or extracted from the &#39;-e&#39; ROOTFS_DIR output from the &#39;core-ima=
ge-minimal&#39; image:<br>
<br>
=C2=A0 wic create directdisk-multi-indirect-both --rootfs-dir rootfs2=3Dcor=
e-image-minimal<br>
<br>
Does that make sense for this?<br>
<br></blockquote><div><br><br></div><div>Yes. I think that is the point. <b=
r></div><div>=C2=A0<br></div></div><br>-- <br><div dir=3D"ltr">Jo=C3=A3o He=
nrique Ferreira de Freitas - <a href=3D"http://joaohf_at_gmail.com" target=
=3D"_blank">joaohf_at_gmail.com</a><br>
Campinas-SP-Brasil</div>
</div></div>

--089e013a0116dfefc704f5e98f39--
