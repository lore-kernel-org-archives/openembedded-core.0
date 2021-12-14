Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28B1C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 20:11:47 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web11.30904.1639512707019930021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 12:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eKNCTijT;
 spf=pass (domain: gmail.com, ip: 209.85.221.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 84so13224254vkc.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 12:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=55cjla/kdFnbFLRN+3uBTn6iSqYPire88tZz7iB7Akg=;
        b=eKNCTijT4sxg8euzK8E80b8gAsguDSWjo8qxZFfo94Ca8APUTAtK4+F5hW9v1fgqy9
         evJLEbRpQisWTciT329axH2aND67c2dEFyVM4LNq3wS+JDh4exEWCDW4nAUAMjQnW4gF
         lW7VUn6DPf5yigy3Tdr/w/dDXR7yqq87dFod6ds8xANR+vx5zX1kN/i9TmWO3F2Vyi5s
         /GKhrp7yD8Ion21BbkTwnLnFJDfddvamjCSbRKhgIq/zkFd32/2ZHUJfGlqFib/uMnSy
         OXd4zUiiBXq+v96lnZoz4wZ9A9oGRwRSdW1dfUWoNivTyvK8mi7L9kp+GzGQPAkWnzOp
         qdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=55cjla/kdFnbFLRN+3uBTn6iSqYPire88tZz7iB7Akg=;
        b=lJTG2Aau5ZLuv1/S7WRsTxLT10jXK6ZVwT3EeeRM+epN9xyavMftO5EjhD11vlb3az
         AKrnpK06Ur6jMvw/zM1Dq2vWUB43u32SJUeXVXgW+naqQaeYBHs500esaOW8uoEE5Rsy
         CKgqG4CAF+XHesOL/3nnY0t0Txp4tHb0I8fTcUD9C+AWv9x9l8lz4oltQC84gkJv/eVB
         nAcs3q9JV5yoagoeWvh/0V7Mx/K8/4dDhpQIhOq5xCw4ag1/6UNmcm2C6FRK/aFnZU27
         QeIIVLpxtmpy57HH16J/Sy/DoJ10UlxPoMKrEqUo1joWfIZEdHwqBU1CLVWSiU8u5cV1
         7gHg==
X-Gm-Message-State: AOAM533hc/94QIBO8bLqrEuR/8iB+D10V5z+1Jyn/g0zfZrfzpEiKZWt
	GljYCXBPmYbDfgLHehH9hcLgXM37X5mUuX6cfb8=
X-Google-Smtp-Source: 
 ABdhPJye1fC9hNUrrGQHmdt+/380LG0ARDIBR1xBUIS6mFl++kfue4Hp/istOq1T8jqOmkyzTHD7qD1x3+WRrq8HUrM=
X-Received: by 2002:a05:6122:14b4:: with SMTP id
 c20mr1629343vkq.30.1639512704241;
 Tue, 14 Dec 2021 12:11:44 -0800 (PST)
MIME-Version: 1.0
References: <16C0B098D197A5E1.12686@lists.openembedded.org>
 <AM9PR09MB464259F10AA7B2E44E403188A8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CADkTA4M=vQvNfTirHjAmU3tm7CdhkBrdErEgUqCqSyD749Us+w@mail.gmail.com>
 <AM9PR09MB464226B4422C79E0C7F6E508A8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB464226B4422C79E0C7F6E508A8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Dec 2021 21:11:32 +0100
Message-ID: 
 <CANNYZj8OabnaRPOs8Sm_B2A9MiLj58cO4FUu6hLR5+QmSby5Tg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][RFC PATCH] insane: Inappropriate patch
 reasoning
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000575b3805d320cc23"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 20:11:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159708

--000000000000575b3805d320cc23
Content-Type: text/plain; charset="UTF-8"

What I would like to see at least is correctly tagging patches with dead
upstreams, now that we have the shiny new status for it, and a report where
they can be seen clearly :)

Alex

On Tue, 14 Dec 2021 at 19:48, Konrad Weihmann <kweihmann@outlook.com> wrote:

