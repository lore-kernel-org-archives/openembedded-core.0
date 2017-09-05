Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5592671B9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 18:52:40 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id b142so571201ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 11:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eklfiBGIIWl2ns9UKAJo8/t+P7aB4OSHUxZTBxFX24w=;
	b=l1LR5lDIhbhF2DCEAFr3b7G7fnUMZaUFl9m6e4E1+rUMte4Rj5qMz6cqo/+6C8rxh0
	xPC0T3bAeqYy0kgicCUYQFxRATwIfinc3j/AyypcnyCkvlY+GbNIwA9+5v3XoEfdHJsw
	NC8hu/WIs4McrP6vpXPvvpkJwcDCQoDRNITAnKJqW+WjooqHbm+R/n1ZtMkc/frpDXVC
	1T/CrUq2IHDZflpeL6iXr3iiK8QCIGlbWZSG1GHl3w3ZOB3J9LKuNFrPf8SqkB7oh1eE
	mc4NgcOYLOrUGtzewLBJ068WNOJGhDKdgncPT7rF5tAHaet0EUpLZhwukcmMgQE7Gggl
	uwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eklfiBGIIWl2ns9UKAJo8/t+P7aB4OSHUxZTBxFX24w=;
	b=kWlcQyP6glC9pZI6nbtjM7l3Mnz5YTxJq2qH/i32K/fJMGi9Y8FRNh1Kvpnlty6ZvS
	HsMSHOB7dz4kYGVMD/Vy4k2rej61BLxAF4orGDbM/WYTvnitmk40/Fm8KKqmLWsq16vx
	9LyIyHABAqKfgfblF5e34Io2Ahj0F2cbLYeHB+UgQWP/+ASpxGnDZGV9Il4EKW4GUgXW
	z9n9hnV1eO/mijXZSxVyyaZxj3Gh74WFufBuvaVXzDV52b4wfgjvkt/PRqV6WpZil5R4
	mwisEVm4swIcXW2XsggEZerfgfVVMhLhHhtTv95WqX7mwJC4bgWfxPTMS4EbdEHKCgGl
	4Lyg==
X-Gm-Message-State: AHPjjUjDN5owfsXXw5Aq7xsL4DLMQnUDi8gGuj6/mG5oKgHHTxDexLnS
	VY2tkE22FtuLou3/qhbYp5PVTDdNZXHh
X-Google-Smtp-Source: AOwi7QAOwT5FSyRNpPOIsIN2PFyhFAZXqakWCNQfTCxuaka+rer6+T3+TI3WJYa4nubiEt4Hwoll8qOI76drPvQnKBA=
X-Received: by 10.107.17.102 with SMTP id z99mr34392ioi.9.1504637562489; Tue,
	05 Sep 2017 11:52:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Tue, 5 Sep 2017 11:52:22 -0700 (PDT)
In-Reply-To: <1ebb3564-9e52-9480-c1c8-9f959d9e9416@siemens.com>
References: <1504593353-7409-1-git-send-email-andrej.valek@siemens.com>
	<CAJTo0LYxVmQidhcuq9VeSBzb7y1KPcgqN6_R97d7PNf51C094g@mail.gmail.com>
	<1ebb3564-9e52-9480-c1c8-9f959d9e9416@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Sep 2017 19:52:22 +0100
Message-ID: <CAJTo0LYwUhk9tHNHZ7DACOC5WXKW_x=1vrNd7pArCxP7-Pe_dA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: 2.9.4 -> 2.9.5
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
X-List-Received-Date: Tue, 05 Sep 2017 18:52:41 -0000
Content-Type: multipart/alternative; boundary="001a113f74ae6db1af055875bb63"

--001a113f74ae6db1af055875bb63
Content-Type: text/plain; charset="UTF-8"

Also the patch has been corrupted by SMTP.  Is it in a branch somewhere?

Ross

On 5 September 2017 at 18:28, Andrej Valek <andrej.valek@siemens.com> wrote:

> Hi Ross,
>
> There are not any CVEs fixes which has not been already merged. There
> are only general changes. Of course, we can "clean" a lot of patches by
> accepting this.
>
> Regards,
> Andrej
>
> On 09/05/2017 11:19 AM, Burton, Ross wrote:
> > On 5 September 2017 at 07:35, Andrej Valek <andrej.valek@siemens.com
> > <mailto:andrej.valek@siemens.com>> wrote:
> >
> >     Signed-off-by: Andrej Valek <andrej.valek@siemens.com
> >     <mailto:andrej.valek@siemens.com>>
> >
> >
> > We're past freeze to the upgrade will have to wait until 2.4 releases.
> Does this
> > fix any outstanding CVEs that we should be cherry-picking?
> >
> > Ross
> >
>

--001a113f74ae6db1af055875bb63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Also the patch has been corrupted by SMTP.=C2=A0 Is it in =
a branch somewhere?<div><br></div><div>Ross</div></div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On 5 September 2017 at 18:28, Andrej =
Valek <span dir=3D"ltr">&lt;<a href=3D"mailto:andrej.valek@siemens.com" tar=
get=3D"_blank">andrej.valek@siemens.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Hi Ross,<br>
<br>
There are not any CVEs fixes which has not been already merged. There<br>
are only general changes. Of course, we can &quot;clean&quot; a lot of patc=
hes by<br>
accepting this.<br>
<br>
Regards,<br>
Andrej<br>
<span class=3D""><br>
On 09/05/2017 11:19 AM, Burton, Ross wrote:<br>
&gt; On 5 September 2017 at 07:35, Andrej Valek &lt;<a href=3D"mailto:andre=
j.valek@siemens.com">andrej.valek@siemens.com</a><br>
</span><span class=3D"">&gt; &lt;mailto:<a href=3D"mailto:andrej.valek@siem=
ens.com">andrej.valek@siemens.<wbr>com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:a=
ndrej.valek@siemens.com">andrej.valek@siemens.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:andrej.valek@si=
emens.com">andrej.valek@siemens.<wbr>com</a>&gt;&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;<br>
&gt;<br>
&gt; We&#39;re past freeze to the upgrade will have to wait until 2.4 relea=
ses. Does this<br>
&gt; fix any outstanding CVEs that we should be cherry-picking?<br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a113f74ae6db1af055875bb63--
