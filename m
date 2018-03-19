Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7DF72789CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:16:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1521490577; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=fB5tHZwIAJrvSaydi5HKDMYkMeQPi14AVRXYUYG17ok=;
	b=jgk6gW8XDf3hbtaUA5/FY5N/mKDzReP7t3ckt9N2cxRSji28zaCamZflCeDNQ7TRd5/iW8Qo
	Go6mN7hTSvITI0CqS7Zgg4g4UM3z0BTgpEIWxUF9qoXsO5DdzcgpDabc4esJv4JkyR2CQ7ww
	0jPeislkb7rf52eQwrVtchqqj4g=
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mxa.mailgun.org with ESMTP id 5ab01a8f.7f6a6849e9f0-smtp-out-n03;
	Mon, 19 Mar 2018 20:16:15 -0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id g14so13454076iob.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:16:14 -0700 (PDT)
X-Gm-Message-State: AElRT7G2jqPwK3ahOAwH7LPOOzplNeeQKqLujyiPs55Ed1XOFOGo4Cha
	tZn9+2b5s0fMjd36yRBlS/0WcViS0yTd9ReeJew=
X-Google-Smtp-Source: AG47ELvc/ihJ9GY/WvlGvLNRMxAnJS8BrouePU9tggoJiQeNL3r/N0AaTt2j7uD2qmkl/he2c0Z3cEZ6uqMT5UzSyhU=
X-Received: by 10.107.176.208 with SMTP id z199mr6401359ioe.245.1521490574286; 
	Mon, 19 Mar 2018 13:16:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.6 with HTTP; Mon, 19 Mar 2018 13:16:13 -0700 (PDT)
In-Reply-To: <CAPGMVzHnpq7qThc2MBi63cu-xJ+GsCEmYxNdTjh6znmAN+sHTg@mail.gmail.com>
References: <CAPGMVzFwWL9xqX-tQSWEFsa-f56nh01ONCCzE2p1+Bx8T1=zdQ@mail.gmail.com>
	<CADNbA1ow32P5yvgSWrPS+1yjAa6qNu1Qtwf3YFgVfHNzSUYt=w@mail.gmail.com>
	<CAPGMVzHnpq7qThc2MBi63cu-xJ+GsCEmYxNdTjh6znmAN+sHTg@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 19 Mar 2018 16:16:13 -0400
X-Gmail-Original-Message-ID: <CADNbA1q6zw+P+V5nQy=_mpqq0NiSN-eWSD5PTuzSrrq4UrVC0A@mail.gmail.com>
Message-ID: <CADNbA1q6zw+P+V5nQy=_mpqq0NiSN-eWSD5PTuzSrrq4UrVC0A@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Build Error
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
X-List-Received-Date: Mon, 19 Mar 2018 20:16:16 -0000
Content-Type: multipart/alternative; boundary="001a1143b41235a9740567c9a1b2"

--001a1143b41235a9740567c9a1b2
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 19, 2018 at 4:05 PM, Rajath C S <rajathcs.1996@gmail.com> wrote:

> I am not mixing and matching the branches.
>
>
My meta-openembedded is on master branch.
> The reason that it is on master branch is : I had not got
> meta-openembedded when I cloned poky and later I cloned meta-openembedded
> manually and it is automatically placed on master branch.
>
> Should meta-openembedded be on master branch or rocko branch?
> Is it fine if the over all target build take place on master branch?
>

The branches need to match across your meta layers.  i.e. all rocko, all
master, etc.

