Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <brandon@rascalmicro.com>) id 1Rzzc1-0006ZJ-F5
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 00:59:13 +0100
Received: by iaby12 with SMTP id y12so10373118iab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 15:50:53 -0800 (PST)
Received-SPF: pass (google.com: domain of brandon@rascalmicro.com designates
	10.50.203.100 as permitted sender) client-ip=10.50.203.100; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	brandon@rascalmicro.com designates 10.50.203.100 as permitted
	sender) smtp.mail=brandon@rascalmicro.com
Received: from mr.google.com ([10.50.203.100])
	by 10.50.203.100 with SMTP id kp4mr23347657igc.6.1329868253339
	(num_hops = 1); Tue, 21 Feb 2012 15:50:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.203.100 with SMTP id kp4mr18819360igc.6.1329868252474; Tue,
	21 Feb 2012 15:50:52 -0800 (PST)
Received: by 10.231.199.138 with HTTP; Tue, 21 Feb 2012 15:50:52 -0800 (PST)
X-Originating-IP: [146.115.15.122]
Date: Tue, 21 Feb 2012 18:50:52 -0500
Message-ID: <CA+b4E8x4_cCvhUw-UgLK=9ymuoXsiih8BMZc=ts0B7Qf=oaNuQ@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQkBxCuUAcZH2Ewmye1S6dAsrngqovXY+OnqRU9BAprKfl37XNbI8SNvYIZM6owFRMaae899
Subject: Cannot satisfy the following dependencies for task-core-basic: libusb-compat (>= 0.1.3)
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
X-List-Received-Date: Tue, 21 Feb 2012 23:59:13 -0000
Content-Type: multipart/alternative; boundary=14dae9340765c96e4004b9821433

--14dae9340765c96e4004b9821433
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

In trying to build core-image-basic, it seems that libusb-compat cannot be
found:

| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for task-core-basic:
|  * libusb-compat (>= 0.1.3) *
|  * opkg_install_cmd: Cannot install package task-core-basic.
NOTE: package core-image-basic-1.0-r0: task do_rootfs: Failed

However, it seems like libusb-compat should be findable:

:~/oe-core/build$ ls ../meta/recipes-support/libusb/
libusb1_1.0.8.bb  libusb-compat-0.1.3  libusb-compat_0.1.3.bb

Do I need to tell bitbake to look in recipes-support explicitly?

Cheers,
Brandon

-- 
Brandon Stafford
Rascal Micro: small computers for art and science
Somerville, MA, USA

--14dae9340765c96e4004b9821433
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div><div>Hi all,</div><div><br></div><div>In trying to build core-image-ba=
sic, it seems that libusb-compat cannot be found:</div><div><br></div><div>=
| Collected errors:</div><div>| =A0* satisfy_dependencies_for: Cannot satis=
fy the following dependencies for task-core-basic:</div>
<div>| =A0* <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</spa=
n>libusb-compat (&gt;=3D 0.1.3) *</div><div>| =A0* opkg_install_cmd: Cannot=
 install package task-core-basic.</div><div>NOTE: package core-image-basic-=
1.0-r0: task do_rootfs: Failed</div>
</div><div><br></div><div>However, it seems like libusb-compat should be fi=
ndable:</div><div><br></div><div>:~/oe-core/build$ ls ../meta/recipes-suppo=
rt/libusb/</div><div><a href=3D"http://libusb1_1.0.8.bb">libusb1_1.0.8.bb</=
a> =A0libusb-compat-0.1.3 =A0<a href=3D"http://libusb-compat_0.1.3.bb">libu=
sb-compat_0.1.3.bb</a></div>
<div><br></div><div>Do I need to tell bitbake to look in recipes-support ex=
plicitly?</div><div><br></div><div>Cheers,<br>Brandon</div><div><br></div>-=
- <br><div>Brandon Stafford</div><div>Rascal Micro: small computers for art=
 and science</div>
<div>Somerville, MA, USA</div><br>

--14dae9340765c96e4004b9821433--
