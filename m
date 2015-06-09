Return-Path: <hcu5555@gmail.com>
Received: from mail-yh0-f67.google.com (mail-yh0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3359373695
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 06:25:08 +0000 (UTC)
Received: by yhab6 with SMTP id b6so971349yha.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jun 2015 23:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=jWGvcQPvBEhsZXhGDDu2/SVvNJOh1BCZj/kkTclCuyw=;
	b=rPN/kloh/kuIxgjTNUy6IYLet9pfGMoOBgGBDx13QQz0+vf8ep/k/Z7/Qxx7SfSntM
	VIba0bqAj+mZdK6HzKHCFO+eRtarDcaHD+fZK96zX/Utvqu5EKpe5bJ2OHxsjynRc7bN
	EuWf7KceLKD9And0bwVI5wbK1rSdIBvu0/n6szp5F/kiqNzKEJUodasR/hfgv9ZCQQxY
	2dCrwMoH6wP5EYufO+LQegCNKDh9ijmNW8nygIVGTRb95y3RgCWcGmVdVqfi2/QAcmNj
	aVzG7H7PalMhSwoJHdezvFjsvQBoZN5BtNvz9HKbqvzaR0q6oLTAhFS3dAoNt+fMctvz
	YTLA==
MIME-Version: 1.0
X-Received: by 10.129.101.135 with SMTP id z129mr19914794ywb.81.1433831109675; 
	Mon, 08 Jun 2015 23:25:09 -0700 (PDT)
Received: by 10.37.224.85 with HTTP; Mon, 8 Jun 2015 23:25:09 -0700 (PDT)
Date: Tue, 9 Jun 2015 14:25:09 +0800
Message-ID: <CAD5oO7mBCi=DoXVCwy5yytdkbJaj1k4GN6MZnv5ATGPxqT7QNg@mail.gmail.com>
From: issta Hu <hcu5555@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: build yocto error
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
X-List-Received-Date: Tue, 09 Jun 2015 06:25:14 -0000
X-Groupsio-MsgNum: 66470
Content-Type: multipart/mixed; boundary=001a114c8356f68bf405180fd1ea

--001a114c8356f68bf405180fd1ea
Content-Type: multipart/alternative; boundary=001a114c8356f68bef05180fd1e8

--001a114c8356f68bef05180fd1e8
Content-Type: text/plain; charset=UTF-8

hi ,

I am very trouble in build the yocto. The error log is like this.

chunyun@ubuntu:~/share/yocto/ZC702$ bitbake core-image-minimal
Loading cache: 100%
|#################################################################################################|
ETA:  00:00:00
Loaded 1303 entries from dependency cache.
Parsing recipes: 100%
|###############################################################################################|
Time: 00:00:00
Parsing of 896 .bb files complete (894 cached, 2 parsed). 1303 targets, 58
skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.27.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "zc702-zynq7"
DISTRO            = "poky"
DISTRO_VERSION    = "1.8+snapshot-20150609"
TUNE_FEATURES     = "arm armv7a vfp neon cortexa9"
TARGET_FPU        = "vfp-neon"
meta              = "fido:b5ba70b47fff227e4381fcac93defccb79e3d8f1"
meta-xilinx       = "fido:5aa58bbbf8ddcc59f8746805d62fd156d7cff461"
meta-yocto
meta-yocto-bsp    = "fido:b5ba70b47fff227e4381fcac93defccb79e3d8f1"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: write_specfile
ERROR: Logfile of failure stored in:
/home/chunyun/share/yocto/ZC702/tmp/work/cortexa9-vfp-neon-poky-linux-gnueabi/init-ifupdown/1.0-r7/temp/log.do_package_write_rpm.8848
Log data follows:
| DEBUG: Executing python function sstate_task_prefunc
| DEBUG: Python function sstate_task_prefunc finished
| DEBUG: Executing python function do_package_write_rpm
| DEBUG: Executing python function read_subpackage_metadata
| DEBUG: Python function read_subpackage_metadata finished
| DEBUG: Executing python function do_package_rpm
| DEBUG: Executing python function write_specfile
| DEBUG: Python function write_specfile finished
| DEBUG: Python function do_package_rpm finished
| DEBUG: Python function do_package_write_rpm finished
| ERROR: Function failed: write_specfile
ERROR: Task 833
(/home/chunyun/share/yocto/poky/meta/recipes-core/init-ifupdown/
init-ifupdown_1.0.bb, do_package_write_rpm) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1396 tasks of which 1395 didn't need to be
rerun and 1 failed.
No currently running tasks (1395 of 1889)

Summary: 1 task failed:
  /home/chunyun/share/yocto/poky/meta/recipes-core/init-ifupdown/
init-ifupdown_1.0.bb, do_package_write_rpm
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

The
/home/chunyun/share/yocto/ZC702/tmp/work/cortexa9-vfp-neon-poky-linux-gnueabi/init-ifupdown/1.0-r7/temp/log.do_package_write_rpm.8848
can see the affix.

--001a114c8356f68bef05180fd1e8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi ,<div><br></div><div>I am very trouble in build the yoc=
to. The error log is like this.</div><div><br></div><div><div>chunyun@ubunt=
u:~/share/yocto/ZC702$ bitbake core-image-minimal</div><div>Loading cache: =
100% |#####################################################################=
############################| ETA: =C2=A000:00:00</div><div>Loaded 1303 ent=
ries from dependency cache.</div><div>Parsing recipes: 100% |##############=
###########################################################################=
######| Time: 00:00:00</div><div>Parsing of 896 .bb files complete (894 cac=
hed, 2 parsed). 1303 targets, 58 skipped, 0 masked, 0 errors.</div><div>NOT=
E: Resolving any missing task queue dependencies</div><div><br></div><div>B=
uild Configuration:</div><div>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &qu=
ot;1.27.0&quot;</div><div>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x=
86_64-linux&quot;</div><div>NATIVELSBSTRING =C2=A0 =3D &quot;Ubuntu-14.04&q=
uot;</div><div>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-poky-lin=
ux-gnueabi&quot;</div><div>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &=
quot;zc702-zynq7&quot;</div><div>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;poky&quot;</div><div>DISTRO_VERSION =C2=A0 =C2=A0=3D &quot;=
1.8+snapshot-20150609&quot;</div><div>TUNE_FEATURES =C2=A0 =C2=A0 =3D &quot=
;arm armv7a vfp neon cortexa9&quot;</div><div>TARGET_FPU =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;vfp-neon&quot;</div><div>meta =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;fido:b5ba70b47fff227e4381fcac93defccb79e3=
d8f1&quot;</div><div>meta-xilinx =C2=A0 =C2=A0 =C2=A0 =3D &quot;fido:5aa58b=
bbf8ddcc59f8746805d62fd156d7cff461&quot;</div><div>meta-yocto =C2=A0 =C2=A0=
 =C2=A0 =C2=A0</div><div>meta-yocto-bsp =C2=A0 =C2=A0=3D &quot;fido:b5ba70b=
