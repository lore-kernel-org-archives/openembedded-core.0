Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D6EC48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 01:50:06 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.88639.1709517003164665947
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 17:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GQO2fVWj;
 spf=pass (domain: mvista.com, ip: 209.85.208.179, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d28e465655so57265701fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 17:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1709517001; x=1710121801; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kjqXshSSYIXN5rUzJRc94YjZwR4HwtbLsolLqWRDMN4=;
        b=GQO2fVWjSrdkNV0CO0ZKs1kiB64YOKoGmpt5S6vUB20pceUb48lKqmWB333Jw5NHXW
         t/qpBTstCfrCaSyiC7Lo+YNcGQT2esYxMnIYgedTvIVPJoLXOju94QAKU2PwhSkzQJj1
         ZKypMjzY0wOOg/gmLB4mT4uSH1gGc7qf+/Eiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709517001; x=1710121801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjqXshSSYIXN5rUzJRc94YjZwR4HwtbLsolLqWRDMN4=;
        b=ZBJ2gTtqcwMVEQ1qH+NOZRiX8xer0v4zqGyZhMe/7e5tmOrZEauvukdcBOYSsURbgi
         e8rg8U7qhL7nwn+zyqXRTCFrl2QHi5sMZbFBuC29377aYIxtrOtFcpNzzogMhaJW8d4s
         mQM1DxwfwT5xh8viqq1iZJrUu527fXo0nByg5vW95RdYobAQoG65eTTzVe2OUcsJT94w
         R54SYvNRgoKi1gVWbQBf+EWFVavk+vEQBkIMyBfVG+0WPwQwHx705pDY/4xnP5VBxO4X
         QMcaoyBh6szxdt3pKpAYkOEls/4oJrhFBWVCNOaK62H9fKH0mqbyrqdm2iWMvFpXRtnV
         sXkg==
X-Gm-Message-State: AOJu0YwR7QkhHMiRYgTTMq8hI1tojzb5noAzNxeGJkkE97xET8tayDHS
	/zqIqLdeYrffDCT4t9g+xx4djQ7UJE+rqa59ATj23sHP+9ZEfyjkN7TDdCbT4z7tS2AeswnkFxp
	F9sc/ZisAXbhFib5s4JQ8KWN9P+AhTawaqUlRC1Ro54dZjAs2OTI=
X-Google-Smtp-Source: AGHT+IEorqOahXCG6iL0Bb/SGrWPl9W8XVN+zYlcDZ7/wHKJiVP1V0foFKQ+PGPH62Ed1omWORSWhGfw1zmEeXUdfss=
X-Received: by 2002:a2e:be1b:0:b0:2d2:bbd9:ebc9 with SMTP id
 z27-20020a2ebe1b000000b002d2bbd9ebc9mr6410936ljq.24.1709517001152; Sun, 03
 Mar 2024 17:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20240208064030.118190-1-vanusuri@mvista.com> <CAOSpxdYeRmheWtPVkTHXO=8EOorxG+2p8nFkEOa5oK6FTf-Zpg@mail.gmail.com>
In-Reply-To: <CAOSpxdYeRmheWtPVkTHXO=8EOorxG+2p8nFkEOa5oK6FTf-Zpg@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 4 Mar 2024 07:19:49 +0530
Message-ID: <CANQUz1_eEm4sci6C0n27zn=CuuMLX4QjP+1Cp3LUMAM4F33BZQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] ghostscript: ignore CVE-2020-36773
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/mixed; boundary="000000000000978afb0612cbf1b5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 01:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196582

--000000000000978afb0612cbf1b5
Content-Type: multipart/alternative; boundary="000000000000978af90612cbf1b3"

--000000000000978af90612cbf1b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

I've sent mail to cpe_dictionary@nist.gov to update the information.

Now it was updated in https://nvd.nist.gov/vuln/detail/CVE-2020-36773

Thanks & Regards,
Vijay

