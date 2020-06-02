Subject: error while adding meta-python layer
To: openembedded-core@lists.openembedded.org
From: "Pankaj  Vinadrao Joshi" <pankaj.vj@exaleapsemi.com>
X-Originating-Location: Gurgaon, Haryana, IN (14.98.179.254)
X-Originating-Platform: Linux Firefox 76
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 02 Jun 2020 04:38:31 -0700
Message-ID: <25Tw.1591097911764956513.5rNg@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="QZK9biVTSXrS5CCHpZ3I"

--QZK9biVTSXrS5CCHpZ3I
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

i have cloned *meta-openembedded* layer and from that i am trying to add me=
ta-python layer but i am getting following error i am adding this to my pok=
y

*pankaj@exaleap-Inspiron-3584:~/raspberrypi4_image$ bitbake-layers add-lay=
er /home/pankaj/meta-openembedded/meta-python/*
NOTE: Starting bitbake server...
Traceback (most recent call last):
File "/home/pankaj/Yocto-practice/poky/bitbake/bin/bitbake-layers", line 9=
5, in <module>
ret =3D main()
File "/home/pankaj/Yocto-practice/poky/bitbake/bin/bitbake-layers", line 6=
3, in main
tinfoil.prepare(True)
File "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/tinfoil.py", line 41=
4, in prepare
self.run_command('parseConfiguration')
File "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/tinfoil.py", line 47=
0, in run_command
raise TinfoilCommandFailed(result[1])
bb.tinfoil.TinfoilCommandFailed: Traceback (most recent call last):
File "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/command.py", line 74=
, in runCommand
result =3D command_method(self, commandline)
File "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/command.py", line 27=
5, in parseConfiguration
command.cooker.parseConfiguration()
File "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/cooker.py", line 433=
, in parseConfiguration
self.handleCollections(self.data.getVar("BBFILE_COLLECTIONS"))
F *ile "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/cooker.py", line 1=
225, in handleCollections*
*raise CollectionError("Errors during parsing layer configuration")*
*bb.cooker.CollectionError: Errors during parsing layer configuration*

this is bblayer.conf
my=C2=A0 bblayer.conf is as following

POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
POKY_BBLAYERS_CONF_VERSION =3D "2"

BBPATH =3D "${TOPDIR}"
BBFILES ?=3D ""

BBLAYERS ?=3D " \
/home/pankajjoshi/Yocto_practice/poky/meta \
/home/pankajjoshi/Yocto_practice/poky/meta-poky \
/home/pankajjoshi/Yocto_practice/poky/meta-yocto-bsp \
/home/pankajjoshi/source_meta/meta-raspberrypi \
/home/pankajjoshi/source_meta/meta-openembedded/meta-oe \
/home/pankajjoshi/source_meta/meta-openembedded/meta-filesystems \
/home/pankajjoshi/source_meta/meta-openembedded/meta-networking \
"
i am doing anything wrong???why i am getting this error??

--QZK9biVTSXrS5CCHpZ3I
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

&nbsp;i have cloned <strong>meta-openembedded</strong> layer and from that =
i am trying to add meta-python layer but i am getting following error i am =
adding this to my poky<br /><br /><br /><strong>pankaj@exaleap-Inspiron-358=
4:~/raspberrypi4_image$ bitbake-layers add-layer /home/pankaj/meta-openembe=
dded/meta-python/</strong><br />NOTE: Starting bitbake server...<br />Trace=
back (most recent call last):<br />&nbsp; File "/home/pankaj/Yocto-practice=
/poky/bitbake/bin/bitbake-layers", line 95, in &lt;module&gt;<br />&nbsp;&n=
bsp;&nbsp; ret =3D main()<br />&nbsp; File "/home/pankaj/Yocto-practice/pok=
y/bitbake/bin/bitbake-layers", line 63, in main<br />&nbsp;&nbsp;&nbsp; tin=
foil.prepare(True)<br />&nbsp; File "/home/pankaj/Yocto-practice/poky/bitba=
ke/lib/bb/tinfoil.py", line 414, in prepare<br />&nbsp;&nbsp;&nbsp; self.ru=
n_command('parseConfiguration')<br />&nbsp; File "/home/pankaj/Yocto-practi=
ce/poky/bitbake/lib/bb/tinfoil.py", line 470, in run_command<br />&nbsp;&nb=
sp;&nbsp; raise TinfoilCommandFailed(result[1])<br />bb.tinfoil.TinfoilComm=
andFailed: Traceback (most recent call last):<br />&nbsp; File "/home/panka=
j/Yocto-practice/poky/bitbake/lib/bb/command.py", line 74, in runCommand<br=
 />&nbsp;&nbsp;&nbsp; result =3D command_method(self, commandline)<br />&nb=
sp; File "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/command.py", line=
 275, in parseConfiguration<br />&nbsp;&nbsp;&nbsp; command.cooker.parseCon=
figuration()<br />&nbsp; File "/home/pankaj/Yocto-practice/poky/bitbake/lib=
/bb/cooker.py", line 433, in parseConfiguration<br />&nbsp;&nbsp;&nbsp; sel=
f.handleCollections(self.data.getVar("BBFILE_COLLECTIONS"))<br />&nbsp; F<s=
trong>ile "/home/pankaj/Yocto-practice/poky/bitbake/lib/bb/cooker.py", line=
 1225, in handleCollections</strong><br /><strong>&nbsp;&nbsp;&nbsp; raise =
CollectionError("Errors during parsing layer configuration")</strong><br />=
<strong>bb.cooker.CollectionError: Errors during parsing layer configuratio=
n</strong><br /><br />this is bblayer.conf<br />my&nbsp; bblayer.conf is as=
 following<br /><br />&nbsp;POKY_BBLAYERS_CONF_VERSION is increased each ti=
me build/conf/bblayers.conf<br /># changes incompatibly<br />POKY_BBLAYERS_=
CONF_VERSION =3D "2"<br />&nbsp;<br />BBPATH =3D "${TOPDIR}"<br />BBFILES ?=
=
=3D ""<br />&nbsp;<br />BBLAYERS ?=3D " \<br />&nbsp; /home/pankajjoshi/Yo=
cto_practice/poky/meta \<br />&nbsp; /home/pankajjoshi/Yocto_practice/poky/=
meta-poky \<br />&nbsp; /home/pankajjoshi/Yocto_practice/poky/meta-yocto-bs=
p \<br />&nbsp; /home/pankajjoshi/source_meta/meta-raspberrypi \<br />&nbsp=
; /home/pankajjoshi/source_meta/meta-openembedded/meta-oe \<br />&nbsp; /ho=
me/pankajjoshi/source_meta/meta-openembedded/meta-filesystems \<br />&nbsp;=
 /home/pankajjoshi/source_meta/meta-openembedded/meta-networking \<br />&nb=
sp; "<br />i am doing anything wrong???why i am getting this error??<br />

--QZK9biVTSXrS5CCHpZ3I--
