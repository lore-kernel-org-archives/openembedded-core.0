Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pcjegan@gmail.com>) id 1S4QYS-0003p9-AZ
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 06:33:52 +0100
Received: by wera1 with SMTP id a1so2206436wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2012 21:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=X7XrB/v5nVm1VBrujUVVY+l0JAIb9Z/UE2ZQ+pBHKsQ=;
	b=SPUePbacikIqLWLDDjDQO4QXojSqiyY1KTSUqisk5E6/Z6R1iJPumYE84loKf+IogM
	PWWwA9ys4xYrNRy3NGHburz4cmq0fRYVEhw6V0T699s5HJxNBptolmEK5QCzrdXZ5hQU
	L0o430oyNwCDKbSOYhmf2K3NA7eCFaRjcikXtpvgBhLrKOmHZimIxUASENWMnlbvc2YW
	O4ptgi+WxjArcXkR347vLhM8xLaSmpYnlhSFk7k3DXlKVO6Nb6B+Ta2rG8qeDMONJUxK
	COp0VBfj/qEou3sv/vWUINb8t6iER8rrfpG5fgENSbtChCD3GaRxOv/6vZiPaiovuQrN
	2bxA==
Received: by 10.180.78.6 with SMTP id x6mr9856255wiw.18.1330925118247; Sun, 04
	Mar 2012 21:25:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.27.211 with HTTP; Sun, 4 Mar 2012 21:24:58 -0800 (PST)
From: Jegan Chandru <pcjegan@gmail.com>
Date: Mon, 5 Mar 2012 10:54:58 +0530
Message-ID: <CAAA4K6L7mTe_MK48y-Xpk6uXNhKf78tK8scTE7hW2eisUeohpg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] insane.bbclass: fix elf.arch not matching
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
X-List-Received-Date: Mon, 05 Mar 2012 05:33:52 -0000
Content-Type: multipart/alternative; boundary=f46d04388ee9e551b704ba7826ed

--f46d04388ee9e551b704ba7826ed
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,

Yes. I do have the patch applied on my tree. I use Yocto v1.1(i just
downloaded sometime back, didnt use git ;( )
But even after the patch applied, it results in above mentioned
warning. Blame is on me as I havent checked the kernel config. It was 32
bit config not 64 bit.
It happened mainly due to naming convention, I have named it defconfig-64,
for some reason bitbake haven't recognized it.
Now that I have given the proper defconfig and recompiled the linux-yocto
kernel v3.0.4 and without the patch applied, compilation went ahead without
any warning.

Thanks,
JC

--f46d04388ee9e551b704ba7826ed
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem,<div><br></div><div>Yes. I do have the patch applied on my tree. I =
use Yocto v1.1(i just downloaded sometime back, didnt use git ;( )</div><di=
v>But even after the patch applied, it results in above mentioned warning.=
=A0Blame is on me as I havent checked the kernel config. It was 32 bit conf=
ig not 64 bit.</div>

<div>It happened mainly due to naming convention, I have named it defconfig=
-64, for some reason bitbake haven&#39;t=A0recognized=A0it.</div><div>Now t=
hat I have given the proper defconfig and recompiled the linux-yocto kernel=
 v3.0.4 and without the patch applied, compilation went ahead without any w=
arning.</div>

<div><br></div><div>Thanks,</div><div>JC</div><div>=A0<br clear=3D"all"><di=
v><br></div>
</div>

--f46d04388ee9e551b704ba7826ed--
