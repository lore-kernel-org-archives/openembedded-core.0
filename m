Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id AB7BE601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 10:49:29 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hb3so49386951igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 02:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=IJPpHUjrmNgf6M9cAFZqyYSjskqiAT4Purwe48FFoyM=;
	b=Lw7kkBK5b3TtmSJK87sSSuMjZyq/kv6tcKnMQJs4zd+hh9qwLNMt/jlgkMB1PU0Bh1
	UWRWIiE0FgvImGaWWuFpVaxX1U6BvhUZ1PyKdX7QXVhL6e9NKHRn9o/p2lpMSUNzEYz5
	TifPM9ixJ2ch327mu0B7R+TR6PHcS+mf+DYR9yVyrRpBEg2huMImct+m5cgYoraHHjFx
	d61HTUnJVj3oKhRS+9JzAwfht1Bpljfr7enPHzETFcEZj7Njl4spn7QU/o/9XPxwORLs
	9S+bYz5MgZLFmCUoudP+w9fqC+1iHHc4lC0g2kE0QsUMaufrTGG6VwOh4MLRarrwauBx
	xu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IJPpHUjrmNgf6M9cAFZqyYSjskqiAT4Purwe48FFoyM=;
	b=fQSExw/JNaQ9ItxMey16s5lsvseqwe26zMac8hEEM1peWdcnvizqdcOL6kXF9v4ikR
	3ESIaFFW5ORMAW1huSKyOejt7KgY6RLW0uJEecAH5R3Wt1Eih7ThnG5f1cUaZurkUMEq
	JNt5O/ivCu22h3SBI5RHJlsol5gpCSBvrTGM7j59dcKz0nNv05MqU/5rcvIwiWHbTVNs
	sFmvFfZBzjgXxhtGqfKW5N+hcejGKrH/27x929/wkQup/EK5r9DE+D6gNbwBY45UeoBN
	f+UU/2vCDXi1NSENw4o6Zvnc0EKkYK9AwJlXXS2UPOj5jRNJz/I6uyKE7Njrbkye66Dl
	vn5Q==
X-Gm-Message-State: AG10YOQKeGobY2StKbIPjshiphES+xeCcLGqIPyHsPrE+noK1lNstQn6hfj5/yilgiZFhcULT2do+KLvAvlLBe1G
X-Received: by 10.50.160.7 with SMTP id xg7mr11041759igb.64.1455533370112;
	Mon, 15 Feb 2016 02:49:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 15 Feb 2016 02:49:10 -0800 (PST)
In-Reply-To: <D8D8A2EA-EEF7-48DB-9875-19204C22CB20@nathan.to>
References: <1B0E749C-F6AB-4D7A-9A0C-C4D3E349794A@nathan.to>
	<CAJ86T=VoQM1-b+UJWWd4grjuyiJEtjRQa12FVJru6R=MGsnxZQ@mail.gmail.com>
	<D8D8A2EA-EEF7-48DB-9875-19204C22CB20@nathan.to>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Feb 2016 10:49:10 +0000
Message-ID: <CAJTo0LaztxKCcgi5uzK1WT5XCU+qMWQ9fv73DC1RD4erYqzHkg@mail.gmail.com>
To: Nathan Sowatskey <nathan@nathan.to>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: util-linux_2.26.2.bb, do_patch failed with exit code '1
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
X-List-Received-Date: Mon, 15 Feb 2016 10:49:29 -0000
Content-Type: multipart/alternative; boundary=001a11339de87c194b052bccc50e

--001a11339de87c194b052bccc50e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 February 2016 at 12:35, Nathan Sowatskey <nathan@nathan.to> wrote:

> Thank you for you help. I must admit that I don=E2=80=99t know how to int=
erpret
> the result, so I have attached env.txt to see if that means anything to
> you, or others


Understanding bitbake -e is very useful so whilst I could just tell you
that it's the meta-cube layer breaking, I'l show you what it all means
first. :)

As you're interested in a particular variable (in this case, SRC_URI),
search the file for the assignment.  It easiest to search for the
[newline]SRC_URI=3D, above the assignment is list of operations that result=
ed
in the final value.

# $SRC_URI [8 operations]
> #   append /home/builder/git/poky/meta/conf/bitbake.conf:600
> #     [vardepsexclude] "APACHE_MIRROR ..."
>

Source mirror variables being added to the variable dependencies exclusion
list so that changing source mirrors doesn't cause everything to re-fetch.


> #   set /home/builder/git/poky/meta/conf/bitbake.conf:618
> #     ""
>

