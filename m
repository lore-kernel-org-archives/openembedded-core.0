Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sidebranch.openembedded@gmail.com>)
	id 1RuVoC-0004OL-Pb for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 22:09:08 +0100
Received: by bke17 with SMTP id 17so5312688bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 13:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=iVUnTQeBuEfpLFF3WWe3/lkLC9FuoDFaRqgyz2KIjTE=;
	b=Lpiy+2Cuy1rLiSddI1nehSYI02+Tjg9m3VKLECNMWCBa88GbZ3yfvNyrVsvEXks5gd
	GagSgXoAHUPAJxhdgpY8djcefakRmtzuh+zfEqI6HrCJMbgkYQsROHYKs2na8H6bviKw
	xaHkfsTagoHbZpur9ANVfCNIe54NNX1yyiin0=
MIME-Version: 1.0
Received: by 10.204.153.195 with SMTP id l3mr9373006bkw.123.1328562066183;
	Mon, 06 Feb 2012 13:01:06 -0800 (PST)
Received: by 10.205.122.135 with HTTP; Mon, 6 Feb 2012 13:01:06 -0800 (PST)
Date: Mon, 6 Feb 2012 22:01:06 +0100
Message-ID: <CAMvUbCz0Lts7dUOWWvJeivm9nUb3nuhEqS-QY4+nOYOgmDzEkw@mail.gmail.com>
From: Leon Woestenberg <sidebranch.openembedded@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: armhf support in OpenEmbedded?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 21:09:08 -0000
Content-Type: multipart/alternative; boundary=0015175ce0a204579f04b851f6ec

--0015175ce0a204579f04b851f6ec
Content-Type: text/plain; charset=ISO-8859-1

Hello,

do we already have support for the ARM "armhf" ABI in OpenEmbedded?  (A
quick search on the ML didn't get me hits).

Basically,"armhf" is built with -mfloat-abi=hard, and tuned for armv7-a
CPUs.


http://wiki.debian.org/ArmHardFloatPort
http://www.powerdeveloper.org/forums/viewtopic.php?p=13645#13645

Regards,

Leon.

--0015175ce0a204579f04b851f6ec
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>do we already have support for the ARM &quot;armhf&quot; ABI =
in OpenEmbedded?=A0 (A quick search on the ML didn&#39;t get me hits).<br><=
br>Basically,&quot;armhf&quot; is built with -mfloat-abi=3Dhard, and tuned =
for armv7-a CPUs.<br>
<br><br><a href=3D"http://wiki.debian.org/ArmHardFloatPort">http://wiki.deb=
ian.org/ArmHardFloatPort</a><br><a href=3D"http://www.powerdeveloper.org/fo=
rums/viewtopic.php?p=3D13645#13645">http://www.powerdeveloper.org/forums/vi=
ewtopic.php?p=3D13645#13645</a><br>
<br>Regards,<br><br>Leon.<br>

--0015175ce0a204579f04b851f6ec--
