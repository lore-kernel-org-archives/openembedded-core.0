Return-Path: <kergoth@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE3073B0B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 13:56:51 +0000 (UTC)
Received: by yhot59 with SMTP id t59so4467248yho.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=lmvcgIQhYaYacVP7NpyfnZSlHiKKsW2jgFyR5m3Ytas=;
	b=qJN/ytvvz47dg+ZaH4emNWCncd/8rdk7h2p8tF4wags4fyywFxN98w38+qmAW9p766
	BuZIcm3vhmr5bAwQjmNs0f3UwcQQdjBqtxvsM+hG4ivXOgWO5AO4ig0HqClipAre0qqJ
	3+U/0Els6ADWF2uAb7rKunlMoIunAo5kAnEjkkFojlEuIc6VyiO0NkNPVvFdxfLiCnN2
	E1bR8AUzD8DmIwWwDUbceey8OHxDY5UKIASpf9CulQCnWaNZQvphhNRFXamNQ7Kp5FQQ
	WcfaDTgbuJ7w8rc+mTfjWnvTTs4VdXDc+UTV4V1/Dg+oz6G9b7hmg6rTjz+Q9fnXYBSM
	rQGw==
X-Received: by 10.170.71.68 with SMTP id n65mr40626968ykn.71.1426082212995;
	Wed, 11 Mar 2015 06:56:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.170.148.7 with HTTP; Wed, 11 Mar 2015 06:56:32 -0700 (PDT)
In-Reply-To: <18cec0bedc4916b29d28d6ee078bfa8d7f05d895.1426062917.git.liezhi.yang@windriver.com>
References: <cover.1426062917.git.liezhi.yang@windriver.com>
	<18cec0bedc4916b29d28d6ee078bfa8d7f05d895.1426062917.git.liezhi.yang@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 11 Mar 2015 06:56:32 -0700
X-Google-Sender-Auth: QVZX6NxQI9dbGHny_B-Atgcmw2A
Message-ID: <CABcZANmaePrX5TE3z3J+vS+09zT0mXKb9o-e4mvUqm1D2btB_g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] license.bbclass: set dirs for do_populate_lic_setscene
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
X-List-Received-Date: Wed, 11 Mar 2015 13:56:53 -0000
Content-Type: multipart/alternative; boundary=001a11399268b9e81d051103a376

--001a11399268b9e81d051103a376
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 11, 2015 at 1:35 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Fixed:
> ERROR: Build of do_populate_lic failed
> ERROR: Traceback (most recent call last):
>   File "bitbake/lib/bb/build.py", line 497, in exec_task
>     return _exec_task(fn, task, d, quieterr)
>   File "bitbake/lib/bb/build.py", line 437, in _exec_task
>     exec_func(func, localdata)
>   File "bitbake/lib/bb/build.py", line 212, in exec_func
>     exec_func_python(func, d, runfile, cwd=adir)
>   File
> "/home/nxadm/nx/ala-blade44.1/builds-2015-03-09-163005/qemuppc_world_oe_bp/
> bitbake/lib/bb/build.py", line 237, in exec_func_python
>     os.chdir(cwd)
> OSError: [Errno 2] No such file or directory:
> 'bitbake_build/tmp/work/ppc7400-wrs-linux/taglib/1.9.1-r0/build'
>
> When running setscene, the cwd is $B which maybe removed by
> autotools.bbclass or cmake.bbclass when rebuild.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>

For reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=4634
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11399268b9e81d051103a376
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Mar 11, 2015 at 1:35 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex"><div id=3D":4il" class=3D"=
" style=3D"overflow:hidden">Fixed:<br>
ERROR: Build of do_populate_lic failed<br>
ERROR: Traceback (most recent call last):<br>
=C2=A0 File &quot;<span class=3D"">bitbake</span>/lib/<span class=3D"">bb</=
span>/build.py&quot;, line 497, in exec_task<br>
=C2=A0 =C2=A0 return _exec_task(fn, task, d, quieterr)<br>
=C2=A0 File &quot;<span class=3D"">bitbake</span>/lib/<span class=3D"">bb</=
span>/build.py&quot;, line 437, in _exec_task<br>
=C2=A0 =C2=A0 exec_func(func, localdata)<br>
=C2=A0 File &quot;<span class=3D"">bitbake</span>/lib/<span class=3D"">bb</=
span>/build.py&quot;, line 212, in exec_func<br>
=C2=A0 =C2=A0 exec_func_python(func, d, runfile, cwd=3Dadir)<br>
=C2=A0 File &quot;/home/nxadm/nx/ala-blade44.1/builds-2015-03-09-163005/qem=
uppc_world_oe_bp/<span class=3D"">bitbake</span>/lib/<span class=3D"">bb</s=
pan>/build.py&quot;, line 237, in exec_func_python<br>
=C2=A0 =C2=A0 os.chdir(cwd)<br>
OSError: [Errno 2] No such file or directory: &#39;bitbake_build/tmp/work/p=
pc7400-wrs-linux/taglib/1.9.1-r0/build&#39;<br>
<br>
When running setscene, the cwd is $B which maybe removed by<br>
autotools.<span class=3D"">bbclass</span> or cmake.<span class=3D"">bbclass=
</span> when rebuild.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;</div></blockquote></div><br>For referenc=
e:=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4634=
">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4634</a><br>-- <br><d=
iv class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot c=
om<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>=
Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11399268b9e81d051103a376--
