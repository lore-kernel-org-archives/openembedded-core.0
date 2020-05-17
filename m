Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.24510.1589731271949500884
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 09:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jRne8EIS;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id x20so6725347ejb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 09:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KMOE58Pg7YZrQ5wfquZiHdyjxukE3gNfF/mlXVk42l8=;
        b=jRne8EIS5Dqv/qMurIMhaTer0weoAEzCzylps76PfIAlKvMA0v5QiNugc1962oiJzm
         V1g2pWOEuXkO1PF97yDJnBf8GN+F1/dIwbTpErI217gcdgCyVx9H39CXlQcmE6cSOGAB
         k/Yua6wzYDW36mAnr7yJZRnqjpxNd2F6MqSUD9pZKXzBH1aPAJCGt94DLMLX2okosZRV
         FAWZDEIkk/6LVz9Btb+eMyt6rMF0FUhbRHQBp/Sw7YifKoTczvzJW3V/uWiz1zYf07sK
         lhpSvOj3VBaELHp08GDg+yqRg26F4tTTWJQeWZGApiNgiBkV8SZHO/qlFzliExPOyp4M
         Ay2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KMOE58Pg7YZrQ5wfquZiHdyjxukE3gNfF/mlXVk42l8=;
        b=UPvzQTkgBSxOjVUohJBaKSDnIpDQej0lNWfclfrqBOX2IMBS8CIhcrEpWCz3XFdv3L
         vLxn2hFAN9BzaR0bZ+BZeklOFSoQz8CcqO2QZpt8Ah5KaqKnb7TaQm52n3fvXRPNUvbm
         UrKoW/dMGOlUHtIWjoqMJKShvISd/uvhKXN8Tr4niuIFhnUCyyPrQ3o23VFEKOOdu1TO
         YtSFay4sTRl1c6JxGtr12Z9lGgYphdfhCh38n3sDI5xOwxaUC22eykktCYq9cjMsYD/A
         471dtZzFZji3iEV1v1fSoRi0+HvsppNsOMEJeraOu1l+DWHG+NVSKTCMcJmVS+WUoGU/
         bAcA==
X-Gm-Message-State: AOAM530jQQmYWW6naYaYX7IY8mM+Sx1/dYlulmQpNrUSzS3mKImqrgU8
	TnVgcBi1bRVvZYqnBuUSd3RJm2unHB4kOtNi6/A=
X-Google-Smtp-Source: ABdhPJwAyytmH6yT0XvDrTs3qh1jRHQUtXyvo5kzOD9DNSRtbmgn0yTavQQ4jMZuDqaqpTpXuUR9Q++gESAobQnCHTo=
X-Received: by 2002:a17:907:4096:: with SMTP id nm6mr12120578ejb.30.1589731270332;
 Sun, 17 May 2020 09:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200514210458.33543-1-JPEWhacker@gmail.com> <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost> <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost> <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost> <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
 <20200517154525.GA16162@localhost>
In-Reply-To: <20200517154525.GA16162@localhost>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 17 May 2020 18:00:58 +0200
Message-ID: <CA+chaQdKYt1ZMGxEnb6nQ2B3KitWXcNBsecgzfZ-htEVH=ySnA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Adrian Bunk <bunk@stusta.de>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Steve Sakoman <sakoman@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Denys Dmytriyenko <denis@denix.org>, Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"jdmason@kudzu.us" <jdmason@kudzu.us>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a816c105a5da273c"

--000000000000a816c105a5da273c
Content-Type: text/plain; charset="UTF-8"

On Sun, May 17, 2020 at 5:45 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Sun, May 17, 2020 at 03:56:20PM +0200, Martin Jansa wrote:
> >...
> > so upgrading
> > from e.g. initial release revision of dunfell to latest in oe-core
> together
> > with all other layers,
> >...
>
> Your "together" is an assumption that is not always true in my experience.
>

Yes, I might be lucky that I can influence that in projects I'm involved in.

But still we should try to improve that experience instead of blocking
updates like this.


> > Point releases are nice, but people should really use whatever is latest
> > revisions in the branches they use and that's IMHO the recommendation
> from
> > Yocto Project itself as well (IIRC we discussed it in OE TSC when talking
> > about tags for point releases).
>
> What often strikes me about OE/Yocto is how far apart what developer
> think how things should be done is from what users are actually doing.
>
> Yocto lacks novice level documentation how users should maintain
> a distribution they got from somewhere for building a product.
>

Agreed, the documentation and user education should be improved.

But IMHO carrying duplicate recipes in oe-core and meta-oe, just because
some users aren't updating meta-oe, only adds more confusion.

If they update oe-core and don't update meta-oe, then they will still get
older version of these python modules, which is bad, but they are already
missing some other fixes from meta-oe.

If they update meta-oe and don't update oe-core, then these python modules
will disappear for them, if they use them at all, then they will probably
notice and that might help them realize, that they should be updating all
layers, not only some of them.

Cheers,

--000000000000a816c105a5da273c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, May 17, 2020 at 5:45 PM Adrian Bu=
nk &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br><=
/div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Sun, May 17, 2020 at 03:56:20PM +0200, Martin Jansa wrote:<br>
&gt;...<br>
&gt; so upgrading<br>
&gt; from e.g. initial release revision of dunfell to latest in oe-core tog=
ether<br>
&gt; with all other layers,<br>
&gt;...<br>
<br>
Your &quot;together&quot; is an assumption that is not always true in my ex=
perience.<br></blockquote><div><br></div><div>Yes, I might be lucky that I =
can influence that in projects I&#39;m involved in.</div><div><br></div><di=
v>But still we should try to improve that experience instead of blocking up=
dates like this.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
&gt; Point releases are nice, but people should really use whatever is late=
st<br>
&gt; revisions in the branches they use and that&#39;s IMHO the recommendat=
ion from<br>
&gt; Yocto Project itself as well (IIRC we discussed it in OE TSC when talk=
ing<br>
&gt; about tags for point releases).<br>
<br>
What often strikes me about OE/Yocto is how far apart what developer <br>
think how things should be done is from what users are actually doing.<br>
<br>
Yocto lacks novice level documentation how users should maintain<br>
a distribution they got from somewhere for building a product.<br></blockqu=
ote><div><br></div><div>Agreed, the documentation and user education should=
 be improved.</div><div><br></div><div>But IMHO carrying duplicate recipes =
in oe-core and meta-oe, just because some users aren&#39;t updating meta-oe=
, only adds more confusion.</div><div><br></div><div>If they update oe-core=
 and don&#39;t update meta-oe, then they will still get older version of th=
ese python modules, which is bad, but they are already missing some other f=
ixes from meta-oe.</div><div><br></div><div>If they update meta-oe and don&=
#39;t update oe-core, then these python modules will disappear for them, if=
 they use them at all, then they will probably notice and that might help t=
hem realize, that they should be updating all layers, not only some of them=
.</div><div><br></div><div>Cheers,</div></div></div>

--000000000000a816c105a5da273c--
