Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1T3oUk-0005NH-GK
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 15:27:46 +0200
Received: by vbbfr13 with SMTP id fr13so6507324vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=LgVHZMqsLpa9m/RF472eFwlRRYFaPAWS3m5MglLZ9+w=;
	b=kD9M1x/6YBweMPSwlKxR9enTsVXqhZeMisxagozgOwDsrH2WD5k/y6sPpGDAjZ3JLi
	sgUQIGpssZcmu7wDM0sMqE1D6L6m8YwircTEQFObKmdpfB6/EskfOwGb+BE0/cc1yqh+
	T7BJbwt6RIaaCEYWqajGXx8dliHD/9tnp0igc0g/gHzCO08ZRsKwxcu8nk1jNibz0OvU
	OKcxkewrt7fk8JOsT0YPbS8BA13bTVtueFuzhNsJrT1I4HkHzuhFCO8HfUHoJqHglA2/
	/tQ61vHZy27gcbaZJH97yfTeAuGm8OabOkhIg7UoKZ2SwVtEmg90153ci43EZ3jLThcG
	KjDw==
MIME-Version: 1.0
Received: by 10.52.26.236 with SMTP id o12mr11508482vdg.81.1345554942356; Tue,
	21 Aug 2012 06:15:42 -0700 (PDT)
Received: by 10.52.161.65 with HTTP; Tue, 21 Aug 2012 06:15:42 -0700 (PDT)
Date: Tue, 21 Aug 2012 15:15:42 +0200
Message-ID: <CAOHjBZvqMsh4nENivZWfrGUb9sXBLE58CfacjZp5U1LWBorGAw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: error expanding variable do_*
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
X-List-Received-Date: Tue, 21 Aug 2012 13:27:46 -0000
Content-Type: multipart/alternative; boundary=20cf307811705d6c8404c7c66cc4

--20cf307811705d6c8404c7c66cc4
Content-Type: text/plain; charset=ISO-8859-1

Hi,

today I restarted to work on my own OE meta layer and, after having pulled
last two months changes is OE-Core, I was able to
build nothing.
This is the error I met

[****]$ bitbake core-image-minimal
Pseudo is not present but is required, building this first before the main
build
NOTE: Error expanding variable do_unpack                        | ETA:
00:00:04
NOTE: Error during finalise of
/oelinux/condorg/openembedded-core/meta/recipes-sato/web/web_git.bb
ERROR: Unable to parse
/oelinux/condorg/openembedded-core/meta/recipes-sato/web/web_git.bb
ERROR: Command execution failed: Exited with 1

I tried with bitbake version 1.15.2 and 1.15.3, the latest two versions.
What about the "Error expanding variable do_unpack?" I've read something in
previous message on mailing list
but with no understanding.

Please can you help me?

Regards,
Giuseppe

--20cf307811705d6c8404c7c66cc4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div>=A0</div><div>today I restarted=A0to work on my own OE m=
eta layer and, after having pulled last two months changes is OE-Core, I wa=
s=A0able to</div><div>build=A0nothing.</div><div>This is the error I met</d=
iv><div>
=A0</div><div>[****]$ bitbake core-image-minimal<br>Pseudo is not present b=
ut is required, building this first before the main build<br>NOTE: Error ex=
panding variable do_unpack=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 | ETA:=A0 00:00:04<br>NOTE: Error during finalise of =
/oelinux/condorg/openembedded-core/meta/recipes-sato/web/<a href=3D"http://=
web_git.bb">web_git.bb</a><br>
ERROR: Unable to parse /oelinux/condorg/openembedded-core/meta/recipes-sato=
/web/<a href=3D"http://web_git.bb">web_git.bb</a><br>ERROR: Command executi=
on failed: Exited with 1</div><div>=A0</div><div>I tried with bitbake versi=
on 1.15.2 and 1.15.3, the latest two versions.</div>
<div>What about the &quot;Error expanding variable do_unpack?&quot; I&#39;v=
e read something in previous message on mailing list</div><div>but with no =
understanding.</div><div>=A0</div><div>Please can you help me?</div><div>
=A0</div><div>Regards,</div><div>Giuseppe<br></div>

--20cf307811705d6c8404c7c66cc4--
