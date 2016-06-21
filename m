Return-Path: <skrishnakar@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id B7D15601D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 18:10:11 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id l188so35462180lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 11:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=nI8KYf9DTZlIuBYKzlollRihJAdVTipm9YGtDMUi4Ik=;
	b=jJ7IvKpj8Uo5kSHPQzE1sJ9LJZZt/QOXVks4RH5jW4RHpdOx8w1dt8BYIlR/+BrXvm
	L/CyccS50e9G5izGKrCTjSaNtQWPxP+HWlHhI+0VTe9l6dfJvWHv1OzfmE6vHsy6lBxn
	fn4qFUIYadWXQxGQRvHbuPUnGNbgebiP3la74V0Ri82mEX9hBlrEAHFDFFx5Qa4mBGjw
	1uZcCsWn3p3a7lOoWiC9AdLl0FGLNHNMtnxz+zdxiAwpT32Iw0gG0T5NGTVqEm33eLZj
	xhoJm/GBdKxrm+BHcHgmZlNAK0VQVL1i1emDq9E6qnWjp7Vo6+d0mPrqpI5EACwedmQj
	ipSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=nI8KYf9DTZlIuBYKzlollRihJAdVTipm9YGtDMUi4Ik=;
	b=R/DLQQ8fQtmfhF1d2sfLY695dFy/uKyl+LdG/JmRmSxbmUsnzNATYI6cwJDIFWBDr9
	y3jrNr+Lgx7++Xc2OUkJrILdNKYgtuvzwH07ASaUVSJGdODB8+OctqQyOhxquz0nmvhe
	U1skmvAmy0ABZP74bfBM/aBeDb/49Yh/xTUgYgEmPyYb2SQZ7NQoEc5NB1V0GbaLqiSl
	Kk3JShaJPEUzvZkAsNTQSrgiqpbgLioL9t9eAJOMynR9EQI56+ImjqUO7sz2L12H0oeE
	wcL+Zi363mZADD+BMomwG2Jr+suQX8UxY13PkLiO/bGSDe2THjDCbUvx6qPjZgb9ituV
	PbXw==
X-Gm-Message-State: ALyK8tKXij4+/7FHqihE1AEQ9PU8vPSvOtR6eJARNHMJCIFM/rkAi+LU40Myt2ljb44ncXCV7aLRB2MRXQ7taA==
X-Received: by 10.194.234.103 with SMTP id ud7mr20760637wjc.39.1466532609443; 
	Tue, 21 Jun 2016 11:10:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.181.131 with HTTP; Tue, 21 Jun 2016 11:09:29 -0700 (PDT)
From: srikanth krishnakar <skrishnakar@gmail.com>
Date: Tue, 21 Jun 2016 23:39:29 +0530
Message-ID: <CALDxG5gA6Jv3+bmWtoQvJ0kbVyPJYhSk-csvPEnGOBhRmrq+PA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: core-image-sato: puzzles binary conflicts with samba binary
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
X-List-Received-Date: Tue, 21 Jun 2016 18:10:12 -0000
Content-Type: multipart/alternative; boundary=089e01493ba03ccc230535cdbbdb

--089e01493ba03ccc230535cdbbdb
Content-Type: text/plain; charset=UTF-8

Hi All,

I have noticed latest OE core build of sato image fails to build If the
image is installing "puzzles" and "samba" simultaneously. The below error
is seen during build of core-image-sato:

Collected errors:
 * check_data_file_clashes: Package puzzles wants to install file
/home/ubuntu/oe/ls1/build/tmp/work/ls1021atwr-linux-gnueabi/
core-image-sato/1.0-r0/rootfs/usr/bin/net
    But that file is already provided by package  * samba
 * opkg_install: Cannot install package packagegroup-core-x11-sato.

Commit that caused this failure:

http://git.openembedded.org/openembedded-core/commit/?id=2e313b8bade66da62b3823f82444ae3b30005022

Did anyone try core-image-sato with samba in the image ?

Thanks,
Skrishna

--089e01493ba03ccc230535cdbbdb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi All,<br><br></div>I have notic=
ed latest OE=20
core build of sato image fails to build If the image is installing=20
&quot;puzzles&quot; and &quot;samba&quot; simultaneously. The below error i=
s seen during=20
build of core-image-sato:<br><br><span style=3D"font-family:monospace,monos=
pace">Collected errors:<br>=C2=A0* check_data_file_clashes: Package puzzles=
 wants to install file /home/ubuntu/oe/ls1/build/tmp/</span><span style=3D"=
font-family:monospace,monospace">work/ls1021atwr-linux-gnueabi/</span><span=
 style=3D"font-family:monospace,monospace">core-image-sato/1.0-r0/rootfs/</=
span><span style=3D"font-family:monospace,monospace">usr/bin/net<br>=C2=A0=
=C2=A0=C2=A0 But that file is already provided by package=C2=A0 * samba<br>=
=C2=A0* opkg_install: Cannot install package packagegroup-core-x11-sato.</s=
pan><br><br></div>Commit that caused this failure:<br><br><a href=3D"http:/=
/git.openembedded.org/openembedded-core/commit/?id=3D2e313b8bade66da62b3823=
f82444ae3b30005022" target=3D"_blank">http://git.openembedded.org/openembed=
ded-core/commit/?id=3D2e313b8bade66da62b3823f82444ae3b30005022</a><br><br><=
/div>Did anyone try core-image-sato with samba in the image ? <br><br></div=
>Thanks,<br></div>Skrishna</div>

--089e01493ba03ccc230535cdbbdb--