47fff227e4381fcac93defccb79e3d8f1&quot;</div><div><br></div><div>NOTE: Prep=
aring RunQueue</div><div>NOTE: Executing SetScene Tasks</div><div>NOTE: Exe=
cuting RunQueue Tasks</div><div>ERROR: Function failed: write_specfile</div=
><div>ERROR: Logfile of failure stored in: /home/chunyun/share/yocto/ZC702/=
tmp/work/cortexa9-vfp-neon-poky-linux-gnueabi/init-ifupdown/1.0-r7/temp/log=
.do_package_write_rpm.8848</div><div>Log data follows:</div><div>| DEBUG: E=
xecuting python function sstate_task_prefunc</div><div>| DEBUG: Python func=
tion sstate_task_prefunc finished</div><div>| DEBUG: Executing python funct=
ion do_package_write_rpm</div><div>| DEBUG: Executing python function read_=
subpackage_metadata</div><div>| DEBUG: Python function read_subpackage_meta=
data finished</div><div>| DEBUG: Executing python function do_package_rpm</=
div><div>| DEBUG: Executing python function write_specfile</div><div>| DEBU=
G: Python function write_specfile finished</div><div>| DEBUG: Python functi=
on do_package_rpm finished</div><div>| DEBUG: Python function do_package_wr=
ite_rpm finished</div><div>| ERROR: Function failed: write_specfile</div><d=
iv>ERROR: Task 833 (/home/chunyun/share/yocto/poky/meta/recipes-core/init-i=
fupdown/<a href=3D"http://init-ifupdown_1.0.bb">init-ifupdown_1.0.bb</a>, d=
o_package_write_rpm) failed with exit code &#39;1&#39;</div><div>NOTE: Task=
s Summary: Attempted 1396 tasks of which 1395 didn&#39;t need to be rerun a=
nd 1 failed.</div><div>No currently running tasks (1395 of 1889)</div><div>=
<br></div><div>Summary: 1 task failed:</div><div>=C2=A0 /home/chunyun/share=
/yocto/poky/meta/recipes-core/init-ifupdown/<a href=3D"http://init-ifupdown=
_1.0.bb">init-ifupdown_1.0.bb</a>, do_package_write_rpm</div><div>Summary: =
There was 1 ERROR message shown, returning a non-zero exit code.</div></div=
><div><br></div><div>The /home/chunyun/share/yocto/ZC702/tmp/work/cortexa9-=
vfp-neon-poky-linux-gnueabi/init-ifupdown/1.0-r7/temp/log.do_package_write_=
rpm.8848 can see the affix.</div></div>

--001a114c8356f68bef05180fd1e8--

--001a114c8356f68bf405180fd1ea
Content-Type: application/octet-stream; name="log.do_package_write_rpm.8848"
Content-Disposition: attachment; filename="log.do_package_write_rpm.8848"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iaoy0o570

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gc3N0YXRlX3Rhc2tfcHJlZnVuYwpERUJV
RzogUHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3ByZWZ1bmMgZmluaXNoZWQKREVCVUc6IEV4
ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcGFja2FnZV93cml0ZV9ycG0KREVCVUc6IEV4ZWN1
dGluZyBweXRob24gZnVuY3Rpb24gcmVhZF9zdWJwYWNrYWdlX21ldGFkYXRhCkRFQlVHOiBQeXRo
b24gZnVuY3Rpb24gcmVhZF9zdWJwYWNrYWdlX21ldGFkYXRhIGZpbmlzaGVkCkRFQlVHOiBFeGVj
dXRpbmcgcHl0aG9uIGZ1bmN0aW9uIGRvX3BhY2thZ2VfcnBtCkRFQlVHOiBFeGVjdXRpbmcgcHl0
aG9uIGZ1bmN0aW9uIHdyaXRlX3NwZWNmaWxlCkRFQlVHOiBQeXRob24gZnVuY3Rpb24gd3JpdGVf
c3BlY2ZpbGUgZmluaXNoZWQKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBkb19wYWNrYWdlX3JwbSBm
aW5pc2hlZApERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3BhY2thZ2Vfd3JpdGVfcnBtIGZpbmlz
aGVkCkVSUk9SOiBGdW5jdGlvbiBmYWlsZWQ6IHdyaXRlX3NwZWNmaWxlCg==

--001a114c8356f68bf405180fd1ea--
