Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.40])
	by mail.openembedded.org (Postfix) with ESMTP id D4FFA60807
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 09:49:23 +0000 (UTC)
Received: from 1btXD2-000402-T5 by out11d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1btXD2-00040Y-UY; Mon, 10 Oct 2016 02:49:24 -0700
Received: by emcmailer; Mon, 10 Oct 2016 02:49:24 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1btXD2-000402-T5; Mon, 10 Oct 2016 02:49:24 -0700
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0294.000; Mon, 10 Oct 2016 11:49:23 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: "Armin Kuster (akuster808@gmail.com)" <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: CVE-2016-0634 -- bash prompt expanding $HOSTNAME  patch for
	krogoth
Thread-Index: AdIi2mCln1IkpaN8SFqfh8JtUR7+Sw==
Date: Mon, 10 Oct 2016 09:49:22 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48ABE4A7CF@SESTOEX04.enea.se>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: CVE-2016-0634 -- bash prompt expanding $HOSTNAME patch for krogoth
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
X-List-Received-Date: Mon, 10 Oct 2016 09:49:25 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3230301C09DEF9499B442BBE162C5E48ABE4A7CFSESTOEX04enease_"

--_000_3230301C09DEF9499B442BBE162C5E48ABE4A7CFSESTOEX04enease_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

I am trying to backport the following patch to bash in krogoth:
https://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-047

Reference to CVE assignment: http://openwall.com/lists/oss-security/2016/09=
/16/8

The patch can be applied with: `patch -p0'

"patch -p0 < ~/security-patches/CVE-2016-0634.patch

poky/build-qemuppc/tmp/work/ppc7400-enea-linux/bash/4.3.30-r0/bash-4.3.30# =
patch -p0 < CVE-2016-0634.patch
patching file parse.y
Hunk #1 succeeded at 5257 (offset -2 lines).
Hunk #2 succeeded at 5405 (offset -2 lines).
Hunk #3 succeeded at 5499 (offset -2 lines).
patching file y.tab.c
Hunk #1 succeeded at 7569 (offset -2 lines).
Hunk #2 succeeded at 7717 (offset -2 lines).
Hunk #3 succeeded at 7811 (offset -2 lines).
root@sestofb10:/media/data/fb/hopo/6.0/poky/build-qemuppc/tmp/work/ppc7400-=
enea-linux/bash/4.3.30-r0/bash-4.3.30#<mailto:root@sestofb10:/media/data/fb=
/hopo/6.0/poky/build-qemuppc/tmp/work/ppc7400-enea-linux/bash/4.3.30-r0/bas=
h-4.3.30#>

But when I add it to the bash recipe and run bitbake I get error (I guess p=
atch -p1 does not work). Do you know how can I solve this issue?
ERROR: bash-4.3.30-r0 do_patch: Command Error: 'quilt --quiltrc /data/fb/ho=
po/6.0/poky/build-qemuppc/tmp/sysroots/x86_64-linux/etc/quiltrc push' exite=
d with 1  Output:
Applying patch CVE-2016-0634.patch
can't find file to patch at input line 25
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Bash-Release:  4.3
|Patch-ID:      bash43-047
|
|Bug-Reported-by:       Bernd Dietzel
|Bug-Reference-ID:
|Bug-Reference-URL:     https://bugs.launchpad.net/ubuntu/+source/bash/+bug=
/1507025
|
|Bug-Description:
|
|Bash performs word expansions on the prompt strings after the special
|escape sequences are expanded.  If a malicious user can modify the system
|hostname or change the name of the bash executable and coerce a user into
|executing it, and the new name contains word expansions (including
|command substitution), bash will expand them in prompt strings containing
|the \h or \H and \s escape sequences, respectively.
|
|Patch (apply with `patch -p0')
|
|CVE:  CVE-2016-0634
|Upstream-Status: Backport
|Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
|
|*** ../bash-4.3-patched/parse.y        2015-08-13 15:11:54.000000000 -0400
|--- parse.y    2016-03-07 15:44:14.000000000 -0500
--------------------------
No file to patch.  Skipping patch.
3 out of 3 hunks ignored
can't find file to patch at input line 82
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|*** ../bash-4.3-patched/y.tab.c        2015-08-13 15:11:54.000000000 -0400
|--- y.tab.c    2016-03-07 15:44:14.000000000 -0500
--------------------------


Thanks
//Sona



