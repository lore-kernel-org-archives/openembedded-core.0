Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail.openembedded.org (Postfix) with ESMTP id D961A7F48D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 19:54:51 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id m30so10172558lfp.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 11:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fcNJjW9CkaSkzJNZAOmyd1faEr3+RDKQPAkxgGLyzAo=;
	b=nKWlTYIY4yJdfA0Zv/66au9NQgXR2oYwFuFvf4PCOu3mklj89s5T84nirqoPWRQr/O
	djEK/ZsjwD14IXU35ZPoWSfXJP+OqqDk77evUqSKnq1uQBDhnRKNL9miBswFqucwSkiK
	QX4rxOLu8sHvWmXhc+9znkGR0E/ztcSwE+j2v4vtg4YjvATCfFBfDMftv+kvMWQ+Gn7Y
	4FxLBX1xayKMGlbwUzijznPWHR6Hn+alcQdWgGDX+TJkt5rVqjula2MvNRTBCQB5zMyt
	FCLATxMMBayzaNggpOzg9PFmS7nzv4oEWTvAVSeOP7tT80rrZPwNRFdRfyahfHnHhz7R
	es7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fcNJjW9CkaSkzJNZAOmyd1faEr3+RDKQPAkxgGLyzAo=;
	b=cToJ7mJXHsWojwKkjB85aheQ6kUUgTuuGE5htCDnbwphbwyGIpsbSgRNnjnyQ6yqXg
	7LjUK9RDWj3uv0ia2n5ht3uNll2vi7lVtkyH1lLYroD0wO/S7hNitSyMS+iEflzYsxCT
	iTyV8XQ/Y3np5WQEz6I6I99o00nXTt8/52oixdnSU8XIXE4PNE4iBj/fctTIzBmK6TVz
	atJ706yiHGef2TR27056GXWk8yBpOreLudAN1pX2/r04O8tJhiQeDaOmWLscNP2BW2yD
	DHH4IFfK0C2NmZcZCIpAeqegGsNHQakrMYc4Y/rf/UfPd84pXUiXgXG8NhQ6b/U/Q6SO
	+kJw==
X-Gm-Message-State: APjAAAVBJU6dMk+DysQO3t5A6Dtjk0nIp1a7EEk3GVpJVFRLPMzXNrVl
	oTHxZFbwihTmv/HjpFHdVwDXgVwE9a3QxiU4ImU=
X-Google-Smtp-Source: APXvYqypT36c8+DNaFpt6Wt0u+5BZ/cSS5fICnANVvTat5YqloJ4HUGtN3EKozANXkpFZYO7WqvjoORYqDewOciiKbs=
X-Received: by 2002:ac2:5a43:: with SMTP id r3mr7646646lfn.150.1574711692161; 
	Mon, 25 Nov 2019 11:54:52 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
	<CADySD0GqssgFeMVj72iV+R3EjUOY=hqJLe7tVTNFbwnmRNzeiQ@mail.gmail.com>
	<49e6e98b-9061-4e97-dfd5-6bd3e80ecf49@intel.com>
In-Reply-To: <49e6e98b-9061-4e97-dfd5-6bd3e80ecf49@intel.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 26 Nov 2019 08:54:40 +1300
Message-ID: <CADySD0GZ16Mr-bWxKF7aoDZK4adPz-1TTNktf=s33y6=YmXe7w@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Mon, 25 Nov 2019 19:54:52 -0000
Content-Type: multipart/alternative; boundary="00000000000008f6800598312304"

--00000000000008f6800598312304
Content-Type: text/plain; charset="UTF-8"

That could be it.
How can I make sure debug stripping is enabled?

thanks
Ankur

On Tue, Nov 26, 2019 at 8:49 AM Ross Burton <ross.burton@intel.com> wrote:

> On 25/11/2019 19:33, Ankur Tyagi wrote:
> > Thanks for the suggestion.
> > But curious why libs are so big now?
>
> The same files on my system:
>
> -rwxr-xr-x root/root   1806504 2019-11-04 21:14 ./lib64/libc-2.30.so
> -rwxr-xr-x root/root    113296 2019-11-04 21:14 ./lib64/libpthread-2.30.so
> -rw-r--r-- root/root    100248 2019-11-04 21:14 ./lib64/libgcc_s.so.1
>
> Your files are a lot larger, so I suspect that you've somehow turned off
> debug stripping.
>
> Ross
>

--00000000000008f6800598312304
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">That could be it.</div><div class=3D"gmail_def=
ault" style=3D"font-family:verdana,sans-serif">How can I make sure debug st=
ripping is enabled?</div><div class=3D"gmail_default" style=3D"font-family:=
verdana,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:verdana,sans-serif">thanks</div><div class=3D"gmail_default" style=3D"=
font-family:verdana,sans-serif">Ankur<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 26, 2019 at 8:49=
 AM Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@in=
tel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 25/11/2019 19:33, Ankur Tyagi wrote:<br>
&gt; Thanks for the suggestion.<br>
&gt; But curious why libs are so big now?<br>
<br>
The same files on my system:<br>
<br>
-rwxr-xr-x root/root=C2=A0 =C2=A01806504 2019-11-04 21:14 ./lib64/<a href=
=3D"http://libc-2.30.so" rel=3D"noreferrer" target=3D"_blank">libc-2.30.so<=
/a><br>
-rwxr-xr-x root/root=C2=A0 =C2=A0 113296 2019-11-04 21:14 ./lib64/<a href=
=3D"http://libpthread-2.30.so" rel=3D"noreferrer" target=3D"_blank">libpthr=
ead-2.30.so</a><br>
-rw-r--r-- root/root=C2=A0 =C2=A0 100248 2019-11-04 21:14 ./lib64/libgcc_s.=
so.1<br>
<br>
Your files are a lot larger, so I suspect that you&#39;ve somehow turned of=
f <br>
debug stripping.<br>
<br>
Ross<br>
</blockquote></div></div>

--00000000000008f6800598312304--
