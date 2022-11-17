Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130D6C43219
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 07:43:32 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.10434.1668671009358444307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 23:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bzp1nouX;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id h12so1612950ljg.9
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 23:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZ/bUSF99OypgmcTv0UeLPYnhcrX40aFwjQkYm0vkTw=;
        b=bzp1nouXtvKTm4FwDgai8YmQQt2+XwMxIBBmhYl4N3wtWh/OItwQBF5LZ7Vg2pztDZ
         1AjI7JpMxUjdjPSYMZkElCE3zE1zeAW0oP/V1trafS0sCTGw/oraHOG1jPB00LW7kSPF
         Y3QCl/hrF3R7gOSeqmuSf7M8s3zdcyhyIbzvR/x3ZogqtR+cVHIxrxH7aH9TI6/Kb6W1
         OLp0WXao94wBGS8qggfODiuM1yvBFVyRHyF4OH/O2kt2Vev/DNlnuMYb7C8+sh1cPp9h
         0FH0Jz6MuhAR4Gsa2qfA385dSF+OxniBNhMTcnfhYHh2MLnc06gZjIvcbfoRDFc7SZTD
         aTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZ/bUSF99OypgmcTv0UeLPYnhcrX40aFwjQkYm0vkTw=;
        b=xZpoECpxprvcCEBkcGIcOfoe/JsK6dpHjY3mJanmFHOUSauUsINTLu8nG3TNa8jYRN
         fueUE++z2NV11FlAfZV+8BoHGNlTJLP5wB4Wicfemld7lL/k6Yipg7yHxjw0leUA+32M
         +lSBCe3xFHa61Mmf55Gaxzti1vBAh2eFSOEXWuycCk6q2wyb0UKYuJujVBSnS5r7Nk2P
         p4mc5RJG7FVxf1cTDWkPZFaSzZgbdo0ibnrnGKYvkuu3DLvB360yWt/Ai+TSHfbYoxCN
         KMVHfctehfcmB6Ms4Z89muDR0KgmOb3yz9UlgxebCyjKUkoVne02uwazTXUnqjF4RO/s
         9hfw==
X-Gm-Message-State: ANoB5pnGbXuRjBwOaGwwe3syCEK7fYU4mP7b3H7HDsKmxnlB4rDngXdo
	kMcq/CinmlR6pZfiuyrUYtyI63FZOwimr3Ndxw7K8mdE
X-Google-Smtp-Source: AA0mqf66iVT7VcWZ3XHcNuJr+gZgnkzNG3UTF0GLrajkVG2oordjJ7f8tVfdUv5Bvmbkk8mU/BSbugaNZnhhpjcuMxE=
X-Received: by 2002:a2e:be8a:0:b0:26f:c081:9aed with SMTP id
 a10-20020a2ebe8a000000b0026fc0819aedmr563571ljr.222.1668671007141; Wed, 16
 Nov 2022 23:43:27 -0800 (PST)
MIME-Version: 1.0
References: <20221103183356.40685-1-sakib.sajal@windriver.com>
 <CANNYZj9R5=X_=yK8hsq_RJJ0ieSrGbCqd4jpzBN5Uv_U59n2ZQ@mail.gmail.com> <DM6PR11MB25388B935A115A1398CD8EAAF2079@DM6PR11MB2538.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB25388B935A115A1398CD8EAAF2079@DM6PR11MB2538.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Nov 2022 08:43:15 +0100
Message-ID: <CANNYZj-mNkCgk=XHWBvqpqr=x4R9AMyktBTj49p-QK=Ui2whxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] blktrace: ask for python3 specifically
To: "Sajal, Sakib" <Sakib.Sajal@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a0b0da05eda5be3b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 07:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173407

--000000000000a0b0da05eda5be3b
Content-Type: text/plain; charset="UTF-8"

Yes, they kinda have a point. Referring to latest python as python3 forever
is silly. Unfortunately we have all those users with legacy proprietary
python2 things, and they feel like they still 'own' python (without a
number).

I'd suggest you resend the patch with 'Upstream-Status: Denied [link to
upstream response]'.

Alex

