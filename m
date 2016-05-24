Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8B24460616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 16:37:31 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id k76so2735060ita.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=FZxEs2RYFl06hiQ8ujVGO1sD9b0Kjs9xo0NeXF57V88=;
	b=qMmPXknyN2AVjZdrFWOBTz/lCeS/HqT62lXo6XoTQhGjEJYT901nDU2b5hhZnNvwEB
	DlNxYSWFCpsSbVybs0hedQhl3XYJBW+Pej1woxp7IKF3rNomxsT8Fmc53qeUSfgn6UXL
	ID89DRMs2Fmnl3aRoU9k1PmTbVQxjy4tZtNy7RAnoAvtapspC6m+UGlFTFy4TmlsLf3L
	TxUHoaQrwRsMUOZ7B7lXh6c9eVN7PqyHtA7UvWvkEBK588VGYvZ4Qn2pRBhCd2ngfi5K
	JgY2i0mvKbmPV68sIw9+pscb2yAq8xPS+C904nZYHrqB8VboQjwNgYZYhfp3cRnS5oa2
	qdWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=FZxEs2RYFl06hiQ8ujVGO1sD9b0Kjs9xo0NeXF57V88=;
	b=upL5kZysT0N7EKjVfSbnja6Ea5N8rp1C901mZMuB/RbXYaJIsTXTIXyv6b0/2wwGki
	j+bNjlDJNX8SXMFSOVkohpF9i86S05sv4Z1ZI6ejlLWqs5DASWRoJP4GzDMIfQUmqMvr
	YiDsCEfSHznKKVMAStteFtV9I3XyBWZGoOPloFzPtbngAg/P5WfLpzS5kklWbxKFcCnf
	sU9YEsCMCuIytXrs6f1z7r1AXjD0dPLAVDf6s3nV1OB0bqimNICQuSSikRtyHC4ay2ek
	iqHavNBLmBpbas1i3e6s+oe/AnCLikYg/Hj8s/4H3kbm7LOfp/iwSr9BhvlPwUkm0Dj7
	OhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=FZxEs2RYFl06hiQ8ujVGO1sD9b0Kjs9xo0NeXF57V88=;
	b=D4vMqNp2WrWgK5uYzVWt6Lskcl3eRXMA8KGzqWJv1wDvflXYzSnDjUQJWcj1OUQBJT
	ctPV3vANTUMxiT2CwrqRlZB5NXgKNOBkwbJ6nubOyhiKvySVlrp0/vKEHGzReGlOkz97
	H7L8Gm8hhV37HfVm1IPh43T70FTey+36pnZe06s67dBYF4kXPssvZvILmqXdLSbXbTut
	mxT1ml5Us6iCDvi+agqaHvtjOcbYm3oJT2BiCK97Xd42czsQGoImcG2A7r9gNdPyqlaG
	9X5L+KBpvHxQdUC8oMZFyWg817xXTxFX+OjtJPaFgaxKVX77VJj9edgs3tKYL6HGa5mW
	QZOw==
X-Gm-Message-State: AOPr4FVFggWvpHAKSslky1EV3DCVMzkx8OyRInb1QEKjlUM2zzMX1YONbeC7Vjtey099eFT6K5Vz0K3Cyv+qkQ==
X-Received: by 10.36.41.11 with SMTP id p11mr18991722itp.66.1464107851744;
	Tue, 24 May 2016 09:37:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Tue, 24 May 2016 09:37:12 -0700 (PDT)
In-Reply-To: <1462846173-3640-1-git-send-email-rongqing.li@windriver.com>
References: <1462846173-3640-1-git-send-email-rongqing.li@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 24 May 2016 09:37:12 -0700
X-Google-Sender-Auth: iMFJQA_xgrq5l97rf_C-f7oSBDU
Message-ID: <CABcZAN=D9C=x+85_w4-4_J4xGoSzU5WJciRsjCbGSAT5mSbUXQ@mail.gmail.com>
To: rongqing.li@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Tue, 24 May 2016 16:37:32 -0000
Content-Type: multipart/alternative; boundary=001a1143fd706a8cdc0533992cc2

--001a1143fd706a8cdc0533992cc2
Content-Type: text/plain; charset=UTF-8

On Mon, May 9, 2016 at 7:09 PM, <rongqing.li@windriver.com> wrote:

> From: Roy Li <rongqing.li@windriver.com>
>
> With MountFlags=slave, those mounts then become private to the
> systemd-udevd
> namespace and are no longer accessible from outside the namespace, which is
> not expected
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>

What's the status of this? Mentor is carrying this patch too :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1143fd706a8cdc0533992cc2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, May 9, 2016 at 7:09 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqi=
ng.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2r1" class=3D"a3s=
 aXjCH m154986f93176b0de">From: Roy Li &lt;<a href=3D"mailto:rongqing.li@wi=
ndriver.com">rongqing.li@windriver.com</a>&gt;<br>
<br>
With MountFlags=3Dslave, those <span class=3D"il">mounts</span> then become=
 private to the systemd-udevd<br>
namespace and are no longer accessible from outside the namespace, which is=
<br>
not expected<br>
<br>
Signed-off-by: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">rong=
qing.li@windriver.com</a>&gt;</div></blockquote></div><br>What&#39;s the st=
atus of this? Mentor is carrying this patch too :)<br>-- <br><div class=3D"=
gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founde=
r - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softw=
are Engineer, Mentor Graphics</div>
</div></div>

--001a1143fd706a8cdc0533992cc2--
