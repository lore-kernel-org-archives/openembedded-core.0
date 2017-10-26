Return-Path: <limon.anibal@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 330EA6E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 18:44:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z3so10140795wme.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 11:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G5vk8SoALcd4t9YJKeqyRkVgXsImA8QfptLpJt5orsc=;
	b=J4cKVmjED80cDYm22Ussg9NqxYIfUArzEnKOQUyppCS43eiTzbhLQFOnOxab/y2gCg
	5R7RHyO+v13TE9WLP2426yaPM6A19DSmg98yerFrJLCZR8Gv9pa4kVFvgq3MV5cAUmYC
	cEXezNlVncl5d78umxBwSg1FWRBheEZs2hnuIO+QuNKZnRSJk3oPZbFhcX3OokYI8mv0
	9WWBwUjTZugCwKE6ux/oZzCS7eQ4c6ajIU4XwBrSc5sE9YxwLeTJWVjqeVdJNAf4Kv6C
	Vbpm2EJXbHMUFpU+YvagKK55d+IWtGPkkcsCOv6huFqjddkJr81hIK7xjedmLkKqNP5I
	yy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G5vk8SoALcd4t9YJKeqyRkVgXsImA8QfptLpJt5orsc=;
	b=OhcdZHvV2BAXdHOR/Q0sbeSqJVmHJcETTymyJFJDL6+iQvgBcptu1dje8CSN4TWmSV
	v39BXwVLRosKLHaqia5hvDcbSndYRiFm9NloHTW6YGzRxpl6tfKdg7v2JWykxpL/Qa41
	7qZ24Jcsds1/WHs7PDQKWv6LdgExeBq+vNEIJWzAX6qcE6FOp0+islWJvidYlVP8aAR9
	q9AJV+h35DsqQTEhghR/AfrZiONLNLioAfhEezXbR4TqXmQN5+RdBXH0n67r0X6x+rHx
	Au/HGw7sOpTdiRKAjrrUEVMOtT+mSBrwq3+lA6mYQPFQaJsEg4tCmOjt+N6/6WmuDLZh
	Dm9Q==
X-Gm-Message-State: AMCzsaWr0eZpM6Ls3v2sqwsgukHiU3TU+bvMIepTiUCL3Cir+5bHQ18Z
	r6XhUOvwTTRmQ0/VkGyzb9RYLWAb3UXY4QfSFhw=
X-Google-Smtp-Source: ABhQp+RdnexpHDfmiqwNNF/3MClQeXA6IsaT9fx4rX/1rqwGWJk6gmyVNuCVa3Ud39V4etjpUzz+Gg74n3EbwwLPuCo=
X-Received: by 10.80.166.196 with SMTP id f4mr27933674edc.278.1509043449067;
	Thu, 26 Oct 2017 11:44:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.173.141 with HTTP; Thu, 26 Oct 2017 11:44:08 -0700 (PDT)
In-Reply-To: <cover.1509034760.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1509034760.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: =?UTF-8?Q?Anibal_Lim=C3=B3n?= <limon.anibal@gmail.com>
Date: Thu, 26 Oct 2017 13:44:08 -0500
Message-ID: <CAPS-YPCMmGejwfW-VwE--xNrShxxfyocPaTOrKvBf-cZUxdtVA@mail.gmail.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] scripts/oe-selftest: oe-selftest-internal wrapper scripts that isolates execution
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
X-List-Received-Date: Thu, 26 Oct 2017 18:44:08 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ef9f4bbaea2055c778e9e"

--94eb2c0ef9f4bbaea2055c778e9e
Content-Type: text/plain; charset="UTF-8"

Hi Leo,

The patch looks good at first glance, i have some comments,

- We need a way to handle the results output because with this you will
have N results files, may be extend the shell script
to consolidate the results file.
- With this if one selftest depends on other there is no way to now it and
the execution will fail, i searched into the selftest cases
(OETestDepends) and now we don't have dependent cases.

Cheers,
Anibal

On Thu, Oct 26, 2017 at 12:33 PM, <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> The below is a profiling experiment, running oe-selftest -r (the proposed
> implementation, see patch description for more info):
>
> Procedure:
>
> With patch 1/1, multiple oe-selftest jobs can be launched in
> parallel. One tool that launch jobs in parallel is GNU Parallel [1],
> allowing
> to construct a simpole pipeline to execute all tests with a pool of four
> jobs:
>
>     $ echo $ALLTESTS | time parallel --jobs4 oe-selftest -r
>
> where ALLTESTS is a variable containing all tests cases (modules) found by
> the
> the runner (oe-selftest-internal) (i.e. ALLTESTS="$(oe-selftest -m |
> awk '{ print $NF }' | grep -v ':')"). This is the result obtained from the
> above command:
>
>     739.57user 120.48system 45:34.61elapsed 31%CPU (0avgtext+0avgdata
> 124600maxresident)k
>     390908inputs+15984336outputs (291major+20227951minor)pagefaults 0swaps
>
>
> The import point on the above numbers is that isolation the oe-selftest
> execution per
> module and using a parallelization tool, complete oe-selftest runs takes
> less than an hour,
> beating current single-job times observed at main auto-buildes.
>
> Profiling results were obtained on a machine with 88 Intel Xeon with 88
> cores
>
> [1] https://www.gnu.org/software/parallel/
>
> The following changes since commit 65d23bd7986615fdfb0f1717b61553
> 4a2a14ab80:
>
>   README.qemu: qemuppc64 is not supported (2017-10-16 23:54:31 +0100)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib lsandov1/oe-selftest-own-
> directory
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
> lsandov1/oe-selftest-own-directory
>
> Leonardo Sandoval (1):
>   scripts/oe-selftest: oe-selftest-internal wrapper scripts that
>     isolates execution
>
>  scripts/oe-selftest          | 102 +++++++++++++++++++++++-------
> -------------
>  scripts/oe-selftest-internal |  75 +++++++++++++++++++++++++++++++
>  2 files changed, 129 insertions(+), 48 deletions(-)
>  create mode 100755 scripts/oe-selftest-internal
>
> --
> 2.12.3
>
>

