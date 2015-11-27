Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1086011F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 02:47:27 +0000 (UTC)
Received: by lfdl133 with SMTP id l133so113866838lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 18:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HSWDKS0sLwFV6+DOIFqjdLoBU3rcwsX0rTO7Vq6KlK4=;
	b=1R6EHJY/jjko3BijfXOgVlgP06g7WMND4Anu8sdgzvAA3RwnX4hMwwIHbgIfaRjkNp
	CBdxjdruBFcPbfmlkeOK5g6PwTR0A8gJ/s+VGn7BS0GhUNAqCECRvv66/8TsAz/4U/nd
	E6DJdGuRIXGAlMMZS07OzJWANMHHAUp+OsrPdvOXZgPRDYcoAUpsvPcBXCq9sddX8uxA
	H/AYC4wJo3gF7IgpGpw3dJyS4odWV36HskBvk3k57VvYRpvaMQ8Xb6bXQLD8+nyrPZ23
	p/2KM0XvdIr+3oc3DwCK6FSScLH+PEDj4izcRVDKz/kpPcO/aav2hMI24tm05EF2D1iF
	6jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=HSWDKS0sLwFV6+DOIFqjdLoBU3rcwsX0rTO7Vq6KlK4=;
	b=Amo47mAjqhoTE9w8JoVWambbHTOUj34s6gk8StD+iVWLH2ld5kust0jzApxBEIUcU+
	qRN/2sfdjmkcacLlyokyWvIl1ou9Zb6zprXu720PT0NxzznZpt9McQdi8qgM2jsiWx8r
	8MUIM6dd48yIkliZVXOkn/mAilAomQgKjBqbUEadnZ2VGB7MK2+r/vNf6K8SfA3FHX26
	XnPOv8FXfOPww8ZJBdkv9BSbqYqO98Lr3b7YOo+asEap+Mcu6YOvRk4vtQbV87oRGNuY
	6Oiw5ctm8Esidv1XoHAnvENRTk1zpSgEI88CYpt6hgctAepc3+sZ3U0sF+JWa9e1GTMX
	20zg==
X-Gm-Message-State: ALoCoQlXwOcBQB8YacjADuLC9VYxMNNgS6m7964QZH0h78Oazw7eXFyTtAvJ3kXCDeGtAFpxz4BI
MIME-Version: 1.0
X-Received: by 10.112.148.198 with SMTP id tu6mr16019228lbb.39.1448592447093; 
	Thu, 26 Nov 2015 18:47:27 -0800 (PST)
Received: by 10.114.122.72 with HTTP; Thu, 26 Nov 2015 18:47:27 -0800 (PST)
In-Reply-To: <CAP9ODKocGGNJ2bUscbF5906SnrusHS8abWuVVQHBLUP6nMgyxw@mail.gmail.com>
References: <1448536554-18349-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAJTo0LZu9O-V3Nq2JLT-uCmW13hja2pMSof_w=bSrJfQL9qipA@mail.gmail.com>
	<CAD3vsf4AyaCVhvu27U8N666EjYwFg7XPWQ7NGjAg_xwbH6dRQQ@mail.gmail.com>
	<CAD3vsf6RJs5ZgsgqvRU1qWvf1Zk3F8hgY5PYq2dMimQzEr_eqw@mail.gmail.com>
	<CAP9ODKocGGNJ2bUscbF5906SnrusHS8abWuVVQHBLUP6nMgyxw@mail.gmail.com>
Date: Fri, 27 Nov 2015 08:17:27 +0530
Message-ID: <CAD3vsf6QVv9EEHOYZHrvnpixf4X5zaLV3OvrLn-64Ja75vtk3w@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH v2] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Fri, 27 Nov 2015 02:47:29 -0000
Content-Type: multipart/alternative; boundary=047d7b343c663bd9bf05257cb648

--047d7b343c663bd9bf05257cb648
Content-Type: text/plain; charset=UTF-8

>
>
> >>> WARNING: Could not copy license file
> >>>
> /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/gmp-6.0.0/COPYING.LESSERv3
> >>> to
> >>>
> /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3:
> >>> [Errno 1] Operation not permitted:
> >>>
> '/data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3'
> >
> > The above warning comes up during do_populate_lic task, and this task
> > is not being executed in pseudo environment. So changing ownership of
> > license files to root user (explicitly via "0") fails, as normal user
> > doesn't have permissions to do so.
> >
> > In this case, use of os.getuid() and os.getgid() behaves correctly, by
> > giving normal user id and solving this warning. So this is one
> > advantage of using os.getuid() and os.getgid() over explicit "0".
>
> The real fix would be put this to run under pseudo, it seems.
>
>
Running populate_lic under pseudo will solve this warning. I will send v3,
if other members are fine with this solution.

Thanks,
Jagadeesh

--
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

--047d7b343c663bd9bf05257cb648
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><span class=3D""><br>
&gt;&gt;&gt; WARNING: Could not copy license file<br>
&gt;&gt;&gt; /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/g=
mp-6.0.0/COPYING.LESSERv3<br>
&gt;&gt;&gt; to<br>
&gt;&gt;&gt; /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/l=
icense-destdir/gmp/COPYING.LESSERv3:<br>
&gt;&gt;&gt; [Errno 1] Operation not permitted:<br>
&gt;&gt;&gt; &#39;/data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0=
-r0/license-destdir/gmp/COPYING.LESSERv3&#39;<br>
&gt;<br>
&gt; The above warning comes up during do_populate_lic task, and this task<=
br>
&gt; is not being executed in pseudo environment. So changing ownership of<=
br>
&gt; license files to root user (explicitly via &quot;0&quot;) fails, as no=
rmal user<br>
&gt; doesn&#39;t have permissions to do so.<br>
&gt;<br>
&gt; In this case, use of os.getuid() and os.getgid() behaves correctly, by=
<br>
&gt; giving normal user id and solving this warning. So this is one<br>
&gt; advantage of using os.getuid() and os.getgid() over explicit &quot;0&q=
uot;.<br>
<br>
</span>The real fix would be put this to run under pseudo, it seems.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br></div><div>Running populate_lic under pseudo will solve this wa=
rning. I will send v3, if other members are fine with this solution.</div><=
div><br></div><div>Thanks,</div><div>Jagadeesh</div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><span class=3D"HOEnZb"><font color=3D"#888888">
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile:=
 +1 (347) 903-9750<br>
</font></span></blockquote></div><br></div></div>

--047d7b343c663bd9bf05257cb648--
