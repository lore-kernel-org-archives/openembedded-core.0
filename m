Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 616966FEF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 02:34:21 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id f6so6494816vkh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 19:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZtpqFRoZhS90aIYISaQ+Tjs5QP/YCpQ6NYOUkXHq9b4=;
	b=WRi5DpTRMP4lXZsSM0w7iiDrkP1ZD6tke81n/V9BdIPpDGeqaZ66IZtEZPt33soxwx
	OIfS58Jfi/XNw3Rr4Jmf6N9NP4N26VFp0YNuKQFFEg4vLJ8GpMByKvDqqCYTwDfdPQ/e
	oaNNiAG6PQBbvHNiatdn0TW+SJR79/+/WsSuyVqj0kyW1XCdjHVviOqxPBSOs3bePd16
	HhaQnu7WaiqbpCzX3r/tap5Fj2lBVC/+55UClr0Z2I9DSvdQfN2lRA1kJVZ6ejbXP9fM
	kxHNdjz1Dv0KlLWJ9JEy/FV+blvfw9qJnC6nnsLaK+PD+kvq3yypuueP2Nc+7w9KwWBt
	4ZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZtpqFRoZhS90aIYISaQ+Tjs5QP/YCpQ6NYOUkXHq9b4=;
	b=sgqpXtgPtRIWujJwQ7Y/IidpFSfzgTU5/uWCBtFr2PW8A+xaMF3wXwnHQ+9SGseZKR
	v5w2D+p5PJ93sGS4WR2CsOuJ4trx4Yvt0kQXTlDEAb95SGE3nnw815749H3AhRZjKaqA
	B4Go24JevwwZupG10HffnUqQ3zK/0PxENlUoDEKennMEGOl4QC4/sed8hgm15andQ+T8
	Q8jIaF7Mi+UIQmahaIQG3oOgjjiWfKBFDMSkjI1wpoF+cp5xDlkwqXfxQaP2/7MEeujc
	vNo0Y4DU+M1pQYYa9K3R087mKCoEWKY4P12LHifSxKipWtWfwkDl4pqwlftIXQCD98wa
	pOeQ==
X-Gm-Message-State: AElRT7FHoxl1bY6FO4I+AwPtUB+J7PJkdyJxhjvwd6SBAgUgxLB3JKrq
	HPcUqyzErO44JMbcb1MKy2E4hp7NCtE7Xh6OIZ0=
X-Google-Smtp-Source: AG47ELvN8Z9eveb698cQ6kXO3U7ri+0kNz/9Uw1u7mCvgQcQN+sayTlj7CnByug6Y1dl3mg/FGHGAEMA7wrcRBrxqo4=
X-Received: by 10.31.7.132 with SMTP id 126mr7600018vkh.42.1521772462379; Thu,
	22 Mar 2018 19:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGMVzH-rzxfbLnV4BP5zGW_8EJ8bj4W_uu7dNs4UGW-UfW-5Q@mail.gmail.com>
	<CAJTo0LYXoowKcTwW+1TLFUfSsag7u5WwtJZtn3DbqAtsHEF_Lw@mail.gmail.com>
In-Reply-To: <CAJTo0LYXoowKcTwW+1TLFUfSsag7u5WwtJZtn3DbqAtsHEF_Lw@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Fri, 23 Mar 2018 02:34:11 +0000
Message-ID: <CAPGMVzEGdGbEVU7dJn3RJ+3gcsxLmHb=tuG2LGwV6m4OM5FEeA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-chicken] networking
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
X-List-Received-Date: Fri, 23 Mar 2018 02:34:22 -0000
Content-Type: multipart/alternative; boundary="001a11441a200c993805680b43f4"

--001a11441a200c993805680b43f4
Content-Type: text/plain; charset="UTF-8"

If it is like : my kernel doesn't support the WiFi hardware then either of
the below things must be a possibility
1. I can install a external WiFi adapter and check for that button in Sato
2. I can install kernel WiFi drivers
   2a. Are there  built WiFi drivers for poky ?

On Fri, 23 Mar 2018, 00:49 Burton, Ross, <ross.burton@intel.com> wrote:

