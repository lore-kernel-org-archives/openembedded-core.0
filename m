Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id E836460111
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 16:32:22 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m88so4460026iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Aug 2017 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F1hOXM56W0VjAAAp8SN07Y6x+b+oa7s6g97+uWP7pSo=;
	b=njsfpHHVNf59PwM2QInDiTpJTIvoheUNdRm2sw3u+FHTty/QweaiS9oq62++NWEmIV
	qzh7TM+ggEoyARoXCh7Ntw3bqHUv+5zSnkSh9nEApVSriFGp63SulcCidseTMEQ6lytO
	A8w6G9E+U5u+sG1vBzFyd+UehLw6xL6CeVtwEaSqZZIvjd/FaOqEFLizs9Y9LJYygcHC
	FUQDDMX4Qq4qjKvmlFBwyOahtZqzNCLIE7TuHQvjBw17wMLiGn3dR7NhHL/yUky0tnb4
	E7B8KT1mCTu+EnkN1+i8V55tVtib3H2YK9D2NiK5n6JMhCYj2s5jJMOzhFmB40iqx/GP
	Q0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F1hOXM56W0VjAAAp8SN07Y6x+b+oa7s6g97+uWP7pSo=;
	b=FCJ826mAvqPLX1UTgZ47GFPL+8UD7+8Ud5Lpx/zGpQLC9DY0ULb3FX5MPzJSKXlwyK
	8tQZSA4WQovBNDYI1SnV4lrXx4ugo/4qDHXI18X24ZMw3XlMfWFhpKdOIpSJocHgyj1f
	k2TPitBXOCZY9yumNT/PNsVZOXLgQ1GLi1jTRurOE7jaPxJx9kfHIlwuogCDlYBHwu9f
	A6Ka091ys8//3fjrxNiXdgmsbPsFOauI4PrgeE2NS/51v3PrMFKIzJGoSH5qcagRQFvg
	iYHml5f7sitKLFzgHz/nvCmVxOz164u+xS7Xaeh4Xmcf6iZ2UaIHk3sssnff77ID+8q7
	sWfA==
X-Gm-Message-State: AIVw112zE8MEss4zX5tIjAY8V0SWZ/6Gb7DOfvBzc28g/W5q6hhdC/LE
	nQOYgDU59D4jEa3Skns9uSaKYynIKK7YIMk=
X-Received: by 10.107.171.69 with SMTP id u66mr1101786ioe.231.1502123543971;
	Mon, 07 Aug 2017 09:32:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Mon, 7 Aug 2017 09:32:03 -0700 (PDT)
In-Reply-To: <20170804185703.51157-2-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170804185703.51157-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170804185703.51157-2-leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Aug 2017 17:32:03 +0100
Message-ID: <CAJTo0LY5mBjm586rFqHBofcZE3eSzY=kAaxp2P=4PBA-2nYwiA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sstatetests: limit the number of signature comparisons when differ
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
X-List-Received-Date: Mon, 07 Aug 2017 16:32:23 -0000
Content-Type: multipart/alternative; boundary="94eb2c05b4ba3f5c1f05562c6420"

--94eb2c05b4ba3f5c1f05562c6420
Content-Type: text/plain; charset="UTF-8"

On 4 August 2017 at 19:57, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> +        i_sigfile, max_sigfiles_to_compare = 0, 20
>          for k in files1.keys() | files2.keys():
>              if k in files1 and k in files2:
> +                i_sigfile += 1
>                  print("%s differs:" % k)
> +                # this is an expensive computation, thus just compare the
> first
> +                # 'max_sigfiles_to_compare' k files
> +                if i_sigfile > max_sigfiles_to_compare:
> +                    continue
>                  sigdatafile1 = self.topdir +
> "/tmp-sstatesamehash/stamps/" + k + "." + files1[k]
>                  sigdatafile2 = self.topdir +
> "/tmp-sstatesamehash2/stamps/" + k + "." + files2[k]
>                  output = bb.siggen.compare_sigfiles(sigdatafile1,
> sigdatafile2)
>

A neater way to do this:

-for k in files1.keys() | files2.keys():
+for k in list(files1.keys() | files2.key())[:20];

(take the union of the files1 and files2 keys, turn it into a list, and
slice off up to the first 20)

Ross

--94eb2c05b4ba3f5c1f05562c6420
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 August 2017 at 19:57,  <span dir=3D"ltr">&lt;<a href=
=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">le=
onardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-sty=
le:solid;border-left-color:rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 i_sigfile, max_sigfiles_to_compare =3D 0, 20<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for k in files1.keys() | files2.keys():<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if k in files1 and k in fil=
es2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i_sigfile +=3D 1<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&quot;%=
s differs:&quot; % k)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # this is an expen=
sive computation, thus just compare the first<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # &#39;max_sigfile=
s_to_compare&#39; k files<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i_sigfile &gt; =
max_sigfiles_to_compare:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sigdatafile1 =
=3D self.topdir + &quot;/tmp-sstatesamehash/stamps/&quot; + k + &quot;.&quo=
t; + files1[k]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sigdatafile2 =
=3D self.topdir + &quot;/tmp-sstatesamehash2/stamps/&quot; + k + &quot;.&qu=
ot; + files2[k]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output =3D bb=
.siggen.compare_sigfiles(<wbr>sigdatafile1, sigdatafile2)<br></blockquote><=
div><br></div><div>A neater way to do this:</div><div><br></div><div>-for k=
 in files1.keys() | files2.keys():</div>+for k in list(files1.keys() | file=
s2.key())[:20];</div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">(take the union of the files1 and files2 keys, turn it into a lis=
t, and slice off up to the first 20)</div><div class=3D"gmail_quote"><br></=
div><div class=3D"gmail_quote">Ross</div></div></div>

--94eb2c05b4ba3f5c1f05562c6420--