On Wed, 16 Nov 2022 at 23:01, Sajal, Sakib <Sakib.Sajal@windriver.com>
wrote:

>
>
> ------------------------------
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* November 3, 2022 3:00 PM
> *To:* Sajal, Sakib <Sakib.Sajal@windriver.com>
> *Cc:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH] blktrace: ask for python3 specifically
>
>
> On Thu, 3 Nov 2022 at 19:34, Sakib Sajal <sakib.sajal@windriver.com>
> wrote:
> >>
> >> python2 has been deprecated, use python3 instead
> >>
> >> +Upstream-Status: Inappropriate (OE-specific)
> >
> >This is not inappropriate, or oe-specific, please send the patch upstream
> first.
> >
> >Alex
>
> I have already sent a patch to upstream blktrace which was rejected:
> https://www.spinics.net/lists/linux-btrace/msg01364.html
>
> In summary, upstream maintainers see the following on their distro:
>
> axboe@m1max ~> which python
> /usr/bin/python
> axboe@m1max ~> /usr/bin/python --version
> Python 3.10.7
> axboe@m1max ~> env python
> Python 3.10.7 (main, Sep  8 2022, 14:34:29) [GCC 12.2.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >*>>*
>
> while on yocto:
> root@qemux86-64:~# which python
> root@qemux86-64:~# which python3
> /usr/bin/python3
> root@qemux86-64:~# /usr/bin/python3 --version
> Python 3.11.0
> root@qemux86-64:~# env python
> env: can't execute 'python': No such file or directory
> root@qemux86-64:~# env python3
> Python 3.11.0 (main, Oct 24 2022, 17:48:40) [GCC 12.2.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>>
>
> python symlink to python3 is not required by python development community
> and is a choice left for distributions to make. If you look at oe-core,
> most, if not all, packages are changing the shebang to python3:
> oe-core.git$ grep -r "env python3" | wc -l
> 166
>
> Regards,
> Sakib
> Re: [PATCH] bno_plot.py: Ask for python3 specifically &mdash; Linux Btrace
> <https://www.spinics.net/lists/linux-btrace/msg01364.html>
> Linux Btrace: Re: [PATCH] bno_plot.py: Ask for python3 specifically
> www.spinics.net
>
>

--000000000000a0b0da05eda5be3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, they kinda have a point. Referring to latest pyt=
hon as python3 forever is silly. Unfortunately we have all those users with=
 legacy proprietary python2 things, and they feel like they still &#39;own&=
#39; python (without a number).</div><div><br></div><div>I&#39;d suggest yo=
u resend the patch with &#39;Upstream-Status: Denied [link to upstream resp=
onse]&#39;.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 16 Nov 2022 at 2=
3:01, Sajal, Sakib &lt;<a href=3D"mailto:Sakib.Sajal@windriver.com">Sakib.S=
ajal@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div class=3D"msg-2768311353365542709">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div id=3D"m_-2768311353365542709signature_bookmark"></div>
<div id=3D"m_-2768311353365542709appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-2768311353365542709divRplyFwdMsg" dir=3D"ltr"><font style=3D"=
font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b>=
 Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"=
_blank">alex.kanavin@gmail.com</a>&gt;<br>
<b>Sent:</b> November 3, 2022 3:00 PM<br>
<b>To:</b> Sajal, Sakib &lt;<a href=3D"mailto:Sakib.Sajal@windriver.com" ta=
rget=3D"_blank">Sakib.Sajal@windriver.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] blktrace: ask for python3 specificall=
y</font>
<div><br>
<br>
On Thu, 3 Nov 2022 at 19:34, Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@=
windriver.com" target=3D"_blank">sakib.sajal@windriver.com</a>&gt; wrote:<b=
r>
</div>
<div>&gt;&gt;<br>
</div>
<div>&gt;&gt; python2 has been deprecated, use python3 instead<br>
</div>
<div>&gt;&gt;<br>
</div>
<div>&gt;&gt; +Upstream-Status: Inappropriate (OE-specific)<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
&gt;<br>
</div>
<div>&gt;This is not inappropriate, or oe-specific, please send the patch u=
pstream first.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
&gt;<br>
</div>
<div>&gt;Alex</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
I have already sent a patch to upstream blktrace which was rejected:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<a href=3D"https://www.spinics.net/lists/linux-btrace/msg01364.html" id=3D"=
m_-2768311353365542709LPlnkOWALinkPreview" target=3D"_blank">https://www.sp=
inics.net/lists/linux-btrace/msg01364.html</a></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
In summary, upstream maintainers see the following on their distro:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<pre>axboe@m1max ~&gt; which python
/usr/bin/python
axboe@m1max ~&gt; /usr/bin/python --version
Python 3.10.7
axboe@m1max ~&gt; env python
Python 3.10.7 (main, Sep =C2=A08 2022, 14:34:29) [GCC 12.2.0] on linux
Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;=
license&quot; for more information.
&gt;<i>&gt;&gt;</i></pre>
while on yocto:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
root@qemux86-64:~# which python
<div>root@qemux86-64:~# which python3</div>
<div>/usr/bin/python3</div>
<div>root@qemux86-64:~# /usr/bin/python3 --version</div>
<div>Python 3.11.0</div>
<div>root@qemux86-64:~# env python</div>
<div>env: can&#39;t execute &#39;python&#39;: No such file or directory</di=
v>
<div>root@qemux86-64:~# env python3</div>
<div>Python 3.11.0 (main, Oct 24 2022, 17:48:40) [GCC 12.2.0] on linux</div=
>
<div>Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &=
quot;license&quot; for more information.</div>
<div>&gt;&gt;&gt;</div>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
python symlink to python3 is not required by python development community a=
nd is a choice left for distributions to make. If you look at oe-core, most=
, if not all, packages are changing the shebang to python3:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
oe-core.git$ grep -r &quot;env python3&quot; | wc -l
<div>166</div>
<div><br>
</div>
<div>Regards,</div>
<div>Sakib<br>
</div>
</div>
<div>
<div id=3D"m_-2768311353365542709LPBorder_GTaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQ=
vbGlzdHMvbGludXgtYnRyYWNlL21zZzAxMzY0Lmh0bWw." style=3D"width:100%;margin-t=
op:16px;margin-bottom:16px;max-width:800px;min-width:424px">
<table id=3D"m_-2768311353365542709LPContainer256791" role=3D"presentation"=
 style=3D"padding:12px 36px 12px 12px;width:100%;border-width:1px;border-st=
