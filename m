Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 38569771D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 11:38:41 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id n143so70405396ita.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 04:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Uk/JSKihBSziBfYoRUkBVap56qprIrq718PQkuxnB2g=;
	b=C20KqEqqwlysP8fKTW8NvddEvq80jsQusa6kDErCwEH9S8FbGZwNYItiCTYhI/5qb0
	AZjhzBo298MMmDzNrCr3iD6QNUvC3bI4c5oiVzTXXqgYD8JlD24WO9reu/H7jOe2U50/
	dS8xQH9d3J3XshH1M0FomOr534LWOcbd27YvzKtk7nVZmRbvn0wMfGu96PRYLUExDGGA
	zKBQLrCj3ypygCx8wAEMUmv1AyC2+vXi7UCU5EP1zq5unxIYkimzz2oBnA5Dh8KL+f6D
	E17jiht3ToxAwvTwi9jhqvZ9VDO+zpqb5mvG9AnIfa3+isPzugVvic9hwoYb86S2NFCZ
	3dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Uk/JSKihBSziBfYoRUkBVap56qprIrq718PQkuxnB2g=;
	b=eSHb8R379Mu3ihxT3O2HNmz4NqE2hDeX0x0z1kPkNPN5cKxVY/cnuyERBhe4NEjRV1
	ny5ZOn6Sit7EwKdPq7t8l4KXMwgk4R/er06zxsInjl3CNrWR7ktpygQz8MiRzqEnxCLG
	Plzyyfw6Bn2k9TYrAljW2lIXY7KbB83sWmDYgOVfzkHhVR1+afdj8IZ6tEG6/hJX85+D
	+i5va/fWQguVRl4jdbWRtRjTKC0fEAtWcQqGNHiXb4JT1e5+SEGCpRYt4q20vJZ8nDF2
	faaGYCK8EaT9oA/MshmacDOcJ1Si+WoicGI11nHQ1Uh+X8AdmwvPJ757roCCp1qLib4L
	12ww==
X-Gm-Message-State: AE9vXwPqnmJuQjg14A1b5m7bfAR7p4Bel72QVlVoIifYH3ze36NIQG/BfO7wESS/nmdLyjHHvOfx6J+V5viRqkr1
X-Received: by 10.107.176.144 with SMTP id z138mr17857656ioe.133.1473939522261;
	Thu, 15 Sep 2016 04:38:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Thu, 15 Sep 2016 04:38:21 -0700 (PDT)
In-Reply-To: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
References: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Sep 2016 12:38:21 +0100
Message-ID: <CAJTo0LbuVqOsjMUix-ntx67a6PVEcLFeYrAN8XnCh7eJzBQgdw@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Crazy display
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
X-List-Received-Date: Thu, 15 Sep 2016 11:38:43 -0000
Content-Type: multipart/alternative; boundary=001a11438ad4a53374053c8a496c

--001a11438ad4a53374053c8a496c
Content-Type: text/plain; charset=UTF-8

Yes, I see this at least once a day, and there's a bug for it somewhere in
bugzilla.

Ross

On 15 September 2016 at 12:30, Gary Thomas <gary@mlbassoc.com> wrote:

> I haven't seen this before, just thought I'd toss it out there.
> I was doing a build (actually three in parallel in separate
> windows on my build box) and noticed this:
>
> Currently  3 running tasks (3282 of 5081)  64%
> |###################################################        |
> 0: busybox-1.24.1-r0 do_compile (pid 29425)
> Currently  3 running tasks (3283 of 5081)  64%
> |###################################################        |
> Currently  3 running tasks (3429 of 5081)  67%
> |#####################################################        |
> 0: gstreamer1.0-libav-1.8.3-r0 do_configure (pid 10393)
> Currently  1 running tasks (3560 of 5081)  70%
> |########################################################        |
> 0: gstreamer1.0-libav-1.8.3-r0 do_compile (pid 17458)
> Currently  3 running tasks (3601 of 5081)  70%
> |########################################################        |
> 0: gstreamer1.0-libav-1.8.3-r0 do_compile (pid 17458)
> 1: gdk-pixbuf-2.34.0-r0 do_package_write_ipk (pid 12673)
> 2: unifdef-native-2.11-r0 do_populate_lic (pid 24548)
>
> Somehow the task tracker (that does a nice job of telling the user
> what's going on without being overwhelming BTW) got very confused!
>
> I doubt if I can every repeat this, just passing on the observation!
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11438ad4a53374053c8a496c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, I see this at least once a day, and there&#39;s a bug=
 for it somewhere in bugzilla.<div><br></div><div>Ross</div></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On 15 September 2016 at 12=
:30, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mailto:gary@mlbassoc.com"=
 target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">I haven&#39;t seen this before, just thought I&#39;d toss=
 it out there.<br>
I was doing a build (actually three in parallel in separate<br>
windows on my build box) and noticed this:<br>
<br>
Currently=C2=A0 3 running tasks (3282 of 5081)=C2=A0 64% |#################=
############<wbr>######################=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
0: busybox-1.24.1-r0 do_compile (pid 29425)<br>
Currently=C2=A0 3 running tasks (3283 of 5081)=C2=A0 64% |#################=
############<wbr>######################=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
Currently=C2=A0 3 running tasks (3429 of 5081)=C2=A0 67% |#################=
############<wbr>########################=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
0: gstreamer1.0-libav-1.8.3-r0 do_configure (pid 10393)<br>
Currently=C2=A0 1 running tasks (3560 of 5081)=C2=A0 70% |#################=
############<wbr>###########################=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<b=
r>
0: gstreamer1.0-libav-1.8.3-r0 do_compile (pid 17458)<br>
Currently=C2=A0 3 running tasks (3601 of 5081)=C2=A0 70% |#################=
############<wbr>###########################=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<b=
r>
0: gstreamer1.0-libav-1.8.3-r0 do_compile (pid 17458)<br>
1: gdk-pixbuf-2.34.0-r0 do_package_write_ipk (pid 12673)<br>
2: unifdef-native-2.11-r0 do_populate_lic (pid 24548)<br>
<br>
Somehow the task tracker (that does a nice job of telling the user<br>
what&#39;s going on without being overwhelming BTW) got very confused!<br>
<br>
I doubt if I can every repeat this, just passing on the observation!<span c=
lass=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
-- <br>
------------------------------<wbr>------------------------------<br>
Gary Thomas=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 Consulting for the<br>
MLB Associates=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 Embedded world<br>
------------------------------<wbr>------------------------------<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a11438ad4a53374053c8a496c--
