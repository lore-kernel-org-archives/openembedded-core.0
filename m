Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web12.4128.1612833232551117551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 17:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e5g06Dz3;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: dorindabassey@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id f2so5190748ioq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 17:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=8mcDx3TBhBg2kbKcckOecRH8/ylWbx7cL6upadlnGMk=;
        b=e5g06Dz3Up0tm3VtjvRFjteQ9WjXmotqejNhP0FDrAJi79wuoFGdFt2VwMcpw/rd5a
         BeGVepUyL71AVLAijHOLPzHMKiNdTfwpJdIlyXdQHWm0yyTKT4OW1KZkH6eFpJ6OG5kB
         l0m7Kb7BqPRzh5FC93Tvhne+eAw7vUKOG+MnS2XeyQ+dE9H/h4FD+K3pOPTp/kwWf1Yy
         kI/4L2wKauRsUaTWG58aPzrWNhAO0VaN84P+M6VYDFxkqRyHMAcRAF4gSLVRGc02ywpO
         raJ4okExhXRkN3AcIlSzp5iFfGafH9G6zznD6gPE0KCX41Pytxe9TykYZrSjnPeSMh4z
         fn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=8mcDx3TBhBg2kbKcckOecRH8/ylWbx7cL6upadlnGMk=;
        b=HfeVV7d/oTSuKCF4ra+gMdsWAJGNKmRk5ADp6g+xhLq8DqP/rpG3p2fEaEotU2J665
         KjDnKT7su3Kt2w+XhIxNW9sn2JnN13rgimSQPTSQonQCZH1NgUKxu0i4bWWLuUAHsMWW
         g665TDnrjHKNEgnp0lSaPLfldfCZ/s/sMd8eSmtVcyx9P0Ib5Mab92dTPjqukfCA4CKN
         C7K7wwbTj/ejWydRJRZL0qmtoBnOAmYAX4497PUaR1LOEcR3dabvUzqO0cbI41QjF3mk
         KsFWJUH9fRbMY9s/rokNkjc4S/thhLKHBCQc20vTQidHgC2dI70WpHxtp2kicXPu/bTa
         PAZA==
X-Gm-Message-State: AOAM532YigJ6GVcx7vAmyL04gAlbbp7KZZWgKL6PBXMqKZ6WFSGGORSp
	rVxdHAQPwkvPFxEsY/z0uepLSdcJi+6TPaFUSrM=
X-Google-Smtp-Source: ABdhPJyoEkwbQYl6TlAgyObl+SFB5hxHIIAYwh/ruZ6XCMeqs6Iy62+Eon6e1bAI/u/srriH0+LXblp/0UyL/ann7gs=
X-Received: by 2002:a6b:a0a:: with SMTP id z10mr18106419ioi.67.1612833231984;
 Mon, 08 Feb 2021 17:13:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6e02:b46:0:0:0:0 with HTTP; Mon, 8 Feb 2021 17:13:51
 -0800 (PST)
Received: by 2002:a05:6e02:b46:0:0:0:0 with HTTP; Mon, 8 Feb 2021 17:13:51
 -0800 (PST)
In-Reply-To: <cc0a90ba7b46bcd5b51c60374b741c198d401fde.camel@linuxfoundation.org>
References: <20210201144638.15582-1-dorindabassey@gmail.com> <cc0a90ba7b46bcd5b51c60374b741c198d401fde.camel@linuxfoundation.org>
From: "Dorinda" <dorindabassey@gmail.com>
Date: Mon, 8 Feb 2021 20:13:51 -0500
Message-ID: <CAJSnhzs1-73MYgRCyfvz+fNuk+A4j=rD+tKTGfRSSMQnjhWAVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] oe-pkgdata-util: Check if environment script is initialized
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dfdaf005badcff27"

--000000000000dfdaf005badcff27
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

I checked devtool and recipetool, they have checks in place that errors out
immediately if executed without initializing oe-init-build-env script.

However, I'm unsure about this:
I'm wondering if there should be a check inside tinfoil itself?

Thanks and Regards,
Dorinda.


On Feb 8, 2021 17:42, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

