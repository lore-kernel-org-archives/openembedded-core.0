Subject: Error while building image for core-image-sato for raspberrypi4
To: openembedded-core@lists.openembedded.org
From: "Pankaj  Vinadrao Joshi" <pankaj.vj@exaleapsemi.com>
X-Originating-Location: Pune, Maharashtra, IN (157.33.140.93)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Jun 2020 06:44:49 -0700
Message-ID: <DzEc.1593438289211123367.xTUF@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="awiYyZZBXQJHKcK3cPPc"

--awiYyZZBXQJHKcK3cPPc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,
i am trying build an image for RPI4 using openembedded-core i have added a=
ll the necessary layers into buit when i am trying to build an image i am g=
etting following error

pankaj@exaleap-Inspiron-3584:~/Oe-Raspberrypi4$ bitbake core-image-sato
NOTE: Bitbake server didn't start within 5 seconds, waiting for 90
Parsing recipes: 100% |###################################################=
###########################################################################=
########################################| Time: 0:06:47
Parsing of 2279 .bb files complete (0 cached, 2279 parsed). 3439 targets, =
213 skipped, 0 masked, 0 errors.
ERROR: Nothing PROVIDES 'core-image-sato'
core-image-sato was skipped: 'hwcodecstools-debug' in IMAGE_FEATURES is no=
t a valid image feature. Valid features: allow-empty-password allow-root-lo=
gin bash-completion-pkgs dbg-pkgs debug-tweaks dev-pkgs doc doc-pkgs eclips=
e-debug empty-root-password hwcodecs nfs-client nfs-server package-manageme=
nt post-install-logging ptest-pkgs read-only-rootfs splash src-pkgs ssh-ser=
ver-dropbear ssh-server-openssh stateless-rootfs staticdev-pkgs tools-debug=
 tools-profile tools-sdk tools-testapps x11 x11-base x11-sato

i didnt understood why this error is,can someone help me with this????

--awiYyZZBXQJHKcK3cPPc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br />i am trying build an image for RPI4 using openembedded-core i have=
 added all the necessary layers into buit when i am trying to build an imag=
e i am getting following error<br /><br />
<div>pankaj@exaleap-Inspiron-3584:~/Oe-Raspberrypi4$ bitbake core-image-sa=
to</div>
<div>NOTE: Bitbake server didn't start within 5 seconds, waiting for 90</d=
iv>
<div>Parsing recipes: 100% |##############################################=
###########################################################################=
#############################################| Time: 0:06:47</div>
<div>Parsing of 2279 .bb files complete (0 cached, 2279 parsed). 3439 targ=
ets, 213 skipped, 0 masked, 0 errors.</div>
<div>ERROR: Nothing PROVIDES 'core-image-sato'</div>
<div>core-image-sato was skipped: 'hwcodecstools-debug' in IMAGE_FEATURES =
is not a valid image feature. Valid features: allow-empty-password allow-ro=
ot-login bash-completion-pkgs dbg-pkgs debug-tweaks dev-pkgs doc doc-pkgs e=
clipse-debug empty-root-password hwcodecs nfs-client nfs-server package-man=
agement post-install-logging ptest-pkgs read-only-rootfs splash src-pkgs ss=
h-server-dropbear ssh-server-openssh stateless-rootfs staticdev-pkgs tools-=
debug tools-profile tools-sdk tools-testapps x11 x11-base x11-sato</div>
<div><br />i didnt understood why this error is,can someone help me with t=
his????</div>

--awiYyZZBXQJHKcK3cPPc--
