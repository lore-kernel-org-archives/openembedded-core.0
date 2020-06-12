Subject: Error while building image for 5.4.y on RPI4
To: openembedded-core@lists.openembedded.org
From: "Pankaj  Vinadrao Joshi" <pankaj.vj@exaleapsemi.com>
X-Originating-Location: Pune, Maharashtra, IN (157.47.55.21)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 12 Jun 2020 00:02:56 -0700
Message-ID: <Y4nb.1591945376060563369.5YNj@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="4zVYhZ6J6RxHzWQ12l2I"

--4zVYhZ6J6RxHzWQ12l2I
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,
i am trying to build an image for RPI4 for 5.4.y kernel but i am getting f=
ollowing error , i

Initialising tasks: 100% |################################################=
###########################################################################=
########################################| Time: 0:00:04
Sstate summary: Wanted 1094 Found 0 Missed 1094 Current 1154 (0% match, 51=
% complete)
NOTE: Executing Tasks
WARNING: libfm-extra-1.3.1-r0 do_fetch: Failed to fetch URL https://downlo=
ads.sourceforge.net/pcmanfm/libfm-1.3.1.tar.xz, attempting MIRRORS if avail=
able
*WARNING: linux-raspberrypi-1_5.4.40+gitAUTOINC+97badb4bae-r0 do_fetch: Fa=
iled to fetch URL git://github.com/raspberrypi/linux.git;branch=3Drpi-5.4.y=
, attempting MIRRORS if available*
*ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+97badb4bae-r0 do_fetch: Fetc=
her failure: Unable to find revision 97badb4baeb8999263a9bc2fa85c3060ffff34=
4b in branch rpi-5.4.y even from upstream*
*ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+97badb4bae-r0 do_fetch: Fetc=
her failure for URL: 'git://github.com/raspberrypi/linux.git;branch=3Drpi-5=
.4.y'. Unable to fetch URL from any source.*
*ERROR: Logfile of failure stored in: /home/pankaj/Oe-Raspberrypi4/tmp-gli=
bc/work/raspberrypi4-oe-linux-gnueabi/linux-raspberrypi/1_5.4.40+gitAUTOINC=
+97badb4bae-r0/temp/log.do_fetch.10175*
ERROR: Task (/home/pankaj/meta-raspberry/meta-raspberrypi/recipes-kernel/l=
inux/linux-raspberrypi_5.4.bb:do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2294 tasks of which 1551 didn't need to be =
rerun and 1 failed.

This my linux-raspberrypi_5.4.bb file

LINUX_VERSION ?=3D "5.4.40"
LINUX_RPI_BRANCH ?=3D "rpi-5.4.y"

SRCREV =3D "97badb4baeb8999263a9bc2fa85c3060ffff344b"

require linux-raspberrypi_5.4.inc

SRC_URI +=3D "file://0001-perf-Make-perf-able-to-build-with-latest-libbfd.=
patch \
file://0001-Revert-selftests-bpf-Skip-perf-hw-events-test-if-the.patch \
file://0002-Revert-selftests-bpf-Fix-perf_buffer-test-on-systems.patch \
file://0001-selftest-bpf-Use-CHECK-macro-instead-of-RET_IF.patch \
file://powersave.cfg \
"

pankaj@exaleap-Inspiron-3584:~/Oe-Raspberrypi4$ bitbake -e | grep ^PREFERR=
ED_VERSION_linux-raspberrypi
PREFERRED_VERSION_linux-raspberrypi=3D"5.4.%"

am i missing anything,why i am getting this error can someone help??

--4zVYhZ6J6RxHzWQ12l2I
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,<br />i am trying to build an image for RPI4 for 5.4.y kernel but i=
 am getting following error , i<br /><br />Initialising tasks: 100% |######=
###########################################################################=
###########################################################################=
#######| Time: 0:00:04</div>
<div>Sstate summary: Wanted 1094 Found 0 Missed 1094 Current 1154 (0% matc=
h, 51% complete)</div>
<div>NOTE: Executing Tasks</div>
<div>WARNING: libfm-extra-1.3.1-r0 do_fetch: Failed to fetch URL https://d=
ownloads.sourceforge.net/pcmanfm/libfm-1.3.1.tar.xz, attempting MIRRORS if =
available</div>
<div><strong>WARNING: linux-raspberrypi-1_5.4.40+gitAUTOINC+97badb4bae-r0 =
do_fetch: Failed to fetch URL git://github.com/raspberrypi/linux.git;branch=
=
=3Drpi-5.4.y, attempting MIRRORS if available</strong></div>
<div><strong>ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+97badb4bae-r0 do=
_fetch: Fetcher failure: Unable to find revision 97badb4baeb8999263a9bc2fa8=
5c3060ffff344b in branch rpi-5.4.y even from upstream</strong></div>
<div><strong>ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+97badb4bae-r0 do=
_fetch: Fetcher failure for URL: 'git://github.com/raspberrypi/linux.git;br=
anch=3Drpi-5.4.y'. Unable to fetch URL from any source.</strong></div>
<div><strong>ERROR: Logfile of failure stored in: /home/pankaj/Oe-Raspberr=
ypi4/tmp-glibc/work/raspberrypi4-oe-linux-gnueabi/linux-raspberrypi/1_5.4.4=
0+gitAUTOINC+97badb4bae-r0/temp/log.do_fetch.10175</strong></div>
<div>ERROR: Task (/home/pankaj/meta-raspberry/meta-raspberrypi/recipes-ker=
nel/linux/linux-raspberrypi_5.4.bb:do_fetch) failed with exit code '1'</div=
>
<div>NOTE: Tasks Summary: Attempted 2294 tasks of which 1551 didn't need t=
o be rerun and 1 failed.</div>
<div><br />This my linux-raspberrypi_5.4.bb file<br /><br />
<div>LINUX_VERSION ?=3D "5.4.40"</div>
<div>LINUX_RPI_BRANCH ?=3D "rpi-5.4.y"</div>
<div>&nbsp;</div>
<div>SRCREV =3D "97badb4baeb8999263a9bc2fa85c3060ffff344b"</div>
<div>&nbsp;</div>
<div>require linux-raspberrypi_5.4.inc</div>
<div>&nbsp;</div>
<div>SRC_URI +=3D "file://0001-perf-Make-perf-able-to-build-with-latest-li=
bbfd.patch \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-Revert-selftest=
s-bpf-Skip-perf-hw-events-test-if-the.patch \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0002-Revert-selftest=
s-bpf-Fix-perf_buffer-test-on-systems.patch \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-selftest-bpf-Us=
e-CHECK-macro-instead-of-RET_IF.patch \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://powersave.cfg \</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"</div>
<div>&nbsp;</div>
<br />
<div>pankaj@exaleap-Inspiron-3584:~/Oe-Raspberrypi4$ bitbake -e | grep ^PR=
EFERRED_VERSION_linux-raspberrypi&nbsp;</div>
<div>PREFERRED_VERSION_linux-raspberrypi=3D"5.4.%"<br /><br />am i missing=
 anything,why i am getting this error can someone help??&nbsp;</div>
<div>&nbsp;</div>
</div>
<div>&nbsp;</div>

--4zVYhZ6J6RxHzWQ12l2I--