>
> Thanks
>
> On Tue, 20 Mar 2018, 01:18 Derek Straka, <derek@asterius.io> wrote:
>
>> Are you mixing and matching branches between layers?  Is your
>> meta-openembedded on rocko or master?
>>
>> On Mon, Mar 19, 2018 at 3:44 PM, Rajath C S <rajathcs.1996@gmail.com>
>> wrote:
>>
>>> Hi,
>>>
>>> 1. So while building the target i get the following error,
>>>
>>> bitbake core-image-sato
>>> Loading cache: 100% |#############################
>>> ####################################################################################|
>>> Time: 0:00:00
>>> Loaded 1 entries from dependency cache.
>>> ERROR: ParseError at /home/jarvis/poky/meta-openemb
>>> edded/meta-python/recipes-extended/python-pyephem/python
>>> -pyephem_3.7.6.0.bb:12: Could not inherit file classes/pypi.bbclass
>>>
>>> for which i create a file called pypi.bbclass and copy the code in it
>>> and place it it /poky/meta/classes and run
>>> "bitbake core-image-sato" for which i dont get any error,
>>> is it the right method to be followed?
>>>
>>> 2. This error appears when i am using bitbake in rocko branch but doesnt
>>> appear when i shift to master branch and build the image; is it fine to
>>> shift branch (i.e. from rocko to master) and build the image?
>>>
>>> Thanks
>>>
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>

--001a1143b41235a9740567c9a1b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Mar 19, 2018 at 4:05 PM, Rajath C S <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"au=
to"><div dir=3D"auto">I am not mixing and matching the branches.</div><div =
dir=3D"auto">=C2=A0<br></div></div></blockquote><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"auto"><div dir=3D"auto"></div>My meta-openembedded is on ma=
ster branch.<div dir=3D"auto">The reason that it is on master branch is : I=
 had not got meta-openembedded when I cloned poky and later I cloned meta-o=
penembedded manually and it is automatically placed on master branch.</div>=
<div dir=3D"auto"><br></div></div></blockquote><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"auto"><div dir=3D"auto"></div><div dir=3D"auto">Should meta-=
openembedded be on master branch or rocko branch?</div><div dir=3D"auto">Is=
 it fine if the over all target build take place on master branch?</div></d=
iv></blockquote><div><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline"><br></span></div><div><span =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">The branches need to match across your meta layers.=C2=
=A0 i.e. all rocko, all master, etc.</span></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks=
</div></div><div class=3D"m_-4351391682564291788HOEnZb"><div class=3D"m_-43=
51391682564291788h5"><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, 20 Mar 2018, 01:18 Derek Straka, &lt;<a href=3D"mailto:derek@asterius.io"=
 target=3D"_blank">derek@asterius.io</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr">Are you mixing and matching branches betw=
een layers?=C2=A0 Is your meta-openembedded on rocko or master?</div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Mar 19, 2018 at=
 3:44 PM, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@=
gmail.com" rel=3D"noreferrer" target=3D"_blank">rajathcs.1996@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>=
<div><div><div>Hi,<br><br>1. So while building the target i get the followi=
ng error,<br><br>bitbake core-image-sato<br>Loading cache: 100% |##########=
###################<wbr>##############################<wbr>################=
##############<wbr>########################| Time: 0:00:00<br>Loaded 1 entr=
ies from dependency cache.<br>ERROR: ParseError at /home/jarvis/poky/meta-o=
penemb<wbr>edded/meta-python/recipes-<wbr>extended/python-pyephem/<a href=
=3D"http://python-pyephem_3.7.6.0.bb:12" rel=3D"noreferrer" target=3D"_blan=
k">python<wbr>-pyephem_3.7.6.0.bb:12</a>: Could not inherit file classes/py=
pi.bbclass<br><br></div>for which i create a file called pypi.bbclass and c=
opy the code in it and place it it /poky/meta/classes and run <br>&quot;bit=
bake core-image-sato&quot; for which i dont get any error,<br></div>is it t=
he right method to be followed?<br><br></div>2. This error appears when i a=
m using bitbake in rocko branch but doesnt appear when i shift to master br=
anch and build the image; is it fine to shift branch (i.e. from rocko to ma=
ster) and build the image?<br><br></div>Thanks<br><div><div><div><div><br><=
/div></div></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" rel=3D"noreferr=
er" target=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>
</blockquote></div>
</div></div></blockquote></div><br></div></div>

--001a1143b41235a9740567c9a1b2--