On Thu, Feb 8, 2024 at 8:40=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:

> On Wed, Feb 7, 2024 at 8:42=E2=80=AFPM Vijay Anusuri via
> lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Artifex Ghostscript before 9.53.0 has an out-of-bounds write and
> use-after-free in devices/vector/gdevtxtw.c (for txtwrite) because a sing=
le
> character code in a PDF document can map to more than one Unicode code
> point (e.g., for a ligature).
> >
> > Reference: https://ubuntu.com/security/CVE-2020-36773
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
> b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
> > index e0d1e4618f..cc06d092c1 100644
> > --- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
> > +++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
> > @@ -26,6 +26,10 @@ CVE_CHECK_IGNORE +=3D "CVE-2013-6629"
> >  # Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.
> >  CVE_CHECK_IGNORE +=3D "CVE-2023-38560"
> >
> > +# This CVE affects Ghostscript before 9.53.0
> > +# https://ubuntu.com/security/CVE-2020-36773
> > +CVE_CHECK_IGNORE +=3D "CVE-2020-36773"
>
> When there is an error in the upstream database it is preferred that
> you send an email to cpe_dictionary@nist.gov requesting an update
> (giving links that justify the change to make it easy for them to
> research)
>
> They are usually quite responsive, and this is much preferred to
> carrying an IGNORE in our metadata.
>
> Thanks!
>
> Steve
>
> > +
> >  def gs_verdir(v):
> >      return "".join(v.split("."))
> >
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#195101):
> https://lists.openembedded.org/g/openembedded-core/message/195101
> > Mute This Topic: https://lists.openembedded.org/mt/104234914/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000978af90612cbf1b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Steve,</div><div><br></div><div>I&#39;ve sent mail=
 to <a href=3D"mailto:cpe_dictionary@nist.gov" target=3D"_blank">cpe_dictio=
nary@nist.gov</a> to update the information. <br><br></div><div>Now it was =
updated in <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2020-36773">http=
s://nvd.nist.gov/vuln/detail/CVE-2020-36773</a> <br></div><div><br></div><d=
iv>Thanks &amp; Regards,</div><div>Vijay<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 8, 2024 at 8:=
40=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@=
sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, Feb 7, 2024 at 8:42=E2=80=AFPM Vijay Anusuri via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@=
lists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Artifex Ghostscript before 9.53.0 has an out-of-bounds write and use-a=
fter-free in devices/vector/gdevtxtw.c (for txtwrite) because a single char=
acter code in a PDF document can map to more than one Unicode code point (e=
.g., for a ligature).<br>
&gt;<br>
&gt; Reference: <a href=3D"https://ubuntu.com/security/CVE-2020-36773" rel=
=3D"noreferrer" target=3D"_blank">https://ubuntu.com/security/CVE-2020-3677=
3</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_=
9.55.0.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.55.0.bb</a> |=
 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/ghostscript/<a href=3D"http://ghost=
script_9.55.0.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.55.0.b=
b</a> b/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_9.5=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.55.0.bb</a><br>
&gt; index e0d1e4618f..cc06d092c1 100644<br>
&gt; --- a/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_=
9.55.0.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.55.0.bb</a><b=
r>
&gt; +++ b/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_=
9.55.0.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_9.55.0.bb</a><b=
r>
&gt; @@ -26,6 +26,10 @@ CVE_CHECK_IGNORE +=3D &quot;CVE-2013-6629&quot;<br>
&gt;=C2=A0 # Issue in the GhostPCL. GhostPCL not part of this GhostScript r=
ecipe.<br>
&gt;=C2=A0 CVE_CHECK_IGNORE +=3D &quot;CVE-2023-38560&quot;<br>
&gt;<br>
&gt; +# This CVE affects Ghostscript before 9.53.0<br>
&gt; +# <a href=3D"https://ubuntu.com/security/CVE-2020-36773" rel=3D"noref=
errer" target=3D"_blank">https://ubuntu.com/security/CVE-2020-36773</a><br>
&gt; +CVE_CHECK_IGNORE +=3D &quot;CVE-2020-36773&quot;<br>
<br>
When there is an error in the upstream database it is preferred that<br>
you send an email to <a href=3D"mailto:cpe_dictionary@nist.gov" target=3D"_=
blank">cpe_dictionary@nist.gov</a> requesting an update<br>
(giving links that justify the change to make it easy for them to<br>
research)<br>
<br>
They are usually quite responsive, and this is much preferred to<br>
carrying an IGNORE in our metadata.<br>
<br>
Thanks!<br>
<br>
Steve<br>
<br>
&gt; +<br>
&gt;=C2=A0 def gs_verdir(v):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return &quot;&quot;.join(v.split(&quot;.&quot;))<b=
r>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#195101): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/195101" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/195101</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10423491=
4/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/104234914/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000978af90612cbf1b3--

