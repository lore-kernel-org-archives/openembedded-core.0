Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 480946E3EC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 18:00:25 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id uy5so854128obc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2014 10:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Rrne4wsISxIKkFQ5k0vCMl7UBLq/vtIaayLMmYtcHTk=;
	b=H43IUdLlvFmCNDGtNM5GzCed56kkhETGMYas3Th/H6CjLWw3/wQ1PT5ALBMcixNt2V
	YDGGKlGEN+WkDo0T25DdrIwEwmKjFWOQm8xOO/2QJ/DtasyiKgbKcsGmn5iSG+evKFgN
	yeVEo2rb/evFompaXes0yc0t63SsbcZ1If3vVXC4AUb3gdDq7upM8DrhxC19KFrIvENb
	/RyfBxpYWgPF3cLrAEP6Q0qS+xWRX4DknYDn8CGABf61cun3NGkx0GwNfYeec+AUWVL0
	QCso5Dl/H/Q3kEdxFsIywKT8KdL/6smMIMp8uOGhkwrvwxxm97+i20C9wl1CZDlyOZ0Y
	yT/w==
MIME-Version: 1.0
X-Received: by 10.182.157.114 with SMTP id wl18mr2602284obb.52.1391623225778; 
	Wed, 05 Feb 2014 10:00:25 -0800 (PST)
Received: by 10.60.40.200 with HTTP; Wed, 5 Feb 2014 10:00:25 -0800 (PST)
Received: by 10.60.40.200 with HTTP; Wed, 5 Feb 2014 10:00:25 -0800 (PST)
In-Reply-To: <20140205144334.GG5112@lpalcu-linux>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>
	<cover.1391594312.git.laurentiu.palcu@intel.com>
	<CAAKB1h3PL6oyL0VG70SVXSMEROxrwX0sJDc82WO+0e=QvSKiaw@mail.gmail.com>
	<52F229E1.3040204@enea.com> <20140205144334.GG5112@lpalcu-linux>
Date: Wed, 5 Feb 2014 19:00:25 +0100
Message-ID: <CAAKB1h1wW3Pb+r_0M6K38scWs-EcKCcpBnqq0vD6LaKSSzZh2A@mail.gmail.com>
From: David Nystrom <david.c.nystrom@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 00/50] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Wed, 05 Feb 2014 18:00:25 -0000
Content-Type: multipart/alternative; boundary=f46d0418283008a7f104f1ac88d0

--f46d0418283008a7f104f1ac88d0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 5 Feb 2014 15:43, "Laurentiu Palcu" <laurentiu.palcu@intel.com> wrote:
>
> On Wed, Feb 05, 2014 at 01:09:05PM +0100, David Nystr=F6m wrote:
> > >
> > >| NOTE: Installing complementary packages ...
> > >| NOTE: Installing the following packages:
> > >| /media/sdb5/bld/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl: the
> > >``install'' command requires at least one argument
> > >| NOTE: Unable to install packages. Command
> > >/media/sdb5/bld/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f
> >
>/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/opkg=
.conf
> > >-o
> >
>/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/root=
fs
> > >--force_postinstall --prefer-arch-to-version   install  returned 1
> I'll send a quick fix for this. This, however, is not the reason of the
> build failure. It's complementary packages that are installed and an
> empty list is passed to install(). Since these are attempt only
> packages, the build does not fail because of this. Anyway, I added a
> simple check and I will send a v3.
>
> > >| NOTE: Running intercept scripts:
> > >| NOTE: Executing write_package_manifest ...
> > >| DEBUG: Executing python function write_package_manifest
> > >| NOTE: Building from feeds activated!
> > >| NOTE: Add all feed with URL
> > >file:///media/sdb5/oel/build/tmp/deploy/ipk/all
> > >| NOTE: Add qemuppc feed with URL
> > >file:///media/sdb5/oel/build/tmp/deploy/ipk/qemuppc
> > >| NOTE: Add ppc7400 feed with URL
> > >file:///media/sdb5/oel/build/tmp/deploy/ipk/ppc7400
> > >| DEBUG: Python function write_package_manifest finished
> > >| NOTE: Executing license_create_manifest ...
> > >| DEBUG: Executing shell function license_create_manifest
> > >| ls: cannot access
> >
>/media/sdb5/bld/tmp/sysroots/qemuppc/pkgdata/runtime-reverse/base-files: N=
o
> > >such file or directory
> > >| readlink: missing operand
> > >| Try 'readlink --help' for more information.
> > >| basename: missing operand
> > >| Try 'basename --help' for more information.
> > >| WARNING: exit code 1 from a shell command.
> > >| DEBUG: Python function do_rootfs finished
> > >| ERROR: Function failed: license_create_manifest (log file is located
at
> >
>/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/temp=
/log.do_rootfs.29007)
> Now, this is the interesting part which, btw, happens on master too.
That's
> because you're installing from feeds and you're installing an older
> version that has different packages than the latest (these are read from
> package.manifest). The YP 1.5 core-image-minimal package.manifest
> contains update-alternatives-cworth. The latest core-image-minimal does
> not contain this package anymore. It contains update-alternatives-opkg.

Thanks Laurentiu,
The 1.5 repo reference was just to give you an easy testcase. Sorry for
creating  confusion.
My debug run above was done with a repo created by poky on the master
branch.

>
> The easiest way would be to add a check in license_create_manifest() to
> just ignore packages that cannot be found. However, since we're dealing
> with licenses here, I honestly don't know if this is the right way of
> doing it...

