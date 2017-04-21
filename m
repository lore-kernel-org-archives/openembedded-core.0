Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id EBD9460111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 08:36:29 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id u70so50026845ywe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 01:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=yXS8R9frWP/ItlgqK3O0atu3ry6RD8MH1r9/35cjYzU=;
	b=VrDOPWBYSGDSCcNO4LWz8fb3BUCsFjA1RytB8Bkq6sop5SyDTirVqHBhZz5zSo0a7Y
	NT1jqhepdpxSXTsdP4kNRrVGRbdfVVhCGHRTERPLiM5y87MlBk10Sh9zIoppga/n0rIf
	2qkTLZj1s82RRG36bF1L7ap75W50OfRUg1sDdnmL4heYOHnNAk7TU2X4U4q4iT+M+Xwj
	YV/xWUo8KcfpJUxpX1z6ZiDkvkTDzdMMb4jk+5suI5EUhLXSzD5p+AdiqqC5Xh7Kcf/V
	y86I95vfSFG0uADOanfv4hn8fCCQBUlFgpGKzgCxg6CnEVsmqjQPZ/UHnxrcGD8TZr79
	GnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yXS8R9frWP/ItlgqK3O0atu3ry6RD8MH1r9/35cjYzU=;
	b=SDINKKBgSI1DhaeTzeVaiN8SKtvIBShMUnQdqPHLpLFSmdsnf4RTwiOihf9Po13k77
	t+hwRXulC6763tJGhs13MJe8HOsnSxDUtri6Cbmx0qTSdguSLv6LN5BLLafAzSz7Jc0p
	xqjjjFyuZlP0r3L/vn96Riw49yqZRs+GqLQ9lKXuPffTuk1o56ud+gMpGCMRUhSTyJZf
	3E+bCF2egbuw5w6v9kwVlM1wYrD9pQUleJT2yfA9xwtDDBN3xaYz1WA/wmpf2mTlWyrq
	MPL/ntk8xuNrI4VKw/p/itAQ1LaP/DPRfHg82Jt/D/eu1eOwLlU1FVsvGea1DPEAAvwX
	oFcA==
X-Gm-Message-State: AN3rC/5mypzun+S3QhePmSM5TSPffAwpZzD95o+6RDPYThFrmgEB4vI/
	olsZj27BnrQfus6IPUxCkXIuajRcVzK9
X-Received: by 10.13.219.17 with SMTP id d17mr10208052ywe.90.1492763790712;
	Fri, 21 Apr 2017 01:36:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.83.128.203 with HTTP; Fri, 21 Apr 2017 01:36:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Apr 2017 10:36:30 +0200
Message-ID: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Fri, 21 Apr 2017 08:36:32 -0000
Content-Type: multipart/alternative; boundary=001a114fa7ec7ab127054da92726

--001a114fa7ec7ab127054da92726
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Anyone else seeing this as well?


I've updated to oe-core commit:

c6cd5865b6914521a841ae0c9f4e2bcda99beff2

from some revision maybe 20-40 commits older and now I'm seeing:


ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0
do_validate_branches: Function failed: do_validate_branches (log file
is located at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp=
/log.do_validate_branches.5385)
ERROR: Logfile of failure stored in:
linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_valida=
te_branches.5385
Log data follows:
| DEBUG: Executing shell function do_validate_branches
| HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
| mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=82=AC=E2=
=84=A2: File exists
|
| [ERROR] Can't find patch dir at ./patches/standard/base
| usage: kgit s2q
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_validate_branches (log file is located at
linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_valida=
te_branches.5385)
NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0:
task do_validate_branches: Failed
ERROR: Task (oe-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb:do_valid=
ate_branches)
failed with exit code '1'

--001a114fa7ec7ab127054da92726
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-console-output" style=3D"box-sizing:bo=
rder-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bo=
ttom:0px;color:rgb(51,51,51);font-size:14px">Anyone else seeing this as wel=
l?</pre><pre class=3D"gmail-console-output" style=3D"box-sizing:border-box;=
white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;=
color:rgb(51,51,51);font-size:14px"><br></pre><pre class=3D"gmail-console-o=
utput" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-=
word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">I=
&#39;ve updated to oe-core commit:</pre><pre class=3D"gmail-console-output"=
 style=3D"box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-=
bottom:0px"><font color=3D"#333333"><span style=3D"font-size:14px;white-spa=
ce:pre-wrap">c6cd5865b6914521a841ae0c9f4e2bcda99beff2<br></span></font></pr=
e><pre class=3D"gmail-console-output" style=3D"box-sizing:border-box;word-w=
rap:break-word;margin-top:0px;margin-bottom:0px"><font color=3D"#333333"><s=
pan style=3D"font-size:14px;white-space:pre-wrap">from some revision maybe =
20-40 commits older and now I&#39;m seeing:</span></font></pre><pre class=
=3D"gmail-console-output" style=3D"box-sizing:border-box;white-space:pre-wr=
ap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51=
);font-size:14px"><br></pre><pre class=3D"gmail-console-output" style=3D"bo=
x-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0p=
x;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">ERROR: linux-yocto-=
1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_validate_branches: Function=
 failed: do_validate_branches (log file is located at linux-yocto/1_4.10.9+=
gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385)
ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOINC+ad2e88=
5015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385
Log data follows:
| DEBUG: Executing shell function do_validate_branches
| HEAD is now at fe0fb8d Merge tag &#39;v4.10.9&#39; into standard/base
| mkdir: cannot create directory =C3=A2=E2=82=AC=CB=9C.=C3=A2=E2=82=AC=E2=
=84=A2: File exists
|=20
| [ERROR] Can&#39;t find patch dir at ./patches/standard/base
| usage: kgit s2q
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_validate_branches (log file is located at linu=
x-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_b=
ranches.5385)
NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: task=
 do_validate_branches: Failed
ERROR: Task (oe-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb:do_valid=
ate_branches) failed with exit code &#39;1&#39;</pre></div>

--001a114fa7ec7ab127054da92726--