--000000000000978afb0612cbf1b5
Content-Type: message/rfc822; name="CVE-2020-36773 update.eml"
Content-Disposition: attachment; filename="CVE-2020-36773 update.eml"
Content-Transfer-Encoding: 8bit
Content-ID: <f_ltca5bh60>
X-Attachment-Id: f_ltca5bh60

Delivered-To: vanusuri@mvista.com
Received: by 2002:a2e:9d09:0:b0:2d2:991f:8843 with SMTP id t9csp1088628lji;
        Fri, 1 Mar 2024 13:31:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE90EbnHz/+ZHOFNKOnP92hvuX9xb2dHm4x60iyjfBaUJ+M8RYVkCy/TdBxg76LhKBMOORK
X-Received: by 2002:a05:6a00:3908:b0:6e4:890a:7af with SMTP id fh8-20020a056a00390800b006e4890a07afmr2992709pfb.26.1709328675574;
        Fri, 01 Mar 2024 13:31:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1709328675; cv=pass;
        d=google.com; s=arc-20160816;
        b=HTFyHigZwPo9SVlz3ToLPqA2xbWCOH+0HOg4ebqn0xG82/M4+r23QHMI1hDmHmZXvf
         V5fSTHtsZTvzVybVbgEmjXLp7I6QI8zrvGczANl1r1wGqKOzt9fzRScv5q7y7+vsbeHR
         kZBrgzDpmCJBaZZE6zf6qo8vIV4DDhs14FZm0gQLPuTUtwOiSy64ssg7MjfW6taTVsBM
         09YMcny/FZ2YxI4sXtYcFL9C88+zF9svT2xifsayVr3c0TY3zrzlbZf5s74pl2Oefr/R
         OWgTqA2MZlYO4NKLTzrJ4hcr8ZRjVYEcch02LKzc/9i42CwnbSpr9GyxvIENrKsO57f8
         6Uuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from:dkim-signature;
        bh=zHEPnpT5TAs4NHbw/Dce7MGm5rSxLhD8hA4p/f9p7dg=;
        fh=nWu3+WXPbym1Lu1D7ugEPGWH/cqbrrj/SRg7+0Ipzow=;
        b=em1SUGJxHvJXsOFbSJ2cltIxwlUNOaJhhH8umzyBE0j06V0bl0i8zr2Zrh1rwOhywN
         Vtk4BVcHwEBixrNe0Ec+VXIdEooUjZmj0Gy2waXloaVEY15D2+H49yi/wqA54r9d+uYk
         P1HnpdpMKw0hSHzQfOK49TeglItr1LCni81YxT7ju678Yr98bLXtgjugKRGbLqRx24aG
         k1kyPRyzFvtOu/+KHFjiiXf9lEjF4utfYc3gyi2/9rDVdhqTFjFcwXpxLduHhYi5SKE5
         bhZiCFaJLUoxY4/otCG8VIsz5DQQrZ6YBSLGSsc5llbS8VCw/N9aktBPnr+Bgjzn0nfc
         72jw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@nist.gov header.s=selector2 header.b=RRUhpNKm;
       arc=pass (i=1 spf=pass spfdomain=nist.gov dkim=pass dkdomain=nist.gov dmarc=pass fromdomain=nist.gov);
       spf=pass (google.com: domain of cpe_dictionary@nist.gov designates 2a01:111:f403:c111::e as permitted sender) smtp.mailfrom=cpe_dictionary@nist.gov;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nist.gov