Hi Dorinda,

On Mon, 2021-02-01 at 09:46 -0500, Dorinda wrote:
> Tinfoil doesn't behave well if environment is not initialized, this check
ensures a proper error log if environment is not initialized.
>
> [YOCTO #12096]
>
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
> v2:
> -Positioned check under a condition when it cannot determine the
pkgdata_dir
>
>  scripts/oe-pkgdata-util | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 93220e3617..75dd23efa3 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -598,6 +598,9 @@ def main():
>              logger.error("Unable to find bitbake by searching parent
directory of this script or PATH")
>              sys.exit(1)
>          logger.debug('Found bitbake path: %s' % bitbakepath)
> +        if not os.environ.get('BUILDDIR', ''):
> +            logger.error("This script can only be run after initialising
the build environment (e.g. by using oe-init-build-env)")
> +            sys.exit(1)
>          tinfoil = tinfoil_init()
>          try:
>              args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')

I'm a little worried about this patch since it fixes the oe-pkgdata-
util case but what about devtool, or recipetool or anything else which
uses tinfoil.

I'm wondering if there should be a check inside tinfoil itself?

or is this problem really oe-pkgdata-util specific?

Cheers,

Richard

--000000000000dfdaf005badcff27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Richard,</div><div dir=3D"auto"><br><div dir=3D"a=
uto">I checked devtool and recipetool, they have checks in place that error=
s out immediately if executed without initializing oe-init-build-env script=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">However, I&#39;m unsur=
e about this:</div><div dir=3D"auto"><span style=3D"font-family:sans-serif"=
>I&#39;m wondering if there should be a check inside tinfoil itself?</span>=
<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks and Regards,=
</div><div dir=3D"auto">Dorinda.</div><br><div class=3D"gmail_extra" dir=3D=
"auto"><br><div class=3D"gmail_quote">On Feb 8, 2021 17:42, &quot;Richard P=
urdie&quot; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richa=
rd.purdie@linuxfoundation.org</a>&gt; wrote:<br type=3D"attribution"><block=
quote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Hi Dorinda,<br>
<div class=3D"elided-text"><br>
On Mon, 2021-02-01 at 09:46 -0500, Dorinda wrote:<br>
&gt; Tinfoil doesn&#39;t behave well if environment is not initialized, thi=
s check ensures a proper error log if environment is not initialized.<br>
&gt; <br>
&gt; [YOCTO #12096]<br>
&gt; <br>
&gt; Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dorindabassey@gmai=
l.com">dorindabassey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2:<br>
&gt; -Positioned check under a condition when it cannot determine the pkgda=
ta_dir<br>
&gt; <br>
&gt; =C2=A0scripts/oe-pkgdata-util | 3 +++<br>
&gt; =C2=A01 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util<br>
&gt; index 93220e3617..75dd23efa3 100755<br>
&gt; --- a/scripts/oe-pkgdata-util<br>
&gt; +++ b/scripts/oe-pkgdata-util<br>
&gt; @@ -598,6 +598,9 @@ def main():<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0logger.error(&quot;<wbr>Unable to find bitbake by searching parent=
 directory of this script or PATH&quot;)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0sys.exit(1)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0logger.debug(&#3=
9;Found bitbake path: %s&#39; % bitbakepath)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.environ.get(&#39;BUILDDIR&#39;,=
 &#39;&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(&quot;This scr=
ipt can only be run after initialising the build environment (e.g. by using=
 oe-init-build-env)&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tinfoil =3D tinf=
oil_init()<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0try:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0args.pkgdata_dir =3D tinfoil.config_data.getVar(&#39;<wbr>PKGDATA_=
DIR&#39;)<br>
<br>
</div>I&#39;m a little worried about this patch since it fixes the oe-pkgda=
ta-<br>
util case but what about devtool, or recipetool or anything else which<br>
uses tinfoil.<br>
<br>
I&#39;m wondering if there should be a check inside tinfoil itself?<br>
<br>
or is this problem really oe-pkgdata-util specific?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br></div></div></div>

--000000000000dfdaf005badcff27--
