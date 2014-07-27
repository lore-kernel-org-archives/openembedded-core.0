Return-Path: <atul.singh008@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 308BC65E1A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jul 2014 12:04:46 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id h3so2535974igd.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jul 2014 05:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wxWCcQJuuTvb3eQzk0/nZZeAXh2d/8+bFaJ9a6WBbtw=;
	b=g+CqyG/USQnnaea7K1eTuQgDs6mdgiz7eEcQehCp7N5AvSvumEW9jMAPcn0/DMe4H0
	/udP3WOiCcf2sRL1AYK5dEvefBaXctdzvIYcS5oh61XVFVoNKhkAYkrOVEI/fkPOjie9
	Eqtq1Mgnr9DAR+bl7FUZqTCaAEFMScxIRe99NwtZCvEVkc7D2wxaZjZNQ4Ql8liISRgr
	5/nFkI6f4wiELtGg2ybAmaPpleObMvLoBs0FeGwVkc8xJb66KSa4kbvNgUdZTbXvjmh7
	ZOxBEj8J84LfVOgCsnKDYsK2Bm6EfI3hzJtbEYZQcEac2E/w6UuatnlhkhBv5N4zOmNP
	lQPg==
MIME-Version: 1.0
X-Received: by 10.50.80.116 with SMTP id q20mr22565772igx.22.1406462687615;
	Sun, 27 Jul 2014 05:04:47 -0700 (PDT)
Received: by 10.64.86.225 with HTTP; Sun, 27 Jul 2014 05:04:47 -0700 (PDT)
Received: by 10.64.86.225 with HTTP; Sun, 27 Jul 2014 05:04:47 -0700 (PDT)
In-Reply-To: <mailman.1097.1406462291.1406.openembedded-core@lists.openembedded.org>
References: <mailman.1097.1406462291.1406.openembedded-core@lists.openembedded.org>
Date: Sun, 27 Jul 2014 17:34:47 +0530
Message-ID: <CAH21_vFKch78Ez+jxcdDCSYHAY_kHcLYXjcz6XjO9fnUW=tq7A@mail.gmail.com>
From: atulkumar singh <atul.singh008@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Aarch64 support needed
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
X-List-Received-Date: Sun, 27 Jul 2014 12:04:48 -0000
Content-Type: multipart/alternative; boundary=089e01536682e2a32704ff2b9c20

--089e01536682e2a32704ff2b9c20
Content-Type: text/plain; charset=UTF-8

Hi All,

Is there support for Aarch64(64 bit ARMv8) available right now?
If so then what i need to mention as a MACHINE in local.conf.
Also please note that i tried adding meta-linaro layer which has
meta-aarch64 into it.
But it has lot more dependency like it ask for linaro,  linaro-toolchain,
networking(meta-opembedded) layers.
So accordingly i added all this into my source directory also i updated the
bblayer.conf file regarding the same.
But still it's not supporting the same has dependency issues.
My bblayer.conf looks something like below:-
BBLAYERS ?= " \
   /home/atulk/yocto/poky-master/meta \
   /home/atulk/yocto/poky-master/meta-yocto \
  /home/atulk/yocto/poky-master/meta-yocto-bsp \
  /home/atulk/yocto/poky-master/meta-aarch64 \
  /home/atulk/yocto/poky-master/meta-linaro \
  /home/atulk/yocto/poky-master/meta-linaro-toolchain \
  /home/atulk/yocto/poky-master/meta-openembedded/meta-networking \
/home/atulk/yocto/poky-master/meta-openembedded/meta-oe \
"

Please let me know with your valuable suggestions.

Thanks and regards,
Atul

--089e01536682e2a32704ff2b9c20
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p><br>
Hi All,</p>
<p>Is there support for Aarch64(64 bit ARMv8) available right now?<br>
If so then what i need to mention as a MACHINE in local.conf.<br>
Also please note that i tried adding meta-linaro layer which has meta-aarch=
64 into it.<br>
But it has lot more dependency like it ask for linaro,=C2=A0 linaro-toolcha=
in, networking(meta-opembedded) layers.<br>
So accordingly i added all this into my source directory also i updated the=
 bblayer.conf file regarding the same.<br>
But still it&#39;s not supporting the same has dependency issues.<br>
My bblayer.conf looks something like below:-<br>
BBLAYERS ?=3D &quot; \<br>
=C2=A0=C2=A0 /home/atulk/yocto/poky-master/meta \<br>
=C2=A0=C2=A0 /home/atulk/yocto/poky-master/meta-yocto \<br>
=C2=A0 /home/atulk/yocto/poky-master/meta-yocto-bsp \<br>
=C2=A0 /home/atulk/yocto/poky-master/meta-aarch64 \<br>
=C2=A0 /home/atulk/yocto/poky-master/meta-linaro \<br>
=C2=A0 /home/atulk/yocto/poky-master/meta-linaro-toolchain \<br>
=C2=A0 /home/atulk/yocto/poky-master/meta-openembedded/meta-networking \<br=
>
/home/atulk/yocto/poky-master/meta-openembedded/meta-oe \<br>
&quot;</p>
<p>Please let me know with your valuable suggestions.</p>
<p>Thanks and regards,<br>
Atul</p>

--089e01536682e2a32704ff2b9c20--
