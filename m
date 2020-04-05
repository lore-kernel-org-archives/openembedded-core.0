Subject: Error running GO-lang executable on target device
To: openembedded-core@lists.openembedded.org
From: salman.isd@gmail.com
X-Originating-Location: Bielefeld, North Rhine-Westphalia, DE (37.201.144.70)
X-Originating-Platform: Windows Chrome 80
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 05 Apr 2020 05:11:10 -0700
Message-ID: <tPpi.1586088670119465866.XDw9@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="6JIIbjLMfma2LuJfHCAU"

--6JIIbjLMfma2LuJfHCAU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I am trying to run the yocto go example on my arm target device. This is th=
e receipe I am using https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/=
recipes-extended/go-examples/go-helloworld_0.1.bb
I made one change to the recipe. I added GO_LINKSHARED=3D"" which removes =
the runtime dependecy of the package on "go-runtime".
I have used both go 1.12 and go 1.14

The package is built correctly. I transfer and try to run on the device bu=
t this error.
./go-helloworld
-sh: ./go-helloworld: No such file or directory

Running file on the binary shows
file go-helloworld
go-helloworld: ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV),=
 dynamically linked, interpreter /lib/ld-linux.so.3, BuildID[sha1]=3Db5d8fa=
526402b35c3233f7ce3e578eb9596d9de8, for GNU/Linux 3.2.0, stripped

There is no ld-linux.so.3 on my device, only ld-linux-armhf.so.3. So I cre=
ade a symlink like shown
ld-linux.so.3 ->=C2=A0ld-linux-armhf.so.3

Tried to run my binary again and this time it segfaults.

Does anyone have an idea what might be going on? All my C programs built w=
ith yocto refer to the correct ld-linux-armhf.so.3 and run fine.Do I need t=
o install some other go-related stuff before running my program?

--6JIIbjLMfma2LuJfHCAU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I am trying to run the yocto go example on my arm target device. This is th=
e receipe I am using&nbsp;<a style=3D"background-color: #ffffff;" href=3D"h=
ttps://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-extended/go-ex=
amples/go-helloworld_0.1.bb" target=3D"_blank" rel=3D"nofollow noopener">ht=
tps://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-extended/go-exa=
mples/go-helloworld_0.1.bb</a><br />I made one change to the recipe. I adde=
d GO_LINKSHARED=3D"" which removes the runtime dependecy of the package on =
"go-runtime".<br />I have used both go 1.12 and go 1.14<br /><br />The pack=
age is built correctly. I transfer and try to run on the device but this er=
ror.<br />
<div><span style=3D"font-weight: bold;">./go-helloworld&nbsp;</span></div>
<div>-sh: ./go-helloworld: No such file or directory</div>
<div><br />Running&nbsp;<span style=3D"font-weight: bold;">file</span>&nbs=
p;on the binary shows<br />
<div><span style=3D"font-weight: bold;">file go-helloworld&nbsp;</span></d=
iv>
<div>go-helloworld: ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (S=
YSV), dynamically linked, interpreter /lib/ld-linux.so.3, BuildID[sha1]=3Db=
5d8fa526402b35c3233f7ce3e578eb9596d9de8, for GNU/Linux 3.2.0, stripped<br /=
><br />There is no ld-linux.so.3 on my device, only ld-linux-armhf.so.3. So=
 I creade a symlink like shown<br />ld-linux.so.3 -&gt;&nbsp;ld-linux-armhf=
.so.3<br /><br />Tried to run my binary again and this time it segfaults.<b=
r /><br />Does anyone have an idea what might be going on? All my C program=
s built with yocto refer to the correct ld-linux-armhf.so.3 and run fine.Do=
 I need to install some other go-related stuff before running my program?</=
div>
</div>

--6JIIbjLMfma2LuJfHCAU--
