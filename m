Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
X-Greylist: delayed 307 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Feb 2017 22:01:26 UTC
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id C363971A14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 22:01:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1487800887; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=hmU4T8W+edrDg77iB9BfCfwZyd2xPJc/rOAO6SzaFQw=;
	b=so3zIHQhEHfwMuvgtpNRAVHbTOBbFrmLk2JQhGiYuzb9BdxWYYRiUiD7kGPo/hhqIyEJoSUW
	zSSrcC2OD//XRTPkEnhVfXErsIaiQ4+ggv3bSpcj0bc9xkVNU6pW+Artyjuoet17UwGGOoGi
	zo7aXoobv3y7u/ZQFA2OzyiPiEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=X/tNs3dwO1Y3k6mnsXrtIsmzNGcOth3OParTO3JEO7K7xG5CZPsmVVlFv8TMW957cFd36I
	1PM498NHmjnRSij+xYYrNNjSiCYRRrtX5W2in2vJwH2WvtDK+64vKEp5ihYpUwQQLG2wX4SD
	ltiEBHoXLEmaLpyzVvNVKNZ7L8rCY=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mxa.mailgun.org with ESMTP id 58ae0903.7f24fc3038f0-smtp-out-n02;
	Wed, 22 Feb 2017 21:56:19 -0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id d9so42472050itc.0;
	Wed, 22 Feb 2017 13:56:19 -0800 (PST)
X-Gm-Message-State: AMke39livi2BKZL14cBzVyv+1eeQkLoILGzXJXF/v5DSOCNw8eli+08ab5FRkpDnXCB1v9SCBiZGEQrHiDT/Ig==
X-Received: by 10.36.94.66 with SMTP id h63mr663332itb.41.1487800578737; Wed,
	22 Feb 2017 13:56:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Wed, 22 Feb 2017 13:56:18 -0800 (PST)
In-Reply-To: <CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
	<20170222204736.GG3283@jama>
	<CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Wed, 22 Feb 2017 16:56:18 -0500
X-Gmail-Original-Message-ID: <CADNbA1pdESCdRAkKB2po-kZ2b26TMSQsas3u4vYFU=SKMOhVaQ@mail.gmail.com>
Message-ID: <CADNbA1pdESCdRAkKB2po-kZ2b26TMSQsas3u4vYFU=SKMOhVaQ@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, "Lamego,
	Jose A" <jose.a.lamego@intel.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Patchwork not picking changes from the ML Was: [oe] [meta-python][PATCH] python-paho-mqtt: update to version 1.2
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
X-List-Received-Date: Wed, 22 Feb 2017 22:01:28 -0000
Content-Type: multipart/alternative; boundary=001a11449c70fe165b054925903b

--001a11449c70fe165b054925903b
Content-Type: text/plain; charset=UTF-8

Martin - No problem.  I'll resend the patches.

Michael - Would it be worth waiting before I resend the change sets?  It
looks like at least a subset of them have made it through.

Thanks.

-Derek

On Wed, Feb 22, 2017 at 3:55 PM, Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> I've seen several issues with hooks. I was working on them yesterday and
> will continue today.
>
> These are currently managed by hand but we are moving them into
> configuration management which should help keep them working consistently.
>
> On Feb 22, 2017 12:47 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>
>> On Wed, Feb 22, 2017 at 12:45:36PM -0500, Derek Straka wrote:
>> > Signed-off-by: Derek Straka <derek@asterius.io>
>>
>> It's not your fault Derek, but most of the patches from today and based
>> on the pings from today also some earlier patches didn't make it into
>> patchwork. This one is the only exception.
>>
>> Michael, Jose: are you aware of some issues with patchwork? Could it be
>> caused by the default Reply-to change from yesterday (or day before
>> during OEDAM)?
>>
>> I know only about issues processing merged changes:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10967
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10759
>>
>> And also UI issue in patchwork that paging doesn't work, e.g.:
>> https://patchwork.openembedded.org/bundle/jama/master-next/?
>> submitter=&state=&q=&archive=both
>> shows that there are 5 pages of changes (which should be in most cases
>> marked as accepted by the hook above), but clicking on 2nd page produces
>> link which drops the query parameters:
>> https://patchwork.openembedded.org/bundle/jama/master-next/?page=2
>> so it says "No patches to display"
>>
>> Regards,
>>
>> > ---
>> >  .../python/{python-paho-mqtt_1.1.bb => python-paho-mqtt_1.2.bb}
>>  | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >  rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.1.bb
>> => python-paho-mqtt_1.2.bb} (68%)
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.
>> bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
>> > similarity index 68%
>> > rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
>> > rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
>> > index b8f5f3f..c8acfc5 100644
>> > --- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
>> > +++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
>> > @@ -11,5 +11,5 @@ RDEPENDS_${PN} = "\
>> >                 python-threading \
>> >  "
>> >
>> > -SRC_URI[md5sum] = "a6407b74eb5e5411e157be1de5c11366"
>> > -SRC_URI[sha256sum] = "0f7a629efe6e3a2c61b59d3550aa9
>> f2c4529b5689a65fde45e6f1ac36b9a261e"
>> > +SRC_URI[md5sum] = "241150b3fcb920ddca4d33181f3238b1"
>> > +SRC_URI[sha256sum] = "9100a6aa706ab699d414ec02705a2
>> 1eb66f436184691d0bf1f2a85a6213c6c1f"
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>