>
>
> On 14.12.21 19:38, Bruce Ashfield wrote:
> > On Tue, Dec 14, 2021 at 1:05 PM Konrad Weihmann <kweihmann@outlook.com>
> wrote:
> >>
> [snip]
>
> >>
> >>
> meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch:
> >>     6: Upstream-Status: Inappropriate [oe-core specific]
> >>
> >> or are simply ignoring it at all.
> >>
> >> In total that are 352 patches I could indentify in latest master.
> >>
> >> I don't want to open up another can of worms, but either we drop the
> >> reasoning from Inappropriate in the patch guideline completely or we
> >> need to fix that in core (I guess in other layers it is even worse :) )
> >>
> >> Any thoughts?
> >
> > If we can opt out of the check either in a layer config or a recipe,
> > then the noise can at least be minimized. Since the ecosystem !=
> > oe-core, this level of checking needs to be something that can be
> > opted-out / disabled.
> >
> > Whatever way this goes, I'd suggest that it not merge until the start
> > of the new year .. luckily RP is in full control of when it merges.
> >
> > Because I for one, won't be spending the Chrismtas holidays queuing
> > other people's patches, or fixing status lines in the patches in my
> > layers :)
> >
> > Cheers,
> >
> > Bruce
>
> Actually a very good idea, but I'm not sure how fine grained we want
> these package-qa ids to be... @RP any thoughts?
>
> Basically we can solve the issue either
> - by keeping the status quo (dropping the reason from the docu)
> - or having is according to docu
>         - having it as a warning in the first place
>         - turning it into an error once we are clean in core and all
> layers
> hosted on yocto project's infra
>
> But yeah sure that patch doesn't need to go in this year, as I don't
> want to ruins everyone's holidays :-)
>
> >>
> >> On 14.12.21 18:53, Konrad Weihmann wrote:
> >>> if a patch uses Upstream-Status: Inappropriate it should provide a
> machine
> >>> readable reasoning in square brackets.
> >>>
> >>> According to latest wiki entry that would be
> >>>
> >>> not author
> >>> native
> >>> licensing
> >>> configuration
> >>> enable feature
> >>> disable feature
> >>> bugfix .*
> >>> embedded specific
> >>> no upstream
> >>> other
> >>>
> >>> a detailed reasoning could be provided as part of the commit message,
> >>> but format of the metadata line is fixed.
> >>>
> >>> This patch adds a check to insane.bbclass and warns if there is a
> >>> non-compliant reasoning given, or none at all.
> >>>
> >>> In a follow-up this should be turned into an error, as it was done
> >>> with missing Upstream-Status
> >>>
> >>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> >>> ---
> >>>    meta/classes/insane.bbclass | 20 ++++++++++++++++++++
> >>>    1 file changed, 20 insertions(+)
> >>>
> >>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> >>> index 240f3aad62..da26f4662c 100644
> >>> --- a/meta/classes/insane.bbclass
> >>> +++ b/meta/classes/insane.bbclass
> >>> @@ -1191,6 +1191,26 @@ python do_qa_patch() {
> >>>                   bb.error("Malformed Upstream-Status in
> patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines,
> match_kinda.group(0)))
> >>>               else:
> >>>                   bb.error("Missing Upstream-Status in
> patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
> >>> +
> >>> +       inappr_message_re = r'Inappropriate(\s+\[(?P<reason>.*)\])*'
> >>> +       inappr_reasons = [
> >>> +            'not author',
> >>> +            'native',
> >>> +            'licensing',
> >>> +            'configuration',
> >>> +            'enable feature',
> >>> +            'disable feature',
> >>> +            'bugfix .*',
> >>> +            'embedded specific',
> >>> +            'no upstream',
> >>> +            'other',
> >>> +       ]
> >>> +       for match_inappr in re.finditer(inappr_message_re, content,
> re.IGNORECASE | re.MULTILINE):
> >>> +
> >>> +           if 'reason' not in match_inappr.groupdict():
> >>> +               bb.warning("Missing Upstream-Status: Inappropriate
> reasoning in patch\n%s\nPlease add according to %s ." % (fullpath,
> guidelines))
> >>> +           elif not any(re.match(x,
> match_inappr.groupdict().get('reason', '') or '') for x in inappr_reasons):
> >>> +               bb.warning("Malformed Upstream-Status: Inappropriate
> in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath,
> guidelines, match_inappr.group(0)))
> >>>    }
> >>>
> >>>    python do_qa_configure() {
> >>>
> >>>
> >>>
> >>>
> >>>
> >>
> >>
> >>
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159705):
> https://lists.openembedded.org/g/openembedded-core/message/159705
> Mute This Topic: https://lists.openembedded.org/mt/87726727/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000575b3805d320cc23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>What I would like to see at least is correctly taggin=
g patches with dead upstreams, now that we have the shiny new status for it=
, and a report where they can be seen clearly :)</div><div><br></div><div>A=
lex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, 14 Dec 2021 at 19:48, Konrad Weihmann &lt;<a href=3D"m=
ailto:kweihmann@outlook.com">kweihmann@outlook.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 14.12.21 19:38, Bruce Ashfield wrote:<br>
&gt; On Tue, Dec 14, 2021 at 1:05 PM Konrad Weihmann &lt;<a href=3D"mailto:=
kweihmann@outlook.com" target=3D"_blank">kweihmann@outlook.com</a>&gt; wrot=
e:<br>
&gt;&gt;<br>
[snip]<br>
<br>
&gt;&gt;<br>
&gt;&gt; meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitu=
te-gtkdoc-qemu-wrapp.patch:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A06: Upstream-Status: Inappropriate [oe-core spec=
ific]<br>
&gt;&gt;<br>
&gt;&gt; or are simply ignoring it at all.<br>
&gt;&gt;<br>
&gt;&gt; In total that are 352 patches I could indentify in latest master.<=
br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t want to open up another can of worms, but either we dr=
op the<br>
&gt;&gt; reasoning from Inappropriate in the patch guideline completely or =
we<br>
&gt;&gt; need to fix that in core (I guess in other layers it is even worse=
 :) )<br>
