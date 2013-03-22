Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hirst689@gmail.com>) id 1UJ39B-0007rq-I5
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 15:40:47 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so3082109pbc.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=eGY1yohqynMqDNyUx/Ad7TgrxoaIc+UZD3+ixA7QWjs=;
	b=SXK7pHACPRo10SMdQsVBYRy18u1MlSkEGEvoxHnXi4NPAGPcfLTHq3MujZT4vfqCn2
	krXXr/Xhi1feXW0fcwMOK7Gu8WpFOQTQk0lcrMYPd9EZjl+6p219uPvk4uJShDffI/dI
	+lynfgSNsHsBwm7PCmxOL2leOzphCTGNo4Ixl9SIdJFEhj9rgDPIaUAHleksPUoyWpKx
	F6ROASvEtQ/XdWfo0ZuY4FwYhhPMoS4qUw+t/wuqAA3tfq+OSrEecqN6S1bFNc0HE8OJ
	axi94J4tH8ZU4zJhlgFTO9WvQCdB9R61KorAOrHZzbZhUJnmoTzShcA/rdSK/luES4cj
	P+2A==
MIME-Version: 1.0
X-Received: by 10.67.1.69 with SMTP id be5mr927245pad.154.1363962229714; Fri,
	22 Mar 2013 07:23:49 -0700 (PDT)
Received: by 10.68.225.166 with HTTP; Fri, 22 Mar 2013 07:23:49 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:23:49 -0400
Message-ID: <CAHu+ux0OrR7quKU3G1fLmzvFFvLxE+k8gQ9v0UtJujfHc1-R2g@mail.gmail.com>
From: David Hirst <hirst689@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: adding a recipe to oe bitbake
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
X-List-Received-Date: Fri, 22 Mar 2013 14:40:52 -0000
Content-Type: multipart/alternative; boundary=047d7b15ac6530753904d88434e5

--047d7b15ac6530753904d88434e5
Content-Type: text/plain; charset=ISO-8859-1

Hi,
    I have been struggling with a oe/bitbake issue. I wanted to add an
other .bb to the image file.
I have tried multiple ways but always end up at the same spot. I have
created a new task-XXX.bb file which includes my bb
I edited the XXXX-rootfs-image.bb to include the task-XXX.bb.
Once built I find that everything built fine and the new recipe was built
but was not loaded into the XXXX-rootfs-image.tar,gz.
If I look into the image directory for the bb file I see the compiled
application in usr/sbin.
I have tried this with my own .bb file and net-snmp bb file which comes
with the default oe-layersetup installation with the same result.
Did I not edit a file or miss some other required step?
-- 
David Hirst
hirst689@gmail.com

--047d7b15ac6530753904d88434e5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br clear=3D"all">Hi,<br>=A0=A0=A0 I have been struggling with a oe/bitbake=
 issue. I wanted to add an other .bb to the image file.<br>I have tried mul=
tiple ways but always end up at the same spot. I have created a new task-XX=
X.bb file which includes my bb<br>
I edited the XXXX-rootfs-image.bb to include the task-XXX.bb.<br>Once built=
 I find that everything built fine and the new recipe was built but was not=
 loaded into the XXXX-rootfs-image.tar,gz.<br>If I look into the image dire=
ctory for the bb file I see the compiled application in usr/sbin.<br>
I
 have tried this with my own .bb file and net-snmp bb file which comes=20
with the default oe-layersetup installation with the same result.<br>Did I =
not edit a file or miss some other required step?<br>-- <br>David Hirst<br>=
<a href=3D"mailto:hirst689@gmail.com" target=3D"_blank">hirst689@gmail.com<=
/a><br>
<img src=3D"" alt=3D""><br>

--047d7b15ac6530753904d88434e5--
