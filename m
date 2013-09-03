Return-Path: <fgretief@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id B32046BD75
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 23:50:54 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id es20so5327906lab.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 16:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=YXm90gy+cm8x1WhLeoOgx7WiCKhpBo3FRucy39TOXqA=;
	b=Scwxgd19OQ+S5HXTmnqs1Iam8y748xFQnu4Sl/n1uFu0ihSR9hZ25pQbdWB//f5eMf
	wNqYSiKCdQVxO1va3eu8rP18kkQHDqT2fNvysU+93aAqluUqNdIZppg9eCc7rFwaRCKj
	zyJpBDBqmbXrMjiMOrcnL1Pju8+6qLJMS5GnhwSJCftguJH1sI3iy+6KAI2kUh0jD9mN
	SZ8kw08YpUgVIMiIZy3ZXEcYnjX0v/sZm5veoQOeTmdreSE7sSlli1j+pSEI/BKDBLTx
	A8Bn+laDzCJLlJNoIHAAjjO1O2SiMefduDoYVzwlc62hq8ibpbF8pNzoQe00ACtqW4nJ
	Ng+g==
MIME-Version: 1.0
X-Received: by 10.152.203.233 with SMTP id kt9mr3633244lac.29.1378242802003;
	Tue, 03 Sep 2013 14:13:22 -0700 (PDT)
Received: by 10.152.37.102 with HTTP; Tue, 3 Sep 2013 14:13:21 -0700 (PDT)
Date: Tue, 3 Sep 2013 23:13:21 +0200
Message-ID: <CAFpw0gLn_s_SYaj9mMtYJvBfc1dqYEzYcXFn04J9+Xm1UroLeA@mail.gmail.com>
From: Francois Retief <fgretief@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: GCC search paths in MinGW SDK
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
X-List-Received-Date: Tue, 03 Sep 2013 23:50:55 -0000
Content-Type: multipart/alternative; boundary=001a11345984a0b5f304e5812874

--001a11345984a0b5f304e5812874
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

Thanks to Richard's recent improvements in the oe-core tree, I finally got
my first MinGW build to compile through and generate a SDK tarball.

Next issue is that on windows GCC is unable to find the crt1.o, crti.o and
crtbegin.o files. when compiling a small hello world app (see
gist<https://gist.github.com/fgretief/6429416#file-mingw-gcc-verbose-output-2013-09-03>[1]
for gcc verbose output). I verified that the files are indeed in the
SDK folders and was correctly unpacked.

Next, I checked the search path (-L) options and they point to the
respective directories where the files reside.

Is it hard coded somewhere GCC should look for these files?  Can anyone
give me some pointers where to start looking?

Cheers,
  Francois

ps. I have noticed that there is a relocate_sdk.py file in the root of the
SDK folder. What is it's purpose and can it have anything to do with the
GCC search paths?

[1]
https://gist.github.com/fgretief/6429416#file-mingw-gcc-verbose-output-2013-09-03
[2] https://github.com/fgretief/meta-mingw

--001a11345984a0b5f304e5812874
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br><br></div><div>Thanks to Richard&#39;s rec=
ent improvements in the oe-core tree, I finally got my first MinGW build to=
 compile through and generate a SDK tarball.<br><br></div><div>Next issue i=
s that on windows GCC is unable to find the crt1.o, crti.o and crtbegin.o f=
iles. when compiling a small hello world app (see <a href=3D"https://gist.g=
ithub.com/fgretief/6429416#file-mingw-gcc-verbose-output-2013-09-03">gist</=
a> [1] for gcc verbose output). I verified that the files are indeed in the=
 SDK folders and was correctly unpacked. <br>
<br></div><div>Next, I checked the search path (-L) options and they point =
to the respective directories where the files reside.<br><br></div><div>Is =
it hard coded somewhere GCC should look for these files?=A0 Can anyone give=
 me some pointers where to start looking?<br>
</div><div><br></div><div>Cheers,<br></div><div>=A0 Francois<br><br></div><=
div>ps. I have noticed that there is a relocate_sdk.py file in the root of =
the SDK folder. What is it&#39;s purpose and can it have anything to do wit=
h the GCC search paths?<br>
</div><div></div><div><div><br>[1] <a href=3D"https://gist.github.com/fgret=
ief/6429416#file-mingw-gcc-verbose-output-2013-09-03">https://gist.github.c=
om/fgretief/6429416#file-mingw-gcc-verbose-output-2013-09-03</a><br>[2] <a =
href=3D"https://github.com/fgretief/meta-mingw">https://github.com/fgretief=
/meta-mingw</a><br>
<br></div></div></div>

--001a11345984a0b5f304e5812874--
