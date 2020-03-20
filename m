Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web12.1107.1584754907719142690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2020 18:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cgzqna2Z;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id e9so257516oii.1;
        Fri, 20 Mar 2020 18:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=Fvdcoje2PKPrpAYsKh9uL0Bk8sr1xJDSGjnKKonARRE=;
        b=cgzqna2Ze/70v8XWovVGJsMueepBzEiWVH0DHHDSJCTmYLGExKzUuME7+4Q0XuyZCt
         jXjkjo6wmsEJgumjejsujTejZUCF6wq2L+I0aywcBHnICsiiyLo+TyInKrJCTpopf0Mq
         cBq8Yiq4eYKnZGhiqnkhc8p35QSaa8gC74Lyxjd5CB+rSGGiEEYcmmCndi6lSGJCWB0L
         bOgE8OqklC0g5TAl7IjMWSvpNApuNXxznK9JTtSkeBSN1tOWHTVXtt72Th7Yfi3AGmfE
         zPTPCGv8vBxyzbnSlNR4h6QYU/e7wwP0QBudtMIVUX9KJinKTsILnR+ZHxpZ7qLvwhUF
         7j9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=Fvdcoje2PKPrpAYsKh9uL0Bk8sr1xJDSGjnKKonARRE=;
        b=aobnlPPsnQg2qQtvV0mQSQ2NziBN2Kpi7vv5NwZWDVwXX/PNn7U0uJpEFqcyf1InTs
         +H4tJ54pGfPT7r6yotR7zLJ1IOCVqnQUTgkNmrxKxSiMMBPFiTJXo9bKA4uch6mHaKHI
         QLLLmybnZnmR08A9FdNnv3SHJhB06xFOGQAygHwWGBPqeWRwYtGVweRPOXnUOZR2PU7X
         UQwex8qFpNtW1tesD43Qh+B7ggB8/wKLJd2x/7lfapx0/K/TZYbnFyJXDsZORYJzRgM5
         AlSXynMgVUZ4A+G0XwwVUASK9qyZA03nBij5f3pMMGqmoz3OZl6OTVBw9nQtBdXvoSm5
         52PQ==
X-Gm-Message-State: ANhLgQ0GO+z1wz3d9Jhm+BzUOLmtyU0r1f72J4+uy6r7e7lxSWFxcFC2
	v27sFnUuk5BoxfePn9P9yzlo/UPKOwI=
X-Google-Smtp-Source: ADFU+vt92XJdwBKep3vN0i3B+CNd4CVDGuuzqll0+5Jj4OYgKivdqouaj6KvBYsQFsGe09c3sj2JvQ==
X-Received: by 2002:a17:90b:228e:: with SMTP id kx14mr11538900pjb.134.1584737770331;
        Fri, 20 Mar 2020 13:56:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:d0c:b773:257a:dcc2? ([2601:202:4180:a5c0:d0c:b773:257a:dcc2])
        by smtp.gmail.com with ESMTPSA id 129sm5852330pgf.10.2020.03.20.13.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 13:56:08 -0700 (PDT)
Subject: Re: [bitbake-devel] Mailing list platform change March 20th
To: Michael Halstead <mhalstead@linuxfoundation.org>,
 bitbake-devel@lists.openembedded.org,
 openembedded-core <openembedded-core@lists.openembedded.org>,
 openembedded-architecture@lists.openembedded.org,
 openembeded-devel <Openembedded-devel@lists.openembedded.org>
References: <CADfgfobNNXr9HSOiwyamzbZ4q1uc8wgD5PzobDF56cDyYui-HQ@mail.gmail.com>
 <CADfgfoYCjVip=oc_U0TdFzOVst5U-KU+R31JhdckRv77APzQ-g@mail.gmail.com>
 <CADfgfob4=Zeh=jn9b9uMqq6Wnt83oGmJ-8yf1wSXYEFTppv2Bg@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <24a37655-8c0b-ca10-543e-90a32bc6bdb9@gmail.com>
Date: Fri, 20 Mar 2020 13:56:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CADfgfob4=Zeh=jn9b9uMqq6Wnt83oGmJ-8yf1wSXYEFTppv2Bg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------B5350835FC839014A2C8AA9E"
Content-Language: en-US

--------------B5350835FC839014A2C8AA9E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Micheal,

Thanks for doing this.

So just for my clarification, there is no needed to update any README to
use a different e-mail to like we did for the Yocto transitions since oe
is already using "lists.openembedded.org"

- armin


