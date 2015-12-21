Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id C82366067D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 13:42:47 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id to4so37190689igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 05:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XoFwlLvn2ORyPZmze1apVV4TyQOiyXsCKsO/cy0RG7g=;
	b=cYE3k/R8+G8ZH7NYlX+HtXcKrdHa+WXREuVGB2RVymtF8W0SENYJOOsdM1PcRFX7qN
	9gXNSaB4KHbon1JzHJAeQaUHxOU3A5aB4naENl0mfUcF0EC8PgBFjDktTUd/PHTuN2Ut
	a70AfXMtEqMuhXQ6tDwTp9BWhG+LsiUtfvkscvfcFaugW6K0wpYuhxOzyPUriOIwzzWM
	3jSRl4FGuxp/jXu6x7HgraAB76ZXocuXYRHO3W7Jp4jV50vSEQPBaf5z5/MhpGgkciVy
	PrAeuPRUakrDX1Dw08xR7TKfyn9oMcuAE0Amvomj/aRlNEkI0WmMQnzSiQlYjS0anwbY
	ekUQ==
MIME-Version: 1.0
X-Received: by 10.50.138.232 with SMTP id qt8mr16328538igb.75.1450705368552;
	Mon, 21 Dec 2015 05:42:48 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Mon, 21 Dec 2015 05:42:47 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Mon, 21 Dec 2015 05:42:47 -0800 (PST)
In-Reply-To: <CAJTo0LaF5ByQoxkOzD22=A6Sq7eiNJCgbObX5E=-AWFVdm=9ng@mail.gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<379ef3716c72c2230a75294f4be5430903f17450.1450568936.git.raj.khem@gmail.com>
	<CAJTo0LaF5ByQoxkOzD22=A6Sq7eiNJCgbObX5E=-AWFVdm=9ng@mail.gmail.com>
Date: Mon, 21 Dec 2015 05:42:47 -0800
Message-ID: <CAMKF1sqZbhW2DO-2d9M4hOqG2EGPn_vcKPWFJb1CjjpQH_KqLQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/17] fts: Add recipe
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
X-List-Received-Date: Mon, 21 Dec 2015 13:42:49 -0000
Content-Type: multipart/alternative; boundary=089e01184cba2a9c15052768aa07

--089e01184cba2a9c15052768aa07
Content-Type: text/plain; charset=UTF-8

On Dec 21, 2015 4:15 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>
> On 19 December 2015 at 23:52, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>  create mode 100644
meta/recipes-core/fts/fts/fts-header-correctness.patch
>>  create mode 100644 meta/recipes-core/fts/fts/fts-uclibc.patch
>>  create mode 100644 meta/recipes-core/fts/fts/gcc5.patch
>>  create mode 100644 meta/recipes-core/fts/fts/remove_cdefs.patch
>>  create mode 100644 meta/recipes-core/fts/fts/stdint.patch
>
>
> None of these patches have headers.

Thanks Ross. I will update the pull tree and send a note afterwards
>
> Ross

--089e01184cba2a9c15052768aa07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Dec 21, 2015 4:15 AM, &quot;Burton, Ross&quot; &lt;<a href=3D"mailto:ros=
s.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 19 December 2015 at 23:52, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0create mode 100644 meta/recipes-core/fts/fts/fts-header-corr=
ectness.patch<br>
&gt;&gt; =C2=A0create mode 100644 meta/recipes-core/fts/fts/fts-uclibc.patc=
h<br>
&gt;&gt; =C2=A0create mode 100644 meta/recipes-core/fts/fts/gcc5.patch<br>
&gt;&gt; =C2=A0create mode 100644 meta/recipes-core/fts/fts/remove_cdefs.pa=
tch<br>
&gt;&gt; =C2=A0create mode 100644 meta/recipes-core/fts/fts/stdint.patch<br=
>
&gt;<br>
&gt;<br>
&gt; None of these patches have headers.</p>
<p dir=3D"ltr">Thanks Ross. I will update the pull tree and send a note aft=
erwards<br>
&gt;<br>
&gt; Ross</p>

--089e01184cba2a9c15052768aa07--
