Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F42FC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 13:06:34 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.42525.1655816786806363184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 06:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y4je0kaz;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id j21so9165449lfe.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 06:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Glcs+4BpapVyCo5GOgoUUyy+WU8deXk6JMA5gP8vaa4=;
        b=Y4je0kaz7OLwaGtUoWOsmBWE9C/vxnm0Th9AqvzQISuuidLeI1zOx9cBpHzLdoV9Hi
         CWYmkQml5eCTCY6AvKP1/2z25ldSy1MVJhPe6bBSE508tJkMw5D9/Ntl7mNfGhSFUDfi
         v7s1GmWTXsCHxLFiXfiwdHPgd1Zz21v7Pwn76LZjg8GBByjGnDL6AWmEP2U7Ff3yZlFW
         Smf08j5GtA+CKyMJKJpF4VBIUA/r1vM4dKsVUkIIn2XHvkx0L1AXj0T+BFMx1luKrmSV
         OnBG+jE5/GNoF5ZIAZSghhSkc/niY8jo6Ux36YE6VsigRIB8K54WSzreZTspb7FKyZYo
         FOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Glcs+4BpapVyCo5GOgoUUyy+WU8deXk6JMA5gP8vaa4=;
        b=mhyWNZkOiMswx4iFBvc+qH0LsGh4Lw0Fi30t7WpU8l0VDbjI7EHS5mQU7D0ee0yPrE
         PB8mF6NKQbAZMVRCNR3LDr8387UCJ2ZSeMgS4ljRmMkNCfHGftK6ib1HpYPcsTNbaEq1
         jXIOkC1ZB3oJOAx9ePviejq7KmnyTgIIaZ78DEb5GPALtkjhemsb5LdtAZgHq1QkaFo+
         sbTKMzBDtuJftR2yNo7hblH1Vmc0XPNYgDkyUhU3+VP7P6KomiF6zS6us9EkWZbmziuq
         6FlTPJmW19dODlNuVQaiZ1S0xDhnGF8rXybCPfFqFghCeD1HClN4JV8OAUvncsSm1nMZ
         Xzag==
X-Gm-Message-State: AJIora9D1Lp2eSowsv4BGs/OaUY9hqsROWRjF7hIJbBOo0xxET0Oe81O
	HmxIh4A3pWFrkdgnXCIWC4F8SpJNlf4CkwDSxIU=
X-Google-Smtp-Source: 
 AGRyM1ud3UkB3xISZhbHMEb0w99hUatyFk3xwD9feuMy2XoQlFxePhu3DxM9mMjhViXzgFixgyvFYguzMPjA12nHXr4=
X-Received: by 2002:a05:6512:3f11:b0:478:9795:4a45 with SMTP id
 y17-20020a0565123f1100b0047897954a45mr15924602lfa.491.1655816784922; Tue, 21
 Jun 2022 06:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220329125432.78608-1-rybczynska@gmail.com>
 <86367787-69bc-5828-8d15-f58872e21e14@geanix.com>
In-Reply-To: <86367787-69bc-5828-8d15-f58872e21e14@geanix.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 21 Jun 2022 15:06:13 +0200
Message-ID: 
 <CAApg2=S3MknmJhLqkXo=ynq+TY4pbNyBBtskgpB0Fpdn_Dic-Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 1/2] cve-check: add json format
To: Sean Nyekjaer <sean@geanix.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ross Burton <ross@burtonini.com>,
 Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000474dce05e1f4e337"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 13:06:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167145

--000000000000474dce05e1f4e337
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 12:45 PM Sean Nyekjaer <sean@geanix.com> wrote:

>
>
> On 29/03/2022 14.54, Marta Rybczynska wrote:
> > Add an option to output the CVE check in a JSON-based format.
> > This format is easier to parse in software than the original
> > text-based one and allows post-processing by other tools.
> >
> > Output formats are now handed by CVE_CHECK_FORMAT_TEXT and
> > CVE_CHECK_FORMAT_JSON. Both of them are enabled by default.
> >
> > The JSON output format gets generated in a similar way to the
> > text format with the exception of the manifest: appending to
> > JSON arrays requires parsing the file. Because of that we
> > first write JSON fragments and then assemble them in one pass
> > at the end.
> >
> > Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> >
> > ---
>
> Hi Marta,
>
> When upgrading from honister to kirkstone, this patch was included.
>
> We have INHERIT += "cve" in our distro conf.
> When doing a build from scratch it works fine with the cve json output,
> but when doing an incremental build it will throw:
>         bb.error("Error adding the same package twice")
>
> I have tried modifying that line to:
>         bb.error("Error adding the same package twice. Offending package:
> %s" %
> product["name"])
>
> It looks like it tries to add all packages again...
>
> I have just disabled json output for now.
> CVE_CHECK_FORMAT_JSON = "0"
>
>
Dear Sean,
Thank you for the report. Could you please describe your configuration a
little bit, especially, which layers do you use? Do you do an image build
or a world build, or maybe a multiple image build?

I'm trying to imagine what is happening in your case, will try to reproduce.

Kind regards,
Marta

--000000000000474dce05e1f4e337
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 21, 2022 at 12:45 PM Sean=
 Nyekjaer &lt;<a href=3D"mailto:sean@geanix.com">sean@geanix.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 29/03/2022 14.54, Marta Rybczynska wrote:<br>
&gt; Add an option to output the CVE check in a JSON-based format.<br>
&gt; This format is easier to parse in software than the original<br>
&gt; text-based one and allows post-processing by other tools.<br>
&gt; <br>
&gt; Output formats are now handed by CVE_CHECK_FORMAT_TEXT and<br>
&gt; CVE_CHECK_FORMAT_JSON. Both of them are enabled by default.<br>
&gt; <br>
&gt; The JSON output format gets generated in a similar way to the<br>
&gt; text format with the exception of the manifest: appending to<br>
&gt; JSON arrays requires parsing the file. Because of that we<br>
&gt; first write JSON fragments and then assemble them in one pass<br>
&gt; at the end.<br>
&gt; <br>
&gt; Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska=
@huawei.com" target=3D"_blank">marta.rybczynska@huawei.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
<br>
Hi Marta,<br>
<br>
When upgrading from honister to kirkstone, this patch was included.<br>
<br>
We have INHERIT +=3D &quot;cve&quot; in our distro conf.<br>
When doing a build from scratch it works fine with the cve json output, <br=
>
but when doing an incremental build it will throw:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;Error adding the same package tw=
ice&quot;)<br>
<br>
I have tried modifying that line to:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;Error adding the same package tw=
ice. Offending package: %s&quot; % <br>
product[&quot;name&quot;])<br>
<br>
It looks like it tries to add all packages again...<br>
<br>
I have just disabled json output for now.<br>
CVE_CHECK_FORMAT_JSON =3D &quot;0&quot;<br>
<br></blockquote><div><br></div><div>Dear Sean,</div><div>Thank you for the=
 report. Could you please describe your configuration a little bit, especia=
lly, which layers do you use? Do you do an image build or a world build, or=
 maybe a multiple image build?</div><div><br></div><div>I&#39;m trying to i=
magine what is happening in your case, <span class=3D"ng" style=3D"backgrou=
nd:rgba(0,0,0,0) none repeat scroll 0% 0%!important">will</span> try to rep=
roduce.</div><div><br></div><div>Kind regards,</div><div>Marta<br></div></d=
iv></div>

--000000000000474dce05e1f4e337--

