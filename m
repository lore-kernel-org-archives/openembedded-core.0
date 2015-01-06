Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id F1DB27293A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 11:33:47 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id dc16so15982370qab.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 03:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Us2IPlqd9Ce8I1nBHFgIbd1330bFGdJXJyUNvEWdePM=;
	b=HE81BrHSaKa6JVc5gTTSKbs32t04cvg01gXtAR9yLmUJhjgsiFXSUVxHulegzWhFk0
	ScgKAow/C0bI9IhN2QE7OJw+ziRuBl6+KSpM9+FAmbUS0UW/5WzDJdPf2/gfru0wT/Ms
	+wAK6U2u6N6dCVasB/tkXZM3JtD99sJh4Y//vHErkHnDz6sAcybxpmkJFCqCt2cL44Fb
	DZvL9tFpE/s3nc+Wz2WXzuSHvY7QkspuSS8O/3HJ1NwEIo8jl/Xo1T5ZmZ/PTLpR7AJk
	fvVKWRsaLhBvxEnf/k8qJJiRTwB9PBdZvPYLykOfDyBXADwDhYHpqwnRhlkPuxMibxmg
	lBtg==
X-Gm-Message-State: ALoCoQmpFP5g+3xUcg9jLOKqAs/5le6fGqpPZK8Kve2Jml8EMli1a413ZmANvlxPzvRddvoT7+rZ
X-Received: by 10.224.92.205 with SMTP id s13mr152431927qam.52.1420544027562; 
	Tue, 06 Jan 2015 03:33:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 6 Jan 2015 03:33:27 -0800 (PST)
In-Reply-To: <20150106110406.GD19402@jama>
References: <54AA4536.7030101@topic.nl> <54AA4B86.9040905@topic.nl>
	<CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
	<54AB8B59.7080702@topic.nl> <20150106085731.GC19402@jama>
	<20150106110406.GD19402@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jan 2015 11:33:27 +0000
Message-ID: <CAJTo0Lbp=oNx9nd-LJ-sz1+N1ZSspPoz=7f9EoFdZhCUEVjiQg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What is expected of a kernel recipe nowadays?
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
X-List-Received-Date: Tue, 06 Jan 2015 11:33:49 -0000
Content-Type: multipart/alternative; boundary=089e015375e426a868050bfa2e5c

--089e015375e426a868050bfa2e5c
Content-Type: text/plain; charset=UTF-8

On 6 January 2015 at 11:04, Martin Jansa <martin.jansa@gmail.com> wrote:

> > | make: *** No rule to make target `oldconfig'.  Stop.
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_configure (log file is located at
> /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17498)
> > NOTE: recipe linux-lg-mako-3.4.0+gitrAUTOINC+38bdbfe224-r0: task
> do_configure: Failed
> > ERROR: Task 491
> (/home/jenkins/workspace/luneos-unstable/webos-ports/meta-smartphone/meta-lg/recipes-kernel/linux/
> linux-lg-mako_git.bb, do_configure) failed with exit code '1'
>
> This was caused by linux.inc, fixed in:
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099687.html


I'm replicating this error with an oe-core kernel, so there's more causes
here.

Ross

--089e015375e426a868050bfa2e5c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2015 at 11:04, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; |=
 make: *** No rule to make target `oldconfig&#39;.=C2=A0 Stop.<br>
&gt; | ERROR: oe_runmake failed<br>
&gt; | WARNING: exit code 1 from a shell command.<br>
&gt; | ERROR: Function failed: do_configure (log file is located at /home/j=
enkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linu=
x-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configu=
re.17498)<br>
&gt; NOTE: recipe linux-lg-mako-3.4.0+gitrAUTOINC+38bdbfe224-r0: task do_co=
nfigure: Failed<br>
&gt; ERROR: Task 491 (/home/jenkins/workspace/luneos-unstable/webos-ports/m=
eta-smartphone/meta-lg/recipes-kernel/linux/<a href=3D"http://linux-lg-mako=
_git.bb" target=3D"_blank">linux-lg-mako_git.bb</a>, do_configure) failed w=
ith exit code &#39;1&#39;<br>
<br>
</span>This was caused by linux.inc, fixed in:<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-devel/2015-=
January/099687.html" target=3D"_blank">http://lists.openembedded.org/piperm=
ail/openembedded-devel/2015-January/099687.html</a></blockquote></div><br>I=
&#39;m replicating this error with an oe-core kernel, so there&#39;s more c=
auses here.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--089e015375e426a868050bfa2e5c--
