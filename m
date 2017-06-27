Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBEC60290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:12:21 +0000 (UTC)
Received: by mail-yb0-f177.google.com with SMTP id b81so7144905yba.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 01:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JD+jN08dgn9POkBYMxp2OSsvZ5QnARsdQxem4zhOpf8=;
	b=Hiv9xb8waKj9K61M7jUPJVe0KfyeE4wZSyYik7kHFVmSwYI7fh3eBjlq7ONVWRKr9o
	ShjetuPguQHX/zxN2KXwhpZ1z9md/79pw5xntE5glYp+IMzFClnDlx24qQ/dCDpmtPgK
	T+QJdDplDN3nljU55M9MPnjg9K9LKIriuRhXM70Djes5osiarmMUQD2L9zOjWOcwsJ0v
	DLbn1HR9iSUCeVmfQ3N5HSk61iN2BAEZuh0kSLVQOg4X7m/Rk67eNy9LxSXyCjKBbJHu
	W0hkBuCj/Y6l65P5rG4+wwpCuHE8z5eM8ZLXkdr9Znq2FpeTiWpi8mq5LbRyp8teWQLw
	HHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JD+jN08dgn9POkBYMxp2OSsvZ5QnARsdQxem4zhOpf8=;
	b=fJs4s2b3fmGzRL0Ywa9UV0kC3vk/MReyTIYnTetBrYnxDTny0K72ReEu+G88PhMD/L
	hlEyBM5SYrcG/h8KzODdtP6u9a+9sNL7zeHyuzXFxJuxvnGOnbEh38FxOtOfRmYmA05/
	VBSbytTa+H/lbN5CL7Towpt0YZNt/JYo4MG8nz/xfr0bHaH/M9fhCMn2ZMLO7PNgurWU
	p0ekgqjV63kDny0H58MwS8CUSBzyrrc8BRIPpSt7Zzwa5WEWG2juvTDMRFePPaSdwWTe
	mD1RwQU/WlY3SHrty5FoRzhjjG2CQ739rnCHGX9Arml5ptnJ0r5hcVk9Y2nD3O/tp8zh
	bcYg==
X-Gm-Message-State: AKS2vOwXfsR8MotHmj8r4wa8OC0jmSFt7BrShzlg098RYEC7P15P/1dl
	35HbqRXN6ROFGjD5JELLn7H6i0gKOw==
X-Received: by 10.37.115.76 with SMTP id o73mr3165219ybc.109.1498551142441;
	Tue, 27 Jun 2017 01:12:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Tue, 27 Jun 2017 01:12:21 -0700 (PDT)
In-Reply-To: <1498550932.7464.29.camel@intel.com>
References: <CA+chaQcmksz0eGEwb9RZ9B_7JFaB7e97iNCoWCp84zJEkqpHoA@mail.gmail.com>
	<1498550932.7464.29.camel@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Jun 2017 10:12:21 +0200
Message-ID: <CA+chaQf=qedEY+V7b8WUG=YNKwANzTSabaY4DNZMa81V7-MiPQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Never ending stream of bitbake exceptions when the builder runs out of disk space
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
X-List-Received-Date: Tue, 27 Jun 2017 08:12:21 -0000
Content-Type: multipart/alternative; boundary="001a114dda2e85e7cb0552eca0b9"

--001a114dda2e85e7cb0552eca0b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is BB_DISKMON_DIRS enabled by default?

Quick grep shows it only in local.conf.sample*:
meta/conf/local.conf.sample:BB_DISKMON_DIRS =3D "\
meta/conf/local.conf.sample.extended:# inode is running low, it is enabled
when BB_DISKMON_DIRS is set.
meta/conf/local.conf.sample.extended:#BB_DISKMON_DIRS =3D
"STOPTASKS,${TMPDIR},1G,100K WARN,${SSTATE_DIR},1G,100K"

and my jenkins builds are very close to default oe-core nodistro config, so
I don't think I have that enabled.

Maybe I should enable it, or maybe it should be enabled by default if we
cannot fix this exception stream.

Thanks

