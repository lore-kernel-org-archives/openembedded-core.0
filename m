Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7A978919
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:42:01 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id y127so5748662vky.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 10:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kahCTy0YVQPEk0hfIfRanCjjsX+HidEJpnH/6sAlL6c=;
	b=ILkZZS5H77tARdLQ+0nV31vn+qIInwn3NmoyHDGOfh/PWk+1wBdYDgZnp8GXCqk53D
	SIWVSEr1jtnqqeoEe4ccZrLJb/IchoRUvIZ0MbUjcr7Ymlv7dOdNFZBDNZb2YsEBye22
	97nXpWiHHx653Ls6XjGfo94KtUpB+W6P2CmXVJp29srS4vLMgWR8Cnqn5PK4g7+SmdES
	jRLOzT5btBiE9sqa2ZiDCKzwPHHwMViQAisr4H3FYT38AicG4XluhyszEgcP5o9Ebml0
	S7aetB3WXin20cwNjRz4zsS9+uxusLw5l/iMmzsw6LpC7QZ8WSQKstmvHmkq3OQlQwH2
	2VJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kahCTy0YVQPEk0hfIfRanCjjsX+HidEJpnH/6sAlL6c=;
	b=OAQQ6rggf2dvhf1e6tWhao13sDVF/FOAneyIiLJw2QC8bD4E2AmD4kEszwH1wIY976
	+1ZTSVxOm6qOT0BdhdSoI55MFf770E+KiNriJ8DLL1H+Z3GLBcI8HEf2YnYcbbMNuq+B
	0MI6JaUTGXRvc08SU0sdxL+WBqHjYE5Ki0KQ7rmjWipjVQJOVbumqXB3f+NzLKTFtLOe
	4vgKy714ODFVwjpHmWOtSbeLOE7/mKJ0UVg2SmTVCvrtWQ3RTR26q7q+i+o8YCRpScGl
	CTUJ9mWBR8g4yq3B3sfAeuO1yh5JcFgomBoKsJF2HHG68VHa81U8OxSxA3Tdvknxs20u
	bNRg==
X-Gm-Message-State: AElRT7GxxZQlsBCRpD3Q25O5PQuVKIJ9xfE5bWOgZT2u6xAVtw6E3aqw
	+j5/eR14QahQtLpkc2gAxPtyMcFEP+cMeEQXZj8=
X-Google-Smtp-Source: AG47ELvxYMSkmLPq8II2q44ju2OWdPnsT2ulLy6HN99qe9+YM3iDiwBA4gGL1WyTvHg4M1P7za2icim7ezL9IDOkWJE=
X-Received: by 10.31.149.129 with SMTP id x123mr16491299vkd.196.1521740523022; 
	Thu, 22 Mar 2018 10:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGMVzEZYNtpjPS3HWy9Q2vOo85X_y1Lb6ZvNpnJLCgvSiQ0bw@mail.gmail.com>
	<CAJTo0LZZwXSNJ2S7Z9zVFJoLkAUUVQ5AGadqR8-u1xcookQcXA@mail.gmail.com>
In-Reply-To: <CAJTo0LZZwXSNJ2S7Z9zVFJoLkAUUVQ5AGadqR8-u1xcookQcXA@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 22 Mar 2018 17:41:52 +0000
Message-ID: <CAPGMVzG_jPgtvsG8jrBGK2sTsf2aKk5rgqq5krk4m6g8UM1sxw@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Mar 2018 17:42:02 -0000
Content-Type: multipart/alternative; boundary="001a114266a250ad58056803d32f"

--001a114266a250ad58056803d32f
Content-Type: text/plain; charset="UTF-8"

Thanks for the tip! But meta-chicken contains a CSV formatter since I need
a CSV editor to my image I thought of using meta-chicken.
Do you know of any other recipes that has the features of CSV editor?
Thanks

On Thu, 22 Mar 2018, 23:09 Burton, Ross, <ross.burton@intel.com> wrote:

> That's a failure in meta-chicken, which isn't part of oe-core.
>
> If you need to use meta-chicken then please contact the maintainers of
> meta-chicken directly.  I do have to wonder if you actually need
> meta-chicken though.
>
> Ross
>
> On 22 March 2018 at 17:34, Rajath C S <rajathcs.1996@gmail.com> wrote:
> > I was including a csv-editor and this error popped up, any solutions?
> >
> > WARNING: chicken-4.12.0-r0 do_prepare_recipe_sysroot: Manifest
> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> > not found?
> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_fetch: Manifest
> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> > not found?
> > WARNING: chicken-egg-typeclass-cross-1.3-r0 do_fetch: Manifest
> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> > not found?
> > WARNING: chicken-egg-regex-cross-1.0-r0 do_fetch: Manifest
> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> > not found?
> > WARNING: chicken-egg-matchable-3.7-r0 do_fetch: Manifest
> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> > not found?
> > WARNING: chicken-egg-make-cross-1.8-r0 do_fetch: Manifest
> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> > not found?
> > WARNING: chicken-egg-iset-cross-2.0-r0 do_fetch: Manifest
> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> > not found?
> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_patch: Manifest
> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> > not found?
> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_prepare_recipe_sysroot:
> > Manifest
> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> > not found?
> > WARNING: chicken-egg-utf8-cross-3.4.4-r0 do_fetch: Manifest
> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> > not found?
> > ERROR: chicken-egg-matchable-cross-3.7-r0 do_install: Function failed:
> > do_install (log file is located at
> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
> > ERROR: Logfile of failure stored in:
> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926
> > Log data follows:
> > | DEBUG: Executing shell function do_install
> > |
> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
> > 113:
> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
> > i586-poky-linux-chicken-install: not found
> > | WARNING: exit code 127 from a shell command.
> > | ERROR: Function failed: do_install (log file is located at
> >
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
> > ERROR: Task
> >
> (virtual:cross:/home/jarvis/poky/meta-chicken/recipes-chicken/chicken-egg/chicken-egg-matchable_3.7.bb:
> do_install)
> > failed with exit code '1'
> > WARNING: chicken-egg-typeclass-1.3-r0 do_fetch: Manifest
> >
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> > not found?
> >
> >
> >
> > Thanks
>

--001a114266a250ad58056803d32f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the tip! But meta-chicken contains a CSV forma=
tter since I need a CSV editor to my image I thought of using meta-chicken.=
<div dir=3D"auto">Do you know of any other recipes that has the features of=
 CSV editor?=C2=A0</div><div dir=3D"auto">Thanks</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Thu, 22 Mar 2018, 23:09 Burton, Ross, =
&lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">That&#39;s a failure in meta=
-chicken, which isn&#39;t part of oe-core.<br>
<br>
If you need to use meta-chicken then please contact the maintainers of<br>
meta-chicken directly.=C2=A0 I do have to wonder if you actually need<br>
meta-chicken though.<br>
<br>
Ross<br>
<br>
On 22 March 2018 at 17:34, Rajath C S &lt;<a href=3D"mailto:rajathcs.1996@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">rajathcs.1996@gmail.com</a>&=
gt; wrote:<br>
&gt; I was including a csv-editor and this error popped up, any solutions?<=
br>
&gt;<br>
&gt; WARNING: chicken-4.12.0-r0 do_prepare_recipe_sysroot: Manifest<br>
&gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cr=
oss.populate_sysroot<br>
&gt; not found?<br>
&gt; WARNING: chicken-egg-matchable-cross-3.7-r0 do_fetch: Manifest<br>
&gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cr=
oss.populate_sysroot<br>
&gt; not found?<br>
&gt; WARNING: chicken-egg-typeclass-cross-1.3-r0 do_fetch: Manifest<br>
&gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cr=
oss.populate_sysroot<br>
&gt; not found?<br>
&gt; WARNING: chicken-egg-regex-cross-1.0-r0 do_fetch: Manifest<br>
&gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cr=
oss.populate_sysroot<br>
&gt; not found?<br>
&gt; WARNING: chicken-egg-matchable-3.7-r0 do_fetch: Manifest<br>
&gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cr=
oss.populate_sysroot<br>
&gt; not found?<br>
&gt; WARNING: chicken-egg-make-cross-1.8-r0 do_fetch: Manifest<br>
&gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cr=
oss.populate_sysroot<br>
&gt; not found?<br>
&gt; WARNING: chicken-egg-iset-cross-2.0-r0 do_fetch: Manifest<br>
&gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cr=
oss.populate_sysroot<br>
&gt; not found?<br>
&gt; WARNING: chicken-egg-matchable-cross-3.7-r0 do_patch: Manifest<br>
&gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cr=
oss.populate_sysroot<br>
&gt; not found?<br>
&gt; WARNING: chicken-egg-matchable-cross-3.7-r0 do_prepare_recipe_sysroot:=
<br>
&gt; Manifest<br>
&gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cr=
oss.populate_sysroot<br>
&gt; not found?<br>
&gt; WARNING: chicken-egg-utf8-cross-3.4.4-r0 do_fetch: Manifest<br>
&gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cr=
oss.populate_sysroot<br>
&gt; not found?<br>
&gt; ERROR: chicken-egg-matchable-cross-3.7-r0 do_install: Function failed:=
<br>
&gt; do_install (log file is located at<br>
&gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cr=
oss/3.7-r0/temp/log.do_install.17926)<br>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cr=
oss/3.7-r0/temp/log.do_install.17926<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing shell function do_install<br>
&gt; |<br>
&gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cr=
oss/3.7-r0/temp/run.do_install.17926:<br>
&gt; 113:<br>
&gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cr=
oss/3.7-r0/temp/run.do_install.17926:<br>
&gt; i586-poky-linux-chicken-install: not found<br>
&gt; | WARNING: exit code 127 from a shell command.<br>
&gt; | ERROR: Function failed: do_install (log file is located at<br>
&gt; /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cr=
oss/3.7-r0/temp/log.do_install.17926)<br>
&gt; ERROR: Task<br>
&gt; (virtual:cross:/home/jarvis/poky/meta-chicken/recipes-chicken/chicken-=
egg/chicken-egg-matchable_3.7.bb:do_install)<br>
&gt; failed with exit code &#39;1&#39;<br>
&gt; WARNING: chicken-egg-typeclass-1.3-r0 do_fetch: Manifest<br>
&gt; /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cr=
oss.populate_sysroot<br>
&gt; not found?<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Thanks<br>
</blockquote></div>

--001a114266a250ad58056803d32f--
