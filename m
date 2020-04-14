Subject: gnome.gtk-doc() gives permission denied error in Yocto (do_install)
To: openembedded-core@lists.openembedded.org
From: vishnumotghare@gmail.com
X-Originating-Location: Bengaluru, Karnataka, IN (103.195.203.242)
X-Originating-Platform: Windows Chrome 80
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 14 Apr 2020 02:27:01 -0700
Message-ID: <gpj5.1586856421429089519.wk1S@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="FsQxkZ74BoCno7hD9CpK"

--FsQxkZ74BoCno7hD9CpK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I'm trying to generate html docs using meson build. I used gnome.gtkdoc() m=
ethod for this (meson build system).

Following is my meson.build file

>=20
> project('mydoc', 'c',
> version: '0.1.0')
>=20
> gnome =3D import('gnome')
>=20
> glib_prefix =3D dependency('glib-2.0').get_pkg config_variable('prefix')
> glib_docpath =3D join_paths(glib_prefix, 'share', 'gtk-doc', 'html')
> docpath =3D join_paths(get_option('datadir '), 'gtk-doc', 'html')
>=20
> content_files =3D [
> 'docbook-mydoc.xml',
> ]
> gnome.gtkdoc('mydoc',
> main_xml : 'main-doc.xml',
> src_dir : [
> join_paths(meson.source_root() )
> ],
> fixxref_args: [
> '--html-dir=3D' + (gnome.gtkdoc_html_dir(meson.p roject_name())),
> '--extra-dir=3D@0@'.format(join_ paths(glib_docpath, 'glib')),
> '--extra-dir=3D@0@'.format(join_ paths(glib_docpath, 'gobject')),
> '--extra-dir=3D@0@'.format(join_ paths(glib_docpath, 'gio')),
> ],
> content_files: content_files,
> install : true,
> install_dir: join_paths(meson.source_root() , 'doc')
> )

Above meson.build works fine & generates html pages in SDK environment (ge=
nerated by yocto). I've problem when running above meson.build in Yocto. It=
 gives me Permission denied error while do_install operation.

*ERROR:*

>=20
> ERROR: ['gtkdoc-mkhtml', '--path=3D/home/user/yocto/build -zeus/tmp/work=
/cortexa7t2hf-
> neon-fslc-linux-gnueabi/mydoc/ 1.0.0-r0/git/:/home/user/ yocto/build-zeu=
s/tmp/work/
> cortexa7t2hf-neon-fslc-linux- gnueabi/mydoc/1.0.0-r0/build/' , 'mydoc',
> '../main-doc.xml'] failed with status 1 Traceback (most recent call last=
):
> File "/home/user/yocto/build-zeus/t mp/work/cortexa7t2hf-neon-fslc -linu=
x-gnueabi/mydoc/1.0.0-r0/
> recipe-sysroot-native/usr/bin/ gtkdoc-mkhtml", line 51, in
> sys.exit(mkhtml.run(options)) File "/home/user/yocto/build-zeus/t mp/wor=
k/cortexa7t2hf-neon-fslc
> -linux-gnueabi/mydoc/1.0.0-r0/ recipe-sysroot-native/usr/ share/gtk-doc/=
python/gtkdoc/
> mkhtml.py", line 93, in run quiet] + remaining_args + [gtkdocdir +
> '/gtk-doc.xsl', document]) File "/home/user/yocto/build-zeus/t mp/work/c=
ortexa7t2hf-neon-fslc
> -linux-gnueabi/mydoc/1.0.0-r0/ recipe-sysroot-native/usr/ share/gtk-doc/=
python/gtkdoc/
> mkhtml.py", line 42, in run_xsltproc return subprocess.call(command + ar=
gs)
> File "/home/user/yocto/build-zeus/t mp/work/cortexa7t2hf-neon-fslc -linu=
x-gnueabi/mydoc/1.0.0-r0/
> recipe-sysroot-native/usr/lib/ python3.7/subprocess.py", line 339, in ca=
ll
> with Popen(*popenargs, **kwargs) as p: File "/home/user/yocto/build-zeus=
/t
> mp/work/cortexa7t2hf-neon-fslc -linux-gnueabi/mydoc/1.0.0-r0/ recipe-sys=
root-native/usr/lib/
> python3.7/subprocess.py", line 800, in init restore_signals,
> start_new_session) File "/home/user/yocto/build-zeus/t mp/work/cortexa7t=
2hf-neon-fslc
> -linux-gnueabi/mydoc/1.0.0-r0/ recipe-sysroot-native/usr/lib/ python3.7/=
subprocess.py",
> line 1551, in _execute_child raise child_exception_type(errno_num , err_=
msg,
> err_filename) PermissionError: [Errno 13] Permission denied: ''

