Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.240.1615924877109222607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 13:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0pTeUcnh;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.41, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f41.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so68520wmj.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 13:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Adwl+2NjobyaV28a2IZyK77ZEROhLyN1OffNevpQMng=;
        b=0pTeUcnhRKgobjkGyozPvt5fuCo8RLfCr3A5S0Eda/k+CyWx/AmpghojqbUITF3wj2
         kZLTPtM54krWIKszuiEptNN5trnljMN+UuUrICEdkMqq3lzCKv35wpTh23C1mGoctEFX
         I1nE10qLMAThUsgdMdeM8P80ctDjbb+p9SmvrNSd9QaOJEb3kH723nLEfPlpEjPzTMj8
         G13436qzUZJ9uj36W5lIZ5LeOyEjJhT/krurY/waoVafgskYY2L7kfH+3A0pTX/pLgJj
         LKzdkdk6hWbG74h3rqx6OA0JT1AXqXEpMpo97tkmc+sD6KA5it+zGf9ZwLiesSQsOrVP
         pzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Adwl+2NjobyaV28a2IZyK77ZEROhLyN1OffNevpQMng=;
        b=odcuPQfy0zotZXnhJ31GBY93tuToKWkoGFzbQzBcHHA8Fv6TI8SW+WW6JMLmVPrPlJ
         AO3PqorChSJCXhiQrmlv1wkcDvLH24n1/70P+O2hTGT07n0LFyFm5ALaLP1H6sNNQ0VA
         hUZWEksCuDCV3cQ2fS9GsxBlkfMJZ0VafxykNXwT2mG83ZQwqUpwIJRJsqI6tXr8xbbS
         G/SwuOPk+8hioEfjMZVWYWUCp/LKJSoHPyTwfBpgjLPxicokNyITFsqMSSJpusWKLBPQ
         Aw0jKKO1eUtaUQDyE+9p4t1rTyWGTQGi7zyGzLGbxYAM/LFNahlAvjeWcDcZChwLZpyv
         bH8Q==
X-Gm-Message-State: AOAM530AX6mjjtJN49mrLG/bdimZmsw33ae0JZkRr2PP3eFP9rB0XXuU
	g5zbE+uw4+2iIgkLbe1Ln+2MDjHbvEGUjmTRuICDgg==
X-Google-Smtp-Source: ABdhPJwshWibnBicouWlQPtnrBsOIEokstbrrKOrdOUNuFK2lT2z2mqAYienZxCTRJGfDWDmtGHFGCCh2es235m+XPs=
X-Received: by 2002:a7b:c931:: with SMTP id h17mr504888wml.4.1615924875427;
 Tue, 16 Mar 2021 13:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <6409e1bf-9400-886e-cd25-76b52456c8ed@hilscher.com>
 <5dcf9ff95e74274d5cebcfe34a0c9de4ce9e886e.camel@linuxfoundation.org> <168e0cb1-582c-8c14-b394-d23f1119178a@hilscher.com>
In-Reply-To: <168e0cb1-582c-8c14-b394-d23f1119178a@hilscher.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 16 Mar 2021 10:01:03 -1000
Message-ID: <CAOSpxdZxridvyrtK+Zc2pzjVbNM99nsVbAWKN05uU5Ur7R542Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-firmware: Fix packaging
To: Michael Trensch <mtrensch@hilscher.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 9:47 AM Michael Trensch <mtrensch@hilscher.com> wro=
te:
>
>
>
> On 16.03.2021 18:56, Richard Purdie wrote:
> > On Tue, 2021-03-16 at 07:24 +0000, Michael Trensch wrote:
> >> Upstream directory layout has changed after update in commit 20a983b9=
c405b483152f1c600d767e04683dfabf,
> >>   resulting in some package to pull in linux-firmware base package.
> >> This may cause an image size increase of approximately 700MB.
> >
> > This patch doesn't seem to apply against master, could you rebase
> > and resend please?
>
> Sorry, I forgot to mention this one was for dunfell. Shall I resend this
> one with a dunfell marker or is it OK, with this answer.
>
> Additionally I will re-check if master is also affected and send a patch
> if necessary.

Actually it doesn't apply to dunfell either (dunfell and master are
both at version 20210208)

So best to submit for master and I will cherry-pick to dunfell.

Thanks for fixing this!

Steve


> Hilscher Gesellschaft f=C3=BCr Systemautomation mbH   |  Rheinstrasse 15=
  |  65795 Hattersheim  |  Germany  |  www.hilscher.com<http://www.hilscher=
.com>
> Sitz der Gesellschaft / place of business: Hattersheim  |  Gesch=C3=A4ft=
sf=C3=BChrer / managing director: Sebastian Hilscher, Hans-J=C3=BCrgen Hils=
cher
> Handelsregister / commercial register: Frankfurt B 26873  |  Ust. Idnr. =
/ VAT No.: DE113852715
> Registergericht / register court: Amtsgericht Frankfurt/Main
>
> Important Information:
> This e-mail message including its attachments contains confidential and =
legally protected information solely intended for the addressee. If you are=
 not the intended addressee of this message, please contact the addresser i=
mmediately and delete this message including its attachments. The unauthori=
zed dissemination, copying and change of this e-mail are strictly forbidden=
. The addresser shall not be liable for the content of such changed e-mails=
.
>
> Wichtiger Hinweis:
> Diese E-Mail einschlie=C3=9Flich ihrer Anh=C3=A4nge enth=C3=A4lt vertrau=
liche und rechtlich gesch=C3=BCtzte Informationen, die nur f=C3=BCr den Adr=
essaten bestimmt sind. Sollten Sie nicht der bezeichnete Adressat sein, so =
teilen Sie dies bitte dem Absender umgehend mit und l=C3=B6schen Sie diese =
Nachricht und ihre Anh=C3=A4nge. Die unbefugte Weitergabe, das Anfertigen v=
on Kopien und jede Ver=C3=A4nderung der E-Mail ist untersagt. Der Absender =
haftet nicht f=C3=BCr Inhalte von ver=C3=A4nderten E-Mails.
>
>=20
>
