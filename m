Return-Path: <petr.nechaev@cogentembedded.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id CF62365D40
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 20:10:56 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w7so14502476lbi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 12:10:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=lguE2LoLWPujqHdvLEUXqSfX5XrD8LMRsyw01K1GtOE=;
	b=WeffnHHRLmiQwAfSYUp3ECrWRoulKJG/+JkGUkuPmEpBfH4p7uGjg5tJkzHGRG+vMn
	FvbUzlxUqTeR0P7Q9Uu3MV2QmcCmx+HhqLVvPipDO8GnbMuWS+5EkFy+lPhLWugOWAIW
	5DBZnrjcUBfBnZ4oxxvA1cD1fkhujGsfFdmMO8WHEYdeWSjrD/xXrg9/rMybVpzFsxz7
	cpII11SyeLTX2VIG89w7kzxIiuPga/lUxiEYexPns1gTFVuHGn6pWeRKBWu+kbcITscW
	S4TylpFdcDouNWB4NLseocAHtoXNmfE6IW3WaEgNQKo2P4IZmZQ/9p8hwi6Gt+WnJhRJ
	a98Q==
X-Gm-Message-State: ALoCoQnH3WcPH+XGQRKj8oBgAf4U1NY29mkpR9LGdwCO7hfXC0Svso9gm/OC8LBj8L+KnD6964NF
MIME-Version: 1.0
X-Received: by 10.112.171.199 with SMTP id aw7mr11312405lbc.40.1417723855824; 
	Thu, 04 Dec 2014 12:10:55 -0800 (PST)
Received: by 10.25.23.86 with HTTP; Thu, 4 Dec 2014 12:10:55 -0800 (PST)
Date: Thu, 4 Dec 2014 23:10:55 +0300
Message-ID: <CAHPquwMXb8mT+UA5b2ahdTCmXDohTHGcRWF33Br5+tpdHcR6gA@mail.gmail.com>
From: Petr Nechaev <petr.nechaev@cogentembedded.com>
To: openembedded-core@lists.openembedded.org
Subject: Rootfs over 4GB
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
X-List-Received-Date: Thu, 04 Dec 2014 20:11:01 -0000
Content-Type: multipart/alternative; boundary=001a11c36c68d0fe0a0509698e6b

--001a11c36c68d0fe0a0509698e6b
Content-Type: text/plain; charset=UTF-8

Hi All,

 I'm using oe-core for building images and have a problem. Rootfs.img is
over 5GB and cannot be copied to FAT32 partition because of file size
limit. This happens during do_bootimg task for core-image-sato-sdk. No
warning is given by bitbake.
 The problem occurs in build_fat_img() function in bootimg.bbclass.

 I have temporarily fixed the problem in my build by extending
bootimg.bbclass. I added new function which first splits *.hddimg into two
partitions: FAT + ext3 and then puts rootfs.img to ext3 partition.

 But, what is the right way of building core-image-sato-sdk with large
rootfs? And what is the technical reason behind putting rootfs.img into a
FAT partition?

---
Petr

--001a11c36c68d0fe0a0509698e6b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"font-size:13px">Hi All=
,</div><div style=3D"font-size:13px"><br></div><div style=3D"font-size:13px=
">=C2=A0I&#39;m using oe-core for building images and have a problem. Rootf=
s.img is over 5GB and cannot be copied to FAT32 partition because of file s=
ize limit. This happens during do_bootimg task for core-image-sato-sdk. No =
warning is given by bitbake.</div><div style=3D"font-size:13px">=C2=A0The p=
roblem occurs in build_fat_img() function in bootimg.bbclass.=C2=A0<br></di=
v><div style=3D"font-size:13px"><br></div><div style=3D"font-size:13px">=C2=
=A0I have temporarily fixed the problem in my build by extending bootimg.bb=
class. I added new function which first splits *.hddimg into two partitions=
: FAT + ext3 and then puts rootfs.img to ext3 partition.=C2=A0</div><div st=
yle=3D"font-size:13px"><br></div><div style=3D"font-size:13px">=C2=A0But, w=
hat is the right way of building core-image-sato-sdk with large rootfs? And=
 what is the technical reason behind putting rootfs.img into a FAT partitio=
n?</div><div style=3D"font-size:13px"><br></div><div style=3D"font-size:13p=
x">---<br></div><div style=3D"font-size:13px"><div dir=3D"ltr">Petr</div></=
div></div></div>
</div>

--001a11c36c68d0fe0a0509698e6b--
