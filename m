Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id BEA1A71144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 11:27:15 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id v8so637017qal.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 03:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=o9YjI0bqWoCDS+eF8koaeygHl/HEb9lWkWax5rJVuQ8=;
	b=dPZW49mMbRjgDCfe8FHxVS0MOYAP8A3hGo0+VemJfPG8zgNxFKDlZnjhv2AqXADEQ+
	16Fiib5tlQ4kPiEeNTt1Z0cSr5AxoP6iFP4u1ulhfqaul/uNbqWYdrNKKbNZD4CiPY8y
	cLZdtk+KbiGqWXPJrs96aWdSmbY7e8CEP7RQIwbpX46BH9o9oS0borqbay1KMuH9nYrs
	jkrVwDwTCao4S69qRVL/HhHCErH0hfKsZNixu+Kcsut2t2CH7yEFUN6BM+ZX6JLuqGcN
	pRL7iI/umeukaXVZmghCHLYyQ43StNdalPNJdncylrGgbTCCjgsVNY6PSCA6EOSP8j6v
	onmw==
X-Gm-Message-State: ALoCoQlCwRZgza4HLchHvbsWIz6p+bVUNCVXNjFbAJ/z0CP/KLiX8peb4hhejIc27JFqDiUe61p4
X-Received: by 10.140.94.195 with SMTP id g61mr1393755qge.80.1421926035789;
	Thu, 22 Jan 2015 03:27:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 22 Jan 2015 03:26:55 -0800 (PST)
In-Reply-To: <b8134b991239e494b77a232bd723245d753c2734.1421788745.git.peter.seebach@windriver.com>
References: <cover.1421788745.git.peter.seebach@windriver.com>
	<b8134b991239e494b77a232bd723245d753c2734.1421788745.git.peter.seebach@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jan 2015 11:26:55 +0000
Message-ID: <CAJTo0LYPQenCD2eMaSzPbaaUrky_Ta4cpnjFpN55D+BS5YzRJw@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.6.2.bb/pseudo_git.bb: Pseudo 1.6.3
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
X-List-Received-Date: Thu, 22 Jan 2015 11:27:19 -0000
Content-Type: multipart/alternative; boundary=001a113a59ee42b091050d3bf41c

--001a113a59ee42b091050d3bf41c
Content-Type: text/plain; charset=UTF-8

On 20 January 2015 at 21:21, Peter Seebach <peter.seebach@windriver.com>
wrote:

> pseudo 1.6.3 merges (with some changes) the changes from
> Peter A. Bigot to make --without-fallback-passwd work. It
> also adds a proposed fix for Yocto bug #7097, which has
> passed the obvious tests I could think of.


This fails to build on *some* machines in the AB pool.

http://errors.yoctoproject.org/Errors/Search/Details/7899/1/10/a6ea28e3460217496856d2d79667c4bfbd867df9
:

DEBUG: Executing shell function do_compile
NOTE: Building/installing only 64-bit libpseudo.so for nativesdk-pseudo.
NOTE: If you need to run 32-bit executables, ensure that NO32LIBS is set to
0.
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-pseudo/1.6.3-r0/pseudo-1.6.3/configure:
line 72: cd: /opt/poky/1.7/sysroots/i686-pokysdk-linux/usr: No such file or
directory
ERROR: Prefix is current directory. That doesn't work.

Ross

--001a113a59ee42b091050d3bf41c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 January 2015 at 21:21, Peter Seebach <span dir=3D"ltr">&lt;<a href=3D=
"mailto:peter.seebach@windriver.com" target=3D"_blank">peter.seebach@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex"><span class=3D"">pseudo</=
span> 1.6.3 merges (with some changes) the changes from<br>
Peter A. Bigot to make --without-fallback-passwd work. It<br>
also adds a proposed fix for Yocto bug #7097, which has<br>
passed the obvious tests I could think of.</blockquote></div><div class=3D"=
gmail_extra"><br></div>This fails to build on *some* machines in the AB poo=
l.</div><div class=3D"gmail_extra"><br><a href=3D"http://errors.yoctoprojec=
t.org/Errors/Search/Details/7899/1/10/a6ea28e3460217496856d2d79667c4bfbd867=
df9">http://errors.yoctoproject.org/Errors/Search/Details/7899/1/10/a6ea28e=
3460217496856d2d79667c4bfbd867df9</a>:<br></div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">DEBUG: Exec=
uting shell function do_compile</div><div class=3D"gmail_extra">NOTE: Build=
ing/installing only 64-bit libpseudo.so for nativesdk-pseudo.</div><div cla=
ss=3D"gmail_extra">NOTE: If you need to run 32-bit executables, ensure that=
 NO32LIBS is set to 0.</div><div class=3D"gmail_extra">/home/pokybuild/yoct=
o-autobuilder/yocto-worker/nightly-mips/build/build/tmp/work/i686-nativesdk=
-pokysdk-linux/nativesdk-pseudo/1.6.3-r0/pseudo-1.6.3/configure: line 72: c=
d: /opt/poky/1.7/sysroots/i686-pokysdk-linux/usr: No such file or directory=
</div><div class=3D"gmail_extra">ERROR: Prefix is current directory. That d=
oesn&#39;t work.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div></div>

--001a113a59ee42b091050d3bf41c--