yle:solid;border-color:rgb(200,200,200);border-radius:2px">
<tbody>
<tr style=3D"border-spacing:0px" valign=3D"top">
<td style=3D"width:100%">
<div id=3D"m_-2768311353365542709LPTitle256791" style=3D"font-size:21px;fon=
t-weight:300;margin-right:8px;font-family:&quot;wf_segoe-ui_light&quot;,&qu=
ot;Segoe UI Light&quot;,&quot;Segoe WP Light&quot;,&quot;Segoe UI&quot;,&qu=
ot;Segoe WP&quot;,Tahoma,Arial,sans-serif;margin-bottom:12px">
<a id=3D"m_-2768311353365542709LPUrlAnchor256791" href=3D"https://www.spini=
cs.net/lists/linux-btrace/msg01364.html" style=3D"text-decoration:none" tar=
get=3D"_blank">Re: [PATCH] bno_plot.py: Ask for python3 specifically &amp;m=
dash; Linux Btrace</a></div>
<div id=3D"m_-2768311353365542709LPDescription256791" style=3D"font-size:14=
px;max-height:100px;color:rgb(102,102,102);font-family:&quot;wf_segoe-ui_no=
rmal&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-seri=
f;margin-bottom:12px;margin-right:8px;overflow:hidden">
Linux Btrace: Re: [PATCH] bno_plot.py: Ask for python3 specifically</div>
<div id=3D"m_-2768311353365542709LPMetadata256791" style=3D"font-size:14px;=
font-weight:400;color:rgb(166,166,166);font-family:&quot;wf_segoe-ui_normal=
&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif">
<a href=3D"http://www.spinics.net" target=3D"_blank">www.spinics.net</a></d=
iv>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<br>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt"></span></font></div>
</div>

</div></blockquote></div>

--000000000000a0b0da05eda5be3b--