I'm not sure why its giving permission denied error. Any help will be appr=
eciated.

--FsQxkZ74BoCno7hD9CpK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">I'm trying to generate html docs using meson build. I use=
d&nbsp;</span><span style=3D"color: #222222; font-family: Arial, Helvetica,=
 sans-serif; font-size: small;">gnome.gtkdoc() method for this (meson build=
 system).</span><br style=3D"color: #222222; font-family: Arial, Helvetica,=
 sans-serif; font-size: small;" /><br style=3D"color: #222222; font-family:=
 Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"color: #=
222222; font-family: Arial, Helvetica, sans-serif; font-size: small;">Follo=
wing is my meson.build file</span><br style=3D"color: #222222; font-family:=
 Arial, Helvetica, sans-serif; font-size: small;" />
<blockquote><span style=3D"color: #222222; font-family: Arial, Helvetica, =
sans-serif; font-size: small;">project('mydoc', 'c',</span><br style=3D"col=
or: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;" =
/><span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif;=
 font-size: small;">&nbsp; version: '0.1.0')</span><br style=3D"color: #222=
222; font-family: Arial, Helvetica, sans-serif; font-size: small;" /><br st=
yle=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size=
: small;" /><span style=3D"color: #222222; font-family: Arial, Helvetica, s=
ans-serif; font-size: small;">gnome =3D import('gnome')</span><br style=3D"=
color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small=
;" /><br style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif=
; font-size: small;" /><span style=3D"color: #222222; font-family: Arial, H=
elvetica, sans-serif; font-size: small;">glib_prefix =3D dependency('glib-2=
.0').get_pkg</span><wbr style=3D"color: #222222; font-family: Arial, Helvet=
ica, sans-serif; font-size: small;" /><span style=3D"color: #222222; font-f=
amily: Arial, Helvetica, sans-serif; font-size: small;">config_variable('pr=
efix')</span><br style=3D"color: #222222; font-family: Arial, Helvetica, sa=
ns-serif; font-size: small;" /><span style=3D"color: #222222; font-family: =
Arial, Helvetica, sans-serif; font-size: small;">glib_docpath =3D join_path=
s(glib_prefix, 'share', 'gtk-doc', 'html')</span><br style=3D"color: #22222=
2; font-family: Arial, Helvetica, sans-serif; font-size: small;" /><span st=
yle=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size=
: small;">docpath =3D join_paths(get_option('datadir</span><wbr style=3D"co=
lor: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;"=
 /><span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif=
; font-size: small;">'), 'gtk-doc', 'html')</span><br style=3D"color: #2222=
22; font-family: Arial, Helvetica, sans-serif; font-size: small;" /><br sty=
le=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size:=
 small;" /><span style=3D"color: #222222; font-family: Arial, Helvetica, sa=
