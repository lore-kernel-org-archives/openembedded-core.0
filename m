Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD2060190
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:48:24 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id l21so676494uak.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 10:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kUWkUxZZoRv/GeQNgQPSu+phANFTJYERYYCiGZHv/b0=;
	b=huEVo5CXQ/K/3IoMvvzD38Djh3vgCsPpKe3Df6vKYHS4KmKnZy703DktdnlMBS77EP
	w+DF+lzgV9FUDL0/dwGk86RhACLvi77ahaIbnDqWOT7duN40xv9JW8b9lxSAZE7dnXtd
	ywjKOXdz9+0G2BEWQkLvwg4dYiirBRmQPQdfFKn9VzxyrPpXAay8wz0cnneEltpgQ180
	mP4jWNDkZ55YDReXhrK7K9wWgv0BHjh0fHVZOH05SpiC28sbx/ahtNTCAOxDy/+HTJq6
	9+sxKM8gX5FL6wYxoe+sj/jbZvJYwCBmGwFAJ0W8pcgGvVrME4KqN3tuPPhnzFhQdFEb
	ibZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kUWkUxZZoRv/GeQNgQPSu+phANFTJYERYYCiGZHv/b0=;
	b=bSL0XBpRX52rZDdgzKJ43QlVMyWXOKya6vvOP4tixewmgvHXi8rXeKP3wddeZ8MOdG
	RGpLCg0j8ILt4qXvw0F8bAQmdwnzmOcSOA/gVKC3MwcTtv12jtsIWsmF7wp3QuunHnXE
	LNiOMJWxEzfzPHCyeemX8kD4xvctZElZbqqPImPKoSGCV0IAJ3jVmYbOtMyX87fqirXX
	BtTIlf2DzADz2IBhkoGyB6xEBtLxFBpJjqUe0DifUd0B7o7AjHHce/irWCUercr5fECj
	Aty7hZoFfo+YusTlvM/KVMvHlUMtAYhBMJ0q5E//+knb19hYAujPe6R+SYYdVSkR7LdB
	aL9w==
X-Gm-Message-State: AElRT7GAexy4L2U7AWyh0trAoKjp2A+hH04PcLy1w8IaZ3e6KGEVqYv2
	u6BUZG66Blm+aG0MgU2E49IfEvxV782Qclnybak=
X-Google-Smtp-Source: AG47ELvQgYKRWVz5Z9yiR7ku+NKcbf5if9Xt6xLF+Hb8uTghzRAorJ56Gp2Mh8S3rc3N+aJlQtVs9+GhD3yygqxuXJM=
X-Received: by 10.159.61.203 with SMTP id e11mr10283243uaj.115.1521740906100; 
	Thu, 22 Mar 2018 10:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGMVzEZYNtpjPS3HWy9Q2vOo85X_y1Lb6ZvNpnJLCgvSiQ0bw@mail.gmail.com>
	<CAJTo0LZZwXSNJ2S7Z9zVFJoLkAUUVQ5AGadqR8-u1xcookQcXA@mail.gmail.com>
	<CAPGMVzG_jPgtvsG8jrBGK2sTsf2aKk5rgqq5krk4m6g8UM1sxw@mail.gmail.com>
	<CAJTo0LZxonCG47kdW3u+SJAPVj7e93vXPR8A-xK5L4Fpu9a6Bg@mail.gmail.com>
In-Reply-To: <CAJTo0LZxonCG47kdW3u+SJAPVj7e93vXPR8A-xK5L4Fpu9a6Bg@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 22 Mar 2018 17:48:15 +0000
Message-ID: <CAPGMVzFkDCCNCUQnZA7hL07S91s0M56SP0mrc9xva0AAOa7m3w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-chicken]
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
X-List-Received-Date: Thu, 22 Mar 2018 17:48:25 -0000
Content-Type: multipart/alternative; boundary="089e0824502825fdd7056803eaf1"

--089e0824502825fdd7056803eaf1
Content-Type: text/plain; charset="UTF-8"

Cool, thanks!

On Thu, 22 Mar 2018, 23:15 Burton, Ross, <ross.burton@intel.com> wrote:

> It contains a CSV module for the Scheme language, it isn't anything
> for the user to use.
>
> CSV files are plain text so any text editor will do.  oe-core has a
> vi-clone as part of busybox, or l3afpad if you want something
> graphical.  meta-oe has the usual Linux editors: vim, nano, joe.
>
> Ross
>
> On 22 March 2018 at 17:41, Rajath C S <rajathcs.1996@gmail.com> wrote:
> > Thanks for the tip! But meta-chicken contains a CSV formatter since I
> need a
> > CSV editor to my image I thought of using meta-chicken.
> > Do you know of any other recipes that has the features of CSV editor?
> > Thanks
> >
> > On Thu, 22 Mar 2018, 23:09 Burton, Ross, <ross.burton@intel.com> wrote:
> >>
> >> That's a failure in meta-chicken, which isn't part of oe-core.
> >>
> >> If you need to use meta-chicken then please contact the maintainers of
> >> meta-chicken directly.  I do have to wonder if you actually need
> >> meta-chicken though.
> >>
> >> Ross
> >>
> >> On 22 March 2018 at 17:34, Rajath C S <rajathcs.1996@gmail.com> wrote:
> >> > I was including a csv-editor and this error popped up, any solutions?
> >> >
> >> > WARNING: chicken-4.12.0-r0 do_prepare_recipe_sysroot: Manifest
> >> >
> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >> > not found?
> >> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_fetch: Manifest
> >> >
> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >> > not found?
> >> > WARNING: chicken-egg-typeclass-cross-1.3-r0 do_fetch: Manifest
> >> >
> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >> > not found?
> >> > WARNING: chicken-egg-regex-cross-1.0-r0 do_fetch: Manifest
> >> >
> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >> > not found?
> >> > WARNING: chicken-egg-matchable-3.7-r0 do_fetch: Manifest
> >> >
> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >> > not found?
> >> > WARNING: chicken-egg-make-cross-1.8-r0 do_fetch: Manifest
> >> >
> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >> > not found?
> >> > WARNING: chicken-egg-iset-cross-2.0-r0 do_fetch: Manifest
> >> >
> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >> > not found?
> >> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_patch: Manifest
> >> >
> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >> > not found?
> >> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_prepare_recipe_sysroot:
> >> > Manifest
> >> >
> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >> > not found?
> >> > WARNING: chicken-egg-utf8-cross-3.4.4-r0 do_fetch: Manifest
> >> >
> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >> > not found?
> >> > ERROR: chicken-egg-matchable-cross-3.7-r0 do_install: Function failed:
> >> > do_install (log file is located at
> >> >
> >> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
> >> > ERROR: Logfile of failure stored in:
> >> >
> >> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926
> >> > Log data follows:
> >> > | DEBUG: Executing shell function do_install
> >> > |
> >> >
> >> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
> >> > 113:
> >> >
> >> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
> >> > i586-poky-linux-chicken-install: not found
> >> > | WARNING: exit code 127 from a shell command.
> >> > | ERROR: Function failed: do_install (log file is located at
> >> >
> >> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
> >> > ERROR: Task
> >> >
> >> >
> (virtual:cross:/home/jarvis/poky/meta-chicken/recipes-chicken/chicken-egg/chicken-egg-matchable_3.7.bb:
> do_install)
> >> > failed with exit code '1'
> >> > WARNING: chicken-egg-typeclass-1.3-r0 do_fetch: Manifest
> >> >
> >> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> >> > not found?
> >> >
> >> >
> >> >
> >> > Thanks
>

--089e0824502825fdd7056803eaf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Cool, thanks!=C2=A0</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Thu, 22 Mar 2018, 23:15 Burton, Ross, &lt;<a href=3D"mai=
lto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">It contains a CSV module for the Scheme langua=
ge, it isn&#39;t anything<br>
for the user to use.<br>
<br>
CSV files are plain text so any text editor will do.=C2=A0 oe-core has a<br=
>
vi-clone as part of busybox, or l3afpad if you want something<br>
graphical.=C2=A0 meta-oe has the usual Linux editors: vim, nano, joe.<br>
<br>
Ross<br>
<br>
On 22 March 2018 at 17:41, Rajath C S &lt;<a href=3D"mailto:rajathcs.1996@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">rajathcs.1996@gmail.com</a>&=
gt; wrote:<br>
&gt; Thanks for the tip! But meta-chicken contains a CSV formatter since I =
need a<br>
&gt; CSV editor to my image I thought of using meta-chicken.<br>
&gt; Do you know of any other recipes that has the features of CSV editor?<=
br>
&gt; Thanks<br>
&gt;<br>
&gt; On Thu, 22 Mar 2018, 23:09 Burton, Ross, &lt;<a href=3D"mailto:ross.bu=
rton@intel.com" target=3D"_blank" rel=3D"noreferrer">ross.burton@intel.com<=
/a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; That&#39;s a failure in meta-chicken, which isn&#39;t part of oe-c=
ore.<br>
&gt;&gt;<br>
&gt;&gt; If you need to use meta-chicken then please contact the maintainer=
s of<br>
&gt;&gt; meta-chicken directly.=C2=A0 I do have to wonder if you actually n=
eed<br>
&gt;&gt; meta-chicken though.<br>
&gt;&gt;<br>
&gt;&gt; Ross<br>
&gt;&gt;<br>
&gt;&gt; On 22 March 2018 at 17:34, Rajath C S &lt;<a href=3D"mailto:rajath=
cs.1996@gmail.com" target=3D"_blank" rel=3D"noreferrer">rajathcs.1996@gmail=
.com</a>&gt; wrote:<br>
&gt;&gt; &gt; I was including a csv-editor and this error popped up, any so=
lutions?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; WARNING: chicken-4.12.0-r0 do_prepare_recipe_sysroot: Manifes=
t<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-c=
hicken-cross.populate_sysroot<br>
&gt;&gt; &gt; not found?<br>
&gt;&gt; &gt; WARNING: chicken-egg-matchable-cross-3.7-r0 do_fetch: Manifes=
t<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-c=
hicken-cross.populate_sysroot<br>
&gt;&gt; &gt; not found?<br>
&gt;&gt; &gt; WARNING: chicken-egg-typeclass-cross-1.3-r0 do_fetch: Manifes=
t<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-c=
hicken-cross.populate_sysroot<br>
&gt;&gt; &gt; not found?<br>
&gt;&gt; &gt; WARNING: chicken-egg-regex-cross-1.0-r0 do_fetch: Manifest<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-c=
hicken-cross.populate_sysroot<br>
&gt;&gt; &gt; not found?<br>
&gt;&gt; &gt; WARNING: chicken-egg-matchable-3.7-r0 do_fetch: Manifest<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-c=
hicken-cross.populate_sysroot<br>
&gt;&gt; &gt; not found?<br>
&gt;&gt; &gt; WARNING: chicken-egg-make-cross-1.8-r0 do_fetch: Manifest<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-c=
hicken-cross.populate_sysroot<br>
&gt;&gt; &gt; not found?<br>
&gt;&gt; &gt; WARNING: chicken-egg-iset-cross-2.0-r0 do_fetch: Manifest<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-c=
hicken-cross.populate_sysroot<br>
&gt;&gt; &gt; not found?<br>
&gt;&gt; &gt; WARNING: chicken-egg-matchable-cross-3.7-r0 do_patch: Manifes=
t<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-c=
hicken-cross.populate_sysroot<br>
&gt;&gt; &gt; not found?<br>
&gt;&gt; &gt; WARNING: chicken-egg-matchable-cross-3.7-r0 do_prepare_recipe=
_sysroot:<br>
&gt;&gt; &gt; Manifest<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-c=
hicken-cross.populate_sysroot<br>
&gt;&gt; &gt; not found?<br>
&gt;&gt; &gt; WARNING: chicken-egg-utf8-cross-3.4.4-r0 do_fetch: Manifest<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-c=
hicken-cross.populate_sysroot<br>
&gt;&gt; &gt; not found?<br>
&gt;&gt; &gt; ERROR: chicken-egg-matchable-cross-3.7-r0 do_install: Functio=
n failed:<br>
&gt;&gt; &gt; do_install (log file is located at<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-mat=
chable-cross/3.7-r0/temp/log.do_install.17926)<br>
&gt;&gt; &gt; ERROR: Logfile of failure stored in:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-mat=
chable-cross/3.7-r0/temp/log.do_install.17926<br>
&gt;&gt; &gt; Log data follows:<br>
&gt;&gt; &gt; | DEBUG: Executing shell function do_install<br>
&gt;&gt; &gt; |<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-mat=
chable-cross/3.7-r0/temp/run.do_install.17926:<br>
&gt;&gt; &gt; 113:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-mat=
chable-cross/3.7-r0/temp/run.do_install.17926:<br>
&gt;&gt; &gt; i586-poky-linux-chicken-install: not found<br>
&gt;&gt; &gt; | WARNING: exit code 127 from a shell command.<br>
&gt;&gt; &gt; | ERROR: Function failed: do_install (log file is located at<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-mat=
chable-cross/3.7-r0/temp/log.do_install.17926)<br>
&gt;&gt; &gt; ERROR: Task<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; (virtual:cross:/home/jarvis/poky/meta-chicken/recipes-chicken=
/chicken-egg/chicken-egg-matchable_3.7.bb:do_install)<br>
&gt;&gt; &gt; failed with exit code &#39;1&#39;<br>
&gt;&gt; &gt; WARNING: chicken-egg-typeclass-1.3-r0 do_fetch: Manifest<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-c=
hicken-cross.populate_sysroot<br>
&gt;&gt; &gt; not found?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks<br>
</blockquote></div>

--089e0824502825fdd7056803eaf1--
