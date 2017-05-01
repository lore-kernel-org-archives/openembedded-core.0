Return-Path: <gizero@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 87D1D7736C;
	Mon,  1 May 2017 12:27:54 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id a103so113907104ioj.1;
	Mon, 01 May 2017 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9Gg9j1ad5az5O+y5mfBo75CarGLDML88o/BJsQ59soU=;
	b=dJkNaR+OL6a6c1+6eFWlTXo/E5Fdg/FtaPfTzQHL8JxXyWRkHA/BGF4/fmeql3cPAJ
	c3u8mV+h5gPDA37qR6fjTdxzOf3FbmmAXhR7d3yLC7oPvirQ91P2vDgndvmUeIgSro3o
	8QuOaEMqo6Ph8xTjWKjg5HShLDzq5Tn7GJWcACFlVIdBz3ypz05aye3SvAL8Y6wfvZY2
	AXRDMBZpvxU2FWbKAybqqIo6WjWUZucKa4pRpOJvLn+rUvDxRQFdJ93TdqEslpNlW3qR
	DUmzakMrLFtizeGR5PTogQPCy/JGDC2j5TCWlbPhjxSVSVR+a1HWhdwvhuvlmDGKmphD
	YqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9Gg9j1ad5az5O+y5mfBo75CarGLDML88o/BJsQ59soU=;
	b=a7NUXd7gU9lcI351Oiu2bkV0LFGcf+2b3fDBMuEZU2zzsTCe2XqhCClzrSgM+Yjukk
	Kosm9r7z84XQZ1VaXF5rDRvR60m8DEEnzVmH8pctrMszFoKectcJmC47kN9beyt7nKfA
	dAzLvVgbg7STyFcvKZkF0yqrF2X90i/3ghaUMKXeP0SgNLIYLBuV0i2U32D3A7yrtnl4
	r4Pq4808ZLajnHB2abnfEtWxYWvNnCJEcx7hZ9CO7Uj1EMSsa4DJnes9g5HZ27yiLG9R
	gPOxAIAcZUDzo9WQYWw2/9kdLwFoIdiFtzWnAtq/7tPmm6hXU0RcwmXawD69RDjjSflv
	Bp8g==
X-Gm-Message-State: AN3rC/6m0/nLpH8sModPBaNfWoOY7ZpHQDtw6s+/n5LvzxqtmEc5E++H
	wZJ7tfDl1N9leoMQrf6Dw8Q4Gd7p1w==
X-Received: by 10.202.173.7 with SMTP id w7mr9706480oie.69.1493641675476; Mon,
	01 May 2017 05:27:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.24.107 with HTTP; Mon, 1 May 2017 05:27:54 -0700 (PDT)
In-Reply-To: <CA+chaQfvm5xdNEhF=v05VnUPiLZFea2pZkZakgmAF_mCF4v07w@mail.gmail.com>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
	<CAK18fxHF1dPOAXSwFwtS0s_vaMo5--t4QS2dq8pBwbDPdFDmbw@mail.gmail.com>
	<CAC+thW0rVtEFKKoJChwLjK-2=aMmZuW5vRufJ9iaFXJt6JiEAg@mail.gmail.com>
	<1493635218.23535.34.camel@linuxfoundation.org>
	<CAP71Wjwwp9ca=4_V-U1NpnX+=5x1V82DS18FkxPAaL9qYknVow@mail.gmail.com>
	<1493638943.23535.36.camel@linuxfoundation.org>
	<2b56f841-8c90-64b7-b6d3-cf0c157451be@balister.org>
	<CA+chaQfvm5xdNEhF=v05VnUPiLZFea2pZkZakgmAF_mCF4v07w@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Mon, 1 May 2017 14:27:54 +0200
Message-ID: <CAC+thW0emfZ38_6nHXdLnVuSBampH=ztME=W9Gg7T8oZbpVuDw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-members@lists.openembedded.org, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [oe] OpenEmbedded 2017 General Meeting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 May 2017 12:27:55 -0000
Content-Type: multipart/alternative; boundary=001a113cf5e87d135c054e758d5f

