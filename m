Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C044C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 08:32:50 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web08.22459.1656577959969171151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 01:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CPmLPl1M;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id z21so32383688lfb.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 01:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P9rjN4a7/z75H2QnPq9d6TuZLU8ymwrLD521F/a7v0A=;
        b=CPmLPl1MwpUT8PJG1z3pafQ6XG2ClybcOkuqxdJg6fIwto59J+whA1yM0lp/zSV99i
         f5B2iT1zvez2/MuZPM3wCgZ/KiiUgR18pNEA3icl+ScywSlfPb3mqHOK49xUfg9SjazW
         PgwhqCadKQpe2Kj+q1d25mHp0Q/yUKO7ahZbVrzsaxQt1SY3INDne5MPhwphag8xrhqT
         MIlqp03rCUCZ46CxIguvpOcE0F6X1BhycxwozW6gUzkbeNczRIqkur07sPIDxHyEsnvs
         5LYEB7TKPAp6xkFt1AnUn8sbRXGj6lWYe13ci+hKcPl0JZkstsz+rTyMklY0jnh04RmS
         JzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P9rjN4a7/z75H2QnPq9d6TuZLU8ymwrLD521F/a7v0A=;
        b=avFPaQrUi8cKxaBriWblw54y4TcaNXzV+Qh+Sc6XkgF1t7lf5UEEp0gc1ZykOZb6Lg
         elkIQhxvsUjxV91k0/NkiJzhRP8+kaSil0zzsvsR2VRAU3HdE6teMtZWkU7ORQCeJVh5
         GK0K6ifgQ8MnwKOspMJMIMJmIbB4GnJv7UIXaH+oMq/WQqn9k/d6hhnc0VLd2rgs0Uat
         RCUGUxkgH0s1rOslsJLXiuGUKn4ivbkPRudq/tX4onYa3h3W80JL20HG/MT+qilC/QDZ
         cOQfBJQvxqvQjl6IoVWzarTuGwEi2wt0JD4ud6QhaAXPhobMLZlF8ByV5460Q7Op2fCW
         PDVA==
X-Gm-Message-State: AJIora/srlPte/sXqk63Y83iemEdmP3YesYu7nwb2C/lfbAko2ShIYnC
	oRX8pVKEn3jUACjUV6ydcCT70C3gnhp0LjCAUjaKmPZkCrk=
X-Google-Smtp-Source: 
 AGRyM1ujLK8qnZ3cyg49XQPTf+Wod4qyoxF9nuO9+5BTNDdrTrpfHBnvnfb4D9smCy+XCwUT4vZSkp6MkpnxHVziULA=
X-Received: by 2002:a05:6512:13a1:b0:47f:787b:4e6a with SMTP id
 p33-20020a05651213a100b0047f787b4e6amr4690722lfa.64.1656577957871; Thu, 30
 Jun 2022 01:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220629201016.1948793-1-aryaman.gupta@windriver.com>
In-Reply-To: <20220629201016.1948793-1-aryaman.gupta@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 30 Jun 2022 09:32:26 +0100
Message-ID: 
 <CANPvuR=H3Z4buLYC7Gy3--ndR_uw1sH1Y-KCozZwyodoEqfpdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqueue: add cpu/io pressure regulation
To: Aryaman Gupta <aryaman.gupta@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b8c35b05e2a61cfc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 08:32:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167403

--000000000000b8c35b05e2a61cfc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aryaman,

Aryaman Gupta <aryaman.gupta@windriver.com> escreveu no dia quarta,
29/06/2022 =C3=A0(s) 21:10:

