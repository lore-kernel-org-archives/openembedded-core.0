Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id BC94E60053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 08:44:43 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so68850424wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 01:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3P4Fe8qUCPzMFRDFpWtuWhVAh76dB6whkF5vdzNfrig=;
	b=eablFC3e3+g4PZgQtczHQ/1fyqurBcBiUfRb+hzQTt19XEfXNI5W6pZG1aE3h8Ys7M
	vl04PH04DVZA1Jg/gq8Q9CvCz/nwJzrSMlznxsUw93qGB0jscnHnKgCQe/4cUkpD7CFx
	eA8/2E4zSScMy1k+NbjuT8QjkNIIDZpMjy4xAmS3MrfNqiVoQwG/tMbS8x+3i86BLknp
	HY8zAnQIcgIRoe5n+wcoBY9ckBd4enDZf4l6rfGyjLbBwJFUaB84kGMR8Lhxc9O7cox4
	FXSYp1mAh46ShdHZSfyqu/UjIF0cQmI8PZena83ee6YUnvmVuthIWbpkOV+Q/eIjU1Cd
	+mkw==
X-Gm-Message-State: ALoCoQk/uJuO6cgLG06ihiJBpU6heLDwLzXWsi2bIq0wUuBiBZmfIGQaq63pOQto1WKZQne31/8K
X-Received: by 10.180.75.176 with SMTP id d16mr43556890wiw.75.1441701883701;
	Tue, 08 Sep 2015 01:44:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Tue, 8 Sep 2015 01:44:14 -0700 (PDT)
In-Reply-To: <55EDBD6F.7090900@topic.nl>
References: <55963864.2030604@topic.nl> <55ED6393.6050906@topic.nl>
	<CAHiDW_GfhUoDMBtwbj2G8RbRnA7OWR_3b_M_tDc-hEz8g4NqYw@mail.gmail.com>
	<55EDBD6F.7090900@topic.nl>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 8 Sep 2015 11:44:14 +0300
Message-ID: <CAHiDW_GPgMLsLbASU4qHCHY65E9OWK3G3BgTpq=vAd8tsPDNbg@mail.gmail.com>
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
X-List-Received-Date: Tue, 08 Sep 2015 08:44:47 -0000
Content-Type: multipart/alternative; boundary=f46d043c8124a681bb051f3860a4

--f46d043c8124a681bb051f3860a4
Content-Type: text/plain; charset=UTF-8

On 7 September 2015 at 19:38, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> On 07-09-15 13:56, Jussi Kukkonen wrote:
>
>> On 7 September 2015 at 13:14, Mike Looijmans <mike.looijmans@topic.nl
>> <mailto:mike.looijmans@topic.nl>> wrote:
>>
>>     Just sped another hour or so trying to pinpoint this, but I cannot
>>     wrap my head around it. What do I have to do to add a license to a
>>     layer without these annoying warnings?
>>
>>
>> I just tried this (with master branch) and it seems to work fine
>> here...  Are you using master or something older?
>>
>
> Did you try that in a separate, empty layer? I suspect I'm missing a
> variable or directive of some kind which cause it to miss the license file.
>

I have layer with literally only:
* conf/layer.conf file with just LICENSE_PATH += "${LAYERDIR}/licenses"
* licenses/internal file
This layer is added to BBLAYERS. After this a recipe from another layer
seems to be able to use the "internal" license...

Jussi


Do you not get a "${DEPLOY_DIR}/licenses/${BPN}/generic_internal" file
>> when you build the recipe for BPN?
>>
>
> Nope.
>
>
>
>>   - Jussi
>>
>>     Mike.
>>
>>
>>     On 03-07-15 09:23, Mike Looijmans wrote:
>>
>>         In my layer.conf I have:
>>
>>         LICENSE_PATH += "${LAYERDIR}/licenses"
>>
>>
>>         In that path, there's a license file called "internal"
>>         containing the
>>         following short text:
>>
>>         For TOPIC internal use only.
>>         Do not distribute.
>>
>>
>>         Now on each build I get warnings like this for every recipe that
>>         refers to
>>         this license:
>>         "WARNING: The license listed internal was not in the licenses
>>         collected for
>>         recipe ..."
>>
>>
>>         As far as I know, I did everything right, but I can't figure out
>>         what else I
>>         need to do here. How do I get this license into the "license
>>         collected"?
>>
>>
>>
>>
>>
>>     Kind regards,
>>
>>     Mike Looijmans
>>     System Expert
>>
>>     TOPIC Embedded Products
>>     Eindhovenseweg 32-C, NL-5683 KH Best
>>     Postbus 440, NL-5680 AK Best
>>     Telefoon: +31 (0) 499 33 69 79
>>     <tel:%2B31%20%280%29%20499%2033%2069%2079>
>>     Telefax: +31 (0) 499 33 69 70
>> <tel:%2B31%20%280%29%20499%2033%2069%2070>
>>     E-mail: mike.looijmans@topicproducts.com
>>     <mailto:mike.looijmans@topicproducts.com>
>>     Website: www.topicproducts.com <http://www.topicproducts.com>
>>
>>     Please consider the environment before printing this e-mail
>>
>>
>>
>>
>>
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>
> --
> Mike Looijmans
>