&gt;&gt;<br>
&gt;&gt; Any thoughts?<br>
&gt; <br>
&gt; If we can opt out of the check either in a layer config or a recipe,<b=
r>
&gt; then the noise can at least be minimized. Since the ecosystem !=3D<br>
&gt; oe-core, this level of checking needs to be something that can be<br>
&gt; opted-out / disabled.<br>
&gt; <br>
&gt; Whatever way this goes, I&#39;d suggest that it not merge until the st=
art<br>
&gt; of the new year .. luckily RP is in full control of when it merges.<br=
>
&gt; <br>
&gt; Because I for one, won&#39;t be spending the Chrismtas holidays queuin=
g<br>
&gt; other people&#39;s patches, or fixing status lines in the patches in m=
y<br>
&gt; layers :)<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Bruce<br>
<br>
Actually a very good idea, but I&#39;m not sure how fine grained we want <b=
r>
these package-qa ids to be... @RP any thoughts?<br>
<br>
Basically we can solve the issue either<br>
- by keeping the status quo (dropping the reason from the docu)<br>
- or having is according to docu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - having it as a warning in the first place<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - turning it into an error once we are clean in=
 core and all layers <br>
hosted on yocto project&#39;s infra<br>
<br>
But yeah sure that patch doesn&#39;t need to go in this year, as I don&#39;=
t <br>
want to ruins everyone&#39;s holidays :-)<br>
<br>
&gt;&gt;<br>
&gt;&gt; On 14.12.21 18:53, Konrad Weihmann wrote:<br>
&gt;&gt;&gt; if a patch uses Upstream-Status: Inappropriate it should provi=
de a machine<br>
&gt;&gt;&gt; readable reasoning in square brackets.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; According to latest wiki entry that would be<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; not author<br>
&gt;&gt;&gt; native<br>
&gt;&gt;&gt; licensing<br>
&gt;&gt;&gt; configuration<br>
&gt;&gt;&gt; enable feature<br>
&gt;&gt;&gt; disable feature<br>
&gt;&gt;&gt; bugfix .*<br>
&gt;&gt;&gt; embedded specific<br>
&gt;&gt;&gt; no upstream<br>
&gt;&gt;&gt; other<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; a detailed reasoning could be provided as part of the commit m=
essage,<br>
&gt;&gt;&gt; but format of the metadata line is fixed.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This patch adds a check to insane.bbclass and warns if there i=
s a<br>
&gt;&gt;&gt; non-compliant reasoning given, or none at all.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; In a follow-up this should be turned into an error, as it was =
done<br>
&gt;&gt;&gt; with missing Upstream-Status<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Konrad Weihmann &lt;<a href=3D"mailto:kweihmann=
@outlook.com" target=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 meta/classes/insane.bbclass | 20 ++++++++++++++++=
++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 20 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/classes/insane.bbclass b/meta/classes/insane=
.bbclass<br>
&gt;&gt;&gt; index 240f3aad62..da26f4662c 100644<br>
&gt;&gt;&gt; --- a/meta/classes/insane.bbclass<br>
&gt;&gt;&gt; +++ b/meta/classes/insane.bbclass<br>
&gt;&gt;&gt; @@ -1191,6 +1191,26 @@ python do_qa_patch() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bb.error(&quot;Malformed Upstream-Status in patch\n%s\nPlease correct=
 according to %s :\n%s&quot; % (fullpath, guidelines, match_kinda.group(0))=
)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bb.error(&quot;Missing Upstream-Status in patch\n%s\nPlease add accor=
ding to %s .&quot; % (fullpath, guidelines))<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0inappr_message_re =3D r&#39;Inappr=
opriate(\s+\[(?P&lt;reason&gt;.*)\])*&#39;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0inappr_reasons =3D [<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;not author&#39=
;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;native&#39;,<b=
r>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;licensing&#39;=
,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;configuration&=
#39;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;enable feature=
&#39;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;disable featur=
e&#39;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bugfix .*&#39;=
,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;embedded speci=
fic&#39;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;no upstream&#3=
9;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;other&#39;,<br=
>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for match_inappr in re.finditer(in=
appr_message_re, content, re.IGNORECASE | re.MULTILINE):<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;reason&#39; =
not in match_inappr.groupdict():<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.war=
ning(&quot;Missing Upstream-Status: Inappropriate reasoning in patch\n%s\nP=
lease add according to %s .&quot; % (fullpath, guidelines))<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif not any(re.matc=
h(x, match_inappr.groupdict().get(&#39;reason&#39;, &#39;&#39;) or &#39;&#3=
9;) for x in inappr_reasons):<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.war=
ning(&quot;Malformed Upstream-Status: Inappropriate in patch\n%s\nPlease co=
rrect according to %s :\n%s&quot; % (fullpath, guidelines, match_inappr.gro=
up(0)))<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 python do_qa_configure() {<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159705): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159705" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159705</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87726727/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87726727/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000575b3805d320cc23--

