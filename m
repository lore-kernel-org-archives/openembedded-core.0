Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SWm5d-0005AM-RO
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 12:13:18 +0200
Received: by ggnp4 with SMTP id p4so5245834ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 03:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=l1u+zCWmbXUmwXylFStxfi32f380KqbMlHrZW20VWfQ=;
	b=DKFVBbXl13NEaUIpkLjPzCqIi3KgMpac1Ie+pFb+8G2adAXWs1jFqoFbzUBq9hQ9ac
	nxBY0TK4UKCzUr/RGs79XJPf81dEc66g8FZQPZjm87FJOc2X7RhxXApZL215Gqlt99ZL
	HCuFp+hN+yaND8QPcC77QavoerH+yYiDpEYJGfsQTrZ5TkVDOFPKSN4J8M3tptBvHMhE
	9io1bGSR7EpxZy1sxvBlXypBQfYet0IPM4u+6dTbdNROMX7fnYp/+205TIkJColPTW6a
	46E470jwQ+c43VfoN77ojuhjAzb3S8bay0um44bH0nUL781jlzFMPDm5ye76QetgN5ou
	o0TA==
Received: by 10.50.140.5 with SMTP id rc5mr9034462igb.40.1337680942695; Tue,
	22 May 2012 03:02:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.18 with HTTP; Tue, 22 May 2012 03:02:02 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAPhnLPBSsP3acUN1uZvPDVCq6PzXF8mGGsFyvgdbfz6EuZ_RSA@mail.gmail.com>
References: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
	<CADkTA4MXvMJt=JhDKdjDR9o3nkYVWmfnEmRnC1cheju6Tbh0Sw@mail.gmail.com>
	<4FB50005.7000807@gherzan.ro>
	<CAPhnLPDzZfuRBKxR3Ru+2nvozRy4evhmtFUf2d-NmqNwY4RjZw@mail.gmail.com>
	<CAK18fxH5H5En0H+k7VccgGUCPApwcL7Xs+RV=1=pvRu_wRYXVQ@mail.gmail.com>
	<CAPhnLPBSsP3acUN1uZvPDVCq6PzXF8mGGsFyvgdbfz6EuZ_RSA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 22 May 2012 13:02:02 +0300
Message-ID: <CAK18fxHfOZ0y07uuRfu6CVPR6KGbbH_NhEd8-HM-17sro3hAkw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmD4bYCNBwUxf4EzxpKpQHhVGoNFKJ5e7lRepvQ82kvX3kuMnSEufVuL0p1lM9kVa9xM2u9
Subject: Re: Linux-yocto 3.0 crashes at do_patch...
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
X-List-Received-Date: Tue, 22 May 2012 10:13:18 -0000
Content-Type: multipart/alternative; boundary=e89a8f83a34b6985f604c09d1d6f

--e89a8f83a34b6985f604c09d1d6f
Content-Type: text/plain; charset=ISO-8859-1

Even after using your workaround i can still reproduce this issue. Yocto
linux still fails.

| ERROR. Could not find an excutable target for yocto/standard/base
| ERROR. Could not locate meta series for yocto/standard/beagleboard
| ERROR. Could not modify yocto/standard/base
NOTE: package
linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4:
task do_patch: Failed
ERROR: Task 3 (/media/HDD/yocto/poky/meta/recipes-kernel/linux/
linux-yocto_3.0.bb, do_patch) failed with exit code '1'

On Thu, May 17, 2012 at 11:48 PM, Flanagan, Elizabeth <
elizabeth.flanagan@intel.com> wrote:

> On Thu, May 17, 2012 at 7:59 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > Today i just gave another try.... same result.
>
> Responding here as well as the yocto list:
>
> A few people have been having this issue and after some discussion we
> think we have a root cause. Let me first explain what happened.
>
> The autobuilder infrastructure shares a common DL_DIR in order to
> optimize the builds and provide the source mirror. This DL_DIR is
> rsynced to the publicaly available source mirror on a regular basis.
> During our infrastructure upgrade the autobuilder attempted to pull
> the tar archive for linux-yocto-3.0
> (
> http://downloads.yoctoproject.org/mirror/sources/git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz
> )
> but due to network issues related to our recent infrastructure upgrade
> the file ended up as a 0 byte file. This file was rsynced the the
> source mirror. A few days ago this was mentioned as an issue. Michael
> Halstead corrected the network issue and I manually removed the file.
> The autobuilder repulled the archive correctly and repopulated the
> source mirror with it.
>
> Things should have been ok at this point. However, we were still
> getting reports of people sporadically running into a 0 byte file. Not
> all the time, but some of the time. Michael Halstead and I just tailed
> out the apache logs with Tom Zanussi wgetting the problematic file,
> watching for failures. No failures were seen in the error logs however
> Tom was still getting sporadic 0 byte files. Which means that his
> request wasn't even hitting the server. I was not able to replicate
> this. The only difference we could see is that I generally do not go
> through a proxy whereas Tom was.
>
> Our theory at this point is that all of the people who are hitting
> this issue are going through a proxy and that their proxy setup has
> cached that 0 byte file and refuses to regenerate it. There isn't a
> lot we can do from our end about that other than suggest the following
> work around. If you run into odd fetch issues with *just* the
> linux-yocto-3.0 tar archive, clear out your DL_DIR of
> git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz and set the
> following:
>
> PREMIRRORS ?= "\
> bzr://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
> cvs://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
> git://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
> hg://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
> osc://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
> p4://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
> svk://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
> svn://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n"
>
> MIRRORS =+ "\
> ftp://.*/.*      http://autobuilder.yoctoproject.org/sources/ \n \
> http://.*/.*     http://autobuilder.yoctoproject.org/sources/ \n \
> https://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n"
>
> This will force the fetch to go to the autobuilder host of sources and
> should work around any proxy caching issues. Then call your local IT
> folks and ask them to clear out your proxy cache. If you run into any
> fetch issues not related to this file, please let me know.
>
> -b
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8f83a34b6985f604c09d1d6f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Even after using your workaround i can still reproduce this issue. Yocto li=
nux still fails.<br>
<br><div>| ERROR. Could not find an excutable target for yocto/standard/bas=
e</div><div>| ERROR. Could not locate meta series for yocto/standard/beagle=
board</div><div>| ERROR. Could not modify yocto/standard/base</div><div>

NOTE: package linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7e=
e23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4: task do_patch: Failed</d=
iv><div>ERROR: Task 3 (/media/HDD/yocto/poky/meta/recipes-kernel/linux/<a h=
ref=3D"http://linux-yocto_3.0.bb">linux-yocto_3.0.bb</a>, do_patch) failed =
with exit code &#39;1&#39;</div>

<div><br></div><div>On Thu, May 17, 2012 at 11:48 PM, Flanagan, Elizabeth <=
span dir=3D"ltr">&lt;<a href=3D"mailto:elizabeth.flanagan@intel.com" target=
=3D"_blank">elizabeth.flanagan@intel.com</a>&gt;</span> wrote:</div><div cl=
ass=3D"gmail_quote">

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Thu, May 17, 2012 at 7:59 AM, Andrei Gher=
zan &lt;<a href=3D"mailto:andrei@gherzan.ro">andrei@gherzan.ro</a>&gt; wrot=
e:<br>


&gt; Today i just gave another try.... same result.<br>
<br>
Responding here as well as the yocto list:<br>
<br>
A few people have been having this issue and after some discussion we<br>
think we have a root cause. Let me first explain what happened.<br>
<br>
The autobuilder infrastructure shares a common DL_DIR in order to<br>
optimize the builds and provide the source mirror. This DL_DIR is<br>
rsynced to the publicaly available source mirror on a regular basis.<br>
During our infrastructure upgrade the autobuilder attempted to pull<br>
the tar archive for linux-yocto-3.0<br>
(<a href=3D"http://downloads.yoctoproject.org/mirror/sources/git2_git.yocto=
project.org.linux-yocto-3.0.tar.gz" target=3D"_blank">http://downloads.yoct=
oproject.org/mirror/sources/git2_git.yoctoproject.org.linux-yocto-3.0.tar.g=
z</a>)<br>