--f46d043c8124a681bb051f3860a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 7=
 September 2015 at 19:38, Mike Looijmans <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex"><span class=3D"">On 07-09-15 13:56,=
 Jussi Kukkonen wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex"><span class=3D"">
On 7 September 2015 at 13:14, Mike Looijmans &lt;<a href=3D"mailto:mike.loo=
ijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl</a><br></span><s=
pan class=3D"">
&lt;mailto:<a href=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mik=
e.looijmans@topic.nl</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Just sped another hour or so trying to pinpoint this, but I c=
annot<br>
=C2=A0 =C2=A0 wrap my head around it. What do I have to do to add a license=
 to a<br>
=C2=A0 =C2=A0 layer without these annoying warnings?<br>
<br>
<br>
I just tried this (with master branch) and it seems to work fine<br>
here...=C2=A0 Are you using master or something older?<br>
</span></blockquote>
<br>
Did you try that in a separate, empty layer? I suspect I&#39;m missing a va=
riable or directive of some kind which cause it to miss the license file.<s=
pan class=3D""><br></span></blockquote><div><br></div><div>I have layer wit=
h literally only:</div><div>* conf/layer.conf file with just LICENSE_PATH +=
=3D &quot;${LAYERDIR}/licenses&quot;</div><div>*=C2=A0licenses/internal fil=
e</div><div>This layer is added to=C2=A0BBLAYERS. After this a recipe from =
another layer seems to be able to use the &quot;internal&quot; license...</=
div><div><br></div><div>Jussi</div><div><br></div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-lef=
t:1ex"><span class=3D"">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Do you not get a &quot;${DEPLOY_DIR}/licenses/${BPN}/generic_internal&quot;=
 file<br>
when you build the recipe for BPN?<br>
</blockquote>
<br></span>
Nope.<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div><div class=3D"h5">
<br>
=C2=A0 - Jussi<br>
<br>
=C2=A0 =C2=A0 Mike.<br>
<br>
<br>
=C2=A0 =C2=A0 On 03-07-15 09:23, Mike Looijmans wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 In my layer.conf I have:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&qu=
ot;<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 In that path, there&#39;s a license file called=
 &quot;internal&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 containing the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 following short text:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 For TOPIC internal use only.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Do not distribute.<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Now on each build I get warnings like this for =
every recipe that<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 refers to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 this license:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;WARNING: The license listed internal was =
not in the licenses<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 collected for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe ...&quot;<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 As far as I know, I did everything right, but I=
 can&#39;t figure out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 what else I<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 need to do here. How do I get this license into=
 the &quot;license<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 collected&quot;?<br>
<br>
<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 Kind regards,<br>
<br>
=C2=A0 =C2=A0 Mike Looijmans<br>
=C2=A0 =C2=A0 System Expert<br>
<br>
=C2=A0 =C2=A0 TOPIC Embedded Products<br>
=C2=A0 =C2=A0 Eindhovenseweg 32-C, NL-5683 KH Best<br>
=C2=A0 =C2=A0 Postbus 440, NL-5680 AK Best<br>
=C2=A0 =C2=A0 Telefoon: <a href=3D"tel:%2B31%20%280%29%20499%2033%2069%2079=
" value=3D"+31499336979" target=3D"_blank">+31 (0) 499 33 69 79</a><br></di=
v></div>
=C2=A0 =C2=A0 &lt;tel:%2B31%20%280%29%20499%2033%2069%2079&gt;<br>
=C2=A0 =C2=A0 Telefax: <a href=3D"tel:%2B31%20%280%29%20499%2033%2069%2070"=
 value=3D"+31499336970" target=3D"_blank">+31 (0) 499 33 69 70</a> &lt;tel:=
%2B31%20%280%29%20499%2033%2069%2070&gt;<br>
=C2=A0 =C2=A0 E-mail: <a href=3D"mailto:mike.looijmans@topicproducts.com" t=
arget=3D"_blank">mike.looijmans@topicproducts.com</a><br>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:mike.looijmans@topicproducts.com=
" target=3D"_blank">mike.looijmans@topicproducts.com</a>&gt;<br>
=C2=A0 =C2=A0 Website: <a href=3D"http://www.topicproducts.com" rel=3D"nore=
ferrer" target=3D"_blank">www.topicproducts.com</a> &lt;<a href=3D"http://w=
ww.topicproducts.com" rel=3D"noreferrer" target=3D"_blank">http://www.topic=
products.com</a>&gt;<span class=3D""><br>
<br>
=C2=A0 =C2=A0 Please consider the environment before printing this e-mail<b=
r>
<br>
<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 _______________________________________________<br>
=C2=A0 =C2=A0 Openembedded-core mailing list<br>
=C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br></span>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a>&gt=
;<br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/mailman/listinfo/openembedded-core</a><br>
<br>
<br><span class=3D""><font color=3D"#888888">
</font></span></blockquote><span class=3D""><font color=3D"#888888">
<br>
<br>
-- <br>
Mike Looijmans<br>
</font></span></blockquote></div><br></div></div>

--f46d043c8124a681bb051f3860a4--