ns-serif; font-size: small;">content_files =3D [</span><br style=3D"color: =
#222222; font-family: Arial, Helvetica, sans-serif; font-size: small;" /><s=
pan style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fon=
t-size: small;">&nbsp; 'docbook-mydoc.xml',</span><br style=3D"color: #2222=
22; font-family: Arial, Helvetica, sans-serif; font-size: small;" /><span s=
tyle=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-siz=
e: small;">]</span><br style=3D"color: #222222; font-family: Arial, Helveti=
ca, sans-serif; font-size: small;" /><span style=3D"color: #222222; font-fa=
mily: Arial, Helvetica, sans-serif; font-size: small;">gnome.gtkdoc('mydoc'=
,</span><br style=3D"color: #222222; font-family: Arial, Helvetica, sans-se=
rif; font-size: small;" /><span style=3D"color: #222222; font-family: Arial=
, Helvetica, sans-serif; font-size: small;">&nbsp; main_xml : 'main-doc.xml=
',</span><br style=3D"color: #222222; font-family: Arial, Helvetica, sans-s=
erif; font-size: small;" /><span style=3D"color: #222222; font-family: Aria=
l, Helvetica, sans-serif; font-size: small;">&nbsp; src_dir : [</span><br s=
tyle=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-siz=
e: small;" /><span style=3D"color: #222222; font-family: Arial, Helvetica, =
sans-serif; font-size: small;">&nbsp; &nbsp; &nbsp; join_paths(meson.source=
_root()</span><wbr style=3D"color: #222222; font-family: Arial, Helvetica, =
sans-serif; font-size: small;" /><span style=3D"color: #222222; font-family=
: Arial, Helvetica, sans-serif; font-size: small;">)</span><br style=3D"col=
or: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;" =
/><span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif;=
 font-size: small;">&nbsp; &nbsp;],</span><br style=3D"color: #222222; font=
