Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
	[209.85.222.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6215D7F2B7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 16:01:35 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id s25so1473238uap.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=J6/H0NNzECqvRX+kQrZesIK86KVS3hAdtVwCN3bWhnU=;
	b=inXHuDcxquu9w1xaYSp0fNsN2gpnHNQmZeprgNfietNVcaGmOz2NeJmo59pnuw/XdH
	GURqMlGTEh3D3VDVJ5r4EBTjglvNVj4cvAm/8Qd81heF4h4tlEg2opLFZVg4kFF4laci
	bfVDpPJZiPQfGXaFC4EjIBoh0Dvm8clRRnvwocCqNp0SNhy4523gOkmKnYiqwkB0vvCx
	MDOImc8MLFPnDwrrbRwHpuH10p4lnoeCxe+M9ba4/ColsFEJ3f/Ga+mSAqahjMlEudae
	X/83p6NfFh2Z0jec5viks2WoGb/E8G3vpCKY7VhN70UqJQ1p8bqHw6E5FAYQ+zGDyFxH
	y1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J6/H0NNzECqvRX+kQrZesIK86KVS3hAdtVwCN3bWhnU=;
	b=krtPWBlfnnF3YnKu0FWWU0HO9c3aZMKfer7wBlFnq9DREgCZ+S0skCbtNsd3pFLYPB
	EE/pDMvOMPn31eBAPxQc/leGxWtzlyZqn9ON07kmj/MZ/6NejSDrMuvlH2Eh0zQ4QkI5
	RNtH9RkdAat3U4hXQBavclH/DKoijExq9RUoki47pvg0wkMVBQqgRQAoF2WQhXLabfxt
	Q2FPqpMrcdt6XzBo9bWbbdRKRaWl1mzAaRf8ijZYePUwxdzRQwvlqyFymUsWwcu7LNvF
	PztVfEgSCFsjEf8fVdGHM7uK0mpltglnNMnht+VOGuQulYHbu5twUz3y419xB7ruNnIH
	g/FA==
X-Gm-Message-State: APjAAAXG9nU9HPYaMzAv7+qS4TI5IthCf0t9El8pL/v84CjMBS+6LGUs
	p+15fzql2yYVbIuoKmj4daVGl2hvECDNi77NQxc=
X-Google-Smtp-Source: APXvYqwNs24p3t+B8RPbPgydFjlPikUFHhW5wqNLegwM9/16nFd5AIlKnjTVW2S899oFVljcvxyA5znXL20Ou+IRzvM=
X-Received: by 2002:ab0:810:: with SMTP id a16mr9312437uaf.93.1566057696295;
	Sat, 17 Aug 2019 09:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190817153954.15805-1-otavio@ossystems.com.br>
In-Reply-To: <20190817153954.15805-1-otavio@ossystems.com.br>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 17 Aug 2019 18:01:25 +0200
Message-ID: <CANNYZj-RD8zN7o7mX61MuATaO_7NSHY8DXAUR6TuU50M85r7Ag@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: Upgrade 19.1.1 -> 19.1.4
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
X-List-Received-Date: Sat, 17 Aug 2019 16:01:35 -0000
Content-Type: multipart/alternative; boundary="000000000000af7e6d059052389f"

--000000000000af7e6d059052389f
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Aug 2019 at 17:40, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> +Subject: [PATCH] Revert "meson: Improve detection of Python when using
> Meson
> + >=0.50."
> +Organization: O.S. Systems Software LTDA.
> +
> +This reverts commit cb3072488cd327155206e92d1ad8eb72a23ab04e.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +-if meson.version().version_compare('>=0.50')
> +-  prog_python = import('python').find_installation('python3')
> +-else
> +-  prog_python = import('python3').find_python()
> +-endif
> ++prog_python = import('python3').find_python()
> + has_mako = run_command(
> +   prog_python, '-c',
> +   '''
>

If this is broken in meson, shouldn't it be fixed at the source (e.g.
meson), rather than patched after the fact back to the 'older pre-0.50 way'
in every component that trips over it?

Alex

--000000000000af7e6d059052389f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 17 Aug 2019 at 17:40, Otavio Salv=
ador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br=
</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">+Subject: [PATCH] Revert &quot;meson: Improve de=
tection of Python when using Meson<br>
+ &gt;=3D0.50.&quot;<br>
+Organization: O.S. Systems Software LTDA.<br>
+<br>
+This reverts commit cb3072488cd327155206e92d1ad8eb72a23ab04e.<br>
+<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>+-if meson.version().version_compare(&#39;&gt;=3D0.50&#39;)<br>
+-=C2=A0 prog_python =3D import(&#39;python&#39;).find_installation(&#39;py=
thon3&#39;)<br>
+-else<br>
+-=C2=A0 prog_python =3D import(&#39;python3&#39;).find_python()<br>
+-endif<br>
++prog_python =3D import(&#39;python3&#39;).find_python()<br>
+ has_mako =3D run_command(<br>
+=C2=A0 =C2=A0prog_python, &#39;-c&#39;,<br>
+=C2=A0 =C2=A0&#39;&#39;&#39;<br></blockquote><div><br></div><div>If this i=
s broken in meson, shouldn&#39;t it be fixed at the source (e.g. meson), ra=
ther than patched after the fact back to the &#39;older pre-0.50 way&#39; i=
n every component that trips over it?</div><div><br></div><div>Alex<br></di=
v></div></div>

--000000000000af7e6d059052389f--