On 3/20/20 11:59 AM, Michael Halstead wrote:
> The migration will begin shortly. List mail will be delayed until the
> process is complete. E-mail sent during downtime should eventually be
> delivered. However waiting to send until after the switch is recommended.
>
> Thank you,
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer
>
> On Thu, Mar 19, 2020 at 9:44 AM Michael Halstead
> <mhalstead@linuxfoundation.org <mailto:mhalstead@linuxfoundation.org>>
> wrote:
>
>     Everything is proceeding smoothly and this work will continue as
>     planned. The migration starts at noon PDT tomorrow.
>
>     List owners please take care of all outstanding moderation in the
>     next 24 hours to ensure a smooth transition.
>
>     Thank you,
>     --
>     Michael Halstead
>     Linux Foundation / Yocto Project
>     Systems Operations Engineer
>
>     On Fri, Mar 13, 2020 at 4:58 PM Michael Halstead
>     <mhalstead@linuxfoundation.org
>     <mailto:mhalstead@linuxfoundation.org>> wrote:
>
>         We are moving our lists from Mailman to Groups.io. E-mail to
>         lists will be delayed during the move window. We are aiming to
>         complete the migration during business hours in the Pacific
>         time zone.
>
>         A new account will be created for you on
>         the Groups.io platform if you don't already have one.
>
>         You can read more about the change on the wiki:
>         https://www.openembedded.org/wiki/GroupsMigration
>
>         If there are serious issues we will rollback the changes. We
>         will e-mail
>         all lists when work is complete.
>
>         --
>         Michael Halstead
>         Linux Foundation / Yocto Project
>         Systems Operations Engineer
>
>


--------------B5350835FC839014A2C8AA9E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Micheal,<br>
    <br>
    Thanks for doing this.<br>
    <br>
    So just for my clarification, there is no needed to update any
    README to use a different e-mail to like we did for the Yocto
    transitions since oe is already using "lists.openembedded.org"<br>
    <br>
    - armin<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 3/20/20 11:59 AM, Michael Halstead
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADfgfob4=Zeh=jn9b9uMqq6Wnt83oGmJ-8yf1wSXYEFTppv2Bg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">The migration will begin shortly. List mail will be
        delayed until the process is complete. E-mail sent during
        downtime should eventually be delivered. However waiting to send
        until after the switch is recommended.
        <div><br>
        </div>
        <div>Thank you,<br>
          --<br>
          Michael Halstead<br>
          Linux Foundation / Yocto Project<br>
          Systems Operations Engineer<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, Mar 19, 2020 at 9:44
          AM Michael Halstead &lt;<a
            href="mailto:mhalstead@linuxfoundation.org"
            moz-do-not-send="true">mhalstead@linuxfoundation.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div dir="ltr">Everything is proceeding smoothly and this work
            will continue as planned. The migration starts at noon PDT
            tomorrow.
            <div><br>
            </div>
            <div>List owners please take care of all outstanding
              moderation in the next 24 hours to ensure a smooth
              transition.</div>
            <div><br>
            </div>
            <div>Thank you,</div>
            <div>--<br>
              Michael Halstead<br>
              Linux Foundation / Yocto Project<br>
              Systems Operations Engineer<br>
            </div>
          </div>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Fri, Mar 13, 2020 at
              4:58 PM Michael Halstead &lt;<a
                href="mailto:mhalstead@linuxfoundation.org"
                target="_blank" moz-do-not-send="true">mhalstead@linuxfoundation.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div dir="ltr">
                <div>We are moving our lists from Mailman to <span>Groups</span>.<span>io</span>.
                  E-mail to lists will be delayed during the move
                  window. We are aiming to complete the migration during
                  business hours in the Pacific time zone.<br>
                </div>
                <div><br>
                </div>
                <div>A new account will be created for you on the <span>Groups</span>.<span>io</span> platform
                  if you don't already have one.<br>
                </div>
                <div><br>
                </div>
                <div>You can read more about the change on the wiki:<br>
                </div>
                <a
                  href="https://www.openembedded.org/wiki/GroupsMigration"
                  target="_blank" moz-do-not-send="true">https://www.openembedded.org/wiki/GroupsMigration</a><br>
                <div><br>
                </div>
                <div>If there are serious issues we will rollback the
                  changes. We will e-mail<br>
                  all lists when work is complete.<br>
                </div>
                <div><br>
                </div>
                <div><span style="color:rgb(136,136,136)">--</span><br
                    style="color:rgb(136,136,136)">
                  <span style="color:rgb(136,136,136)">Michael Halstead</span><br
                    style="color:rgb(136,136,136)">
                  <span style="color:rgb(136,136,136)">Linux Foundation
                    / Yocto Project</span><br
                    style="color:rgb(136,136,136)">
                  <span style="color:rgb(136,136,136)">Systems
                    Operations Engineer</span><br>
                </div>
                <div><br>
                </div>
              </div>
            </blockquote>
          </div>
        </blockquote>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
    <br>
  </body>
</html>

--------------B5350835FC839014A2C8AA9E--
