Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web09.2706.1618046883238217604
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Apr 2021 02:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=URFmLQi4;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id x123so3301269vsb.10
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Apr 2021 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=00/a0ibVX+5fY7IYtHFK8no7Egm1hOK9wWjJzRG1sbM=;
        b=URFmLQi4Mva64S/T6bgmvSxeGZ5UKsB0ZMBj7rOYj3yMm1LZqZ1j2HwZScnpuhk+nU
         pEDWwHBIgxJvWnHMIERYg2il26kLQzLwPNQ7K2NwP2AWwcxQ+khNblDFw1vpngjDnD9R
         crGZ+Tu8ipWe9o13JsrzbFOyh1/cmNZvJSyI0GocUPgn2TxyPFbkXllW8tRiMAJq2hRA
         kF21BZw1G+VrXYIW7/HWMQ1t+aRu32DhDTau9NenKMR/FaGd4R0z8Chj59HZZ7iN7L5v
         nueWF4XXMjg1srq9Q/U/vhVEie1vVsgDtj7twBLiI+a5uD+InyX/Rrb9Lwg4VvcyagmC
         xKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=00/a0ibVX+5fY7IYtHFK8no7Egm1hOK9wWjJzRG1sbM=;
        b=oOUT1qv++cyOvXhp555A+mXsWNySTEvCOroyZhrMYCxKFUNV+QsQzLey2ixSIsVCse
         TA3EwPpZYJkn7jIJ+lKNLQAUkQsbDOw28oq3AehWFqKSkjr+wpCpGtqjWo7C1W1jV6fL
         1f2BLwQxMYGr9q2t3nNOPrx6SYhv3i2pokwRKzpoMzgkPvWob97lUltb8qOVljWUGjF6
         3/zdb8KfdGdj6epcyd0tk3fpUV4vcZoYONkyevldXzaP6m+g/XvgVFgqBtkaf486oKo9
         oWG1rpqAqeT1E+nHOuib4RtSLiawOqFXM4AcRYTyR18ExSFbsw9yD6dIxVPAq2sz5CTN
         BrJA==
X-Gm-Message-State: AOAM533TVYnnLHRxDdJ46c6dLMI6Ue52V7flxA8CmJ0g7WuYYURi42zg
	rV4bLyNNAEkYD7+LC1kmXy8vJSqtNv6Y7nXWwVk=
X-Google-Smtp-Source: ABdhPJxGz84Px4zu9PTjQ6qVdJLeVpO2/nwYOmujNOPpaQDTCYoCq11YfyHO8rmapPHVcWtmom+u/ib4UGe03ulJhBI=
X-Received: by 2002:a67:1447:: with SMTP id 68mr14211381vsu.20.1618046882262;
 Sat, 10 Apr 2021 02:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <122e62-d2a0-c117-67d5-9a93baca6e8@crashcourse.ca>
In-Reply-To: <122e62-d2a0-c117-67d5-9a93baca6e8@crashcourse.ca>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 10 Apr 2021 11:27:51 +0200
Message-ID: <CANNYZj_oEcG1Ma9UowpjepwqyaGrj-miHLOcnGczNmrmrh7xBg@mail.gmail.com>
Subject: Re: [OE-core] is there a standard for pkg_{pre,post}... and appending/prepending?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a5b27405bf9ae52a"

--000000000000a5b27405bf9ae52a
Content-Type: text/plain; charset="UTF-8"

I guess you need to investigate a bit deeper, and inspect the actual
postinst script content for all of those items. Are some of them missing
the needed bits?

Alex

On Thu, 8 Apr 2021 at 12:17, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>
>   just noticed the following (probably harmless) inconsistency in
> oe-core/meta:
>
> classes/manpages.bbclass:pkg_postinst_append_${MAN_PKG} () {
> classes/manpages.bbclass:pkg_postrm_append_${MAN_PKG} () {
> recipes-core/dropbear/dropbear.inc:pkg_postrm_append_${PN} () {
> recipes-core/busybox/busybox.inc:pkg_postinst_${PN}_prepend () {
> recipes-core/busybox/busybox.inc:pkg_postinst_${PN}_append () {
>
> for consistency, should the package name go before or after?
>
> rday
>
> 
>
>

--000000000000a5b27405bf9ae52a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I guess you need to investigate a bit deeper, and ins=
pect the actual postinst script content for all of those items. Are some of=
 them missing the needed bits?</div><div><br></div><div>Alex<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, 8 Apr 2021 at 12:17, Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crash=
course.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
=C2=A0 just noticed the following (probably harmless) inconsistency in<br>
oe-core/meta:<br>
<br>
classes/manpages.bbclass:pkg_postinst_append_${MAN_PKG} () {<br>
classes/manpages.bbclass:pkg_postrm_append_${MAN_PKG} () {<br>
recipes-core/dropbear/dropbear.inc:pkg_postrm_append_${PN} () {<br>
recipes-core/busybox/busybox.inc:pkg_postinst_${PN}_prepend () {<br>
recipes-core/busybox/busybox.inc:pkg_postinst_${PN}_append () {<br>
<br>
for consistency, should the package name go before or after?<br>
<br>
rday<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000a5b27405bf9ae52a--
