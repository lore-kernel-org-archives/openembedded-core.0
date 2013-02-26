Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anton.sergienko@gmail.com>) id 1UANLZ-0004h8-CA
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 17:25:43 +0100
Received: by mail-ve0-f172.google.com with SMTP id cz11so3823224veb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 08:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:from:date:message-id:subject:to
	:content-type; bh=YEo7Al6Qju0VPTblx9ccOrdHEZSMVyUyjJYUXg4YX2E=;
	b=NT3LIIHG0iK3Di/Op90jIl82dezcSuMIC31+sydz0la0N8fthiyyibnU74yYY3M/zh
	PLMwqvYixIIb5EQ0cVyD0C81Av6pyyHuJRuqDr3M1jyIMie7LBqfFYSyLAFOSomq8zuQ
	Nj0FNxxb8OlK1Co4lghoxuPiD9Ly0pC2eki7/a71qSwRY5vbMUi+pYRunqjW2eEDiCI2
	mZmlbRGICa3HJT7dRhhJfidKzSMDdIsOjNIrND4JZPEGEyVgiBcpnMSdxyhDnNj0xDTm
	J5MmSC9iu9GXbiyJJmYA0VwYBZJbv/TTXfeN4BiDIUTIzIgcy3IyTYxK+qsCGNE6ymMS
	Stew==
X-Received: by 10.52.67.164 with SMTP id o4mr10245367vdt.42.1361894959701;
	Tue, 26 Feb 2013 08:09:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.211.5 with HTTP; Tue, 26 Feb 2013 08:08:59 -0800 (PST)
From: Anton Sergienko <anton.sergienko@gmail.com>
Date: Tue, 26 Feb 2013 17:08:59 +0100
Message-ID: <CAMEF+f=FAyLCaWwjzq+W=1QEZcEM3V1awR8-e5ogFdn923ndhg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 16:25:45 -0000
Content-Type: multipart/alternative; boundary=20cf307f3b624b6b2904d6a2e1b9

--20cf307f3b624b6b2904d6a2e1b9
Content-Type: text/plain; charset=UTF-8

Hi!
After the patch (commit c49f967384ccbfe131bbb33ee518014f3fc4b38f) to
meta/classes/kernel-arch.bbclass kernel build fails for arm machine with
hard floating point instruction set in CC (-mfloat-abi=hard).
As I understand kernel should not be build with fpu specific floating point
instructions(should not be any floating point operation at all), but CFLAGS
from machine-tune are propagated to CC and it also include -mfloat-abi
flag. Should not -mfloat-abi flag be filtered out in kernel-arch.bbclass ?

//Anton

--20cf307f3b624b6b2904d6a2e1b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<div>After the patch (commit c49f967384ccbfe131bbb33ee5=
18014f3fc4b38f) to meta/classes/kernel-arch.bbclass kernel build fails for =
arm machine with hard floating point instruction set in CC (-mfloat-abi=3Dh=
ard).</div>

<div style>As I understand kernel should not be build with fpu specific flo=
ating point instructions(should not be any floating point operation at all)=
, but CFLAGS from machine-tune are propagated to CC and it also include -mf=
loat-abi flag. Should not -mfloat-abi flag be=C2=A0filtered=C2=A0out in ker=
nel-arch.bbclass ?</div>

<div style><br></div><div style>//Anton</div></div>

--20cf307f3b624b6b2904d6a2e1b9--
