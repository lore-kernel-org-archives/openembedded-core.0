Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RBBsU-0005Av-1H
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 22:46:14 +0200
Received: by bke11 with SMTP id 11so1148357bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=8SDGjYiPPppbKnDvx8BwZq09hdtWDDIVF6dZL4ShsOg=;
	b=AeAPh2UdRuBbNEYz1zBNVFNVpfpznBCUznj5hd6BDF0rh+v6NpSddLOPS1Fkd/+Geu
	V+l/I3bAPx2sIjOLnW6uQ3yCQllL/KbGs1PNTHoK+X5vA4w+gAzHnaPAahd4F11yEkwy
	gUaT3NJiBf09OZVrz3uRiYJxkGecwGvEkZCfI=
MIME-Version: 1.0
Received: by 10.204.138.193 with SMTP id b1mr1042764bku.114.1317760840133;
	Tue, 04 Oct 2011 13:40:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Tue, 4 Oct 2011 13:40:40 -0700 (PDT)
Date: Tue, 4 Oct 2011 17:40:40 -0300
X-Google-Sender-Auth: ZQE4KLN2fYL8IxSiym___GWWpSQ
Message-ID: <CAP9ODKqPytjP_RCU_DQMewMp2TV9p86qVk8YT=eBC_jwNPaWYw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: gdb-cross-canadian fails to build
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
X-List-Received-Date: Tue, 04 Oct 2011 20:46:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

Today's tip fails with:

Log data follows:
| NOTE: Applying patch 'no-werror.patch'
(openembedded-core/meta/recipes-devtools/gdb/gdb/no-werror.patch)
| xterm Xt error: Can't open display:
| xterm:  DISPLAY is not set
| ERROR: Error executing a python function in
/home/otavio/hacking/ossystems/embedded-linux/openembedded-core/meta/recipe=
s-devtools/gdb/gdb-cross-canadian_7.3.1.bb:
| AttributeError: 'module' object has no attribute 'domain'
|
| ERROR: The stack trace of python calls that resulted in this
exception/failure was:
| ERROR:   File "patch_do_patch", line 136, in <module>
| ERROR:
| ERROR:   File "patch_do_patch", line 133, in patch_do_patch
| ERROR:
| ERROR:   File
"/home/otavio/hacking/ossystems/embedded-linux/openembedded-core/meta/lib/o=
e/patch.py",
line 379, in Resolve
| ERROR:     bb.msg.fatal(bb.msg.domain.Build, ("Cannot proceed with
manual patch resolution - '%s' not found. " \
| ERROR:
| ERROR: The code that was being executed was:
| ERROR:      0132:                     raise
bb.build.FuncFailed(str(sys.exc_value))
| ERROR:      0133:             resolver.Resolve()
| ERROR:      0134:
| ERROR:      0135:
| ERROR:  *** 0136:patch_do_patch(d)
| ERROR:      0137:
| ERROR: (file: 'patch_do_patch', lineno: 136, function: <module>)
| ERROR:      0129:                     patchset.Import({"file":local,
"remote":url, "strippath": striplevel}, True)
| ERROR:      0130:             except Exception:
| ERROR:      0131:                     import sys
| ERROR:      0132:                     raise
bb.build.FuncFailed(str(sys.exc_value))
| ERROR:  *** 0133:             resolver.Resolve()
| ERROR:      0134:
| ERROR:      0135:
| ERROR:      0136:patch_do_patch(d)
| ERROR:      0137:
| ERROR: (file: 'patch_do_patch', lineno: 133, function: patch_do_patch)
| ERROR: Function 'patch_do_patch' failed
NOTE: package gdb-cross-canadian-i586-7.3.1-r4.0: task do_patch: Failed
ERROR: Task 758
(/home/otavio/hacking/ossystems/embedded-linux/openembedded-core/meta/recip=
es-devtools/gdb/gdb-cross-canadian_7.3.1.bb,
do_patch) failed with exit code '1'


Clues?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


