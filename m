Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7C01577128
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 02:15:54 +0000 (UTC)
Received: by igbif5 with SMTP id if5so4164005igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 19:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=dvj7CYNhJpAVrClm+vyfSfRc8UuU0zMAWxVc8NjZNrQ=;
	b=RRy1F1aQVdYCk8Lmzg1VImtC7SlWnFS959pQMOThDR6D5YHLLOsJgZX4qNRLKvS/X0
	AX2tstmzjf2pZFDjr0PxI0Ci6w7FVukhoGBYfRlh3tJodXLXuqtDI7+DBSVtTjMeGGT9
	N1IKV/DgAlJnHrAoxez5B4F/3JusYRiW/4wPwBq933U9/GdF9/q/on+wzqOCfMkpYqjn
	v4C7Bztp7cgCIZqdiN3AKSapoYdvmZZkdDjk+g9F9Ia3nY1MQ8gPmSCIMnFu9tbgGNfU
	3eSwERv9xVhtpDVTt6ICjhJMXBmC/4IcHPxDGlrfx5UyRwpcD/3rBVndyrA9h1XbZdL9
	X+pA==
X-Received: by 10.50.147.6 with SMTP id tg6mr2474769igb.68.1444961754890; Thu,
	15 Oct 2015 19:15:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.65.204 with HTTP; Thu, 15 Oct 2015 19:15:35 -0700 (PDT)
In-Reply-To: <1444930021-4096-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1444930021-4096-1-git-send-email-benjamin.esquivel@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 15 Oct 2015 19:15:35 -0700
X-Google-Sender-Auth: LMAPRHl1BhgGWzI4Ufdmd2i62TA
Message-ID: <CABcZANkYQD8esrYrhDWZdiXnp5tEdemmh0cGyqpGWX_zA_t5fA@mail.gmail.com>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate SDK: prepare calling of bb.utils for exceptions
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
X-List-Received-Date: Fri, 16 Oct 2015 02:15:55 -0000
Content-Type: multipart/alternative; boundary=089e013c67c21d4ab505222f604c

--089e013c67c21d4ab505222f604c
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 15, 2015 at 10:27 AM, Benjamin Esquivel <
benjamin.esquivel@linux.intel.com> wrote:

> +    def movefile(self, sourcefile, destdir):
> +        try:
> +            # FIXME: this check of movefile's return code to None should
> be
> +            # fixed within the function to use only exceptions to signal
> when
> +            # something goes wrong
> +            if (bb.utils.movefile(sourcefile, destdir) == None):
> +                raise Exception("moving {} to {} failed".format(
> +                                        sourcefile, destdir))
> +        except Exception as e:
> +            bb.warn(str(e))
> +            bb.error("unable to place {} in final SDK location".format(
> +                        sourcefile))
> +
> +    def mkdirhier(self, dirpath):
> +        try:
> +            bb.utils.mkdirhier(dirpath)
> +        except OSError as e:
> +            bb.warn(str(e))
> +            bb.error("cannot make dir for SDK: {}".format(dirpath))
>

Shouldn't this be fatal?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013c67c21d4ab505222f604c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Oct 15, 2015 at 10:27 AM, Benjamin Esquivel <span dir=3D"ltr">&lt;<=
a href=3D"mailto:benjamin.esquivel@linux.intel.com" target=3D"_blank">benja=
min.esquivel@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div id=3D":1fa" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =
=C2=A0 def movefile(self, sourcefile, destdir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME: this check of movefile&=
#39;s return code to None should be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # fixed within the function to u=
se only exceptions to signal when<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # something goes wrong<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bb.utils.movefile(sourcefile=
, destdir) =3D=3D None):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(&q=
uot;moving {} to {} failed&quot;.format(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sourcefi=
le, destdir))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(str(e))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;unable to place {=
} in final SDK location&quot;.format(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sourcefile))<br>
+<br>
+=C2=A0 =C2=A0 def mkdirhier(self, dirpath):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(dirpath)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(str(e))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;cannot make dir f=
or SDK: {}&quot;.format(dirpath))</div></blockquote></div><br>Shouldn&#39;t=
 this be fatal?<br>-- <br><div class=3D"gmail_signature">Christopher Larson=
<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaur=
us<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--089e013c67c21d4ab505222f604c--