but due to network issues related to our recent infrastructure upgrade<br>
the file ended up as a 0 byte file. This file was rsynced the the<br>
source mirror. A few days ago this was mentioned as an issue. Michael<br>
Halstead corrected the network issue and I manually removed the file.<br>
The autobuilder repulled the archive correctly and repopulated the<br>
source mirror with it.<br>
<br>
Things should have been ok at this point. However, we were still<br>
getting reports of people sporadically running into a 0 byte file. Not<br>
all the time, but some of the time. Michael Halstead and I just tailed<br>
out the apache logs with Tom Zanussi wgetting the problematic file,<br>
watching for failures. No failures were seen in the error logs however<br>
Tom was still getting sporadic 0 byte files. Which means that his<br>
request wasn&#39;t even hitting the server. I was not able to replicate<br>
this. The only difference we could see is that I generally do not go<br>
through a proxy whereas Tom was.<br>
<br>
Our theory at this point is that all of the people who are hitting<br>
this issue are going through a proxy and that their proxy setup has<br>
cached that 0 byte file and refuses to regenerate it. There isn&#39;t a<br>
lot we can do from our end about that other than suggest the following<br>
work around. If you run into odd fetch issues with *just* the<br>
linux-yocto-3.0 tar archive, clear out your DL_DIR of<br>
git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz and set the<br>
following:<br>
<br>
PREMIRRORS ?=3D &quot;\<br>
bzr://.*/.* =A0 <a href=3D"http://autobuilder.yoctoproject.org/sources/" ta=
rget=3D"_blank">http://autobuilder.yoctoproject.org/sources/</a> \n \<br>
cvs://.*/.* =A0 <a href=3D"http://autobuilder.yoctoproject.org/sources/" ta=
rget=3D"_blank">http://autobuilder.yoctoproject.org/sources/</a> \n \<br>
git://.*/.* =A0 <a href=3D"http://autobuilder.yoctoproject.org/sources/" ta=
rget=3D"_blank">http://autobuilder.yoctoproject.org/sources/</a> \n \<br>
hg://.*/.* =A0 =A0<a href=3D"http://autobuilder.yoctoproject.org/sources/" =
target=3D"_blank">http://autobuilder.yoctoproject.org/sources/</a> \n \<br>
osc://.*/.* =A0 <a href=3D"http://autobuilder.yoctoproject.org/sources/" ta=
rget=3D"_blank">http://autobuilder.yoctoproject.org/sources/</a> \n \<br>
p4://.*/.* =A0 =A0<a href=3D"http://autobuilder.yoctoproject.org/sources/" =
target=3D"_blank">http://autobuilder.yoctoproject.org/sources/</a> \n \<br>
svk://.*/.* =A0 <a href=3D"http://autobuilder.yoctoproject.org/sources/" ta=
rget=3D"_blank">http://autobuilder.yoctoproject.org/sources/</a> \n \<br>
svn://.*/.* =A0 <a href=3D"http://autobuilder.yoctoproject.org/sources/" ta=
rget=3D"_blank">http://autobuilder.yoctoproject.org/sources/</a> \n&quot;<b=
r>
<br>
MIRRORS =3D+ &quot;\<br>
ftp://.*/.* =A0 =A0 =A0<a href=3D"http://autobuilder.yoctoproject.org/sourc=
es/" target=3D"_blank">http://autobuilder.yoctoproject.org/sources/</a> \n =
\<br>
http://.*/.* =A0 =A0 <a href=3D"http://autobuilder.yoctoproject.org/sources=
/" target=3D"_blank">http://autobuilder.yoctoproject.org/sources/</a> \n \<=
br>
https://.*/.* =A0 =A0<a href=3D"http://autobuilder.yoctoproject.org/sources=
/" target=3D"_blank">http://autobuilder.yoctoproject.org/sources/</a> \n&qu=
ot;<br>
<br>
This will force the fetch to go to the autobuilder host of sources and<br>
should work around any proxy caching issues. Then call your local IT<br>
folks and ask them to clear out your proxy cache. If you run into any<br>
fetch issues not related to this file, please let me know.<br>
<br>
-b<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br>

--e89a8f83a34b6985f604c09d1d6f--