--001a11449c70fe165b054925903b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Martin - No problem.=C2=A0 I&#39;ll resend the patches.<di=
v><br></div><div>Michael - Would it be worth waiting before I resend the ch=
ange sets?=C2=A0 It looks like at least a subset of them have made it throu=
gh.</div><div><br></div><div>Thanks.</div><div><br></div><div>-Derek</div><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Feb =
22, 2017 at 3:55 PM, Michael Halstead <span dir=3D"ltr">&lt;<a href=3D"mail=
to:mhalstead@linuxfoundation.org" target=3D"_blank">mhalstead@linuxfoundati=
on.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
auto">I&#39;ve seen several issues with hooks. I was working on them yester=
day and will continue today.<div dir=3D"auto"><br></div><div dir=3D"auto">T=
hese are currently managed by hand but we are moving them into configuratio=
n management which should help keep them working consistently.</div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div class=3D=
"h5">On Feb 22, 2017 12:47 PM, &quot;Martin Jansa&quot; &lt;<a href=3D"mail=
to:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;=
 wrote:<br type=3D"attribution"></div></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div><div class=3D"h5">On Wed, Feb 22, 2017 at 12:45:36PM -0500, Derek Stra=
ka wrote:<br>
&gt; Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" t=
arget=3D"_blank">derek@asterius.io</a>&gt;<br>
<br>
It&#39;s not your fault Derek, but most of the patches from today and based=
<br>
on the pings from today also some earlier patches didn&#39;t make it into<b=
r>
patchwork. This one is the only exception.<br>
<br>
Michael, Jose: are you aware of some issues with patchwork? Could it be<br>
caused by the default Reply-to change from yesterday (or day before<br>
during OEDAM)?<br>
<br>
I know only about issues processing merged changes:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10967" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/sh=
ow_bug.cgi?id=3D10967</a><br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10759" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/sh=
ow_bug.cgi?id=3D10759</a><br>
<br>
And also UI issue in patchwork that paging doesn&#39;t work, e.g.:<br>
<a href=3D"https://patchwork.openembedded.org/bundle/jama/master-next/?subm=
itter=3D&amp;state=3D&amp;q=3D&amp;archive=3Dboth" rel=3D"noreferrer" targe=
t=3D"_blank">https://patchwork.openembedded<wbr>.org/bundle/jama/master-nex=
t/?<wbr>submitter=3D&amp;state=3D&amp;q=3D&amp;archive=3D<wbr>both</a><br>
shows that there are 5 pages of changes (which should be in most cases<br>
marked as accepted by the hook above), but clicking on 2nd page produces<br=
>
link which drops the query parameters:<br>
<a href=3D"https://patchwork.openembedded.org/bundle/jama/master-next/?page=
=3D2" rel=3D"noreferrer" target=3D"_blank">https://patchwork.openembedded<w=
br>.org/bundle/jama/master-next/?<wbr>page=3D2</a><br>
so it says &quot;No patches to display&quot;<br>
<br>
Regards,<br>
<br>
&gt; ---<br>
&gt;=C2=A0 .../python/{<a href=3D"http://python-paho-mqtt_1.1.bb" rel=3D"no=
referrer" target=3D"_blank">python-paho-mqtt_1<wbr>.1.bb</a> =3D&gt; <a hre=
f=3D"http://python-paho-mqtt_1.2.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-paho-mqtt_1.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/p<wbr>ython/{<a href=3D"http=
://python-paho-mqtt_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-pah=
o-mqtt_1.1.bb</a> =3D&gt; <a href=3D"http://python-paho-mqtt_1.2.bb" rel=3D=
"noreferrer" target=3D"_blank">python-paho-mqtt_1.2.bb</a>} (68%)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools<wbr>/python/<a href=3D"http:=
//python-paho-mqtt_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-paho=
-mqtt_1.1.<wbr>bb</a> b/meta-python/recipes-devtools<wbr>/python/<a href=3D=
"http://python-paho-mqtt_1.2.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-paho-mqtt_1.2.<wbr>bb</a><br>
&gt; similarity index 68%<br>
&gt; rename from meta-python/recipes-devtools/p<wbr>ython/<a href=3D"http:/=
/python-paho-mqtt_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-=
mqtt_1.1.bb</a><br>
&gt; rename to meta-python/recipes-devtools/p<wbr>ython/<a href=3D"http://p=
ython-paho-mqtt_1.2.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-mq=
tt_1.2.bb</a><br>
&gt; index b8f5f3f..c8acfc5 100644<br>
&gt; --- a/meta-python/recipes-devtools<wbr>/python/<a href=3D"http://pytho=
n-paho-mqtt_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-mqtt_1=
.1.<wbr>bb</a><br>
&gt; +++ b/meta-python/recipes-devtools<wbr>/python/<a href=3D"http://pytho=
n-paho-mqtt_1.2.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-mqtt_1=
.2.<wbr>bb</a><br>
&gt; @@ -11,5 +11,5 @@ RDEPENDS_${PN} =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-th=
reading \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;a6407b74eb5e5411e157be1de5c11<wbr>366&quot;=
<br>
&gt; -SRC_URI[sha256sum] =3D &quot;0f7a629efe6e3a2c61b59d3550aa9<wbr>f2c452=
9b5689a65fde45e6f1ac36b9<wbr>a261e&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;241150b3fcb920ddca4d33181f323<wbr>8b1&quot;=
<br>
&gt; +SRC_URI[sha256sum] =3D &quot;9100a6aa706ab699d414ec02705a2<wbr>1eb66f=
436184691d0bf1f2a85a6213<wbr>c6c1f&quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-devel mailing list<br>
&gt; <a href=3D"mailto:Openembedded-devel@lists.openembedded.org" target=3D=
"_blank">Openembedded-devel@lists.opene<wbr>mbedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-devel" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/=
<wbr>mailman/listinfo/openembedded-<wbr>devel</a><br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a><br>
<br></div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></font></span></blockquote></div></div>
</blockquote></div><br></div>

--001a11449c70fe165b054925903b--
