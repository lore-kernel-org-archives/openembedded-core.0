Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.739.1587678156489487294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 14:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cS/AGAZG;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: kergoth@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id k22so5579107eds.6
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 14:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=10wj6qx6As2qUYMEx8KsdsGbzKUZQ8boRU+EFcY5SmI=;
        b=cS/AGAZGA7G91Nkb06Qzz8ATelull8zek8p1c8SruZaG94h//TFF4hxqPHi6agLTsR
         K4NLr+KJFkdWIBB6PUeW+OGrNUDKwFYDnqdqgxGIGVDCKzjCm/llgUEMuKMYJNfQXhcS
         59y+tyq8T8ndatsYaMCjFDdAuJda3mlVx4ls3I6+rF1NSBBzBmTltHcCRswfymhMduR6
         dgQxf5xZUM8lxr7TMxB1gJ0vWeTrpIqxOwjeDQ6phZQMTnxdWYfC61ss1rxzWewL8Aaa
         Bae8U+XlaJVAJHNPZD5d2sryhL1vFtuyu3WhU/m76ETdQC7DllS9N+B1HCbNuVZjADRo
         Dspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10wj6qx6As2qUYMEx8KsdsGbzKUZQ8boRU+EFcY5SmI=;
        b=oUABynU3lDTg0StyNa3ko/8s+U8rtuoDRugd8dgqLHkbfJhG3h4iAl0TYAUWN102Ps
         MVlXBHYXVKNG1vVoQBLijknkQI1NDPZX/Pgh5d0WJk77dVJQOWa2Oz6Xd8BEk0KgJyDQ
         rHVIraJvO1UNnAHRl+7HV8Ua3Ztjc8Dm0BK/Nv1tWYpe/9qCIv2H+FIK1MA+LhNrOrKK
         fCuD3hB8fK4aDXak4HaRKVx0Kd3pHxnU2ZniR1XKacO6D8ADTRKwDCdAq0oFzNDF1UXq
         5NI6XxdSASqktc0iruX64jdSU9XHAmrZtLTsk3B07VRvlYmnltGbGYRAuUTuv0lhyQ4G
         q80A==
X-Gm-Message-State: AGi0PuZravv/HvF2uPSNXa07LexihrwmJRYVK1BmXB7YirzP1jw+wGjW
	U3BcN0KGxPe+W/ZNfcc9pZ0kgeoxJHGAuKoZF54=
X-Google-Smtp-Source: APiQypJwrySZkgXyexqhYauHqui0+z1t7OUm5I4z8Koq1ip/EfE8Pzfi4z0XOvGUYzlNKEhetk4lsrOtSllU/E2c1tM=
X-Received: by 2002:aa7:cc88:: with SMTP id p8mr4592536edt.387.1587678154901;
 Thu, 23 Apr 2020 14:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2004231348560.3238810@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2004231348560.3238810@localhost.localdomain>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Thu, 23 Apr 2020 14:42:23 -0700
Message-ID: <CABcZANkMLE8aif1TK_gK80KMXo9R-9QaubyvKcdd+jWiH_Upqw@mail.gmail.com>
Subject: Re: [OE-core] any value in a single variable setting for "don't use busybox"?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000070ce7c05a3fc2074"

--00000000000070ce7c05a3fc2074
Content-Type: text/plain; charset="UTF-8"

This seems like something best kept in the distro .conf rather than
local.conf, in which case brevity is much less of an issue.

On Thu, Apr 23, 2020 at 10:53 AM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   in the vein of the recently-introduced INIT_MANAGER variable, is
> there any value in introducing a variable that is short for "i don't
> want a hint of busybox in my image"?
>
>   i see the equivalent in the same file i mentioned in an earlier
> post: meta/lib/oeqa/selftest/cases/imagefeatures.py, with the
> corresponding settings:
>
> # Replace busybox
> PREFERRED_PROVIDER_virtual/base-utils = "packagegroup-core-base-utils"
> VIRTUAL-RUNTIME_base-utils = "packagegroup-core-base-utils"
> VIRTUAL-RUNTIME_base-utils-hwclock = "util-linux-hwclock"
> VIRTUAL-RUNTIME_base-utils-syslog = ""
>
> # Blacklist busybox
> PNBLACKLIST[busybox] = "Don't build this"
>
>   i ask since a colleague just asked me how to do exactly that --
> prevent any trace of busybox being used in the final image.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> 
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--00000000000070ce7c05a3fc2074
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems like something best kept in the distro .conf ra=
ther than local.conf, in which case brevity is much less of an issue.</div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Apr 23, 2020 at 10:53 AM Robert P. J. Day &lt;<a href=3D"mailto:rpjday@cr=
ashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><br>
=C2=A0 in the vein of the recently-introduced INIT_MANAGER variable, is<br=
>
there any value in introducing a variable that is short for &quot;i don&#3=
9;t<br>
want a hint of busybox in my image&quot;?<br>
<br>
=C2=A0 i see the equivalent in the same file i mentioned in an earlier<br>
post: meta/lib/oeqa/selftest/cases/imagefeatures.py, with the<br>
corresponding settings:<br>
<br>
# Replace busybox<br>
PREFERRED_PROVIDER_virtual/base-utils =3D &quot;packagegroup-core-base-uti=
ls&quot;<br>
VIRTUAL-RUNTIME_base-utils =3D &quot;packagegroup-core-base-utils&quot;<br=
>
VIRTUAL-RUNTIME_base-utils-hwclock =3D &quot;util-linux-hwclock&quot;<br>
VIRTUAL-RUNTIME_base-utils-syslog =3D &quot;&quot;<br>
<br>
# Blacklist busybox<br>
PNBLACKLIST[busybox] =3D &quot;Don&#39;t build this&quot;<br>
<br>
=C2=A0 i ask since a colleague just asked me how to do exactly that --<br>
prevent any trace of busybox being used in the final image.<br>
<br>
rday<br>
<br>
-- <br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Onta=
rio, CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<a href=3D"http://crashcourse.ca" rel=3D"noreferrer" targ=
et=3D"_blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<=
a href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">h=
ttp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linke=
din.com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.=
com/in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--00000000000070ce7c05a3fc2074--
