Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6877760190
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:50:33 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id s92so6113874uas.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 10:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=PG3W4BuinAG/9LIk0plhYi7Q6qom+uCR6snTIi2JQK8=;
	b=XHTNWRgF34szjktuAwQL/3J93D+RWodorOoQZTciI4uDHi1qkH4yW9qEeGcd2pC27+
	aCSWj0I/LI5gkqhd6g9KDrvDXwaRh5wcJkifKceBg2Vy2dQA96kAXTdcu/8HjTfK4zWi
	haBldRU4HxO6gdXLFGDb9rV9I8IsEoF1IDLIz3XSuAzedSPSNnUkbhh20lioQIxSY2ui
	qHEmU+P8ezkDU245odMIWTExvtPlEY+JjYT1+EZDu+vgjP3yAITm3iKIIJdrRfGi5sfI
	dEcrdgFhGVmcHW16pMyeXDiUwN5GNZ1vjU+vUAZl4tu8pT+SOJDieBK9YMUegsMm4mNB
	ghsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=PG3W4BuinAG/9LIk0plhYi7Q6qom+uCR6snTIi2JQK8=;
	b=jTFIMpWApZQuMqTyP/3LjEIqFinTenUQx403KQdva61AWqF7sx2NmK9Epnk/eusPpm
	z1rykDl6AVod+x08UhQ8JhuIt0OMNgGh2y2cj2B6RnEgHTUS3CEPVOYJ/Gp7x2QbXh73
	eWekSAC9MY4eEOdThIBaBqVePLAwJamKKDqok79ZigEJ7AMOD37jXAV51Z0x7U65gMAg
	/MI8Bf5A2a6uUU+EmYEkdRbPpP++CfAmptaYM2xHy2hqCvUiZhT+/CGv6PCX2OK30EoE
	Yv4bV04wszHpMgSQAY64RBVLHLi49eo7kDe5Ur53xuAq/IaJMlzglip5A58O0DqP1FXs
	7JuQ==
X-Gm-Message-State: AElRT7EUijMdve77YwB+fjr3F32VYtMdq4fX3UnLe0O3bqDQpkj+ID0B
	Uv98kQAQpwtB02IQ4FIn6OIw1DpjyJeHtqSCtDo=
X-Google-Smtp-Source: AG47ELvrX+Yihuloi3KBeXTanUuVEkP2nE0fRpH4Q8e9W8r+4f0jel/oYp6y+bOl5l/3HZqgw3U/sFBpVJ8bY4wRwzw=
X-Received: by 10.176.78.167 with SMTP id l39mr18431648uah.193.1521741034234; 
	Thu, 22 Mar 2018 10:50:34 -0700 (PDT)
MIME-Version: 1.0
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 22 Mar 2018 17:50:23 +0000
Message-ID: <CAPGMVzH-rzxfbLnV4BP5zGW_8EJ8bj4W_uu7dNs4UGW-UfW-5Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Mar 2018 17:50:33 -0000
Content-Type: multipart/alternative; boundary="f403043eee74c92a1f056803f114"

--f403043eee74c92a1f056803f114
Content-Type: text/plain; charset="UTF-8"

Can you help me setup WiFi connection to poky?
Im highly struggling with this, I have placed connman in local.conf file ,
what next is the procedure such that my poky on qemu can detect the WiFi?
Thanks

On Thu, 22 Mar 2018, 23:18 Rajath C S, <rajathcs.1996@gmail.com> wrote:

> Cool, thanks!
>
> On Thu, 22 Mar 2018, 23:15 Burton, Ross, <ross.burton@intel.com> wrote:
>
>> It contains a CSV module for the Scheme language, it isn't anything
>> for the user to use.
>>
>> CSV files are plain text so any text editor will do.  oe-core has a
>> vi-clone as part of busybox, or l3afpad if you want something
>> graphical.  meta-oe has the usual Linux editors: vim, nano, joe.
>>
>> Ross
>>
>> On 22 March 2018 at 17:41, Rajath C S <rajathcs.1996@gmail.com> wrote:
>> > Thanks for the tip! But meta-chicken contains a CSV formatter since I
>> need a
>> > CSV editor to my image I thought of using meta-chicken.
>> > Do you know of any other recipes that has the features of CSV editor?
>> > Thanks
>> >
>> > On Thu, 22 Mar 2018, 23:09 Burton, Ross, <ross.burton@intel.com> wrote:
>> >>
>> >> That's a failure in meta-chicken, which isn't part of oe-core.
>> >>
>> >> If you need to use meta-chicken then please contact the maintainers of
>> >> meta-chicken directly.  I do have to wonder if you actually need
>> >> meta-chicken though.
>> >>
>> >> Ross
>> >>
>> >> On 22 March 2018 at 17:34, Rajath C S <rajathcs.1996@gmail.com> wrote:
>> >> > I was including a csv-editor and this error popped up, any solutions?
>> >> >
>> >> > WARNING: chicken-4.12.0-r0 do_prepare_recipe_sysroot: Manifest
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> >> > not found?
>> >> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_fetch: Manifest
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> >> > not found?
>> >> > WARNING: chicken-egg-typeclass-cross-1.3-r0 do_fetch: Manifest
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> >> > not found?
>> >> > WARNING: chicken-egg-regex-cross-1.0-r0 do_fetch: Manifest
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> >> > not found?
>> >> > WARNING: chicken-egg-matchable-3.7-r0 do_fetch: Manifest
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> >> > not found?
>> >> > WARNING: chicken-egg-make-cross-1.8-r0 do_fetch: Manifest
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> >> > not found?
>> >> > WARNING: chicken-egg-iset-cross-2.0-r0 do_fetch: Manifest
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> >> > not found?
>> >> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_patch: Manifest
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> >> > not found?
>> >> > WARNING: chicken-egg-matchable-cross-3.7-r0
>> do_prepare_recipe_sysroot:
>> >> > Manifest
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> >> > not found?
>> >> > WARNING: chicken-egg-utf8-cross-3.4.4-r0 do_fetch: Manifest
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> >> > not found?
>> >> > ERROR: chicken-egg-matchable-cross-3.7-r0 do_install: Function
>> failed:
>> >> > do_install (log file is located at
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
>> >> > ERROR: Logfile of failure stored in:
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926
>> >> > Log data follows:
>> >> > | DEBUG: Executing shell function do_install
>> >> > |
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
>> >> > 113:
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
>> >> > i586-poky-linux-chicken-install: not found
>> >> > | WARNING: exit code 127 from a shell command.
>> >> > | ERROR: Function failed: do_install (log file is located at
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
>> >> > ERROR: Task
>> >> >
>> >> >
>> (virtual:cross:/home/jarvis/poky/meta-chicken/recipes-chicken/chicken-egg/chicken-egg-matchable_3.7.bb:
>> do_install)
>> >> > failed with exit code '1'
>> >> > WARNING: chicken-egg-typeclass-1.3-r0 do_fetch: Manifest
>> >> >
>> >> >
>> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> >> > not found?
>> >> >
>> >> >
>> >> >
>> >> > Thanks
>>
>

--f403043eee74c92a1f056803f114
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you help me setup WiFi connection to poky?=C2=A0<div =
dir=3D"auto">Im highly struggling with this, I have placed connman in local=
.conf file , what next is the procedure such that my poky on qemu can detec=
t the WiFi?</div><div dir=3D"auto">Thanks</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr">On Thu, 22 Mar 2018, 23:18 Rajath C S, &lt;<a hre=
f=3D"mailto:rajathcs.1996@gmail.com">rajathcs.1996@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">Cool, thanks!=C2=
=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 22 Mar 201=
8, 23:15 Burton, Ross, &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank" rel=3D"noreferrer">ross.burton@intel.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">It contains a CSV module for the Scheme la=
nguage, it isn&#39;t anything<br>
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
mail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">rajathcs.1996@gma=
il.com</a>&gt; wrote:<br>
&gt; Thanks for the tip! But meta-chicken contains a CSV formatter since I =
need a<br>
&gt; CSV editor to my image I thought of using meta-chicken.<br>
&gt; Do you know of any other recipes that has the features of CSV editor?<=
br>
&gt; Thanks<br>
&gt;<br>
&gt; On Thu, 22 Mar 2018, 23:09 Burton, Ross, &lt;<a href=3D"mailto:ross.bu=
rton@intel.com" rel=3D"noreferrer noreferrer" target=3D"_blank">ross.burton=
@intel.com</a>&gt; wrote:<br>
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
cs.1996@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">rajathcs=
.1996@gmail.com</a>&gt; wrote:<br>
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
</blockquote></div></blockquote></div>

--f403043eee74c92a1f056803f114--
