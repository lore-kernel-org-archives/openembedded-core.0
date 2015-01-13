Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id B495C65C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 17:45:14 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id m20so3420965qcx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 09:45:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yymjFBJr0qYof7F3di8ujT59Z6oDx27LH+9p8MRcPPE=;
	b=CmyXOAOMusqSHSmO/MLRzUCdF6eb2SR/1jv7RatfA++DJ7ZrGdGqwISAG7FAweg1QM
	zSgz9vyOK2Ld0KBrwSXtZRHRe+qGK9wU013w1hG9yXrY5AekF+0rMiMY0GWtMAMLfXo6
	6zMA+WZ7Fjiwh5BGX2h2KDYiNWPzxBIgcvd0iCyBn4w6HIDJOauT0TTSxCHAt/LfLOt2
	Nv1XiRaDaHjZ9FX9EZYT9FPmM/OfJZxGS1/wTPmUuxeCbLpmyfdGb5ae2BhtssXoZ6OE
	m+uphjZ6J/F4Lh1RrGFwZHGdA7yRcCU05G05diaAECFy7EQ7t3D3/FrOA/JrxbKXGlnW
	+liQ==
X-Gm-Message-State: ALoCoQmk0tUt4JOEEkvGdzwSRXrtEiiV0GB5kP4kE7t/+EFNJSzsmHQjx5L44prAYhMF6xaZ+QEb
X-Received: by 10.224.7.197 with SMTP id e5mr6250967qae.64.1421171114450; Tue,
	13 Jan 2015 09:45:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 13 Jan 2015 09:44:54 -0800 (PST)
In-Reply-To: <a4b53d0ddc7976a58e0bc5c094dab61886f84e20.1420642796.git.liezhi.yang@windriver.com>
References: <cover.1420642796.git.liezhi.yang@windriver.com>
	<a4b53d0ddc7976a58e0bc5c094dab61886f84e20.1420642796.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 17:44:54 +0000
Message-ID: <CAJTo0LaPD+YE0V37reL7brdoE8HiL=5oHz4mDL_nCr3EG5DrTg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] libtool: upgrade to 2.4.4
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
X-List-Received-Date: Tue, 13 Jan 2015 17:45:25 -0000
Content-Type: multipart/alternative; boundary=001a11c223f4713dcf050c8c2fef

--001a11c223f4713dcf050c8c2fef
Content-Type: text/plain; charset=UTF-8

On 7 January 2015 at 15:02, Robert Yang <liezhi.yang@windriver.com> wrote:

> * The libtool config files are put in libtool/build-aux now, it was
>   libtool/config in the past.
>

This may be the cause for a pile of errors on the autobuilder:

ross@flashheart
/data/poky-master/tmp/sysroots/intel-corei7-64/usr/bin/crossscripts
$ grep tmp/work libtoolize
.
"/data/poky-master/tmp/work/corei7-64-poky-linux/libtool-cross/2.4.4-r0/libtool-2.4.4/build-aux/funclib.sh"
.
"/data/poky-master/tmp/work/corei7-64-poky-linux/libtool-cross/2.4.4-r0/libtool-2.4.4/build-aux/options-parser"
.
"/data/poky-master/tmp/work/corei7-64-poky-linux/libtool-cross/2.4.4-r0/libtool-2.4.4/build-aux/extract-trace"

The libtoolize in the sysroot's /usr/bin/crossscripts refers to files in
the libtool-cross work directory.  Hopefully this explains most of the
failures this upgrade caused (between it and the kernel, my latest MUT run
had 73 failures).

Ross

--001a11c223f4713dcf050c8c2fef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 7=
 January 2015 at 15:02, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailto=
:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex"><div id=3D":1dk" class=3D"" style=3D=
"overflow:hidden">* The <span class=3D"">libtool</span> config files are pu=
t in <span class=3D"">libtool</span>/build-aux now, it was<br>
=C2=A0 <span class=3D"">libtool</span>/config in the past.<br></div></block=
quote></div><br>This may be the cause for a pile of errors on the autobuild=
er:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><d=
iv class=3D"gmail_extra">ross@flashheart /data/poky-master/tmp/sysroots/int=
el-corei7-64/usr/bin/crossscripts</div><div class=3D"gmail_extra">$ grep tm=
p/work libtoolize</div><div class=3D"gmail_extra">. &quot;/data/poky-master=
/tmp/work/corei7-64-poky-linux/libtool-cross/2.4.4-r0/libtool-2.4.4/build-a=
ux/funclib.sh&quot;</div><div class=3D"gmail_extra">. &quot;/data/poky-mast=
er/tmp/work/corei7-64-poky-linux/libtool-cross/2.4.4-r0/libtool-2.4.4/build=
-aux/options-parser&quot;</div><div class=3D"gmail_extra">. &quot;/data/pok=
y-master/tmp/work/corei7-64-poky-linux/libtool-cross/2.4.4-r0/libtool-2.4.4=
/build-aux/extract-trace&quot;</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">The libtoolize in the sysroot&#39;s /usr/bin/cross=
scripts refers to files in the libtool-cross work directory.=C2=A0 Hopefull=
y this explains most of the failures this upgrade caused (between it and th=
e kernel, my latest MUT run had 73 failures).</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a11c223f4713dcf050c8c2fef--