--_000_3230301C09DEF9499B442BBE162C5E48ABE4A7CFSESTOEX04enease_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div>Hi Armin,</div>
<div>&nbsp;</div>
<div>I am trying to backport the following patch to bash in krogoth:</div>
<div><a href=3D"https://ftp.gnu.org/pub/gnu/bash/bash-4.3-patches/bash43-04=
7"><font color=3D"#0563C1"><u>https://ftp.gnu.org/pub/gnu/bash/bash-4.3-pat=
ches/bash43-047</u></font></a> </div>
<div>&nbsp;</div>
<div>Reference to CVE assignment: <a href=3D"http://openwall.com/lists/oss-=
security/2016/09/16/8"><font color=3D"#0563C1"><u>http://openwall.com/lists=
/oss-security/2016/09/16/8</u></font></a></div>
<div>&nbsp;</div>
<div><font face=3D"Courier New" size=3D"2"><span style=3D"font-size:10pt;">=
The patch can be applied with: `patch -p0' </span></font></div>
<div>&nbsp;</div>
<div>&#8220;patch &#8211;p0 &lt; ~/security-patches/CVE-2016-0634.patch</di=
v>
<div>&nbsp;</div>
<div>poky/build-qemuppc/tmp/work/ppc7400-enea-linux/bash/4.3.30-r0/bash-4.3=
.30# patch -p0 &lt; CVE-2016-0634.patch</div>
<div>patching file parse.y</div>
<div>Hunk #1 succeeded at 5257 (offset -2 lines).</div>
<div>Hunk #2 succeeded at 5405 (offset -2 lines).</div>
<div>Hunk #3 succeeded at 5499 (offset -2 lines).</div>
<div>patching file y.tab.c</div>
<div>Hunk #1 succeeded at 7569 (offset -2 lines).</div>
<div>Hunk #2 succeeded at 7717 (offset -2 lines).</div>
<div>Hunk #3 succeeded at 7811 (offset -2 lines).</div>
<div><a href=3D"mailto:root@sestofb10:/media/data/fb/hopo/6.0/poky/build-qe=
muppc/tmp/work/ppc7400-enea-linux/bash/4.3.30-r0/bash-4.3.30#"><font color=
=3D"#0563C1"><u>root@sestofb10:/media/data/fb/hopo/6.0/poky/build-qemuppc/t=
mp/work/ppc7400-enea-linux/bash/4.3.30-r0/bash-4.3.30#</u></font></a></div>
<div>&nbsp;</div>
<div>But when I add it to the bash recipe and run bitbake I get error (I gu=
ess patch &#8211;p1 does not work). Do you know how can I solve this issue?=
</div>
<div>ERROR: bash-4.3.30-r0 do_patch: Command Error: 'quilt --quiltrc /data/=
fb/hopo/6.0/poky/build-qemuppc/tmp/sysroots/x86_64-linux/etc/quiltrc push' =
exited with 1&nbsp; Output:</div>
<div>Applying patch CVE-2016-0634.patch</div>
<div>can't find file to patch at input line 25</div>
<div>Perhaps you used the wrong -p or --strip option?</div>
<div>The text leading up to this was:</div>
<div>--------------------------</div>
<div>|Bash-Release:&nbsp; 4.3</div>
<div>|Patch-ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bash43-047</div>
<div>|</div>
<div>|Bug-Reported-by:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bernd Dietzel</d=
iv>
<div>|Bug-Reference-ID:</div>
<div>|Bug-Reference-URL:&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://bugs.la=
unchpad.net/ubuntu/&#43;source/bash/&#43;bug/1507025">
https://bugs.launchpad.net/ubuntu/&#43;source/bash/&#43;bug/1507025</a></di=
v>
<div>|</div>
<div>|Bug-Description:</div>
<div>|</div>
<div>|Bash performs word expansions on the prompt strings after the special=
</div>
<div>|escape sequences are expanded.&nbsp; If a malicious user can modify t=
he system</div>
<div>|hostname or change the name of the bash executable and coerce a user =
into</div>
<div>|executing it, and the new name contains word expansions (including</d=
iv>
<div>|command substitution), bash will expand them in prompt strings contai=
ning</div>
<div>|the \h or \H and \s escape sequences, respectively.</div>
<div>|</div>
<div>|Patch (apply with `patch -p0')</div>
<div>|</div>
<div>|CVE:&nbsp; CVE-2016-0634</div>
<div>|Upstream-Status: Backport</div>
<div>|Signed-off-by: Sona Sarmadi &lt;sona.sarmadi@enea.com&gt;</div>
<div>|</div>
<div>|*** ../bash-4.3-patched/parse.y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 2015-08-13 15:11:54.000000000 -0400</div>
<div>|--- parse.y&nbsp;&nbsp;&nbsp; 2016-03-07 15:44:14.000000000 -0500</di=
v>
<div>--------------------------</div>
<div>No file to patch.&nbsp; Skipping patch.</div>
<div>3 out of 3 hunks ignored</div>
<div>can't find file to patch at input line 82</div>
<div>Perhaps you used the wrong -p or --strip option?</div>
<div>The text leading up to this was:</div>
<div>--------------------------</div>
<div>|*** ../bash-4.3-patched/y.tab.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 2015-08-13 15:11:54.000000000 -0400</div>
<div>|--- y.tab.c&nbsp;&nbsp;&nbsp; 2016-03-07 15:44:14.000000000 -0500</di=
v>
<div>--------------------------</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><font size=3D"2"><span style=3D"font-size:10.5pt;">Thanks</span></font=
></div>
<div><font size=3D"2"><span style=3D"font-size:10.5pt;">//Sona</span></font=
></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</span></font>
</body>
</html>

--_000_3230301C09DEF9499B442BBE162C5E48ABE4A7CFSESTOEX04enease_--
