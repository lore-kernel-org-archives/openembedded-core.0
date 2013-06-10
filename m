Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id C94656A9C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 21:01:12 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id gw10so6135901lab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 14:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Qg6+lSmqhIjRVil3CuB61eye9KPCzAu+47inPGts92M=;
	b=RezqCntNIngLY8M/gEAALuRbOksDkNkentWUvrqDucN5yZccgigY6Bl+VI+y3apSdm
	4+HYNlCOVd2gc6bSFfBfSDTEr+VV3swQ+IN8SlBRQo9GbtD8YATwO2oj4EReKOMKLgyj
	pzLVIa6yFvOEnyUqI/XQ9CnJWWhQk7aEIV+vq4thgjDD8I3kbyLnstjQItqWN8VX6LU3
	9/Y0N/9TcFG3R1M4ww1dB4zH3A+oHAvOYG6D9mcK4s9+vnTcDkTuFngLDZ97R7MPqgCk
	e0KN/2V9wxegY8fZGOaPKE5LW+bjPn7sxgZftMvSV1TCBwAaMZdPdaDVHg2u/KNWXEDv
	rUvA==
X-Received: by 10.112.188.231 with SMTP id gd7mr7301077lbc.1.1370898072996;
	Mon, 10 Jun 2013 14:01:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.4.66 with HTTP; Mon, 10 Jun 2013 14:00:52 -0700 (PDT)
In-Reply-To: <CAP9ODKo_XEzjM8cKUNi-mJ2v8SnEfEnusAaWYi1==gNGWwuY=Q@mail.gmail.com>
References: <cover.1370896985.git.chris_larson@mentor.com>
	<4dcc39cc1fed7d398b97859ea281ab46e8ba8dbb.1370896985.git.chris_larson@mentor.com>
	<CAP9ODKo_XEzjM8cKUNi-mJ2v8SnEfEnusAaWYi1==gNGWwuY=Q@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Mon, 10 Jun 2013 14:00:52 -0700
Message-ID: <CABcZANng6HLV+DFe3qJB9jXVS3M-T5rc4fDzBbAC1HwHouAy0Q@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] packagegroup-core-tools-profile: don't exclude mips
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
X-List-Received-Date: Mon, 10 Jun 2013 21:01:13 -0000
Content-Type: multipart/alternative; boundary=001a11c36e52aa12ae04ded314bf

--001a11c36e52aa12ae04ded314bf
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 10, 2013 at 1:56 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <kergoth@gmail.com>wrote:
>
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> Now that liburcu supports mips, this packagegroup can pull in lttng
>> software
>> on that architecture.
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>
>
> Your commit log say's nothing about babeltrace. I think it'd be good to
> add it.
>

It's debatable whether babel trace is considered 'lttng software', as it's
listed at http://lttng.org/download and http://lttng.org/babeltrace redirects
to the official babeltrace project page also. If you think mentioning it
separately would be beneficial, I'll send a v2. Thanks for reviewing these.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c36e52aa12ae04ded314bf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Jun 10, 2013 at 1:56 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On Mon, Jun 10, 2013 at 5:46 PM, Christo=
pher Larson <span dir=3D"ltr">&lt;<a href=3D"mailto:kergoth@gmail.com" targ=
et=3D"_blank">kergoth@gmail.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">From: Christopher Larson &lt;<a href=3D"mailto:chris_larso=
n@mentor.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>


<br>
Now that liburcu supports mips, this packagegroup can pull in lttng softwar=
e<br>
on that architecture.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;</blockquote><div><b=
r></div></div><div>Your commit log say&#39;s nothing about babeltrace. I th=
ink it&#39;d be good to add it.</div>

</blockquote></div><br>It&#39;s debatable whether babel trace is considered=
 &#39;lttng software&#39;, as it&#39;s listed at=C2=A0<a href=3D"http://ltt=
ng.org/download">http://lttng.org/download</a>=C2=A0and=C2=A0<a href=3D"htt=
p://lttng.org/babeltrace">http://lttng.org/babeltrace</a>=C2=A0redirects to=
 the official babeltrace project page also. If you think mentioning it sepa=
rately would be beneficial, I&#39;ll send a v2. Thanks for reviewing these.=
<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c36e52aa12ae04ded314bf--