Return-Path: <cpe_dictionary@nist.gov>
Received: from DS0PR09CU002.outbound.protection.outlook.com (mail-centralusazlp17012000e.outbound.protection.outlook.com. [2a01:111:f403:c111::e])
        by mx.google.com with ESMTPS id 38-20020a630c66000000b005e49408e834si4378103pgm.881.2024.03.01.13.31.14
        for <vanusuri@mvista.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Mar 2024 13:31:15 -0800 (PST)
Received-SPF: pass (google.com: domain of cpe_dictionary@nist.gov designates 2a01:111:f403:c111::e as permitted sender) client-ip=2a01:111:f403:c111::e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nist.gov header.s=selector2 header.b=RRUhpNKm;
       arc=pass (i=1 spf=pass spfdomain=nist.gov dkim=pass dkdomain=nist.gov dmarc=pass fromdomain=nist.gov);
       spf=pass (google.com: domain of cpe_dictionary@nist.gov designates 2a01:111:f403:c111::e as permitted sender) smtp.mailfrom=cpe_dictionary@nist.gov;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nist.gov
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxU2GMcyf9BC7XwVdUKvTX1ikR/VBG1+nGc9Oa7lFYUG/SvF1lPfJAXXBXJGxKfqmWw5GDBAd3QmGh0pQhCxnMPSnoV9rR5dolRJayod96BMKiKYIAj/jd/i1fk2cDO3gV3JPiQ0tIxErp8k8dEJPeLTAeH4K2naXuhRhluEXc/DCNnQwqOaXk4hY+H6qEArd++5ya1FC/SQ6TibuFT/D3ieLC94Aj4JCKSEAti/zDDTW+xRbo2HDPYhvBZEl8FM9q7qffUe1ZZfhiAC7EZkPoGrFxcyp+vnb0PZORWZYEoZ4h+ax7V90r1cLMapH3f+TQpq8t3YVPt6H9NC5FVLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHEPnpT5TAs4NHbw/Dce7MGm5rSxLhD8hA4p/f9p7dg=;
 b=Wpd4htiSOWp3eiFSs1RlnAvx4+w5oz8hDI5LcVxXe/1npFSAtkTpdNw37H2Ps9Ov6VTa0UCNEKTmEHgu4CrNL/1WabDXlNAfs/wIJpcYNuDgWFhxpSKLKpZTZVLUCP924tU9vVYHJQguPzLRXKD9t3XGUZ1yzX/FaCTGdN0xPTb0++NQ9fDfFrzSdCpEoGjAIAcjaNqsaDyhvWFguSWl8E2i8Mgz9I8Q9TqwwWtrAU8h9t+9gsqDU+g6y+IXD82dJpHlfzys37pWGoFCXH6eHgQx1pNASAH7nm7oVzCOXHyN7PzSL0QLUtLfLEynD3j8idsf9OlDpZ2MEFLI6VkorQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nist.gov; dmarc=pass action=none header.from=nist.gov;
 dkim=pass header.d=nist.gov; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nist.gov; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHEPnpT5TAs4NHbw/Dce7MGm5rSxLhD8hA4p/f9p7dg=;
 b=RRUhpNKmBZM8qkzPbC02YShosqcuWZ9WEnfLkLLu1whdDKhJlGAgGMfRckKzyzLUvolB4R3CqK5rKGgXs+b9BrrIfZjCP7rGXfDV/HsZ5HAP+Lx06RDyH2x983UE9sijcOL/XNjY9SLp1G/w0atA2sFTAv8j8d1tDxhV3wrZ27/1Oy1m9hE58c4voUhw0iCnWb/9Hgv0j8a99aUarU85/rE9StFasDTBvDKep25MAA2ltxo42Qqe7h/VLaA4FXTyhmvS9VHc9zxzX5+jhOiNFynx+3CeeN3Xlk1B14AC1cJtcCNr3GFE8YNeGygLlWZY5OPawJd75toa+KCFoa67Jg==