Good point, I think it might be better to avoid creating a manifest, rather
than creating a potentially bogus manifest when using the FEEDS
functionality.

The per-package licenses should be already existing in the repo when using
a feed.

//DD

Br,
David
>
> laurentiu
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--f46d0418283008a7f104f1ac88d0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 5 Feb 2014 15:43, &quot;Laurentiu Palcu&quot; &lt;<a href=3D"mailto:laur=
entiu.palcu@intel.com">laurentiu.palcu@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Feb 05, 2014 at 01:09:05PM +0100, David Nystr=F6m wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;| NOTE: Installing complementary packages ...<br>
&gt; &gt; &gt;| NOTE: Installing the following packages:<br>
&gt; &gt; &gt;| /media/sdb5/bld/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl: =
the<br>
&gt; &gt; &gt;``install&#39;&#39; command requires at least one argument<br=
>
&gt; &gt; &gt;| NOTE: Unable to install packages. Command<br>
&gt; &gt; &gt;/media/sdb5/bld/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f<=
br>
&gt; &gt; &gt;/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minima=
l/1.0-r0/opkg.conf<br>
&gt; &gt; &gt;-o<br>
&gt; &gt; &gt;/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minima=
l/1.0-r0/rootfs<br>
&gt; &gt; &gt;--force_postinstall --prefer-arch-to-version =A0 install =A0r=
eturned 1<br>
&gt; I&#39;ll send a quick fix for this. This, however, is not the reason o=
f the<br>
&gt; build failure. It&#39;s complementary packages that are installed and =
an<br>
&gt; empty list is passed to install(). Since these are attempt only<br>
&gt; packages, the build does not fail because of this. Anyway, I added a<b=
r>
&gt; simple check and I will send a v3.<br>
&gt;<br>
&gt; &gt; &gt;| NOTE: Running intercept scripts:<br>
&gt; &gt; &gt;| NOTE: Executing write_package_manifest ...<br>
&gt; &gt; &gt;| DEBUG: Executing python function write_package_manifest<br>
&gt; &gt; &gt;| NOTE: Building from feeds activated!<br>
&gt; &gt; &gt;| NOTE: Add all feed with URL<br>
&gt; &gt; &gt;file:///media/sdb5/oel/build/tmp/deploy/ipk/all<br>
&gt; &gt; &gt;| NOTE: Add qemuppc feed with URL<br>
&gt; &gt; &gt;file:///media/sdb5/oel/build/tmp/deploy/ipk/qemuppc<br>
&gt; &gt; &gt;| NOTE: Add ppc7400 feed with URL<br>
&gt; &gt; &gt;file:///media/sdb5/oel/build/tmp/deploy/ipk/ppc7400<br>
&gt; &gt; &gt;| DEBUG: Python function write_package_manifest finished<br>
&gt; &gt; &gt;| NOTE: Executing license_create_manifest ...<br>
&gt; &gt; &gt;| DEBUG: Executing shell function license_create_manifest<br>
&gt; &gt; &gt;| ls: cannot access<br>
&gt; &gt; &gt;/media/sdb5/bld/tmp/sysroots/qemuppc/pkgdata/runtime-reverse/=
base-files: No<br>
&gt; &gt; &gt;such file or directory<br>
&gt; &gt; &gt;| readlink: missing operand<br>
&gt; &gt; &gt;| Try &#39;readlink --help&#39; for more information.<br>
&gt; &gt; &gt;| basename: missing operand<br>
&gt; &gt; &gt;| Try &#39;basename --help&#39; for more information.<br>
&gt; &gt; &gt;| WARNING: exit code 1 from a shell command.<br>
&gt; &gt; &gt;| DEBUG: Python function do_rootfs finished<br>
&gt; &gt; &gt;| ERROR: Function failed: license_create_manifest (log file i=
s located at<br>
&gt; &gt; &gt;/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minima=
l/1.0-r0/temp/log.do_rootfs.29007)<br>
&gt; Now, this is the interesting part which, btw, happens on master too. T=
hat&#39;s<br>
&gt; because you&#39;re installing from feeds and you&#39;re installing an =
older<br>
&gt; version that has different packages than the latest (these are read fr=
om<br>
&gt; package.manifest). The YP 1.5 core-image-minimal package.manifest<br>
&gt; contains update-alternatives-cworth. The latest core-image-minimal doe=
s<br>
&gt; not contain this package anymore. It contains update-alternatives-opkg=
.</p>
<p dir=3D"ltr">Thanks Laurentiu,<br>
The 1.5 repo reference was just to give you an easy testcase. Sorry for cre=
ating=A0 confusion.<br>
My debug run above was done with a repo created by poky on the master branc=
h.</p>
<p dir=3D"ltr">&gt;<br>
&gt; The easiest way would be to add a check in license_create_manifest() t=
o<br>
&gt; just ignore packages that cannot be found. However, since we&#39;re de=
aling<br>
&gt; with licenses here, I honestly don&#39;t know if this is the right way=
 of<br>
&gt; doing it...</p>
<p dir=3D"ltr">Good point, I think it might be better to avoid creating a m=
anifest, rather than creating a potentially bogus manifest when using the F=
EEDS functionality.</p>
<p dir=3D"ltr">The per-package licenses should be already existing in the r=
epo when using a feed.</p>
<p dir=3D"ltr">//DD</p>
<p dir=3D"ltr">Br,<br>
David<br>
&gt;<br>
&gt; laurentiu<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--f46d0418283008a7f104f1ac88d0--
