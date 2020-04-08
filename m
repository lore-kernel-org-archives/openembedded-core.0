Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web12.4022.1586310780523850760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hE649I+Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id b1so5910072ljp.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 18:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=DdAVGPOMgb2Bx7ickrTD8drAP43LfJq+/ftlZ+zsaeQ=;
        b=hE649I+Ym01qnzf+ftPbmwWcLFaaSTX0LKSbuG/SAewFNYnTucw01WtMnGJgR/aN/n
         sZes2YcIrGxV9scfRb4JFuhYHfamM7GmTgVI0FlWmMvO71uBxJVT5g5CGVcBA4V/WTr8
         j4qSDH94XL9ivNMsEVWqKt6TEQwGuUES4/7c9p4s4j5SVZv/pxmcJ9XpxekFGjZgHkIU
         CWW+FM+SeBtlXmTk4ipic9yQ2/Yo0kxWwlL5X3p1xue/83h2wRxJ00Bv3cBAGrD0I6AX
         oiUcr9e939q+Vff2dtpUe8v7qMEdZGfRjirYyQ5c4eStM74Gk4+F4Nk2f9imRYjNZvC9
         CipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=DdAVGPOMgb2Bx7ickrTD8drAP43LfJq+/ftlZ+zsaeQ=;
        b=kI8iek/wzTlD9ELJe2bF+36J0UXIiyrSZUrRzwOM9n5KZKnJ4Ql3cTa112Dqe3oYcq
         LvWO4GY2MCF1AD4YD6P6hlp+ZGMBzA8Mz0wyvV994TGu3NnThelP4CdwOIN7Avi4J5m8
         ZwieSWWTpfyNvANVs7HHR/Kv/tZmTgrTPmpIXjqmO4r1aj6OvB+mhJ067+jCNckXJX7k
         CvurPoKsE9AhIQDV5Zh2gFCqVBmSAvtqUeGmnTGHTu+v6B3pjBw4q46zSXMVg4lLbNee
         Qkiw3DZ9S1D2HFkWEm19OsxiZZC9TNDHDk6F7Sls4fvSewRQtjyeYfBeSel+wfLfY1xZ
         Z+YA==
X-Gm-Message-State: AGi0PuYMmLDkfnWLhWrKDgTweu2YozecnFGhFL/78wUBnncqBTVA2VmG
	B7jeHvfk+eYhDI82owc82rKlzLQLH+YDG64yK0TeNpc36Eg=
X-Google-Smtp-Source: APiQypIww3ciq1LO4vTGVgS5I9FDVfumX20kkh8kEjiqXuCmq7yx0nRwfkv5HMut7Y+PCoYGNuwXyAFf86If2lP/enc=
X-Received: by 2002:a2e:8887:: with SMTP id k7mr3421190lji.193.1586310778243;
 Tue, 07 Apr 2020 18:52:58 -0700 (PDT)
MIME-Version: 1.0
From: "Ankur Tyagi" <ankur.tyagi85@gmail.com>
Date: Wed, 8 Apr 2020 13:52:47 +1200
Message-ID: <CADySD0GO0510UjoSWx=sK9oiyCFCJanB7-C7Ph6y62BtOmfNXA@mail.gmail.com>
Subject: Including vendor's pre-built binary in image
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000070cf2a05a2bdc2d7"

--00000000000070cf2a05a2bdc2d7
Content-Type: text/plain; charset="UTF-8"

Hi,

I am sure this is not being discussed for first time and I tried
all suggested solution in previous emails but none worked hence I am asking
again.

Trying to include a pre-built binary from vendor in my image but getting
following QA error:

ERROR: my-recipe-1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool contained
in package my-recipe requires libstdc++.so.6(CXXABI_1.3), but no providers
found in RDEPENDS_my-recipe ? [file-rdeps]
ERROR: my-recipe -1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool
contained in package my-recipe requires libstdc++.so.6(GLIBCXX_3.4), but no
providers found in RDEPENDS_my-recipe ? [file-rdeps]
ERROR: my-recipe -1.0-r0 do_package_qa: QA run found fatal errors. Please
consider fixing them.
ERROR: my-recipe -1.0-r0 do_package_qa: Function failed: do_package_qa

I have tried following in my-recipe_1.0.bb but error still persists
RDEPENDS_${PN} += "libstdc++6"

How can I fix this?

thanks
Ankur

--00000000000070cf2a05a2bdc2d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">Hi,<br></div><div class=3D"gmail_default" style=3D"font-family:=
verdana,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:verdana,sans-serif">I am sure this=C2=A0is not being discussed for=C2=
=A0first time and I tried all=C2=A0suggested solution in=C2=A0previous emai=
ls but none worked hence I am asking again.</div><div class=3D"gmail_defaul=
t" style=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:verdana,sans-serif">Trying to include a pre-bu=
ilt binary from vendor in my image but getting following QA error:</div><di=
v class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><br></di=
v><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif">ERR=
OR: my-recipe-1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool contained in=
 package=20

my-recipe

 requires libstdc++.so.6(CXXABI_1.3), but no providers found in RDEPENDS_my=
-recipe

? [file-rdeps]<br>ERROR:=20

my-recipe

-1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool contained in package=20

my-recipe requires libstdc++.so.6(GLIBCXX_3.4), but no providers found in R=
DEPENDS_my-recipe

? [file-rdeps]<br>ERROR:=20

my-recipe

-1.0-r0 do_package_qa: QA run found fatal errors. Please consider fixing th=
em.<br>ERROR:=20

my-recipe

-1.0-r0 do_package_qa: Function failed: do_package_qa<br></div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><br></div><div =
class=3D"gmail_default" style=3D"font-family:verdana,sans-serif">I have tri=
ed following in <a href=3D"http://my-recipe_1.0.bb">my-recipe_1.0.bb</a> bu=
t error still persists</div><div class=3D"gmail_default" style=3D"font-fami=
ly:verdana,sans-serif">RDEPENDS_${PN} +=3D &quot;libstdc++6&quot;<br></div>=
<div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><br><=
/div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif">=
How can I=C2=A0fix this?</div><div class=3D"gmail_default" style=3D"font-fa=
mily:verdana,sans-serif"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:verdana,sans-serif">thanks</div><div class=3D"gmail_default" styl=
e=3D"font-family:verdana,sans-serif">Ankur</div></div>

--00000000000070cf2a05a2bdc2d7--
