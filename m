Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.3412.1594752650568999253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 11:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=aXaWCKfk;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.218.43, mailfrom: mircea.carausu@broadcom.com)
Received: by mail-ej1-f43.google.com with SMTP id f12so23839877eja.9
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 11:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=vDkcGuPLCcD2gijzQ+F20BKG5VZ+5x+5laVJsotG9Uk=;
        b=aXaWCKfkObGBpZSC/KFYXV8UvGK3f5yfAHE2cnAvc2EWQxckGFmMrVEKnnBtVxMyJJ
         v2uKalIC58glTELWG3Sab4NxwyZUViwy5ZFMjX9fL/d09Q2iN7MqNiq1c/XSKHK3bZuX
         hgd/USK/HEnegdskvMHyHl3LKxQ3uSysNjqAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=vDkcGuPLCcD2gijzQ+F20BKG5VZ+5x+5laVJsotG9Uk=;
        b=U0YaW6/pqH8wGvl82B8O3u7tyIISw21guuI42b7+kN8YaYvHoBEuvIp8o5kEVP4OxO
         Hb7QszQ59r00CzeddXiWl2yrEBj8pl9ttauWwOq9JfpUX3XIGVFpAyavfQnUOhgR0rul
         y+mwfv5BXeblIH2zP8M2jYu1ij38xvHp4pkdNO5bH/zju1Vs8arNLsptMFjTvRs1mBlO
         qA2Uiv8cijv9FIBYG+p4MvO8OUemrcJFsouVIh17sWrSMLYjhyZ9GjRLFpHR+CgNsyUz
         pmkj4PGVbGtuixum8OewT8HFjdzxomsb8XDGyAX+flXzUKtSvIU+1m6WwcSLmuVmvFHA
         n7iQ==
X-Gm-Message-State: AOAM530mROzNPdB3TwPw2Lt5DvFX+k7yX2kXXtVuKPeCkNSAG9CzzO6i
	4Db2lt32ziXQpAVPbV9AAzEC1faxPeo9VTZBXX9kEZnVJtmOpQ==
X-Google-Smtp-Source: ABdhPJyGESvD7qioWqOfYmONdQjLADJpqzbz8215fwRdeyRLMVC0ZArid+AbuJhwiB779ySYO9+Jh3gjisWdpTX5J1o=
X-Received: by 2002:a17:906:840a:: with SMTP id n10mr5635076ejx.453.1594752648581;
 Tue, 14 Jul 2020 11:50:48 -0700 (PDT)
MIME-Version: 1.0
From: mircea.carausu@broadcom.com
Date: Tue, 14 Jul 2020 11:50:37 -0700
Message-ID: <CAA5OMZ8KP=CriR-gsRsiq223_r-N7+yT6Y9_AvPddQb3Fbuscw@mail.gmail.com>
Subject: tinymembench: fix patch fuzz
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001fe84605aa6b4909"

--0000000000001fe84605aa6b4909
Content-Type: text/plain; charset="UTF-8"

Hello,
I am new to the list and up-streaming activities.
Could you please kindly guide me how to submit a fix for the existing
tinymembench.patch
(meta-openembedded/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-directives.patch)
Problem:

tinymembench patch does not apply cleanly (it succeeds with warnings - fuzz
detected). Used devtool to fix:

devtool modify tinymembench devtool finish --force-patch-refresh
tinymembench ../meta-openembedded/meta-oe

I already generated the new patch.

What are the next steps (other than local verification).

Should I just upload it here for review once I consider it ready for review?

Sorry for asking such basic questions....

Many thanks,

Mircea

--0000000000001fe84605aa6b4909
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>I am new to the list and up-streaming activitie=
s.</div><div>Could you please kindly guide me how to submit a fix for the e=
xisting tinymembench.patch</div><div>(meta-openembedded/meta-oe/recipes-ben=
chmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-directives.=
patch)</div><div>Problem:</div><div><p style=3D"white-space:pre-wrap;color:=
rgb(53,53,53);font-family:sans-serif">tinymembench patch does not apply cle=
anly (it succeeds with warnings - fuzz detected).
Used devtool to fix:</p><p style=3D"white-space:pre-wrap;color:rgb(53,53,53=
);font-family:sans-serif">  devtool modify tinymembench
  devtool finish --force-patch-refresh tinymembench ../meta-openembedded/me=
ta-oe</p><p style=3D"white-space:pre-wrap;color:rgb(53,53,53);font-family:s=
ans-serif">I already generated the new patch. <br></p><p style=3D"white-spa=
ce:pre-wrap;color:rgb(53,53,53);font-family:sans-serif">What are the next s=
teps (other than local verification). </p><p style=3D"white-space:pre-wrap;=
color:rgb(53,53,53);font-family:sans-serif">Should I just upload it here fo=
r review once I consider it ready for review?</p><p style=3D"white-space:pr=
e-wrap;color:rgb(53,53,53);font-family:sans-serif">Sorry for asking such ba=
sic questions.... </p><p style=3D"white-space:pre-wrap;color:rgb(53,53,53);=
font-family:sans-serif">Many thanks,</p><p style=3D"white-space:pre-wrap;co=
lor:rgb(53,53,53);font-family:sans-serif">Mircea<br></p><p style=3D"white-s=
pace:pre-wrap;color:rgb(53,53,53);font-family:sans-serif"><br></p></div></d=
iv>

--0000000000001fe84605aa6b4909--