Default SRC_URI or "" in bitbake.conf.


> #   set /home/builder/git/poky/meta/conf/documentation.conf:387
> #     [doc] "The list of source files -..."
>

Documentation added to the [doc] flag.


> #   set
> /home/builder/git/oe-core/meta/recipes-core/util-linux/util-linux.inc:26
> #
> "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-=
${PV}.tar.xz
>            "
>

util-linux.inc setting the tarball URI.


> #   append /home/builder/git/oe-core/meta/recipes-core/util-linux/
> util-linux_2.26.2.bb:19
> #     "file://util-linux-ng-replace-siginterrupt.patch
>  file://util-linux-ng-2.16-mount_lock_path.patch ..."
>

Version-specific patches appended in the recipe itself.

#   set /home/builder/git/oe-core/meta/recipes-core/util-linux/
> util-linux_2.26.2.bb:20
> #     [md5sum] "9bdf368c395f1b70325d0eb22c7f48fb"
> #   set /home/builder/git/oe-core/meta/recipes-core/util-linux/
> util-linux_2.26.2.bb:21
> #     [sha256sum]
> "0e29bda142528a48a0a953c39ff63093651a4809042e1790fbd6aa8663fd9666"
>

The recipe adding the version-specific checksum flags.


> #   append
> /home/builder/git/meta-overc/meta-cube/recipes-core/util-linux/util-linux=
_2.%.bbappend:8
> #     "         file://pam.d    ${NSENTER_PATCH} "
>

The meta-cube layer appending more patches via a non-version-specific
bbappend.  That ${NSENTER_PATCH} looks suspicious!

# pre-expansion value:
> #
> "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-=
${PV}.tar.xz
>             file://u
> til-linux-ng-replace-siginterrupt.patch
> file://util-linux-ng-2.16-mount_lock_path.patch
>   file://uclibc-__progname-conflict.patch
> file://configure-sbindir.patch             file://fix-pa
> rallel-build.patch             file://runuser.pamd
> file://runuser-l.pamd             ${OLDHOST}
>         file://pam.d    ${NSENTER_PATCH} "
>

This is what the SRC_URI looks like after all those expressions have been
evaluated, but before the variable references have been expanded.  Note
${NSENTER_PATCH} at the end.


> SRC_URI=3D"
> http://kernel.org/pub/linux/utils/util-linux/v2.26/util-linux-2.26.2.tar.=
xz
>             file://util-linux-ng-replace-siginterrupt.patch
> file://util-linux-ng-2.16-mount_lock_path.patch
> file://uclibc-__progname-conflict.patch
> file://configure-sbindir.patch             file://fix-parallel-build.patc=
h
>             file://runuser.pamd             file://runuser-l.pamd
>             file://pam.d    file://nsenter-to-be-more-flexible.patch "


The expanded variable value.  NSENTER_PATCH has been replaced with
nsenter-to-be-more-flexible.patch.

Conclusion: meta-cube broke.  I don't think util-linux in Jethro has
changed recently, so I'd suggest that meta-cube introduced a broken patch.

Ross

--001a11339de87c194b052bccc50e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 February 2016 at 12:35, Nathan Sowatskey <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:nathan@nathan.to" target=3D"_blank">nathan@nathan.to</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex">Thank you for you help. I must admit that I=
 don=E2=80=99t know how to interpret the result, so I have attached env.txt=
 to see if that means anything to you, or others</blockquote></div><br></di=
