Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web11.15603.1622921236167768445
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jun 2021 12:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a9/wfLv7;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id f11so6747369vst.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jun 2021 12:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+uoF8HwCBNmpY9nRL/aMG2PP0EoTIWjvwPMmpqtXj8=;
        b=a9/wfLv7jihZWJqImdUTlbYVepOePRN3IllJ51GgYYI8sviLC7pIaFEtqopFejP1np
         8cgS7Gi+Utk32doWkl8cfl+2VGrBnIzdvnI8SXwin0UIpUKnZLkfIrASy8v54YUmbKTB
         kNl6hNzRhhtsi4P9OS78XWEG9vQC9g7UAsnTJTXO0nmefeW9t91WJlKkiswl3Es/S18V
         uYlQpKOJpLAIiJyc7Qj5Plal8ea7BPxC9s7jUGOPwdKAuT6Ds81dtNj9/E92iRNUT686
         /t1ZLlqazAayRlq+s1wlDEwOALoIziX7wthzso+LGRXL5dTlqf0gErpGy3BHRxrda+xK
         RTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+uoF8HwCBNmpY9nRL/aMG2PP0EoTIWjvwPMmpqtXj8=;
        b=Igw7EaQMB2h4tbM0DvTDGmtMOPJoyGcI94NJkHLPzTvRBd3r9ZnUPJCHYaREeGC0FM
         m/KUd8qRxk7+Xekx/Jeh1pXRVU1xWXFVN7aF1pIjqdi0ECkeI4JnQG9AG30LPiN5CudO
         CN0C81Om2LbmqgqUdw+GFBA7WRvpdtCj3p2LkNRHaK0dkzpWh0km5gNjcclRO4ZDQbdT
         ao/UtElu6XoIZ0MMe9YllkHYhgqg6cqZnrJEOf3gwQmFDPuIPiJaBukNwAjIynwbvPxj
         Kyj0hb9t6QHULxludq4mztcqtW4xzozk+itC3WImj6yibDxCYLVl7R79yLZq181DuSC+
         D7+w==
X-Gm-Message-State: AOAM530dZa96IlpoISY2Rqb/nZS5/INAfvGT7vF8XeukdO6rdjtZoWBB
	SOc4rTfNyB01sRDibumTAaEgnYc7K8dlWcxOgoc=
X-Google-Smtp-Source: ABdhPJyCcsj+7hRc2cpgZv2WVxyTeN5d3sV9UMBIyRaAFX02hZtS7GtnyKFq9eiwNEB6LwFRJoSJ5u5f3/HD8hZzRNI=
X-Received: by 2002:a05:6102:2f4:: with SMTP id j20mr6092150vsj.51.1622921235373;
 Sat, 05 Jun 2021 12:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-4-alex.kanavin@gmail.com> <1685B658849E960A.4717@lists.openembedded.org>
 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com> <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
In-Reply-To: <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 5 Jun 2021 21:27:03 +0200
Message-ID: <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000bba0c205c409cb66"

--000000000000bba0c205c409cb66
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Jun 2021 at 18:09, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> I've just realised this is also happening with master in a-quick:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1441
>
> all centos8 failures.
>
> Michael: Did something change on those machines during maint on Friday
> that could be triggering ths?
>

I manually ran sato testsdk on the centos8 worker just now, and it passed
without errors.

Was there maybe a period where system time on the host was wrong?

Alex

--000000000000bba0c205c409cb66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, 5 Jun 2021 at 18:09, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
I&#39;ve just realised this is also happening with master in a-quick:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/85/build=
s/1441" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/85/builds/1441</a><br>
<br>
all centos8 failures.<br>
<br>
Michael: Did something change on those machines during maint on Friday<br>
that could be triggering ths?<br>
</blockquote><div><br></div><div>I manually ran sato testsdk on the centos8=
 worker just now, and it passed without errors.</div><div><br></div><div>Wa=
s there maybe a period where system time on the host was wrong?</div><div><=
br></div><div>Alex<br></div></div></div>

--000000000000bba0c205c409cb66--
