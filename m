Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sidebranch.openembedded@gmail.com>)
	id 1RXyGU-0005g6-Va for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 17:53:11 +0100
Received: by eeav2 with SMTP id v2so1301073eea.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 08:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=C6l25o7USU/2EHapZhpq32e5SKB+giEa4rfbhysjWuU=;
	b=CQgIJZRsAqH++k15kgleagqJpSpwYTohyCFdPzmouwWSY4/I/s6DuKsP0jdeOGQkch
	WTZlB2cZ9x+VXTSfMV46M4/+du0ycQoQESL8MfyDfwXrMt76cx1Y4TMfrl1g5hVQ3wyS
	EIdCayIdWad9m0ZN7qJ0AQ6Q8MhtWk/2e4V9o=
MIME-Version: 1.0
Received: by 10.14.17.211 with SMTP id j59mr2830011eej.138.1323189982340; Tue,
	06 Dec 2011 08:46:22 -0800 (PST)
Received: by 10.204.185.76 with HTTP; Tue, 6 Dec 2011 08:46:22 -0800 (PST)
Date: Tue, 6 Dec 2011 17:46:22 +0100
Message-ID: <CAMvUbCxsL0hLMcThgR6=1-Vu3tfkOh6Jwr3FP95T_ssPFOMd9g@mail.gmail.com>
From: Leon Woestenberg <sidebranch.openembedded@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC] Move package-split of kexec-tools (kdump/kexec) into oe-core?
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
X-List-Received-Date: Tue, 06 Dec 2011 16:53:11 -0000
Content-Type: multipart/alternative; boundary=0016e659f280de27ac04b36f2c97

--0016e659f280de27ac04b36f2c97
Content-Type: text/plain; charset=ISO-8859-1

Hello all,


meta-openembedded uses .bbappend to change the package-split-up of
"kexec-tools" (as in openembedded-core) into "kexec" and "kdump" packages
(this was classic OE behaviour).

http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend?id=0c6d03335c117d24096598a3415ba22f74ec4f6e

However, in openembedded-core we have a dependency on kexec-tools, thus
this error results:

|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for task-core-tools-testapps:
|  *     kexec-tools *
|  * opkg_install_cmd: Cannot install package task-core-tools-testapps.


So the use of meta-openembedded as a layer breaks openembedded-core.

As a solution, can we move this package-split into openembedded-core?


Other (neat!) solutions at hand? Maybe a meta-package?


Regards,

Leon.

thanks 'ant_work' for the pointer to bbappend.

--0016e659f280de27ac04b36f2c97
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all,<br><br><br>meta-openembedded uses .bbappend to change the packag=
e-split-up of &quot;kexec-tools&quot; (as in openembedded-core) into &quot;=
kexec&quot; and &quot;kdump&quot; packages (this was classic OE behaviour).=
<br>
<br><a href=3D"http://cgit.openembedded.org/meta-openembedded/commit/meta-o=
e/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend?id=3D0c6d03335c117d240965=
98a3415ba22f74ec4f6e">http://cgit.openembedded.org/meta-openembedded/commit=
/meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend?id=3D0c6d03335c117=
d24096598a3415ba22f74ec4f6e</a><br>
<br>However, in openembedded-core we have a dependency on kexec-tools, thus=
 this error results:<br><br>|=A0 * satisfy_dependencies_for: Cannot satisfy=
 the following dependencies for task-core-tools-testapps:<br>|=A0 * =A0=A0=
=A0 kexec-tools *<br>
|=A0 * opkg_install_cmd: Cannot install package task-core-tools-testapps.<b=
r><br><br>So the use of meta-openembedded as a layer breaks openembedded-co=
re.<br><br>As a solution, can we move this package-split into openembedded-=
core?<br>
<br><br>Other (neat!) solutions at hand? Maybe a meta-package?<br><br><br>R=
egards,<br><br>Leon.<br><br>thanks &#39;ant_work&#39; for the pointer to bb=
append.<br><br>

--0016e659f280de27ac04b36f2c97--