-family: Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"=
color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small=
;">&nbsp; fixxref_args: [</span><br style=3D"color: #222222; font-family: A=
rial, Helvetica, sans-serif; font-size: small;" /><span style=3D"color: #22=
2222; font-family: Arial, Helvetica, sans-serif; font-size: small;">&nbsp; =
&nbsp; &nbsp; '--html-dir=3D' + (gnome.gtkdoc_html_dir(meson.p</span><wbr s=
tyle=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-siz=
e: small;" /><span style=3D"color: #222222; font-family: Arial, Helvetica, =
sans-serif; font-size: small;">roject_name())),</span><br style=3D"color: #=
222222; font-family: Arial, Helvetica, sans-serif; font-size: small;" /><sp=
an style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font=
-size: small;">&nbsp; &nbsp; &nbsp; '--extra-dir=3D@0@'.format(join_</span>=
<wbr style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small;" /><span style=3D"color: #222222; font-family: Arial, Helve=
tica, sans-serif; font-size: small;">paths(glib_docpath, 'glib')),</span><b=
r style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-=
size: small;" /><span style=3D"color: #222222; font-family: Arial, Helvetic=
a, sans-serif; font-size: small;">&nbsp; &nbsp; &nbsp; '--extra-dir=3D@0@'.=
format(join_</span><wbr style=3D"color: #222222; font-family: Arial, Helvet=
ica, sans-serif; font-size: small;" /><span style=3D"color: #222222; font-f=
amily: Arial, Helvetica, sans-serif; font-size: small;">paths(glib_docpath,=
 'gobject')),</span><br style=3D"color: #222222; font-family: Arial, Helvet=
ica, sans-serif; font-size: small;" /><span style=3D"color: #222222; font-f=
amily: Arial, Helvetica, sans-serif; font-size: small;">&nbsp; &nbsp; &nbsp=
; '--extra-dir=3D@0@'.format(join_</span><wbr style=3D"color: #222222; font=
-family: Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"=
color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small=
;">paths(glib_docpath, 'gio')),</span><br style=3D"color: #222222; font-fam=
ily: Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"colo=
r: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;">&=
nbsp; &nbsp; ],</span><br style=3D"color: #222222; font-family: Arial, Helv=
etica, sans-serif; font-size: small;" /><span style=3D"color: #222222; font=
-family: Arial, Helvetica, sans-serif; font-size: small;">&nbsp; content_fi=
les: content_files,</span><br style=3D"color: #222222; font-family: Arial, =
Helvetica, sans-serif; font-size: small;" /><span style=3D"color: #222222; =
font-family: Arial, Helvetica, sans-serif; font-size: small;">&nbsp; instal=
l : true,</span><br style=3D"color: #222222; font-family: Arial, Helvetica,=
 sans-serif; font-size: small;" /><span style=3D"color: #222222; font-famil=
y: Arial, Helvetica, sans-serif; font-size: small;">&nbsp; install_dir: joi=
n_paths(meson.source_root()</span><wbr style=3D"color: #222222; font-family=
: Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"color: =
#222222; font-family: Arial, Helvetica, sans-serif; font-size: small;">, 'd=
oc')</span><br style=3D"color: #222222; font-family: Arial, Helvetica, sans=
-serif; font-size: small;" /><span style=3D"color: #222222; font-family: Ar=
ial, Helvetica, sans-serif; font-size: small;">)</span></blockquote>
<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; =
font-size: small;">Above meson.build works fine &amp; generates html pages =
in SDK environment&nbsp;</span><span style=3D"color: #222222; font-family: =
Arial, Helvetica, sans-serif; font-size: small;">(generated by yocto). I've=
 problem when running above meson.build in&nbsp;</span><span style=3D"color=
: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;">Yo=
cto. It gives me Permission denied error while do_install operation.</span>=
<br style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fon=
t-size: small;" /><br style=3D"color: #222222; font-family: Arial, Helvetic=
a, sans-serif; font-size: small;" /><strong><span style=3D"color: #222222; =
font-family: Arial, Helvetica, sans-serif; font-size: small;">ERROR:</span>=
</strong><br style=3D"color: #222222; font-family: Arial, Helvetica, sans-s=
erif; font-size: small;" /><br style=3D"color: #222222; font-family: Arial,=
 Helvetica, sans-serif; font-size: small;" />
<blockquote><span style=3D"color: #222222; font-family: Arial, Helvetica, =
sans-serif; font-size: small;">ERROR: ['gtkdoc-mkhtml',</span><span style=
=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: =
small;">'--path=3D/home/user/yocto/build</span><wbr style=3D"color: #222222=
; font-family: Arial, Helvetica, sans-serif; font-size: small;" /><span sty=
le=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size:=
 small;">-zeus/tmp/work/cortexa7t2hf-</span><wbr style=3D"color: #222222; f=
ont-family: Arial, Helvetica, sans-serif; font-size: small;" /><span style=
=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: =
small;">neon-fslc-linux-gnueabi/mydoc/</span><wbr style=3D"color: #222222; =
font-family: Arial, Helvetica, sans-serif; font-size: small;" /><span style=
=
=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: =
small;">1.0.0-r0/git/:/home/user/</span><wbr style=3D"color: #222222; font-=
family: Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"c=
olor: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;=
">yocto/build-zeus/tmp/work/</span><wbr style=3D"color: #222222; font-famil=
y: Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"color:=
 #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;">cor=
texa7t2hf-neon-fslc-linux-</span><wbr style=3D"color: #222222; font-family:=
 Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"color: #=
222222; font-family: Arial, Helvetica, sans-serif; font-size: small;">gnuea=
bi/mydoc/1.0.0-r0/build/'</span><wbr style=3D"color: #222222; font-family: =
Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"color: #2=
22222; font-family: Arial, Helvetica, sans-serif; font-size: small;">,</spa=
n><span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif;=
 font-size: small;">'mydoc', '../main-doc.xml'] failed with status 1</span>=
<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Traceback (most recent call last):</span><span style=3D"c=
olor: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;=
">File "/home/user/yocto/build-zeus/t</span><wbr style=3D"color: #222222; f=
ont-family: Arial, Helvetica, sans-serif; font-size: small;" /><span style=
=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: =
small;">mp/work/cortexa7t2hf-neon-fslc</span><wbr style=3D"color: #222222; =
font-family: Arial, Helvetica, sans-serif; font-size: small;" /><span style=
=
=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: =
small;">-linux-gnueabi/mydoc/1.0.0-r0/</span><wbr style=3D"color: #222222; =
font-family: Arial, Helvetica, sans-serif; font-size: small;" /><span style=
=
=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: =
small;">recipe-sysroot-native/usr/bin/</span><wbr style=3D"color: #222222; =
font-family: Arial, Helvetica, sans-serif; font-size: small;" /><span style=
=
=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: =
small;">gtkdoc-mkhtml",</span><span style=3D"color: #222222; font-family: A=
rial, Helvetica, sans-serif; font-size: small;">line 51, in sys.exit(mkhtml=
.run(options)) File</span><span style=3D"color: #222222; font-family: Arial=
, Helvetica, sans-serif; font-size: small;">"/home/user/yocto/build-zeus/t<=
/span><wbr style=3D"color: #222222; font-family: Arial, Helvetica, sans-ser=
if; font-size: small;" /><span style=3D"color: #222222; font-family: Arial,=
 Helvetica, sans-serif; font-size: small;">mp/work/cortexa7t2hf-neon-fslc</=
span><wbr style=3D"color: #222222; font-family: Arial, Helvetica, sans-seri=
f; font-size: small;" /><span style=3D"color: #222222; font-family: Arial, =
Helvetica, sans-serif; font-size: small;">-linux-gnueabi/mydoc/1.0.0-r0/</s=
pan><wbr style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif=
; font-size: small;" /><span style=3D"color: #222222; font-family: Arial, H=
elvetica, sans-serif; font-size: small;">recipe-sysroot-native/usr/</span><=
wbr style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fon=
t-size: small;" /><span style=3D"color: #222222; font-family: Arial, Helvet=
ica, sans-serif; font-size: small;">share/gtk-doc/python/gtkdoc/</span><wbr=
 style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-s=
ize: small;" /><span style=3D"color: #222222; font-family: Arial, Helvetica=
, sans-serif; font-size: small;">mkhtml.py",</span><span style=3D"color: #2=
22222; font-family: Arial, Helvetica, sans-serif; font-size: small;">line 9=
3, in run quiet] + remaining_args + [gtkdocdir + '/gtk-doc.xsl',</span><spa=
n style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-=
size: small;">document])</span><span style=3D"color: #222222; font-family: =
Arial, Helvetica, sans-serif; font-size: small;">File "/home/user/yocto/bui=
ld-zeus/t</span><wbr style=3D"color: #222222; font-family: Arial, Helvetica=
, sans-serif; font-size: small;" /><span style=3D"color: #222222; font-fami=
ly: Arial, Helvetica, sans-serif; font-size: small;">mp/work/cortexa7t2hf-n=
eon-fslc</span><wbr style=3D"color: #222222; font-family: Arial, Helvetica,=
 sans-serif; font-size: small;" /><span style=3D"color: #222222; font-famil=
y: Arial, Helvetica, sans-serif; font-size: small;">-linux-gnueabi/mydoc/1.=
0.0-r0/</span><wbr style=3D"color: #222222; font-family: Arial, Helvetica, =
sans-serif; font-size: small;" /><span style=3D"color: #222222; font-family=
: Arial, Helvetica, sans-serif; font-size: small;">recipe-sysroot-native/us=
r/</span><wbr style=3D"color: #222222; font-family: Arial, Helvetica, sans-=
serif; font-size: small;" /><span style=3D"color: #222222; font-family: Ari=
al, Helvetica, sans-serif; font-size: small;">share/gtk-doc/python/gtkdoc/<=
/span><wbr style=3D"color: #222222; font-family: Arial, Helvetica, sans-ser=
if; font-size: small;" /><span style=3D"color: #222222; font-family: Arial,=
 Helvetica, sans-serif; font-size: small;">mkhtml.py",</span><span style=3D=
"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: smal=
l;">line 42, in run_xsltproc return subprocess.call(command + args)</span><=
span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small;">File "/home/user/yocto/build-zeus/t</span><wbr style=3D"co=
lor: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;"=
 /><span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif=
; font-size: small;">mp/work/cortexa7t2hf-neon-fslc</span><wbr style=3D"col=
or: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;" =
/><span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif;=
 font-size: small;">-linux-gnueabi/mydoc/1.0.0-r0/</span><wbr style=3D"colo=
r: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;" /=
><span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; =
font-size: small;">recipe-sysroot-native/usr/lib/</span><wbr style=3D"color=
: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;" />=
<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">python3.7/subprocess.py",</span><span style=3D"color: #22=
2222; font-family: Arial, Helvetica, sans-serif; font-size: small;">line 33=
9, in call with Popen(*popenargs, **kwargs) as p:</span><span style=3D"colo=
r: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;">F=
ile "/home/user/yocto/build-zeus/t</span><wbr style=3D"color: #222222; font=
-family: Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"=
color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small=
;">mp/work/cortexa7t2hf-neon-fslc</span><wbr style=3D"color: #222222; font-=
family: Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"c=
olor: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;=
">-linux-gnueabi/mydoc/1.0.0-r0/</span><wbr style=3D"color: #222222; font-f=
amily: Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"co=
lor: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;"=
>recipe-sysroot-native/usr/lib/</span><wbr style=3D"color: #222222; font-fa=
mily: Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"col=
or: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;">=
python3.7/subprocess.py",</span><span style=3D"color: #222222; font-family:=
 Arial, Helvetica, sans-serif; font-size: small;">line 800, in init restore=
_signals, start_new_session)</span><span style=3D"color: #222222; font-fami=
ly: Arial, Helvetica, sans-serif; font-size: small;">File "/home/user/yocto=
/build-zeus/t</span><wbr style=3D"color: #222222; font-family: Arial, Helve=
tica, sans-serif; font-size: small;" /><span style=3D"color: #222222; font-=
family: Arial, Helvetica, sans-serif; font-size: small;">mp/work/cortexa7t2=
hf-neon-fslc</span><wbr style=3D"color: #222222; font-family: Arial, Helvet=
ica, sans-serif; font-size: small;" /><span style=3D"color: #222222; font-f=
amily: Arial, Helvetica, sans-serif; font-size: small;">-linux-gnueabi/mydo=
c/1.0.0-r0/</span><wbr style=3D"color: #222222; font-family: Arial, Helveti=
ca, sans-serif; font-size: small;" /><span style=3D"color: #222222; font-fa=
mily: Arial, Helvetica, sans-serif; font-size: small;">recipe-sysroot-nativ=
e/usr/lib/</span><wbr style=3D"color: #222222; font-family: Arial, Helvetic=
a, sans-serif; font-size: small;" /><span style=3D"color: #222222; font-fam=
ily: Arial, Helvetica, sans-serif; font-size: small;">python3.7/subprocess.=
py",</span><span style=3D"color: #222222; font-family: Arial, Helvetica, sa=
ns-serif; font-size: small;">line 1551, in _execute_child raise child_excep=
tion_type(errno_num</span><wbr style=3D"color: #222222; font-family: Arial,=
 Helvetica, sans-serif; font-size: small;" /><span style=3D"color: #222222;=
 font-family: Arial, Helvetica, sans-serif; font-size: small;">,</span><spa=
n style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-=
size: small;">err_msg, err_filename) PermissionError: [Errno 13] Permission=
 denied:</span><span style=3D"color: #222222; font-family: Arial, Helvetica=
, sans-serif; font-size: small;">''</span></blockquote>
<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; =
font-size: small;">I'm not sure why its giving permission denied error. Any=
 help will be&nbsp;</span><span style=3D"color: #222222; font-family: Arial=
, Helvetica, sans-serif; font-size: small;">appreciated.</span>

--FsQxkZ74BoCno7hD9CpK--