> Stop the scheduler from starting new tasks if the
> current cpu or io pressure is above a certain threshold, specified
> through the "BB_MAX_{CPU|IO}_SOME_PRESSURE" variables in conf/local.conf.
>
> If the thresholds aren't specified, the default values are 100 for both
> CPU and IO, which will have no impact on build times.
> Arbitary lower limit of 1.0 results in a fatal error to avoid extremely
> long builds. If the percentage limits are higher than 100, then the defau=
lt
> values are used and warnings are issued to inform users that the
> specified limit is out of bounds.
>
> Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
> Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
> ---
>  bitbake/lib/bb/runqueue.py | 39 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
> index 1e47fe70ef..9667acc11c 100644
> --- a/bitbake/lib/bb/runqueue.py
> +++ b/bitbake/lib/bb/runqueue.py
> @@ -159,6 +159,27 @@ class RunQueueScheduler(object):
>                  self.buildable.append(tid)
>
>          self.rev_prio_map =3D None
> +        # Some hosts like openSUSE have readable /proc/pressure files
> +        # but throw errors when these files are opened.
> +        try:
> +            subprocess.check_output(["cat", "/proc/pressure/cpu",
> "/proc/pressure/io"], \
> +                                    universal_newlines=3DTrue,
> stderr=3Dsubprocess.DEVNULL)
> +            self.readable_pressure_files =3D True
> +        except:
> +            if self.rq.max_cpu_pressure!=3D100 or
> self.rq.max_io_pressure!=3D100:
> +                bb.warn("The /proc/pressure files can't be read.
> Continuing build without monitoring pressure")
> +            self.readable_pressure_files =3D False
> +
> +    def exceeds_max_pressure(self):
> +        if self.readable_pressure_files:
>

We can jump when the user does not provide any default values or if they
provide the maximum

if self.readable_pressure_files and (self.rq.max_cpu_pressure < 100 or
self.rq.max_io_pressure < 100):

Jose

+            # extract avg10 from /proc/pressure/{cpu|io}
> +            curr_pressure_sample =3D subprocess.check_output(["cat",
> "/proc/pressure/cpu", "/proc/pressure/io"], \
> +                                   universal_newlines=3DTrue,
> stderr=3Dsubprocess.DEVNULL)
> +            curr_cpu_pressure =3D
> curr_pressure_sample.split('\n')[0].split()[1].split("=3D")[1]
> +            curr_io_pressure =3D
> curr_pressure_sample.split('\n')[2].split()[1].split("=3D")[1]
> +
> +            return float(curr_cpu_pressure) > self.rq.max_cpu_pressure o=
r
> float(curr_io_pressure) > self.rq.max_io_pressure
> +        return False
>
>      def next_buildable_task(self):
>          """
> @@ -171,6 +192,8 @@ class RunQueueScheduler(object):
>          buildable.intersection_update(self.rq.tasks_covered |
> self.rq.tasks_notcovered)
>          if not buildable:
>              return None
> +        if self.exceeds_max_pressure():
> +            return None
>
>          # Filter out tasks that have a max number of threads that have
> been exceeded
>          skip_buildable =3D {}
> @@ -1699,6 +1722,8 @@ class RunQueueExecute:
>
>          self.number_tasks =3D int(self.cfgData.getVar("BB_NUMBER_THREADS=
")
> or 1)
>          self.scheduler =3D self.cfgData.getVar("BB_SCHEDULER") or "speed=
"
> +        self.max_cpu_pressure =3D
> float(self.cfgData.getVar("BB_MAX_CPU_SOME_PRESSURE") or 100.0)
> +        self.max_io_pressure =3D
> float(self.cfgData.getVar("BB_MAX_IO_SOME_PRESSURE") or 100.0)
>
>          self.sq_buildable =3D set()
>          self.sq_running =3D set()
> @@ -1733,6 +1758,20 @@ class RunQueueExecute:
>          if self.number_tasks <=3D 0:
>               bb.fatal("Invalid BB_NUMBER_THREADS %s" % self.number_tasks=
)
>
> +        lower_limit =3D 1.0
> +        upper_limit =3D 100.0
> +        if self.max_cpu_pressure < lower_limit:
> +            bb.fatal("Invalid BB_MAX_CPU_SOME_PRESSURE %s, minimum value
> is %s" % (self.max_cpu_pressure, lower_limit))
> +        if self.max_cpu_pressure > upper_limit:
> +            bb.warn("Percentage value of BB_MAX_CPU_SOME_PRESSURE %s
> rounded down to %s" % (self.max_cpu_pressure, upper_limit))
> +            self.max_cpu_pressure =3D upper_limit
> +
> +        if self.max_io_pressure < lower_limit:
> +            bb.fatal("Invalid BB_MAX_IO_SOME_PRESSURE %s, minimum value
> is %s" % (self.max_io_pressure, lower_limit))
> +        if self.max_io_pressure > upper_limit:
> +            bb.warn("Percentage value of BB_MAX_IO_SOME_PRESSURE %s
> rounded down to %s" % (self.max_io_pressure, upper_limit))
> +            self.max_io_pressure =3D upper_limit
> +
>          # List of setscene tasks which we've covered
>          self.scenequeue_covered =3D set()
>          # List of tasks which are covered (including setscene ones)
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167390):
> https://lists.openembedded.org/g/openembedded-core/message/167390
> Mute This Topic: https://lists.openembedded.org/mt/92073312/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000b8c35b05e2a61cfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Aryaman,</div><div dir=3D"ltr"><br></div><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Aryaman Gupta =
&lt;<a href=3D"mailto:aryaman.gupta@windriver.com">aryaman.gupta@windriver.=
com</a>&gt; escreveu no dia quarta, 29/06/2022 =C3=A0(s) 21:10:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Stop the scheduler from sta=
rting new tasks if the<br>
current cpu or io pressure is above a certain threshold, specified<br>
through the &quot;BB_MAX_{CPU|IO}_SOME_PRESSURE&quot; variables in conf/loc=
al.conf.<br>
<br>
If the thresholds aren&#39;t specified, the default values are 100 for both=
<br>
CPU and IO, which will have no impact on build times.<br>
Arbitary lower limit of 1.0 results in a fatal error to avoid extremely<br>
long builds. If the percentage limits are higher than 100, then the default=
<br>
values are used and warnings are issued to inform users that the<br>
specified limit is out of bounds.<br>
<br>
Signed-off-by: Aryaman Gupta &lt;<a href=3D"mailto:aryaman.gupta@windriver.=
com" target=3D"_blank">aryaman.gupta@windriver.com</a>&gt;<br>
Signed-off-by: Randy Macleod &lt;<a href=3D"mailto:randy.macleod@windriver.=
com" target=3D"_blank">randy.macleod@windriver.com</a>&gt;<br>
---<br>
=C2=A0bitbake/lib/bb/runqueue.py | 39 +++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 39 insertions(+)<br>
<br>
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py<br>
index 1e47fe70ef..9667acc11c 100644<br>
--- a/bitbake/lib/bb/runqueue.py<br>
+++ b/bitbake/lib/bb/runqueue.py<br>
@@ -159,6 +159,27 @@ class RunQueueScheduler(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.buildabl=
e.append(tid)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.rev_prio_map =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Some hosts like openSUSE have readable /proc=
/pressure files<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # but throw errors when these files are opened=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output([&quot;c=
at&quot;, &quot;/proc/pressure/cpu&quot;, &quot;/proc/pressure/io&quot;], \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 universal_newlines=3DT=
rue, stderr=3Dsubprocess.DEVNULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.readable_pressure_files =3D=
 True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.rq.max_cpu_pressure!=3D1=
00 or self.rq.max_io_pressure!=3D100:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;The =
/proc/pressure files can&#39;t be read. Continuing build without monitoring=
 pressure&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.readable_pressure_files =3D=
 False<br>
+<br>
+=C2=A0 =C2=A0 def exceeds_max_pressure(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.readable_pressure_files:<br></blockquo=
te><div><br></div><div>We can jump when the user does not provide any defau=
lt values or if they provide the maximum</div><div><br></div><div>if self.r=
eadable_pressure_files and (self.rq.max_cpu_pressure &lt; 100 or self.rq.ma=
x_io_pressure &lt; 100):</div><div><br></div><div>Jose</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # extract avg10 from /proc/press=
ure/{cpu|io}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curr_pressure_sample =3D subproc=
ess.check_output([&quot;cat&quot;, &quot;/proc/pressure/cpu&quot;, &quot;/p=
roc/pressure/io&quot;], \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0universal_newlines=3DTr=
ue, stderr=3Dsubprocess.DEVNULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curr_cpu_pressure =3D curr_press=
ure_sample.split(&#39;\n&#39;)[0].split()[1].split(&quot;=3D&quot;)[1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curr_io_pressure =3D curr_pressu=
re_sample.split(&#39;\n&#39;)[2].split()[1].split(&quot;=3D&quot;)[1]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return float(curr_cpu_pressure) =
&gt; self.rq.max_cpu_pressure or float(curr_io_pressure) &gt; self.rq.max_i=
o_pressure<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
<br>
=C2=A0 =C2=A0 =C2=A0def next_buildable_task(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
@@ -171,6 +192,8 @@ class RunQueueScheduler(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buildable.intersection_update(self.rq.tas=
ks_covered | self.rq.tasks_notcovered)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not buildable:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.exceeds_max_pressure():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Filter out tasks that have a max number=
 of threads that have been exceeded<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip_buildable =3D {}<br>
@@ -1699,6 +1722,8 @@ class RunQueueExecute:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.number_tasks =3D int(self.cfgData.ge=
tVar(&quot;BB_NUMBER_THREADS&quot;) or 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.scheduler =3D self.cfgData.getVar(&q=
uot;BB_SCHEDULER&quot;) or &quot;speed&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.max_cpu_pressure =3D float(self.cfgData.g=
etVar(&quot;BB_MAX_CPU_SOME_PRESSURE&quot;) or 100.0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.max_io_pressure =3D float(self.cfgData.ge=
tVar(&quot;BB_MAX_IO_SOME_PRESSURE&quot;) or 100.0)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.sq_buildable =3D set()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.sq_running =3D set()<br>
@@ -1733,6 +1758,20 @@ class RunQueueExecute:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.number_tasks &lt;=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Invalid BB_=
NUMBER_THREADS %s&quot; % self.number_tasks)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lower_limit =3D 1.0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 upper_limit =3D 100.0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.max_cpu_pressure &lt; lower_limit:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Invalid BB_MAX_CP=
U_SOME_PRESSURE %s, minimum value is %s&quot; % (self.max_cpu_pressure, low=
er_limit))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.max_cpu_pressure &gt; upper_limit:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Percentage value o=
f BB_MAX_CPU_SOME_PRESSURE %s rounded down to %s&quot; % (self.max_cpu_pres=
sure, upper_limit))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.max_cpu_pressure =3D upper_=
limit<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.max_io_pressure &lt; lower_limit:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Invalid BB_MAX_IO=
_SOME_PRESSURE %s, minimum value is %s&quot; % (self.max_io_pressure, lower=
_limit))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.max_io_pressure &gt; upper_limit:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Percentage value o=
f BB_MAX_IO_SOME_PRESSURE %s rounded down to %s&quot; % (self.max_io_pressu=
re, upper_limit))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.max_io_pressure =3D upper_l=
imit<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# List of setscene tasks which we&#39;ve =
covered<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.scenequeue_covered =3D set()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# List of tasks which are covered (includ=
ing setscene ones)<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167390): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167390" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167390</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92073312/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92073312/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000b8c35b05e2a61cfc--

