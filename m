Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B44B478A2B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 11:41:00 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id m12so14373435wrm.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 03:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9Oqqkw/WTK8Rsc0V20UwWp3zhAJqUfCVdGR/lAdbuVg=;
	b=CkoClqHtP8CRWK4sQlHbsUXuOQ3W1i4YDtoH0syxoq8u/zHjSSfFaTq1d1AhsG12HW
	gFSWdhRYoYojFbCkEyRZbxLNuGiu7ZrvOg87ZcHx/tpiea8T0DKHAca19ymZLJKH3YZ+
	1IqaVXNwIsns8KlKDEoYLI5ktyelzwZZOicpMu56UdXLysJ4Q2qXLTqUoHCuDdQN6IR9
	kXI8hpvlRYNwJ0x2do+U6LmstRzEF2A3GSII3WNGEHUhw6vmPbyVX8X6YhOBHLysaVw3
	lRWQ7r4b8PbeJ//WnNxbCUsL2kCqkKvGIPlULzU0BwlW7dz3Weq9LKY5nx8ScO6L7XDB
	XuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9Oqqkw/WTK8Rsc0V20UwWp3zhAJqUfCVdGR/lAdbuVg=;
	b=UAhtUtWK3quciOqjHX4Vng2s6eNOIk6Y/7vc71UWZZ63DAULo7tVS+vZFW6osvaIVd
	wo9/jR1oTkYOPQuxToZOvEfaDSgNFRqS0I2iYLtv4EEknHUDhT4vdPGhiKeK1poD3wPq
	LKJJuq8579jlw+KT924acAyA4poSFYjzRkuU35RH7u+6cH2Z+wS+TnAHmKQgHGy7Srml
	qXsHRshlibLFjc7NVd6dZIVwxZyjAFMFDNRha1gSPQ3yZufR6aTV4A78kdWg8uW1Qmwh
	LvdsjKoSwP7Unzr5Jx5pZZEmSczH7b7+2l5xdM1hv8rpV1pyI0YU4h7wFJfJ6weXrVWW
	K53g==
X-Gm-Message-State: APf1xPC3cg9zQ5u9HoUuRw7qpjJLGvSsj10ZUj4aNN3KPR7HZmhHrYQD
	Rimn8yzCu7TR2/+s9a26tiS779Y+5Y2tP2bGC6U=
X-Google-Smtp-Source: AG47ELv9c5YUNnTmbXtg17sXBtCwMm+Ay0JRnhVG3wLGTGqMPIV51kqm6zP2D2cLxobmLTjX1UqiEN53NtaIBdR4ipk=
X-Received: by 10.223.143.101 with SMTP id p92mr9549512wrb.241.1520163661287; 
	Sun, 04 Mar 2018 03:41:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 4 Mar 2018 03:41:00 -0800 (PST)
In-Reply-To: <20180131191038.99-1-Martin.Jansa@gmail.com>
References: <20180131191038.99-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Mar 2018 12:41:00 +0100
Message-ID: <CA+chaQfHzRvmJCGzsDht2tJwyMuVP01oM4Uorf83kUS3_1TAVA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Daniel Lublin <daniel@lublin.se>, Pavel Modilaynen <pavelmn@axis.com>
Subject: Re: [morty][PATCH] buildstats.bbclass: Avoid index exception in /proc/PID/io parsing
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
X-List-Received-Date: Sun, 04 Mar 2018 11:41:01 -0000
Content-Type: multipart/alternative; boundary="f403045f54d808193a056694afc5"

--f403045f54d808193a056694afc5
Content-Type: text/plain; charset="UTF-8"

ping

On Wed, Jan 31, 2018 at 8:10 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> From: Pavel Modilaynen <pavelmn@axis.com>
>
> There is some probability (depends on system load) to get empty
> or line containing "0" as the last line while reading /proc/PID/io.
> Avoid build failure by checking if line contains separator
> ":" before split.
>
> Backport from pyro commit b26feaf51af55f17fad79dbd53dd3ec0a37c38ff
>
> Signed-off-by: Pavel Modilaynen <pavelmn@axis.com>
> Signed-off-by: Daniel Lublin <daniel@lublin.se>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/buildstats.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.
> bbclass
> index 599a219984..415d2ee820 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -31,6 +31,11 @@ def get_process_cputime(pid):
>                  i = f.readline().strip()
>                  if not i:
>                      break
> +                if not ":" in i:
> +                    # one more extra line is appended (empty or
> containing "0")
> +                    # most probably due to race condition in kernel while
> +                    # updating IO stats
> +                    break
>                  i = i.split(": ")
>                  iostats[i[0]] = i[1]
>      resources = resource.getrusage(resource.RUSAGE_SELF)
> --
> 2.15.1
>
>

--f403045f54d808193a056694afc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Wed, Jan 31, 2018 at 8:10 PM, Martin Jansa <span dir=3D"ltr">&=
lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Pa=
vel Modilaynen &lt;<a href=3D"mailto:pavelmn@axis.com">pavelmn@axis.com</a>=
&gt;<br>
<br>
There is some probability (depends on system load) to get empty<br>
or line containing &quot;0&quot; as the last line while reading /proc/PID/i=
o.<br>
Avoid build failure by checking if line contains separator<br>
&quot;:&quot; before split.<br>
<br>
Backport from pyro commit b26feaf51af55f17fad79dbd53dd3e<wbr>c0a37c38ff<br>
<br>
Signed-off-by: Pavel Modilaynen &lt;<a href=3D"mailto:pavelmn@axis.com">pav=
elmn@axis.com</a>&gt;<br>
Signed-off-by: Daniel Lublin &lt;<a href=3D"mailto:daniel@lublin.se">daniel=
@lublin.se</a>&gt;<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/buildstats.<wbr>bbclass | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/classes/buildstats.<wbr>bbclass b/meta/classes/buildstats=
.<wbr>bbclass<br>
index 599a219984..415d2ee820 100644<br>
--- a/meta/classes/buildstats.<wbr>bbclass<br>
+++ b/meta/classes/buildstats.<wbr>bbclass<br>
@@ -31,6 +31,11 @@ def get_process_cputime(pid):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D f.readl=
ine().strip()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not i:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not &quot;:&quo=
t; in i:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # on=
e more extra line is appended (empty or containing &quot;0&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # mo=
st probably due to race condition in kernel while<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # up=
dating IO stats<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D i.split=
(&quot;: &quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iostats[i[0]]=
 =3D i[1]<br>
=C2=A0 =C2=A0 =C2=A0resources =3D resource.getrusage(resource.<wbr>RUSAGE_S=
ELF)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
</font></span></blockquote></div><br></div>

--f403045f54d808193a056694afc5--
