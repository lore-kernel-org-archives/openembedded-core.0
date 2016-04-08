Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id B2B7270034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 17:20:25 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id c126so85113692lfb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Apr 2016 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=Bq0aJkSP93Dh31sYEMrT4ljhYoQ4HtpnnX35PGEYTgw=;
	b=NRweENB2tiFrpTEEpLB1QxmCP/vmmPwxj9rEfV74pmuk/P2+EUUNstsXZu9KTzwgl0
	uRcGwR7cUNDm7CJiGcc0gMZmbunCh307RnYo/A+HJRW9IqVKvuLInK8KDlmaHkyOo3Yw
	2WDLwieWyGgC6FQCnShMCVOrgrBOkZIFQCLtfGswqhOh8zF+djiTkhzjBi7Ae6vbbBIs
	fkztfQ2/jDke4quAthApE6eI8DuZtYadax7u7xahcTRtXerVyUmJFI9uq38NPv4i1ocE
	dRTs32QM05QW2YhUxRVwKqz1JUoiIKW2nxbXXHL4CHOIi73v/fR6poKBDWINioPWW9HT
	BoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Bq0aJkSP93Dh31sYEMrT4ljhYoQ4HtpnnX35PGEYTgw=;
	b=YWW3bCXKhztfXttDCOI/8/yhZWVNo4DIQh3Zbc2m06YuLL8cTtmAXi7bBVLC4dy0pm
	GmhPeZDmsyKnseYePH9ZDTKCNAA0hahq53J3QCt9nzAaYTZyJT0xILkseZQ/taIL4hTq
	Qi6u+lzWOKRp8PdGkyObnPel83I+SnKarcXTvmUCYjKVURC/jAIFcrd6VXRRgFkeY79C
	gxT45UdTXF8lGVWIY25Sc+0BlFCzKheYPnB4xltzu4ke2Eoc2H+PkpbkyA+Pk9Nlwb6+
	SOxmQauA8L1CGzcoh3cY2aptYRFVxhtBFyTiKu0jraExUyYLrnYT1fJ7B9LwzdjxBWeg
	+ABQ==
X-Gm-Message-State: AD7BkJK5EviZFK2TnxiuB47GEtKathFFk9/UEv+mfJeV62nofH8Ar+tdFocSF+6lKqqwTtzJSbV2Hbexa+aSPQ==
X-Received: by 10.112.146.201 with SMTP id te9mr4026441lbb.9.1460136024941;
	Fri, 08 Apr 2016 10:20:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.21.211 with HTTP; Fri, 8 Apr 2016 10:19:55 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 8 Apr 2016 14:19:55 -0300
Message-ID: <CAAPZna383bo4guwTc5a8dfaLuATyaTvULmyyZngfDtQiOjtB=Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: userdel_sysroot_sstate failed when try to remove group
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
X-List-Received-Date: Fri, 08 Apr 2016 17:20:26 -0000
Content-Type: multipart/alternative; boundary=047d7b3a87d6173b96052ffc69b1

--047d7b3a87d6173b96052ffc69b1
Content-Type: text/plain; charset=UTF-8

Hi all,

I'm getting this error when building recipe
meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
from meta-openembedded:

DEBUG: Executing shell function userdel_sysroot_sstate
NOTE: cyrus-sasl: Performing userdel with [--root
/home/user/src/prj/build/tmp/sysroots/intel-core2-32 cyrus]
NOTE: cyrus-sasl: user cyrus doesn't exist, not removing it
NOTE: cyrus-sasl: Performing groupdel with [--root
/home/user/src/prj/build/tmp/sysroots/intel-core2-32 mail]
groupdel: cannot remove the primary group of user 'mail'
WARNING: exit code 1 from a shell command.
ERROR: cyrus-sasl: groupdel command did not succeed.
DEBUG: Python function sysroot_cleansstate finished
ERROR: Function failed: userdel_sysroot_sstate

The function userdel_sysroot_sstate was introduced by commit:
http://cgit.openembedded.org/openembedded-core/commit/?id=b5304ce438666a7418746f4ddd32703ae3188089

This error occurs on the first build of cyrus-sasl recipe, and I didn't run
cleansstate any time. userdel_sysroot_sstate is trying to remove user
and group before they are created.

As temporary solution I commented line SSTATECLEANFUNCS =
"userdel_sysroot_sstate"
in useradd.bbclass file.

Regards.

--047d7b3a87d6173b96052ffc69b1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi all,<br><br>I&#39;m getting this error when=
 building recipe meta-networking/recipes-daemons/cyrus-sasl/<a href=3D"http=
://cyrus-sasl_2.1.26.bb">cyrus-sasl_2.1.26.bb</a><br>from meta-openembedded=
:<br><br>DEBUG: Executing shell function userdel_sysroot_sstate<br>NOTE: cy=
rus-sasl: Performing userdel with [--root /home/user/src/prj/build/tmp/sysr=
oots/intel-core2-32 cyrus]<br>NOTE: cyrus-sasl: user cyrus doesn&#39;t exis=
t, not removing it<br>NOTE: cyrus-sasl: Performing groupdel with [--root /h=
ome/user/src/prj/build/tmp/sysroots/intel-core2-32 mail]<br>groupdel: canno=
t remove the primary group of user &#39;mail&#39;<br>WARNING: exit code 1 f=
rom a shell command.<br>ERROR: cyrus-sasl: groupdel command did not succeed=
.<br>DEBUG: Python function sysroot_cleansstate finished<br>ERROR: Function=
 failed: userdel_sysroot_sstate<br><br>The function userdel_sysroot_sstate =
was introduced by commit:<br><a href=3D"http://cgit.openembedded.org/openem=
bedded-core/commit/?id=3Db5304ce438666a7418746f4ddd32703ae3188089">http://c=
git.openembedded.org/openembedded-core/commit/?id=3Db5304ce438666a7418746f4=
ddd32703ae3188089</a><br><br>This error occurs on the first build of cyrus-=
sasl recipe, and I didn&#39;t run<br>cleansstate any time. userdel_sysroot_=
sstate is trying to remove user<br>and group before they are created.<br><b=
r>As temporary solution I commented line SSTATECLEANFUNCS =3D &quot;userdel=
_sysroot_sstate&quot;<br>in useradd.bbclass file.<br><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small=
">Regards.<br></div></div>

--047d7b3a87d6173b96052ffc69b1--