Received: from MW4PR09MB9475.namprd09.prod.outlook.com (2603:10b6:303:1fa::11)
 by PH8PR09MB10079.namprd09.prod.outlook.com (2603:10b6:510:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Fri, 1 Mar
 2024 21:31:11 +0000
Received: from MW4PR09MB9475.namprd09.prod.outlook.com
 ([fe80::61a1:e7d:fef4:7285]) by MW4PR09MB9475.namprd09.prod.outlook.com
 ([fe80::61a1:e7d:fef4:7285%7]) with mapi id 15.20.7339.031; Fri, 1 Mar 2024
 21:31:11 +0000
From: cpe_dictionary <cpe_dictionary@nist.gov>
To: Vijay Anusuri <vanusuri@mvista.com>, cpe_dictionary
	<cpe_dictionary@nist.gov>
Subject: RE: CVE-2020-36773 update
Thread-Topic: CVE-2020-36773 update
Thread-Index: AQHaWwtgXnDLloBk2USbnNQcErjoPbEjiUYg
Date: Fri, 1 Mar 2024 21:31:11 +0000
Message-ID: 
 <MW4PR09MB9475986C81BCC2EA5A82B425965E2@MW4PR09MB9475.namprd09.prod.outlook.com>
References: 
 <CANQUz1-8UKOHjzScivOT_-rrJ3eRVbY=3gEgOyjnpPC+Q3NckQ@mail.gmail.com>
In-Reply-To: 
 <CANQUz1-8UKOHjzScivOT_-rrJ3eRVbY=3gEgOyjnpPC+Q3NckQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nist.gov;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR09MB9475:EE_|PH8PR09MB10079:EE_
x-ms-office365-filtering-correlation-id: 05373523-691a-406b-70b9-08dc3a36ea58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ppKSe5gDiEl+U1aKFE48v7VHY7FBTtknwfzQFZJ0ClQf+Yh4o/75Z3FUv/dYcyiQJ3gD54q22oyIN7AfBIi4aO2UchShtkTRD1xucm1vEirPaB9ahYLeMbFATnNrKQzPEUSAexBnEB5hquHB8G4yXC3/Orl6XJx+4+FybiuAzV5MZgbXeBYdI4/Yfsu8FOedB+ioS2Y+ooFSGjmw/f1SM0R2c0zCtHFi8jb0QVRBF38GXR04cQ2/GCCQ1GMOZbCfXh7fHTdrdHnZhlRTu2PJOOb1UwqlZfpHQmyZAZF3P2DgFYGePlGoNhOLjvtldMzoj4hw1eVudCj5vm6C7b78rX3RtDvIMfyjmIt3Rdkpo3bHBQPHWnCTiJv3hFRdhRXVee0A6eJhZJyGbqJlVMkOsJIxY3aWb/cJy5RCDjYSK5EKlntQTgJihR+GZUSWHUEnsm1XG1UzVBshfDxAAauMUrSKAJVU/EPcHvJPsCMY4pdR59LXqrvY/JckicTpz2fGad37CqPTLa35GvKpjeA9DSzHiEsXDmLj9QKVNSGPRMl73cHhgBdGtEhEmGl9Nd98MTfphdwa/GzyJC5YFmek+LwLoXtF692pi8AzEKnCxlfFC+RlNe8WSZwSwmAGgTzPwthtjsG4cVtwMUp50QP/MPsqkdAi2skEmOO6T6PQfTo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR09MB9475.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?AazQZUw46srfCLKoPJKtpQjzvYi2Sozo6niFJZXFj9QGDWNDg0MGCMgoafrN?=
 =?us-ascii?Q?HDpNBAQnV/Ov3I0MpGdRSoMS3pZsrL69h+SME7Szw9iC+LCFeyYw0bcPrc9x?=
 =?us-ascii?Q?gHGArg04muDHQGqe6c34NmZsz4Jv0je0z+wda6voyxXvzjspPsWnjD5B0XHD?=
 =?us-ascii?Q?vt6Dd4WlD9gS3Zq4n5DiO1wtRkEOp8EIIE21VoqCzgFXMqfIoju530FTHdAq?=
 =?us-ascii?Q?xpnTs0UJgSjnT2KJRWrLh+7slYlxJLLPs/Hqwsv7Hru4I7vcUppeQsKTdotg?=
 =?us-ascii?Q?kUHtRuSwf+uHofShqd3jZf9toGpNa7Axiya1k2uzIf4UIQxqVMh/h1ibZacj?=
 =?us-ascii?Q?O4Pc3vOvnjrH6bUXt2hhFeHCHItkjIGX9FQGCQTL7aXJBV6Vrnao0joj64jg?=
 =?us-ascii?Q?zsR8HQcueMXrI3lDv7cfY60r+wOuFH8cF4ZzZF6ZN3PakiyrFoE4Wbht8XJT?=
 =?us-ascii?Q?gS3gd5huzIbYUvKtLgqAb4jqugWinIZ3yqtddcafHtStCYXWBXLRtIXap+rt?=
 =?us-ascii?Q?mgAjneGj4JDwMLk/2WETcGCoLwCosyr4fvW7QfGah+YSeOsIXu1Q/zkCs8/u?=
 =?us-ascii?Q?kruqwKaSEQ9ScqlWQdVHpkDMcYsasbvWZ++ZH+7TQa3gE8Jmesdg4nkFwjRs?=
 =?us-ascii?Q?TEZwq53/Q9IusQn3ZO5JgPpq0uIza4eYP6ykStdCk8cX2dh3HHsfHTdTu+AM?=
 =?us-ascii?Q?60v7Jn78SIAWGey5mFaD+KP8N8tp53GpVR0/+VO1DarDlGqtO7lLVrfgGaW7?=
 =?us-ascii?Q?rqe791FFZ/NFe7dy8+Yn8GQTJ3zlxZTekE0BjwhSyJtdf7S+cEj3g1kcHYAN?=
 =?us-ascii?Q?FvDz3mMvtgn0Thl4na6d/4uLaUCGxTNwOSI5WYVNHihGmf75AhVwvOo+5IIm?=
 =?us-ascii?Q?tJX0qqWIgcuQZOzmqBBDeAFt1TYihmqNGkF/U3oaC8wuL3NNHPrIphxKxDov?=
 =?us-ascii?Q?BJYe8p6LYbK945RX8YmcbdnQA8uaH6umyNVNwqnIqk2oavkRGj7wxPSiIIrr?=
 =?us-ascii?Q?TxmpqMIm7L2p4MkTQBg810iY0M2DCrAkITYTRq0sCSZ/WzDHoWcaOGbu6s7J?=
 =?us-ascii?Q?hxUtUIqcFYGYYEEWPa5vivq+RpZaatnntX1RfZitkicauwLxssNewg2YlI6D?=
 =?us-ascii?Q?prgXb2e603kFMmCPNmDsrmvNhHEwfdCVlqBwAg8zPbqCPuEdPkD/3N2BKys5?=
 =?us-ascii?Q?nza3PxKLgKCbwQkipA8jVGv+UbrZ5sXHwGgwqPx72RQ9VmfF3nvvb83Dekpp?=
 =?us-ascii?Q?TF7XbMmdtMDA1tWpq1u1CuHs4rGBOt6fZ9CkF1OsJoHbHNvoXhUr3HbC82yj?=
 =?us-ascii?Q?h3LGSxWn2yvbeqZN1O/lOXVRJtGlrGTOiyy5LqSMYdJldVWHsLcyPQ+uvW5k?=
 =?us-ascii?Q?A5lK24JjrQ/Y+8RUnb5jm2/1h8O7yYCpABV/5UFX6aNyAKKtkHvuQ6nFfSQE?=
 =?us-ascii?Q?7ZuJJKNZoDv7l/Pr7Sg75DKpGg+MavOGJEnppoKY/CN1cJwDDUwEysyoQ7YM?=
 =?us-ascii?Q?0y+Cdo9WTmeXM8hvG3xWmeBG6lhyooooj7+/yBSI35hIEh2rNuSRodKDTqc2?=
 =?us-ascii?Q?CJqBGiaYmUS08rUCN3g=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR09MB9475986C81BCC2EA5A82B425965E2MW4PR09MB9475namp_"
MIME-Version: 1.0
X-OriginatorOrg: nist.gov
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR09MB9475.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05373523-691a-406b-70b9-08dc3a36ea58
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 21:31:11.3664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ab5d82f-d8fa-4797-a93e-054655c61dec
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR09MB10079

--_000_MW4PR09MB9475986C81BCC2EA5A82B425965E2MW4PR09MB9475namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Good afternoon,

We apologize for the late response as we are currently experiencing a large=
 volume of CPE related inquiries.

Thank you for bringing this to our attention. We appreciate community input=
 in order to provide the most accurate and up-to-date information as possib=
le. After reviewing publicly available information we have made the appropr=
iate modifications.  Please allow up to 24 hours for the changes to be refl=
ected on the website and in the data feeds.


V/r,

Common Platform Enumeration Team

National Institute of Standards and Technology (NIST)

cpe_dictionary@nist.gov<mailto:cpe_dictionary@nist.gov>


From: Vijay Anusuri <vanusuri@mvista.com>
Sent: Thursday, February 8, 2024 10:52 PM
To: cpe_dictionary <cpe_dictionary@nist.gov>
Subject: CVE-2020-36773 update

Hi Team,

CVE-2020-36773 was fixed in the Ghostscript version 9.53.0 by the below com=
mit
https://git.ghostscript.com/?p=3Dghostpdl.git;h=3D8c7bd787defa071c96289b7da=
9397f673fddb874

This issue introduced in 9.51 as described in the patch.

Affected versions: 9.51 & 9.52
References: https://ghostscript.com/docs/9.53.3/History9.htm
                    https://ubuntu.com/security/CVE-2020-36773

Could you please update this in upstream database.

Thanks & Regards,
Vijay

--_000_MW4PR09MB9475986C81BCC2EA5A82B425965E2MW4PR09MB9475namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing
	{mso-style-priority:1;
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:black;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><a name=3D"_Hlk160027609"></a><a name=3D"_Hlk1601986=
12"></a><a name=3D"_Hlk159929441"><span style=3D"mso-bookmark:_Hlk160198612=
"><span style=3D"mso-bookmark:_Hlk160027609">Good afternoon,</span></span><=
/a><span style=3D"mso-bookmark:_Hlk159929441"><span style=3D"mso-bookmark:_=
Hlk160198612"><span style=3D"mso-bookmark:_Hlk160027609"><o:p></o:p></span>=
</span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk159929441"><span sty=
le=3D"mso-bookmark:_Hlk160198612"><span style=3D"mso-bookmark:_Hlk160027609=
"><o:p>&nbsp;</o:p></span></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk159929441"><span sty=
le=3D"mso-bookmark:_Hlk160198612"><span style=3D"mso-bookmark:_Hlk160027609=
">We apologize for the late response as we are currently experiencing a lar=
ge volume of CPE related inquiries.<o:p></o:p></span></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk159929441"><span sty=
le=3D"mso-bookmark:_Hlk160198612"><span style=3D"mso-bookmark:_Hlk160027609=
"><o:p>&nbsp;</o:p></span></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk159929441"><span sty=
le=3D"mso-bookmark:_Hlk160198612"><span style=3D"mso-bookmark:_Hlk160027609=
"><a name=3D"_Hlk160196222">Thank you for bringing this to our attention. W=
e appreciate community input in order to provide
 the most accurate and up-to-date information as possible. After reviewing =
publicly available information we have made the appropriate modifications.&=
nbsp; Please allow up to 24 hours for the changes to be reflected on the we=
bsite and in the data feeds.</a></span></span></span><span style=3D"mso-boo=
kmark:_Hlk160198612"><span style=3D"mso-bookmark:_Hlk160027609"><span style=
=3D"mso-bookmark:_Hlk160196222"><o:p></o:p></span></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk160198612"><span sty=
le=3D"mso-bookmark:_Hlk160027609"><span style=3D"mso-bookmark:_Hlk160196222=
"><o:p>&nbsp;</o:p></span></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk160198612"><span =
style=3D"mso-bookmark:_Hlk160027609"><span style=3D"mso-bookmark:_Hlk160196=
222">V/r,<o:p></o:p></span></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk160198612"><span =
style=3D"mso-bookmark:_Hlk160027609"><span style=3D"mso-bookmark:_Hlk160196=
222">Common Platform Enumeration Team<o:p></o:p></span></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk160198612"><span =
style=3D"mso-bookmark:_Hlk160027609"><span style=3D"mso-bookmark:_Hlk160196=
222">National Institute of Standards and Technology (NIST)<o:p></o:p></span=
></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk160198612"><span =
style=3D"mso-bookmark:_Hlk160027609"><span style=3D"mso-bookmark:_Hlk160196=
222"></span></span></span><a href=3D"mailto:cpe_dictionary@nist.gov"><span =
style=3D"mso-bookmark:_Hlk160198612"><span style=3D"mso-bookmark:_Hlk160027=
609"><span style=3D"mso-bookmark:_Hlk160196222">cpe_dictionary@nist.gov</sp=
an></span></span><span style=3D"mso-bookmark:_Hlk160198612"><span style=3D"=
mso-bookmark:_Hlk160027609"><span style=3D"mso-bookmark:_Hlk160196222"></sp=
an></span></span></a><span style=3D"mso-bookmark:_Hlk160196222"></span><spa=
n style=3D"mso-bookmark:_Hlk160027609"></span><span style=3D"mso-bookmark:_=
Hlk160198612"></span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Vijay Anusuri &lt;vanusuri@mvista.com&g=
t; <br>
<b>Sent:</b> Thursday, February 8, 2024 10:52 PM<br>
<b>To:</b> cpe_dictionary &lt;cpe_dictionary@nist.gov&gt;<br>
<b>Subject:</b> CVE-2020-36773 update<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">CVE-2020-36773 was fixed in the Ghostscript version =
9.53.0 by the below commit
<br>
<a href=3D"https://git.ghostscript.com/?p=3Dghostpdl.git;h=3D8c7bd787defa07=
1c96289b7da9397f673fddb874">https://git.ghostscript.com/?p=3Dghostpdl.git;h=
=3D8c7bd787defa071c96289b7da9397f673fddb874</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">This issue introduced in 9.51 as described in the pa=
tch.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Affected versions: 9.=
51 &amp; 9.52<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">References: <a href=3D"https://ghostscript.com/docs/=
9.53.3/History9.htm">
https://ghostscript.com/docs/9.53.3/History9.htm</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"h=
ttps://ubuntu.com/security/CVE-2020-36773">
https://ubuntu.com/security/CVE-2020-36773</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Could you please update this in upstream database.<o=
:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks &amp; Regards,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Vijay<o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_MW4PR09MB9475986C81BCC2EA5A82B425965E2MW4PR09MB9475namp_--

--000000000000978afb0612cbf1b5--

