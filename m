Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tarek.elsherbiny@gmail.com>) id 1TENdu-0002E3-Lg
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:00:54 +0200
Received: by qcad10 with SMTP id d10so1027758qca.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/cS2GfjWuhEVyYJ7Tj9i8THMYseujS8DIqCFQGZqTnQ=;
	b=wYUC+HisjI6dRyiREkFyQ4Yw2nvhy0z8zpG4DoepPuqFq50PAqaAzVf1oqj5pa5I0m
	6xPI/pS3ZpSpnjZnTb2pRkTlpf7oOu1F97VZZBGhCJPSC6V6lloGytisEGYk5737x3sv
	uhTl9m8rJ9XZu/ZCNxfAU6hlbmdh/SM2BsyQ3oDP0g6ypESxlKjJINl81XXMJbrlIHfR
	NUxg8EiCPj6IT+K4X4SV919Zn5y2yJnbZ1qTXjxUeucIGlxL7WUI4kBvJsZ/CUw61RX0
	Va+s/ZEucwGkmIEwSO+kb7iqFXOBAWh/UCzhyWz/Wa26Rc1HyubMOSNgdWH++fbbYb8p
	6PWw==
MIME-Version: 1.0
Received: by 10.224.197.10 with SMTP id ei10mr8408120qab.49.1348073292743;
	Wed, 19 Sep 2012 09:48:12 -0700 (PDT)
Received: by 10.224.174.19 with HTTP; Wed, 19 Sep 2012 09:48:12 -0700 (PDT)
Date: Wed, 19 Sep 2012 17:48:12 +0100
Message-ID: <CAB3sqtaZSMuxaFkeaXtAuFAwcE2=JuXJTE56J-F-=pKvZddpjg@mail.gmail.com>
From: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: SVN checkout ERROR: Function failed: Fetcher failure for URL:
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
X-List-Received-Date: Wed, 19 Sep 2012 17:00:54 -0000
Content-Type: multipart/alternative; boundary=20cf3005dc98bec3f004ca10c579

--20cf3005dc98bec3f004ca10c579
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I would like to check out from our local SVN repository. This is the URI
line I'm using in the recipe:

 SRC_URI =3D
"svn://svn.local.repo/svn/dev_repos/Generation3_app;module=3Dtrunk;proto=3D=
http"

When I try the same command bitbake is using on the command line it works
fine. But bitbake is not fetching the package.

Is there a special parameter that I need to modify for SVN to work?

here is the error message I get:

WARNING: Failed to fetch URL
svn://svn.local.repo/svn/dev_repos/Generation3_app;module=3Dtrunk;proto=3Dh=
ttp
ERROR: Fetcher failure: Fetch command export HOME=3D"/home/"; export
SSH_AGENT_PID=3D"2398"; export SSH_AUTH_SOCK=3D"/tmp/keyring-suRHPa/ssh";
export
GIT_CONFIG=3D"/home//work/fsl/build/tmp/sysroots/i686-linux/etc/gitconfig";
export
PATH=3D"/home/work/fsl/build/tmp/sysroots/i686-linux/usr/bin/armv7a-vfp-neo=
n-poky-linux-gnueabi:/home/work/fsl/build/tmp/sysroots/imx6qsabrelite/usr/b=
in/crossscripts:/home/work/fsl/build/tmp/sysroots/i686-linux/usr/sbin:/home=
/work/fsl/build/tmp/sysroots/i686-linux/usr/bin:/home/work/fsl/build/tmp/sy=
sroots/i686-linux/sbin:/home/work/fsl/build/tmp/sysroots/i686-linux//bin:/h=
ome/work/fsl/sources/poky/scripts:/home/work/fsl/sources/poky/bitbake/bin/:=
/home/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr=
/games:/opt/openocd/bin:/opt/arm-elf/bin:/opt/arm-elf-insight/bin:/opt/sh-e=
lf/bin:/opt/insight.sh-elf/bin:/usr/local/cwSDK/cwvx/bin:/opt/arm-elf-insig=
ht/bin:/opt/android-sdk-linux_x86/platform-tools/:/home/work/fsl/sources/po=
ky/scripts";
/usr/bin/env svn update -r 78183 could not be run:
None
ERROR: Function failed: Fetcher failure for URL:
'svn://svn.local.repo/svn/dev_repos/Generation3_app;module=3Dtrunk;proto=3D=
http'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/work/fsl/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/web-browse=
r-8.5-r1/temp/log.do_fetch.29607
NOTE: package web-browser-8.5-r1: task do_fetch: Failed

--20cf3005dc98bec3f004ca10c579
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div><br></div><div>I would like to check out from our local SVN=A0reposito=
ry. This is the URI line I&#39;m using in the recipe:</div><div><br></div><=
div>=A0SRC_URI =3D &quot;svn://svn.local.repo/svn/dev_repos/Generation3_app=
;module=3Dtrunk;proto=3Dhttp&quot;</div>
<div><br></div><div>When I try the same command bitbake is using on the com=
mand line it works fine. But bitbake is not fetching the package.</div><div=
><br></div><div>Is there a special parameter that I need to modify for SVN =
to work?</div>
<div><br></div><div>here is the error message I get:</div><div><br></div><d=
iv><div>WARNING: Failed to fetch URL svn://svn.local.repo/svn/dev_repos/Gen=
eration3_app;module=3Dtrunk;proto=3Dhttp</div><div>ERROR: Fetcher failure: =
Fetch command export HOME=3D&quot;/home/&quot;; export SSH_AGENT_PID=3D&quo=
t;2398&quot;; export SSH_AUTH_SOCK=3D&quot;/tmp/keyring-suRHPa/ssh&quot;; e=
xport GIT_CONFIG=3D&quot;/home//work/fsl/build/tmp/sysroots/i686-linux/etc/=
gitconfig&quot;; export PATH=3D&quot;/home/work/fsl/build/tmp/sysroots/i686=
-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi:/home/work/fsl/build/tmp/=
sysroots/imx6qsabrelite/usr/bin/crossscripts:/home/work/fsl/build/tmp/sysro=
ots/i686-linux/usr/sbin:/home/work/fsl/build/tmp/sysroots/i686-linux/usr/bi=
n:/home/work/fsl/build/tmp/sysroots/i686-linux/sbin:/home/work/fsl/build/tm=
p/sysroots/i686-linux//bin:/home/work/fsl/sources/poky/scripts:/home/work/f=
sl/sources/poky/bitbake/bin/:/home/bin:/usr/local/sbin:/usr/local/bin:/usr/=
sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/openocd/bin:/opt/arm-elf/bin:/opt/=
arm-elf-insight/bin:/opt/sh-elf/bin:/opt/insight.sh-elf/bin:/usr/local/cwSD=
K/cwvx/bin:/opt/arm-elf-insight/bin:/opt/android-sdk-linux_x86/platform-too=
ls/:/home/work/fsl/sources/poky/scripts&quot;; /usr/bin/env svn update -r 7=
8183 could not be run:</div>
<div>None</div><div>ERROR: Function failed: Fetcher failure for URL: &#39;s=
vn://svn.local.repo/svn/dev_repos/Generation3_app;module=3Dtrunk;proto=3Dht=
tp&#39;. Unable to fetch URL from any source.</div><div>ERROR: Logfile of f=
ailure stored in: /home/work/fsl/build/tmp/work/armv7a-vfp-neon-poky-linux-=
gnueabi/web-browser-8.5-r1/temp/log.do_fetch.29607</div>
<div>NOTE: package web-browser-8.5-r1: task do_fetch: Failed</div></div><di=
v><br></div>

--20cf3005dc98bec3f004ca10c579--
