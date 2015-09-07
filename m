Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id D631174197
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 11:57:26 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so81451512wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 04:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IMjJ8s6oIAQ3aDzB1Z/d2rueMGRmQQFsn1avKIBktyo=;
	b=Bh7qZHnmSiASMPoH1s5+BHL8F4eeJqmUO14JTs9QvaLCrERaQUC8D1j4SpASHozhmx
	13Z+KUeZH4XqXAdKXouZUO0UzIObN8qQ5eZLkwUeq88FByfwvi4mukjiCOISXkwY0HtD
	TD+aAZ5Fsv/4ICc6PoQ/s/aoWVFj4A7iw6BfJdRqQDLl8zz6A1+CLJbbmGXFnfS78bO8
	ko8Cw4nZ1Lij+9ZWbb+DN+r1vkzxQkjgJ9PRPqcmKfkfrbbkPthERRWZbwyXqzYQhyYN
	u5a157j/JkoXe9FwlLVlMfuJNH4cSPoUs5Sxy5+CWj6matI43kmfDrL45HuLqw1q9BEX
	1Qjw==
X-Gm-Message-State: ALoCoQnZAtMr/MaHvxAxvBQ2hG1cA9pcqp/E7EpT7OglBB+Xi/PCO4APjV+/BbIKbfka4BmMBea6
X-Received: by 10.194.87.4 with SMTP id t4mr37769832wjz.84.1441627045963; Mon,
	07 Sep 2015 04:57:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Mon, 7 Sep 2015 04:56:56 -0700 (PDT)
In-Reply-To: <55ED6393.6050906@topic.nl>
References: <55963864.2030604@topic.nl> <55ED6393.6050906@topic.nl>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 7 Sep 2015 14:56:56 +0300
Message-ID: <CAHiDW_GfhUoDMBtwbj2G8RbRnA7OWR_3b_M_tDc-hEz8g4NqYw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Getting rid of "The license listed internal was not in the licenses collected" warnings?
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
X-List-Received-Date: Mon, 07 Sep 2015 11:57:28 -0000
Content-Type: multipart/alternative; boundary=047d7bf10b20f95abe051f26f328

--047d7bf10b20f95abe051f26f328
Content-Type: text/plain; charset=UTF-8

On 7 September 2015 at 13:14, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> Just sped another hour or so trying to pinpoint this, but I cannot wrap my
> head around it. What do I have to do to add a license to a layer without
> these annoying warnings?


I just tried this (with master branch) and it seems to work fine here...
Are you using master or something older?

Do you not get a "${DEPLOY_DIR}/licenses/${BPN}/generic_internal" file when
you build the recipe for BPN?

 - Jussi


Mike.
>
>
> On 03-07-15 09:23, Mike Looijmans wrote:
>
>> In my layer.conf I have:
>>
>> LICENSE_PATH += "${LAYERDIR}/licenses"
>>
>>
>> In that path, there's a license file called "internal" containing the
>> following short text:
>>
>> For TOPIC internal use only.
>> Do not distribute.
>>
>>
>> Now on each build I get warnings like this for every recipe that refers to
>> this license:
>> "WARNING: The license listed internal was not in the licenses collected
>> for
>> recipe ..."
>>
>>
>> As far as I know, I did everything right, but I can't figure out what
>> else I
>> need to do here. How do I get this license into the "license collected"?
>>
>>
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> Telefax: +31 (0) 499 33 69 70
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7bf10b20f95abe051f26f328
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 7=
 September 2015 at 13:14, Mike Looijmans <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex">Just sped another hour or so trying=
 to pinpoint this, but I cannot wrap my head around it. What do I have to d=
o to add a license to a layer without these annoying warnings?</blockquote>=
<div><br></div><div>I just tried this (with master branch) and it seems to =
work fine here...=C2=A0 Are you using master or something older?</div><div>=
<br></div><div>Do you not get a &quot;${DEPLOY_DIR}/licenses/${BPN}/generic=
_internal&quot; file when you build the recipe for BPN?</div><div><br></div=
><div>=C2=A0- Jussi</div><div>=C2=A0</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
<span><font color=3D"#888888">
Mike.</font></span><span><br>
<br>
<br>
On 03-07-15 09:23, Mike Looijmans wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
In my layer.conf I have:<br>
<br>
LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
<br>
<br>
In that path, there&#39;s a license file called &quot;internal&quot; contai=
ning the<br>
following short text:<br>
<br>
For TOPIC internal use only.<br>
Do not distribute.<br>
<br>
<br>
Now on each build I get warnings like this for every recipe that refers to<=
br>
this license:<br>
&quot;WARNING: The license listed internal was not in the licenses collecte=
d for<br>
recipe ...&quot;<br>
<br>
<br>
As far as I know, I did everything right, but I can&#39;t figure out what e=
lse I<br>
need to do here. How do I get this license into the &quot;license collected=
&quot;?<br>
<br>
</blockquote>
<br>
<br>
<br>
<br></span><div><div>
Kind regards,<br>
<br>
Mike Looijmans<br>
System Expert<br>
<br>
TOPIC Embedded Products<br>
Eindhovenseweg 32-C, NL-5683 KH Best<br>
Postbus 440, NL-5680 AK Best<br>
Telefoon: <a href=3D"tel:%2B31%20%280%29%20499%2033%2069%2079" value=3D"+31=
499336979" target=3D"_blank">+31 (0) 499 33 69 79</a><br>
Telefax: <a href=3D"tel:%2B31%20%280%29%20499%2033%2069%2070" value=3D"+314=
99336970" target=3D"_blank">+31 (0) 499 33 69 70</a><br>
E-mail: <a href=3D"mailto:mike.looijmans@topicproducts.com" target=3D"_blan=
k">mike.looijmans@topicproducts.com</a><br>
Website: <a href=3D"http://www.topicproducts.com" rel=3D"noreferrer" target=
=3D"_blank">www.topicproducts.com</a><br>
<br>
Please consider the environment before printing this e-mail<br>
<br>
<br>
<br>
<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div></div>

--047d7bf10b20f95abe051f26f328--