On Tue, Jun 27, 2017 at 10:08 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> On Thu, 2017-06-15 at 08:48 +0200, Martin Jansa wrote:
> > This issue exists for very long time.
> >
> >
> > I know that when the builder runs out of disk space there are multiple
> > things which might go wrong (I've seen bad archives on premirrors, bad
> > sstate archives caused by this), so this issue isn't the main problem,
> > but still would be nice to fail faster.
> >
> >
> > In last build which was running for some 9 hours, it was first
> > building for maybe 2 hours before it run out of disk space and this
> > morning there is 50MB log just from bitbake output stored on the
> > jenkins master. Repeating following message very quickly
> >
> >
> > # grep -c "Errno 28" consoleText.txt
> > 42986
> >
> >
> > ERROR: Running command [['world'], 'build']
> > Traceback (most recent call last):
> >   File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py", line
> > 211, in fire(event=3D<bb.event.HeartbeatEvent object at 0x7fcfed3e96a0>=
,
> > d=3D<bb.data_smart.DataSmart object at 0x7fd00330b198>):
> >
> >     >    fire_class_handlers(event, d)
> >          if worker_fire:
> >   File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py", line
> > 134, in fire_class_handlers(event=3D<bb.event.HeartbeatEvent object at
> > 0x7fcfed3e96a0>, d=3D<bb.data_smart.DataSmart object at
> > 0x7fd00330b198>):
> >                          continue
> >     >            execute_handler(name, handler, event, d)
> >
> >   File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py", line
> > 106, in execute_handler(name=3D'runqueue_stats', handler=3D<function
> > runqueue_stats at 0x7fd0020c6158>, event=3D<bb.event.HeartbeatEvent
> > object at 0x7fcfed3e96a0>, d=3D<bb.data_smart.DataSmart object at
> > 0x7fd00330b198>):
> >          try:
> >     >        ret =3D handler(event)
> >          except (bb.parse.SkipRecipe, bb.BBHandledException):
> >   File
> > "/home/jenkins/oe/world/shr-core/openembedded-core/meta/classes/buildst=
ats.bbclass",
> line 212, in runqueue_stats(e=3D<bb.event.HeartbeatEvent object at
> 0x7fcfed3e96a0>):
> >              done =3D isinstance(e, bb.event.BuildCompleted)
> >     >        system_stats.sample(e, force=3Ddone)
> >              if done:
> >   File
> > "/home/jenkins/oe/world/shr-core/openembedded-core/meta/lib/buildstats.=
py",
> line 148, in SystemStats.sample(event=3D<bb.event.HeartbeatEvent object a=
t
> 0x7fcfed3e96a0>, force=3DFalse):
> >                                       data +
> >     >                                 b'\n')
> >                  self.last_proc =3D now
> > OSError: [Errno 28] No space left on device
> >
> >
> > =EF=BF=BCIt would be better to exit completely when something as bad as=
 Errno
> > 28 happens.
>
> Do you have BB_DISKMON_DIRS active? Probably yes.
>
> The reason why it did not trigger here might be that the build ran out
> of disk space so quickly that the disk monitoring had no chance to
> detect the problem before system stat sampling itself started failing
> with the error above.
>
> System stat sampling and disk monitoring are hooking into the same
> event, so my theory is that once the system stat sampling fails, disk
> monitoring code no longer runs.
>
> I'm not sure what exactly the right fix is: detect uncaught OSError like
> 28 in the bitbake event loop and abort the build, and/or catch the error
> in buildstats.py and ignore it so that the normal disk monitoring can
> happen?
>
> I know how to do the latter, but not the former.
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
>

--001a114dda2e85e7cb0552eca0b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is=C2=A0<span style=3D"font-size:12.8px">BB_DISKMON_DIRS e=
nabled by default?</span><div><span style=3D"font-size:12.8px"><br></span><=
/div><div><span style=3D"font-size:12.8px">Quick grep shows it only in loca=
l.conf.sample*:</span></div><div><div><span style=3D"font-size:12.8px">meta=
/conf/local.conf.sample:BB_DISKMON_DIRS =3D &quot;\</span></div><div><span =
style=3D"font-size:12.8px">meta/conf/local.conf.sample.extended:# inode is =
running low, it is enabled when BB_DISKMON_DIRS is set.</span></div><div><s=
pan style=3D"font-size:12.8px">meta/conf/local.conf.sample.extended:#BB_DIS=
KMON_DIRS =3D &quot;STOPTASKS,${TMPDIR},1G,100K WARN,${SSTATE_DIR},1G,100K&=
quot;</span></div><div style=3D"font-size:12.8px"><br></div></div><div styl=
e=3D"font-size:12.8px">and my jenkins builds are very close to default oe-c=
ore nodistro config, so I don&#39;t think I have that enabled.</div><div st=
yle=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">Maybe I =
should enable it, or maybe it should be enabled by default if we cannot fix=
 this exception stream.</div><div style=3D"font-size:12.8px"><br></div><div=
 style=3D"font-size:12.8px">Thanks</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Tue, Jun 27, 2017 at 10:08 AM, Patrick Ohly=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick.ohly@intel.com" target=3D"=
_blank">patrick.ohly@intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Thu, 2017-06-15 at=
 08:48 +0200, Martin Jansa wrote:<br>