--94eb2c0ef9f4bbaea2055c778e9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Hi Leo,</span><div style=
=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">The patch l=
ooks good at first glance, i have some comments,</div><div style=3D"font-si=
ze:12.8px"><br></div><div style=3D"font-size:12.8px">- We need a way to han=
dle the results output because with this you will have N results files, may=
 be extend the shell script</div><div style=3D"font-size:12.8px">to consoli=
date the results file.</div><div style=3D"font-size:12.8px">- With this if =
one selftest depends on other there is no way to now it and the execution w=
ill fail, i searched into the selftest cases</div><div style=3D"font-size:1=
2.8px">(OETestDepends) and now we don&#39;t have dependent cases.</div><div=
 style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">Cheer=
s,</div><div style=3D"font-size:12.8px">Anibal</div></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Thu, Oct 26, 2017 at 12:33 PM, =
 <span dir=3D"ltr">&lt;<a href=3D"mailto:leonardo.sandoval.gonzalez@linux.i=
ntel.com" target=3D"_blank">leonardo.sandoval.gonzalez@linux.intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Leonardo Sandoval=
 &lt;<a href=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com">leonardo=
.sandoval.gonzalez@<wbr>linux.intel.com</a>&gt;<br>
<br>
The below is a profiling experiment, running oe-selftest -r (the proposed<b=
r>
implementation, see patch description for more info):<br>
<br>
Procedure:<br>
<br>
With patch 1/1, multiple oe-selftest jobs can be launched in<br>
parallel. One tool that launch jobs in parallel is GNU Parallel [1], allowi=
ng<br>
to construct a simpole pipeline to execute all tests with a pool of four<br=
>
jobs:<br>
<br>
=C2=A0 =C2=A0 $ echo $ALLTESTS | time parallel --jobs4 oe-selftest -r<br>
<br>
where ALLTESTS is a variable containing all tests cases (modules) found by =
the<br>
the runner (oe-selftest-internal) (i.e. ALLTESTS=3D&quot;$(oe-selftest -m |=
<br>
awk &#39;{ print $NF }&#39; | grep -v &#39;:&#39;)&quot;). This is the resu=
lt obtained from the<br>
above command:<br>
<br>
=C2=A0 =C2=A0 739.57user 120.48system 45:34.61elapsed 31%CPU (0avgtext+0avg=
data 124600maxresident)k<br>
=C2=A0 =C2=A0 390908inputs+15984336outputs (291major+20227951minor)<wbr>pag=
efaults 0swaps<br>
<br>
<br>
The import point on the above numbers is that isolation the oe-selftest exe=
cution per<br>
module and using a parallelization tool, complete oe-selftest runs takes le=
ss than an hour,<br>
beating current single-job times observed at main auto-buildes.<br>
<br>
Profiling results were obtained on a machine with 88 Intel Xeon with 88 cor=
es<br>
<br>
[1] <a href=3D"https://www.gnu.org/software/parallel/" rel=3D"noreferrer" t=
arget=3D"_blank">https://www.gnu.org/software/<wbr>parallel/</a><br>
<br>
The following changes since commit 65d23bd7986615fdfb0f1717b61553<wbr>4a2a1=
4ab80:<br>
<br>
=C2=A0 README.qemu: qemuppc64 is not supported (2017-10-16 23:54:31 +0100)<=
br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"no=
referrer" target=3D"_blank">git.yoctoproject.org/<wbr>poky-contrib</a> lsan=
dov1/oe-selftest-own-<wbr>directory<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
=3Dlsandov1/oe-selftest-own-directory" rel=3D"noreferrer" target=3D"_blank"=
>http://git.yoctoproject.org/<wbr>cgit.cgi/poky-contrib/log/?h=3D<wbr>lsand=
ov1/oe-selftest-own-<wbr>directory</a><br>
<br>
Leonardo Sandoval (1):<br>
=C2=A0 scripts/oe-selftest: oe-selftest-internal wrapper scripts that<br>
=C2=A0 =C2=A0 isolates execution<br>
<br>
=C2=A0scripts/oe-selftest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 102 +++++++++=
++++++++++++++-------<wbr>-------------<br>
=C2=A0scripts/oe-selftest-internal |=C2=A0 75 +++++++++++++++++++++++++++++=
+<wbr>+<br>
=C2=A02 files changed, 129 insertions(+), 48 deletions(-)<br>
=C2=A0create mode 100755 scripts/oe-selftest-internal<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.12.3<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c0ef9f4bbaea2055c778e9e--