--001a113cf5e87d135c054e758d5f
Content-Type: text/plain; charset=UTF-8

On Mon, May 1, 2017 at 1:59 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> I had to change the password on the login, but then it worked for me.
>
> I've added Andrea and Andrei to the list.
>

Thanks!


>
> On Mon, May 1, 2017 at 1:46 PM, Philip Balister <philip@balister.org>
> wrote:
>
>> On 05/01/2017 07:42 AM, Richard Purdie wrote:
>> > On Mon, 2017-05-01 at 13:07 +0200, Nicolas Dechesne wrote:
>> >> well, it's the same for me. In the 'view source' page, i can see
>> >> this:
>> >>
>> >> ==
>> >> You do not have permission to edit this page, for the following
>> >> reason:
>> >> The action you have requested is limited to users in the group:
>> >> Administrators.
>> >
>> > Right, it is totally broken.
>> >
>> > Someone has messed up the group access permissions, likely related to
>> > spam protection. Right now it appears only the admins can change
>> > anything. I could try and fix it but I should probably understand who
>> > did what and why to cause this first.
>> >
>> > Who has changed the group permissions recently?
>>
>> I'll check with Bill Traynor.
>>
>> Philip
>>
>> >
>> > Cheers,
>> >
>> > Richard
>> > _______________________________________________
>> > Openembedded-architecture mailing list
>> > Openembedded-architecture@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-
>> architecture
>> >
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
>
>

--001a113cf5e87d135c054e758d5f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 1, 2017 at 1:59 PM, Martin Jansa <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
">I had to change the password on the login, but then it worked for me.<div=
><br></div><div>I&#39;ve added Andrea and Andrei to the list.</div></div></=
blockquote><div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Mon, May 1, 2017 at 1:46 PM, Phi=
lip Balister <span dir=3D"ltr">&lt;<a href=3D"mailto:philip@balister.org" t=
arget=3D"_blank">philip@balister.org</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><span>On 05/01/2017 07:42 AM, Richard Purdie wrote:<br>
&gt; On Mon, 2017-05-01 at 13:07 +0200, Nicolas Dechesne wrote:<br>
&gt;&gt; well, it&#39;s the same for me. In the &#39;view source&#39; page,=
 i can see<br>
&gt;&gt; this:<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D<br>
&gt;&gt; You do not have permission to edit this page, for the following<br=
>
&gt;&gt; reason:<br>
&gt;&gt; The action you have requested is limited to users in the group:<br=
>
&gt;&gt; Administrators.<br>
&gt;<br>
&gt; Right, it is totally broken.<br>
&gt;<br>
&gt; Someone has messed up the group access permissions, likely related to<=
br>
&gt; spam protection. Right now it appears only the admins can change<br>
&gt; anything. I could try and fix it but I should probably understand who<=
br>
&gt; did what and why to cause this first.<br>
&gt;<br>
&gt; Who has changed the group permissions recently?<br>
<br>
</span>I&#39;ll check with Bill Traynor.<br>
<br>
Philip<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
<span class=3D"m_1236841734821903728im m_1236841734821903728HOEnZb">&gt; __=
____________________________<wbr>_________________<br>
&gt; Openembedded-architecture mailing list<br>
&gt; <a href=3D"mailto:Openembedded-architecture@lists.openembedded.org" ta=
rget=3D"_blank">Openembedded-architecture@list<wbr>s.openembedded.org</a><b=
r>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-architecture" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedd=
ed.org/<wbr>mailman/listinfo/openembedded-<wbr>architecture</a><br>
&gt;<br>
</span><div class=3D"m_1236841734821903728HOEnZb"><div class=3D"m_123684173=
4821903728h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>
</div></div><br>______________________________<wbr>_________________<br>
Openembedded-architecture mailing list<br>
<a href=3D"mailto:Openembedded-architecture@lists.openembedded.org">Openemb=
edded-architecture@<wbr>lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-arch=
itecture" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.or=
g/<wbr>mailman/listinfo/openembedded-<wbr>architecture</a><br>
<br></blockquote></div><br></div></div>

--001a113cf5e87d135c054e758d5f--