v><div class=3D"gmail_extra"><div class=3D"gmail_extra">Understanding bitba=
ke -e is very useful so whilst I could just tell you that it&#39;s the meta=
-cube layer breaking, I&#39;l show you what it all means first. :)</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">As you&#39;re =
interested in a particular variable (in this case, SRC_URI), search the fil=
e for the assignment.=C2=A0 It easiest to search for the [newline]SRC_URI=
=3D, above the assignment is list of operations that resulted in the final =
value.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex"># $SRC_URI [8 operations]<br># =C2=A0 append /home/builde=
r/git/poky/meta/conf/bitbake.conf:600<br># =C2=A0 =C2=A0 [vardepsexclude] &=
quot;APACHE_MIRROR ...&quot;<br></blockquote><div><br></div><div>Source mir=
ror variables being added to the variable dependencies exclusion list so th=
at changing source mirrors doesn&#39;t cause everything to re-fetch.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"># =C2=A0 set /home/builder/git/poky/meta/c=
onf/bitbake.conf:618<br># =C2=A0 =C2=A0 &quot;&quot;<br></blockquote><div><=
br></div><div>Default SRC_URI or &quot;&quot; in bitbake.conf.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex"># =C2=A0 set /home/builder/git/poky/meta/conf/=
documentation.conf:387<br># =C2=A0 =C2=A0 [doc] &quot;The list of source fi=
les -...&quot;<br></blockquote><div><br></div><div>Documentation added to t=
he [doc] flag.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex"># =C2=A0 set /home/bu=
ilder/git/oe-core/meta/recipes-core/util-linux/util-linux.inc:26<br># =C2=
=A0 =C2=A0 &quot;${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSIO=
N}/util-linux-${PV}.tar.xz =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<=
br></blockquote><div><br></div><div>util-linux.inc setting the tarball URI.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex"># =C2=A0 append /home/builder/git/o=
e-core/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.26.2.bb:=
19">util-linux_2.26.2.bb:19</a><br># =C2=A0 =C2=A0 &quot;file://util-linux-=
ng-replace-siginterrupt.patch =C2=A0file://util-linux-ng-2.16-mount_lock_pa=
th.patch ...&quot;<br></blockquote><div>=C2=A0</div><div>Version-specific p=
atches appended in the recipe itself.</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
# =C2=A0 set /home/builder/git/oe-core/meta/recipes-core/util-linux/<a href=
=3D"http://util-linux_2.26.2.bb:20">util-linux_2.26.2.bb:20</a><br># =C2=A0=
 =C2=A0 [md5sum] &quot;9bdf368c395f1b70325d0eb22c7f48fb&quot;<br># =C2=A0 s=
et /home/builder/git/oe-core/meta/recipes-core/util-linux/<a href=3D"http:/=
/util-linux_2.26.2.bb:21">util-linux_2.26.2.bb:21</a><br># =C2=A0 =C2=A0 [s=
ha256sum] &quot;0e29bda142528a48a0a953c39ff63093651a4809042e1790fbd6aa8663f=
d9666&quot;<br></blockquote><div><br></div><div>The recipe adding the versi=
on-specific checksum flags.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"># =C2=A0=
 append /home/builder/git/meta-overc/meta-cube/recipes-core/util-linux/util=
-linux_2.%.bbappend:8<br># =C2=A0 =C2=A0 &quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://pam.d =C2=A0 =C2=A0${NSENTER_PATCH} &quot;<br></blockquote><div><br=
></div><div>The meta-cube layer appending more patches via a non-version-sp=
ecific bbappend.=C2=A0 That ${NSENTER_PATCH} looks suspicious!</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style=
:solid;padding-left:1ex"># pre-expansion value:<br># =C2=A0 &quot;${KERNELO=
RG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://u<br>til-linux-ng-replace=
-siginterrupt.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://util-l=
inux-ng-2.16-mount_lock_path.patch<br>=C2=A0 file://uclibc-__progname-confl=
ict.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure-sbindi=
r.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-pa<br>rallel-b=
uild.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://runuser.pamd =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://runuser-l.pamd =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${OLDHOST}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
ile://pam.d =C2=A0 =C2=A0${NSENTER_PATCH} &quot;<br></blockquote><div><br><=
/div><div>This is what the SRC_URI looks like after all those expressions h=
ave been evaluated, but before the variable references have been expanded.=
=C2=A0 Note ${NSENTER_PATCH} at the end.</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:=
1ex">SRC_URI=3D&quot;<a href=3D"http://kernel.org/pub/linux/utils/util-linu=
x/v2.26/util-linux-2.26.2.tar.xz">http://kernel.org/pub/linux/utils/util-li=
nux/v2.26/util-linux-2.26.2.tar.xz</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://util-linux-ng-replace-siginterrupt.patch =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 file://util-linux-ng-2.16-mount_lock_path.patch =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://uclibc-__progname-conflict.pa=
tch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure-sbindir.patc=
h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-parallel-build.patch=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://runuser.pamd =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://runuser-l.pamd =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://pam.d =C2=A0=
 =C2=A0file://nsenter-to-be-more-flexible.patch &quot;</blockquote><div><br=
></div><div>The expanded variable value.=C2=A0 NSENTER_PATCH has been repla=
ced with nsenter-to-be-more-flexible.patch.</div><div><br></div><div>Conclu=
sion: meta-cube broke.=C2=A0 I don&#39;t think util-linux in Jethro has cha=
nged recently, so I&#39;d suggest that meta-cube introduced a broken patch.=
</div><div><br></div><div>Ross</div></div></div></div>

--001a11339de87c194b052bccc50e--
