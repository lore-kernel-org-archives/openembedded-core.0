Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5C66E98F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 02:00:15 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id z11so4196116lbi.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 19:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=S5/aDv5+RZd92HR2sqWWkHa8XrhN+pPaeDXvOF2yTnI=;
	b=0skVclQp4MA92jY89/T5zNNtU8RDBIeG8rgyDjyr74woJXQpSuKS3kwFyKMY42ryHB
	8ds5axIeazKpYFLwoVgLsqCBsvBnlBSrRZ2xe5sMEpOU/EW/eA1XOGOJ7H5YoR7rYfEO
	WdKnjAE4JIs8DgME0ZCaj4FVtcF3PW6vMBUpO2nBjJ8WhkymHvQerKN6yCkiGrpC4Qiu
	p0eNg6FbMKi+8+22jMRDYd3dqju2b3BQNBL+tPi2DXzUqYBy2UDGBd8CoM86Ty6mTfjM
	Nbx6LpuilNJJQT7K3cW3jNtv+rmelquDFynV7+zStcuvWmyEQSM7zclIzRkc+mUMFUf5
	WStw==
X-Received: by 10.152.120.195 with SMTP id le3mr48368388lab.6.1395712815522;
	Mon, 24 Mar 2014 19:00:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.35.194 with HTTP; Mon, 24 Mar 2014 18:59:55 -0700 (PDT)
In-Reply-To: <5330DF25.6070607@windriver.com>
References: <cover.1395639298.git.liezhi.yang@windriver.com>
	<c4b687132dcd976635a375f994f66b3a6b9242f9.1395639299.git.liezhi.yang@windriver.com>
	<CABcZANma6KPgomjHwW=Lc2_VSiHrWiE624=cNWN3FaiNEbfPZQ@mail.gmail.com>
	<5330DF25.6070607@windriver.com>
From: Chris Larson <kergoth@gmail.com>
Date: Mon, 24 Mar 2014 18:59:55 -0700
Message-ID: <CABcZANksxp05PfURbyas+b_Z5rXgUGJQbaNEffPHCLxAHnO1uA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] local.conf.sample.extended: update it for the archiver
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
X-List-Received-Date: Tue, 25 Mar 2014 02:00:23 -0000
Content-Type: multipart/alternative; boundary=089e01227abc93eb1004f564b6d8

--089e01227abc93eb1004f564b6d8
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 24, 2014 at 6:43 PM, Robert Yang <liezhi.yang@windriver.com>wrote:

> On 03/24/2014 11:34 PM, Chris Larson wrote:
>
>> On Sun, Mar 23, 2014 at 10:39 PM, Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>>
>>  +# 9) The recipe type that will be archived:
>>> +#    COPYLEFT_RECIPE_TYPES = '<type1> <type2> ...'
>>> +#    The type can be: target native nativesdk cross crosssdk
>>> cross-canadian.
>>>
>>>
>> Hmm, I wonder if we should note that the default is to archive all types,
>> here.
>>
>>
> Good idea, I've updated it and pushed to:
>
> git://git.openembedded.org/openembedded-core-contrib rbt/archiver_license
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-
> contrib/log/?h=rbt/archiver_license


Looks good to me.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01227abc93eb1004f564b6d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Mar 24, 2014 at 6:43 PM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On 03/24/2014 11:34 PM, Chri=
s Larson wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Sun, Mar 23, 2014 at 10:39 PM, Robert Yang &lt;<a href=3D"mailto:liezhi.=
yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<u><=
/u>wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+# 9) The recipe type that will be archived:<br>
+# =C2=A0 =C2=A0COPYLEFT_RECIPE_TYPES =3D &#39;&lt;type1&gt; &lt;type2&gt; =
...&#39;<br>
+# =C2=A0 =C2=A0The type can be: target native nativesdk cross crosssdk<br>
cross-canadian.<br>
<br>
</blockquote>
<br>
Hmm, I wonder if we should note that the default is to archive all types,<b=
r>
here.<br>
<br>
</blockquote>
<br></div>
Good idea, I&#39;ve updated it and pushed to:<br>
<br>
git://<a href=3D"http://git.openembedded.org/openembedded-core-contrib" tar=
get=3D"_blank">git.openembedded.org/<u></u>openembedded-core-contrib</a> rb=
t/archiver_license<br>
<a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/=
log/?h=3Drbt/archiver_license" target=3D"_blank">http://cgit.openembedded.o=
rg/<u></u>cgit.cgi/openembedded-core-<u></u>contrib/log/?h=3Drbt/archiver_<=
u></u>license</a></blockquote>

</div><br>Looks good to me.</div><div class=3D"gmail_extra"><br>Signed-off-=
by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com">kergoth@gma=
il.com</a>&gt;<br>-- <br>Christopher Larson<br>clarson at kergoth dot com<b=
r>

Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics
</div></div>

--089e01227abc93eb1004f564b6d8--