> As I said yesterday, core-image-sato ships with connman already.  If
> the networking UI doesn't have a big [ ] Turn Wifi On button then the
> problem is that your kernel doesn't support the wifi hardware.
>
> Ross
>
> On 22 March 2018 at 17:50, Rajath C S <rajathcs.1996@gmail.com> wrote:
> > Can you help me setup WiFi connection to poky?
> > Im highly struggling with this, I have placed connman in local.conf file
> ,
> > what next is the procedure such that my poky on qemu can detect the WiFi?
> > Thanks
> >
> > On Thu, 22 Mar 2018, 23:18 Rajath C S, <rajathcs.1996@gmail.com> wrote:
> >>
> >> Cool, thanks!
> >>
> >> On Thu, 22 Mar 2018, 23:15 Burton, Ross, <ross.burton@intel.com> wrote:
> >>>
> >>> It contains a CSV module for the Scheme language, it isn't anything
> >>> for the user to use.
> >>>
> >>> CSV files are plain text so any text editor will do.  oe-core has a
> >>> vi-clone as part of busybox, or l3afpad if you want something
> >>> graphical.  meta-oe has the usual Linux editors: vim, nano, joe.
> >>>
> >>> Ross
> >>>
> >>> On 22 March 2018 at 17:41, Rajath C S <rajathcs.1996@gmail.com> wrote:
> >>> > Thanks for the tip! But meta-chicken contains a CSV formatter since I
> >>> > need a
> >>> > CSV editor to my image I thought of using meta-chicken.
> >>> > Do you know of any other recipes that has the features of CSV editor?
> >>> > Thanks
> >>> >
> >>> > On Thu, 22 Mar 2018, 23:09 Burton, Ross, <ross.burton@intel.com>
> wrote:
> >>> >>
> >>> >> That's a failure in meta-chicken, which isn't part of oe-core.
> >>> >>
> >>> >> If you need to use meta-chicken then please contact the maintainers
> of
> >>> >> meta-chicken directly.  I do have to wonder if you actually need
> >>> >> meta-chicken though.
> >>> >>
> >>> >> Ross
> >>> >>
> >>> >> On 22 March 2018 at 17:34, Rajath C S <rajathcs.1996@gmail.com>
> wrote:
> >>> >> > I was including a csv-editor and this error popped up, any
> >>> >> > solutions?
> >>> >> >
> >>> >> > WARNING: chicken-4.12.0-r0 do_prepare_recipe_sysroot: Manifest
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >>> >> > not found?
> >>> >> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_fetch: Manifest
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >>> >> > not found?
> >>> >> > WARNING: chicken-egg-typeclass-cross-1.3-r0 do_fetch: Manifest
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >>> >> > not found?
> >>> >> > WARNING: chicken-egg-regex-cross-1.0-r0 do_fetch: Manifest
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >>> >> > not found?
> >>> >> > WARNING: chicken-egg-matchable-3.7-r0 do_fetch: Manifest
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >>> >> > not found?
> >>> >> > WARNING: chicken-egg-make-cross-1.8-r0 do_fetch: Manifest
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >>> >> > not found?
> >>> >> > WARNING: chicken-egg-iset-cross-2.0-r0 do_fetch: Manifest
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >>> >> > not found?
> >>> >> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_patch: Manifest
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >>> >> > not found?
> >>> >> > WARNING: chicken-egg-matchable-cross-3.7-r0
> >>> >> > do_prepare_recipe_sysroot:
> >>> >> > Manifest
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >>> >> > not found?
> >>> >> > WARNING: chicken-egg-utf8-cross-3.4.4-r0 do_fetch: Manifest
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >>> >> > not found?
> >>> >> > ERROR: chicken-egg-matchable-cross-3.7-r0 do_install: Function
> >>> >> > failed:
> >>> >> > do_install (log file is located at
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
> >>> >> > ERROR: Logfile of failure stored in:
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926
> >>> >> > Log data follows:
> >>> >> > | DEBUG: Executing shell function do_install
> >>> >> > |
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
> >>> >> > 113:
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
> >>> >> > i586-poky-linux-chicken-install: not found
> >>> >> > | WARNING: exit code 127 from a shell command.
> >>> >> > | ERROR: Function failed: do_install (log file is located at
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
> >>> >> > ERROR: Task
> >>> >> >
> >>> >> >
> >>> >> >
> (virtual:cross:/home/jarvis/poky/meta-chicken/recipes-chicken/chicken-egg/chicken-egg-matchable_3.7.bb:
> do_install)
> >>> >> > failed with exit code '1'
> >>> >> > WARNING: chicken-egg-typeclass-1.3-r0 do_fetch: Manifest
> >>> >> >
> >>> >> >
> >>> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >>> >> > not found?
> >>> >> >
> >>> >> >
> >>> >> >
> >>> >> > Thanks
>

--001a11441a200c993805680b43f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If it is like : my kernel doesn&#39;t support the WiFi ha=
rdware then either of the below things must be a possibility<div dir=3D"aut=
o">1. I can install a external WiFi adapter and check for that button in Sa=
to</div><div dir=3D"auto">2. I can install kernel WiFi drivers=C2=A0</div><=
div dir=3D"auto">=C2=A0 =C2=A02a. Are there=C2=A0 built WiFi drivers for po=
ky ?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, 23 =
Mar 2018, 00:49 Burton, Ross, &lt;<a href=3D"mailto:ross.burton@intel.com" =
target=3D"_blank" rel=3D"noreferrer">ross.burton@intel.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">As I said yesterday, core-image-sato=
 ships with connman already.=C2=A0 If<br>
the networking UI doesn&#39;t have a big [ ] Turn Wifi On button then the<b=
r>
problem is that your kernel doesn&#39;t support the wifi hardware.<br>
<br>
Ross<br>
<br>
On 22 March 2018 at 17:50, Rajath C S &lt;<a href=3D"mailto:rajathcs.1996@g=
mail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">rajathcs.1996@gma=
il.com</a>&gt; wrote:<br>
&gt; Can you help me setup WiFi connection to poky?<br>
&gt; Im highly struggling with this, I have placed connman in local.conf fi=
le ,<br>
&gt; what next is the procedure such that my poky on qemu can detect the Wi=
Fi?<br>
&gt; Thanks<br>
&gt;<br>
&gt; On Thu, 22 Mar 2018, 23:18 Rajath C S, &lt;<a href=3D"mailto:rajathcs.=
1996@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">rajathcs.19=
96@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Cool, thanks!<br>
&gt;&gt;<br>
&gt;&gt; On Thu, 22 Mar 2018, 23:15 Burton, Ross, &lt;<a href=3D"mailto:ros=
s.burton@intel.com" rel=3D"noreferrer noreferrer" target=3D"_blank">ross.bu=
rton@intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It contains a CSV module for the Scheme language, it isn&#39;t=
 anything<br>
&gt;&gt;&gt; for the user to use.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; CSV files are plain text so any text editor will do.=C2=A0 oe-=
core has a<br>
&gt;&gt;&gt; vi-clone as part of busybox, or l3afpad if you want something<=
br>
&gt;&gt;&gt; graphical.=C2=A0 meta-oe has the usual Linux editors: vim, nan=
o, joe.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Ross<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 22 March 2018 at 17:41, Rajath C S &lt;<a href=3D"mailto:ra=
jathcs.1996@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">raja=
thcs.1996@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt; Thanks for the tip! But meta-chicken contains a CSV forma=
tter since I<br>
&gt;&gt;&gt; &gt; need a<br>
&gt;&gt;&gt; &gt; CSV editor to my image I thought of using meta-chicken.<b=
r>
&gt;&gt;&gt; &gt; Do you know of any other recipes that has the features of=
 CSV editor?<br>
&gt;&gt;&gt; &gt; Thanks<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; On Thu, 22 Mar 2018, 23:09 Burton, Ross, &lt;<a href=3D"m=
ailto:ross.burton@intel.com" rel=3D"noreferrer noreferrer" target=3D"_blank=
">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; That&#39;s a failure in meta-chicken, which isn&#39;t=
 part of oe-core.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; If you need to use meta-chicken then please contact t=
he maintainers of<br>
&gt;&gt;&gt; &gt;&gt; meta-chicken directly.=C2=A0 I do have to wonder if y=
ou actually need<br>
&gt;&gt;&gt; &gt;&gt; meta-chicken though.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; Ross<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; On 22 March 2018 at 17:34, Rajath C S &lt;<a href=3D"=
mailto:rajathcs.1996@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">rajathcs.1996@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt;&gt; &gt; I was including a csv-editor and this error popp=
ed up, any<br>
&gt;&gt;&gt; &gt;&gt; &gt; solutions?<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; WARNING: chicken-4.12.0-r0 do_prepare_recipe_sys=
root: Manifest<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manif=
est-allarch-chicken-cross.populate_sysroot<br>
&gt;&gt;&gt; &gt;&gt; &gt; not found?<br>
&gt;&gt;&gt; &gt;&gt; &gt; WARNING: chicken-egg-matchable-cross-3.7-r0 do_f=
etch: Manifest<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manif=
est-allarch-chicken-cross.populate_sysroot<br>
&gt;&gt;&gt; &gt;&gt; &gt; not found?<br>
&gt;&gt;&gt; &gt;&gt; &gt; WARNING: chicken-egg-typeclass-cross-1.3-r0 do_f=
etch: Manifest<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manif=
est-allarch-chicken-cross.populate_sysroot<br>
&gt;&gt;&gt; &gt;&gt; &gt; not found?<br>
&gt;&gt;&gt; &gt;&gt; &gt; WARNING: chicken-egg-regex-cross-1.0-r0 do_fetch=
: Manifest<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manif=
est-allarch-chicken-cross.populate_sysroot<br>
&gt;&gt;&gt; &gt;&gt; &gt; not found?<br>
&gt;&gt;&gt; &gt;&gt; &gt; WARNING: chicken-egg-matchable-3.7-r0 do_fetch: =
Manifest<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manif=
est-allarch-chicken-cross.populate_sysroot<br>
&gt;&gt;&gt; &gt;&gt; &gt; not found?<br>
&gt;&gt;&gt; &gt;&gt; &gt; WARNING: chicken-egg-make-cross-1.8-r0 do_fetch:=
 Manifest<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manif=
est-allarch-chicken-cross.populate_sysroot<br>
&gt;&gt;&gt; &gt;&gt; &gt; not found?<br>
&gt;&gt;&gt; &gt;&gt; &gt; WARNING: chicken-egg-iset-cross-2.0-r0 do_fetch:=
 Manifest<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manif=
est-allarch-chicken-cross.populate_sysroot<br>
&gt;&gt;&gt; &gt;&gt; &gt; not found?<br>
&gt;&gt;&gt; &gt;&gt; &gt; WARNING: chicken-egg-matchable-cross-3.7-r0 do_p=
atch: Manifest<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manif=
est-allarch-chicken-cross.populate_sysroot<br>
&gt;&gt;&gt; &gt;&gt; &gt; not found?<br>
&gt;&gt;&gt; &gt;&gt; &gt; WARNING: chicken-egg-matchable-cross-3.7-r0<br>
&gt;&gt;&gt; &gt;&gt; &gt; do_prepare_recipe_sysroot:<br>
&gt;&gt;&gt; &gt;&gt; &gt; Manifest<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manif=
est-allarch-chicken-cross.populate_sysroot<br>
&gt;&gt;&gt; &gt;&gt; &gt; not found?<br>
&gt;&gt;&gt; &gt;&gt; &gt; WARNING: chicken-egg-utf8-cross-3.4.4-r0 do_fetc=
h: Manifest<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manif=
est-allarch-chicken-cross.populate_sysroot<br>
&gt;&gt;&gt; &gt;&gt; &gt; not found?<br>
&gt;&gt;&gt; &gt;&gt; &gt; ERROR: chicken-egg-matchable-cross-3.7-r0 do_ins=
tall: Function<br>
&gt;&gt;&gt; &gt;&gt; &gt; failed:<br>
&gt;&gt;&gt; &gt;&gt; &gt; do_install (log file is located at<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/ch=
icken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)<br>
&gt;&gt;&gt; &gt;&gt; &gt; ERROR: Logfile of failure stored in:<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/ch=
icken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926<br>
&gt;&gt;&gt; &gt;&gt; &gt; Log data follows:<br>
&gt;&gt;&gt; &gt;&gt; &gt; | DEBUG: Executing shell function do_install<br>
&gt;&gt;&gt; &gt;&gt; &gt; |<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/ch=
icken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:<br>
&gt;&gt;&gt; &gt;&gt; &gt; 113:<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/ch=
icken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:<br>
&gt;&gt;&gt; &gt;&gt; &gt; i586-poky-linux-chicken-install: not found<br>
&gt;&gt;&gt; &gt;&gt; &gt; | WARNING: exit code 127 from a shell command.<b=
r>
&gt;&gt;&gt; &gt;&gt; &gt; | ERROR: Function failed: do_install (log file i=
s located at<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/ch=
icken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)<br>
&gt;&gt;&gt; &gt;&gt; &gt; ERROR: Task<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; (virtual:cross:/home/jarvis/poky/meta-chicken/re=
cipes-chicken/chicken-egg/chicken-egg-matchable_3.7.bb:do_install)<br>
&gt;&gt;&gt; &gt;&gt; &gt; failed with exit code &#39;1&#39;<br>
&gt;&gt;&gt; &gt;&gt; &gt; WARNING: chicken-egg-typeclass-1.3-r0 do_fetch: =
Manifest<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manif=
est-allarch-chicken-cross.populate_sysroot<br>
&gt;&gt;&gt; &gt;&gt; &gt; not found?<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt; Thanks<br>
</blockquote></div>

--001a11441a200c993805680b43f4--
