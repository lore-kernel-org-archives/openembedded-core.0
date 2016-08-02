Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4DB6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 16:56:39 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id m101so218206486ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 09:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6aBcHfCE50lKkOe839JTeI+HszL4hKYOELT69aVuYCs=;
	b=ddShpDDGANADJEKyfCqe/tPCCS8Anr9KXQyVbju7dq8A5JodYqdyzMKOdris6Fedas
	OdRb8/gdTWNZ/uVHm1Z9MIl2ahzI3qlLEMIZ09Zw5V8hTMcGuDYvv1y+J2s5QH47J01Q
	USaGSsTmY0mq3wCKWR48J8EhMSBbU77sbViqrGRBOrqPuYuAVSISvE3eoDiRpPSG+Opm
	5s1kXhJSjG2AWWbujIxQgBAN7CAC4BND4KSEzyh+UlPSd5Tuj0BWCFTP50UoqmF5P5DL
	fo4EOFrXunK/brLFAxMfL8dhwtBEKSpcQicLC9TPX7NbJvx3oOt5crx+sH0gZY22Eg17
	zdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6aBcHfCE50lKkOe839JTeI+HszL4hKYOELT69aVuYCs=;
	b=gOxR5OvJpCBxPUuJqkQrdAw140M5tTlVg+AqgLvrOeWgvL4qYEMnPivxS1H4us8c7u
	aTj+U76tvoNOsqqh00eimDjrlTnVE9jcLI3g4AFOcGLT3YW2Ll6xBR/daixDtMlFdR0J
	vtiAVYRdTHkzSLiH9dUN31A/x1Zbzy8wMNXGX7eiEf6emHk3FmWcumvHmUeO85Z1AMcr
	ukNzctqXzHHP+2CX2cXiyLs4HHFJfBCS3a0fQqpidDu0MTfbGBnrOUW5btNG/sp2lxkW
	dkA3PHyV32NzAFgq0xFyoK3RzTKt4FDoqo4ae317JvJsIDvLwvjoaI6EFAJYdfdOJRNT
	Q08w==
X-Gm-Message-State: AEkoouuy4FONd6aQHFwsSvAHdKE9Hyyo5Dp8CO6S6vScYjiQ3q3m5Pslu74VdHH7k8O9nmKZKbgKQyFwqJgLxzie
X-Received: by 10.107.154.196 with SMTP id c187mr59830382ioe.99.1470156999902; 
	Tue, 02 Aug 2016 09:56:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 2 Aug 2016 09:56:19 -0700 (PDT)
In-Reply-To: <63d457eb9aeb264ae65e31c1e78f8024609a38c3.1469595557.git.dengke.du@windriver.com>
References: <cover.1469595557.git.dengke.du@windriver.com>
	<63d457eb9aeb264ae65e31c1e78f8024609a38c3.1469595557.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Aug 2016 17:56:19 +0100
Message-ID: <CAJTo0LaevDthmEf=w4Z0CE3C4d3G4-FUxOu8yJaFX8NjdzZDCg@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] perf: enable man pages for 'help' functionality
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
X-List-Received-Date: Tue, 02 Aug 2016 16:56:43 -0000
Content-Type: multipart/alternative; boundary=001a1140e81ebe5e2f053919991a

--001a1140e81ebe5e2f053919991a
Content-Type: text/plain; charset=UTF-8

Hi,

On 27 July 2016 at 06:02, Dengke Du <dengke.du@windriver.com> wrote:

> When using 'perf help <subcommand>', it can't find 'man' command and
> pages for
> perf.
> The perf man pages depends on the xmlto-native and asciidoc-native, so we
> just
> need to add the two packages to the DEPENDS variable and add 'man'to
> RDEPENDS_perf-doc.
>

Whilst I like the idea of supporting more documentation, and have long
wanted to integrate doxygen/gtk-doc/etc into Yocto for building SDKs with
API documentation, I'm not sure we should be making random packages depend
on tooling to always generate documentation.

What do people think of a distro feature / global environment variable for
"recipe should build the documentation"?  For perf this would mean adding
asciidoc so it can build the man pages, for GLib it would mean depending on
gtk-doc so the API docs can be generated, and so on.  But if they're not
needed then they can be disabled to improve build speeds.

Ross

--001a1140e81ebe5e2f053919991a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 27 July 2016 at 06:02, Dengke Du <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:dengke.du@windriver.com" target=3D"_bl=
ank">dengke.du@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div>When using &#39;<span>perf</span> help &lt;subcommand&gt;&#3=
9;, it can&#39;t find &#39;man&#39; command and pages for<br>
<span>perf</span>.<br>
The <span>perf</span> man pages depends on the xmlto-native and asciidoc-na=
tive, so we just<br>
need to add the two packages to the DEPENDS variable and add &#39;man&#39;t=
o<br>
RDEPENDS_perf-doc.</div></blockquote></div><br>Whilst I like the idea of su=
pporting more documentation, and have long wanted to integrate doxygen/gtk-=
doc/etc into Yocto for building SDKs with API documentation, I&#39;m not su=
re we should be making random packages depend on tooling to always generate=
 documentation.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">What do people think of a distro feature / global environment var=
iable for &quot;recipe should build the documentation&quot;?=C2=A0 For perf=
 this would mean adding asciidoc so it can build the man pages, for GLib it=
 would mean depending on gtk-doc so the API docs can be generated, and so o=
n.=C2=A0 But if they&#39;re not needed then they can be disabled to improve=
 build speeds.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a1140e81ebe5e2f053919991a--
