Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.2287.1590052305429878361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 02:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QXhkaT1X;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id n24so7955137ejd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 02:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UNE1KhX97rIdjKn042GZYUrlV0p7vmwWsQxAKDD6aeM=;
        b=QXhkaT1X4PPCnw7nn7ObhT/mHBcKBzvcDTmYzQctielhbDB8Ydk5QLKli4HvwkC/vv
         Q3+Ot9JupYrawjB8lUVUE7yQZCofkj4oAMuDPoPQNVzIGxmpIieyisYOMhXgs8xeZo2D
         3ll0mIjSdIS4eXYhwBVp7zU5uxRSU2P8eIG90n0jVmtZX8h0uWcHavQGYnoYJCKa2GZp
         HVc9jUDhREFmlVNN/mAEZpHG9YOzFjd0KNYmI6RrHdLY3VKLnlknkphyWELgF3tQ5B0V
         uPzmkc0tiaknF/9zhL6AvDGENIZGFme3aC4lmDNQzDc/QVtm/+1SZh+KGwpeVUS7rBeP
         GNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UNE1KhX97rIdjKn042GZYUrlV0p7vmwWsQxAKDD6aeM=;
        b=QvCfwYXEsZPZ+lYjEEvp7Ql1UQCxDsSaHnZ5wk8uYplyumDZkZ0JTz7H3a8o0ccBKS
         LcK78kJ5R891nTJ7Yp7891n3l56AO1gSjzJo8snmQ3gw7FvfSCfwFSJ3tSondyajG8r5
         qJ8Cf4szPjFUgLMD6vIglZGmBbUDNozE4tq4sPX69Xui5cZiYl53uRMJmyBriJ/a8KjA
         P8BI4/NNikJ7QMXJV9Z65d6gjZPj8rTAQvvRIdeTEJqn32HUjRho1BqW7oQnLMg13POu
         /aJmK4Jim7vP7oYaQ0BeZ3Lqt4bpfUTX1jcnGYd/iFq5ef1ML9ZIUrkfCPPwvtMXrzKW
         z5vQ==
X-Gm-Message-State: AOAM530/Gu1ndQt0KbFdrWYHsS+XrM38+QokdEUYheZAbiS9RtuZ+yPn
	ln4doApBmuD6OqSDZ1UpxA1oWOeAoKJ/cLdjRD0=
X-Google-Smtp-Source: ABdhPJxluPb6Ee5kTe0XYIztT92R8F5kiwkK7nmVquz/pQ/Xi9AIoD9yo54MPlaW3vqubsZ248dwgf3EU6QRM37LSrk=
X-Received: by 2002:a17:906:ce36:: with SMTP id sd22mr2544191ejb.94.1590052303812;
 Thu, 21 May 2020 02:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost> <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost> <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost> <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
 <20200517154525.GA16162@localhost> <CA+chaQdKYt1ZMGxEnb6nQ2B3KitWXcNBsecgzfZ-htEVH=ySnA@mail.gmail.com>
 <20200517161441.GB16162@localhost> <5731941e-fe0c-e242-bea5-cd0d3c2ef772@gmail.com>
 <CAGDS+nkfNwuePOPSJ3JdRVqbzz=XTAvxMK_pjoeAX8vGnSS0HA@mail.gmail.com>
 <CA+chaQcADhU_7tzV89CsEHH8YDa3xOobwxQmri9_2EWcLGVMWg@mail.gmail.com> <CAJ86T=XCWi=1K0XmFgNjJzMBfKhnLxTKF1zZ84K-=roJVzRoqw@mail.gmail.com>
In-Reply-To: <CAJ86T=XCWi=1K0XmFgNjJzMBfKhnLxTKF1zZ84K-=roJVzRoqw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 21 May 2020 11:11:32 +0200
Message-ID: <CA+chaQcooejBTxCSQn=GsE36LFyGJEJd1wHVrhsjO4uCp+aegQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Steve Sakoman <sakoman@gmail.com>, Khem Raj <raj.khem@gmail.com>, Adrian Bunk <bunk@stusta.de>, 
	Andrey Zhizhikin <andrey.z@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Denys Dmytriyenko <denis@denix.org>, 
	Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"jdmason@kudzu.us" <jdmason@kudzu.us>
Content-Type: multipart/alternative; boundary="000000000000be3d3c05a624e6a6"

--000000000000be3d3c05a624e6a6
Content-Type: text/plain; charset="UTF-8"

On Tue, May 19, 2020 at 9:57 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, May 19, 2020 at 11:25 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > We have discussed this in OE TSC meeting yesterday:
> >
> https://lists.openembedded.org/g/tsc/topic/openembedded_tsc_meeting/74313532
> >
> > tsc suggested to use LAYERVERSION bump in oe-core with
> LAYERDEPENDS_meta-python update in meta-python, so that people will need to
> update both layers (or neither if they really cannot).
>
> OE living up to it's nickname... Over Engineered :-)
>

Compared with some really Over Engineered stuff I've seen, this feels like
KISS :).

--000000000000be3d3c05a624e6a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, May 19, 2020 at 9:57 PM Andre McC=
urdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Tue, May 19, 2020 at 11:25 AM Martin Jansa &lt;<a hre=
f=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; We have discussed this in OE TSC meeting yesterday:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/tsc/topic/openembedded_tsc=
_meeting/74313532" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/tsc/topic/openembedded_tsc_meeting/74313532</a><br>
&gt;<br>
&gt; tsc suggested to use LAYERVERSION bump in oe-core with LAYERDEPENDS_me=
ta-python update in meta-python, so that people will need to update both la=
yers (or neither if they really cannot).<br>
<br>
OE living up to it&#39;s nickname... Over Engineered :-)<br></blockquote><d=
iv><br></div><div>Compared with some really Over Engineered stuff I&#39;ve =
seen, this feels like KISS :).=C2=A0</div></div></div>

--000000000000be3d3c05a624e6a6--
