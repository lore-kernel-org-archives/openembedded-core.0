Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SqVTN-0005NW-VX
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 22:31:22 +0200
Received: by obcva7 with SMTP id va7so7677048obc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2012 13:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=OfI24zcIGCVLH/PByzC1YR5QiAMq9plloQ0PLq1R1Zg=;
	b=U6MkUfWqq13SgyjUM14fp2XAylSEFYlEfT5OQE9rl+SHWUj+G644XSKztjtUI0ZWio
	YsVFqZMoryJkZ+Aa0zqFZ760rr4UKZPEkFqKjN+Ks900W+BTZht1g6MnWSp3m7rGfl5s
	if4nna5ugoE8XpwY65GAqdZRIoO5/zYhCqQEZ6nmjEjjhfjIqlF1+gTtp+/AAlQCzdVn
	hF7XstNMtIDvG0bPNu6CCa8YPpLObNknjuYeU4ADlaRpvVtErHzTz/28+FUm7Ob41fGh
	fHo+l1Y3E+Bp5/nP1o2OQifzAvj6fczQt63+egFsqdYxO0nqkXuypQSNd3+O6yFByO1v
	javA==
Received: by 10.50.11.129 with SMTP id q1mr3771746igb.8.1342383603966; Sun, 15
	Jul 2012 13:20:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Sun, 15 Jul 2012 13:19:43 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sun, 15 Jul 2012 23:19:43 +0300
Message-ID: <CAK18fxFZ-FdNbtc7-qMWDV4AAxUFdKJRmQDNrKkqDPQ6BL0ipQ@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkCVLpgd8CHA5DqcRU+QjeDK+HFxbdRGAMcN3/2fdUzIbLYnghfOA9V4+9P8KZRhzl8KXB6
Subject: Perf fail on mips
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
X-List-Received-Date: Sun, 15 Jul 2012 20:31:22 -0000
Content-Type: multipart/alternative; boundary=e89a8f50320cdde22b04c4e409f1

--e89a8f50320cdde22b04c4e409f1
Content-Type: text/plain; charset=ISO-8859-1

Any fast ideas on this?
qemu mips / core-image-sato-sdk / master

CC
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/util/scripting-engines/trace-event-perl.o
    CC
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/scripts/perl/Perf-Trace-Util/Context.o
    CC
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/util/scripting-engines/trace-event-python.o
In file included from
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/Python.h:8:0,
                 from util/scripting-engines/trace-event-python.c:22:
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/pyconfig.h:34:20:
error: "_ABIN32" is not defined [-Werror=undef]
In file included from
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/pyport.h:4:0,
                 from
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/Python.h:58,
                 from util/scripting-engines/trace-event-python.c:22:
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/pyconfig.h:34:20:
error: "_ABIN32" is not defined [-Werror=undef]
cc1: all warnings being treated as errors
    CC
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/scripts/python/Perf-Trace-Util/Context.o
make: ***
[/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/util/scripting-engines/trace-event-python.o]
Error 1
make: *** Waiting for unfinished jobs....
In file included from
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/Python.h:8:0,
                 from scripts/python/Perf-Trace-Util/Context.c:22:
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/pyconfig.h:34:20:
error: "_ABIN32" is not defined [-Werror=undef]
In file included from
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/pyport.h:4:0,
                 from
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/Python.h:58,
                 from scripts/python/Perf-Trace-Util/Context.c:22:
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/pyconfig.h:34:20:
error: "_ABIN32" is not defined [-Werror=undef]
cc1: all warnings being treated as errors
make: ***
[/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/scripts/python/Perf-Trace-Util/Context.o]
Error 1
make: Leaving directory
`/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/src/kernel/tools/perf'
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (see
/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/temp/log.do_compile.6311
for further information)

ag

--e89a8f50320cdde22b04c4e409f1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Any fast ideas on this?=A0<div>qemu mips / core-image-sato-sdk / master</di=
v><div><br></div><div><div>CC /home/agherzan/work/personal/yocto/2012-07-13=
-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/util/scripting-=
engines/trace-event-perl.o</div>

<div>=A0 =A0 CC /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/=
work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/scripts/perl/Perf-Trace-Util/=
Context.o</div><div>=A0 =A0 CC /home/agherzan/work/personal/yocto/2012-07-1=
3-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/util/scripting=
-engines/trace-event-python.o</div>

<div>In file included from /home/agherzan/work/personal/yocto/2012-07-13-qe=
mumips/tmp/sysroots/qemumips/usr/include/python2.7/Python.h:8:0,</div><div>=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from util/scripting-engines/trace-event-=
python.c:22:</div>

<div>/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qe=
mumips/usr/include/python2.7/pyconfig.h:34:20: error: &quot;_ABIN32&quot; i=
s not defined [-Werror=3Dundef]</div><div>In file included from /home/agher=
zan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/inclu=
de/python2.7/pyport.h:4:0,</div>

<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from /home/agherzan/work/personal/y=
octo/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/Python=
.h:58,</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from util/scripting-eng=
ines/trace-event-python.c:22:</div>

<div>/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qe=
mumips/usr/include/python2.7/pyconfig.h:34:20: error: &quot;_ABIN32&quot; i=
s not defined [-Werror=3Dundef]</div><div>cc1: all warnings being treated a=
s errors</div>

<div>=A0 =A0 CC /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/=
work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/scripts/python/Perf-Trace-Uti=
l/Context.o</div><div>make: *** [/home/agherzan/work/personal/yocto/2012-07=
-13-qemumips/tmp/work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/util/scripti=
ng-engines/trace-event-python.o] Error 1</div>

<div>make: *** Waiting for unfinished jobs....</div><div>In file included f=
rom /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qem=
umips/usr/include/python2.7/Python.h:8:0,</div><div>=A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0from scripts/python/Perf-Trace-Util/Context.c:22:</div>

<div>/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qe=
mumips/usr/include/python2.7/pyconfig.h:34:20: error: &quot;_ABIN32&quot; i=
s not defined [-Werror=3Dundef]</div><div>In file included from /home/agher=
zan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/inclu=
de/python2.7/pyport.h:4:0,</div>

<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from /home/agherzan/work/personal/y=
octo/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/include/python2.7/Python=
.h:58,</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from scripts/python/Per=
f-Trace-Util/Context.c:22:</div>

<div>/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qe=
mumips/usr/include/python2.7/pyconfig.h:34:20: error: &quot;_ABIN32&quot; i=
s not defined [-Werror=3Dundef]</div><div>cc1: all warnings being treated a=
s errors</div>

<div>make: *** [/home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/=
work/qemumips-poky-linux/perf-3.4-r1/perf-3.4/scripts/python/Perf-Trace-Uti=
l/Context.o] Error 1</div><div>make: Leaving directory `/home/agherzan/work=
/personal/yocto/2012-07-13-qemumips/tmp/sysroots/qemumips/usr/src/kernel/to=
ols/perf&#39;</div>

<div>ERROR: oe_runmake failed</div><div>ERROR: Function failed: do_compile =
(see /home/agherzan/work/personal/yocto/2012-07-13-qemumips/tmp/work/qemumi=
ps-poky-linux/perf-3.4-r1/temp/log.do_compile.6311 for further information)=
</div>

</div><div><br></div><div>ag</div>

--e89a8f50320cdde22b04c4e409f1--