&gt; This issue exists for very long time.<br>
&gt;<br>
&gt;<br>
&gt; I know that when the builder runs out of disk space there are multiple=
<br>
&gt; things which might go wrong (I&#39;ve seen bad archives on premirrors,=
 bad<br>
&gt; sstate archives caused by this), so this issue isn&#39;t the main prob=
lem,<br>
&gt; but still would be nice to fail faster.<br>
&gt;<br>
&gt;<br>
&gt; In last build which was running for some 9 hours, it was first<br>
&gt; building for maybe 2 hours before it run out of disk space and this<br=
>
&gt; morning there is 50MB log just from bitbake output stored on the<br>
&gt; jenkins master. Repeating following message very quickly<br>
&gt;<br>
&gt;<br>
&gt; # grep -c &quot;Errno 28&quot; consoleText.txt<br>
&gt; 42986<br>
&gt;<br>
&gt;<br>
&gt; ERROR: Running command [[&#39;world&#39;], &#39;build&#39;]<br>
&gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0File &quot;/home/jenkins/oe/world/shr-<wbr>core/bitbake/li=
b/bb/event.py&quot;, line<br>
&gt; 211, in fire(event=3D&lt;bb.event.<wbr>HeartbeatEvent object at 0x7fcf=
ed3e96a0&gt;,<br>
&gt; d=3D&lt;bb.data_smart.DataSmart object at 0x7fd00330b198&gt;):<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 fire_class_handlers(event, d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if worker_fire:<br>
&gt;=C2=A0 =C2=A0File &quot;/home/jenkins/oe/world/shr-<wbr>core/bitbake/li=
b/bb/event.py&quot;, line<br>
&gt; 134, in fire_class_handlers(event=3D&lt;bb.<wbr>event.HeartbeatEvent o=
bject at<br>
&gt; 0x7fcfed3e96a0&gt;, d=3D&lt;bb.data_smart.DataSmart object at<br>
&gt; 0x7fd00330b198&gt;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 continue<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execu=
te_handler(name, handler, event, d)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0File &quot;/home/jenkins/oe/world/shr-<wbr>core/bitbake/li=
b/bb/event.py&quot;, line<br>
&gt; 106, in execute_handler(name=3D&#39;<wbr>runqueue_stats&#39;, handler=
=3D&lt;function<br>
&gt; runqueue_stats at 0x7fd0020c6158&gt;, event=3D&lt;bb.event.HeartbeatEv=
ent<br>
&gt; object at 0x7fcfed3e96a0&gt;, d=3D&lt;bb.data_smart.DataSmart object a=
t<br>
&gt; 0x7fd00330b198&gt;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D handler(eve=
nt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (bb.parse.SkipRecipe, bb.BBHa=
ndledException):<br>
&gt;=C2=A0 =C2=A0File<br>
&gt; &quot;/home/jenkins/oe/world/shr-<wbr>core/openembedded-core/meta/<wbr=
>classes/buildstats.bbclass&quot;, line 212, in runqueue_stats(e=3D&lt;bb.e=
vent.<wbr>HeartbeatEvent object at 0x7fcfed3e96a0&gt;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done =3D isinstance(e,=
 bb.event.BuildCompleted)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 system_stats.sample=
(e, force=3Ddone)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if done:<br>
&gt;=C2=A0 =C2=A0File<br>
&gt; &quot;/home/jenkins/oe/world/shr-<wbr>core/openembedded-core/meta/<wbr=
>lib/buildstats.py&quot;, line 148, in SystemStats.sample(event=3D&lt;bb.<w=
br>event.HeartbeatEvent object at 0x7fcfed3e96a0&gt;, force=3DFalse):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data +=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b&=
#39;\n&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.las=
t_proc =3D now<br>
&gt; OSError: [Errno 28] No space left on device<br>
&gt;<br>
&gt;<br>
&gt; =EF=BF=BCIt would be better to exit completely when something as bad a=
s Errno<br>
&gt; 28 happens.<br>
<br>
</div></div>Do you have BB_DISKMON_DIRS active? Probably yes.<br>
<br>
The reason why it did not trigger here might be that the build ran out<br>
of disk space so quickly that the disk monitoring had no chance to<br>
detect the problem before system stat sampling itself started failing<br>
with the error above.<br>
<br>
System stat sampling and disk monitoring are hooking into the same<br>
event, so my theory is that once the system stat sampling fails, disk<br>
monitoring code no longer runs.<br>
<br>
I&#39;m not sure what exactly the right fix is: detect uncaught OSError lik=
e<br>
28 in the bitbake event loop and abort the build, and/or catch the error<br=
>
in buildstats.py and ignore it so that the normal disk monitoring can<br>
happen?<br>
<br>
I know how to do the latter, but not the former.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Best Regards, Patrick Ohly<br>
<br>
The content of this message is my personal opinion only and although<br>
I am an employee of Intel, the statements I make here in no way<br>
represent Intel&#39;s position on the issue, nor am I authorized to speak<b=
r>
on behalf of Intel on this matter.<br>
<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--001a114dda2e85e7cb0552eca0b9--
