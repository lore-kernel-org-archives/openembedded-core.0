Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1387E72FB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 22:08:54 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id z127so8349494lfa.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y0AhSyNL+pSPTD3V8mHjZC+6U7X6n3ftBqH8/mSNE5c=;
	b=AueK3RVPiQPjNfapyDcb6uE1jyA26n61OrZBK4ukGwc7uFFarQniJzWqhxA9erRShE
	P1BU+sMxe8jAqGiS/9hA4ZBhA/wXJuO1jyei9gemUUaYo37v022BzhJbHxl70ncsiQvP
	Cy50Ih0xw1NTIrhM1Fu8UDF6t4/9cqxIihTe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y0AhSyNL+pSPTD3V8mHjZC+6U7X6n3ftBqH8/mSNE5c=;
	b=hb40ETDg76wGw25OnlW1Ptr1b+g1EgB/vCfCouKU3a37YN2h1gDB0PSS5sZWGOLGP7
	3BhTnpklqhiOOjRoax9geyN4WTILWDpyMHql2pVfimf1hcE9Iy5Y8Bc10zEGYSfw3Ku5
	IYEasyk7HTe0RR9Cvl0YY9vYwjG/EnL4yKhgfV0iWx+53JJBGu7bVxZWmEAY0y9x7TD+
	ChKktoZvt/tJHj+TZ3zMv/D0Rvhr6QucBfiUZyv4rOtE0PKboi22AiWu+V/9qlQl7ICd
	DAXdAjnMtC22qhx3bVsaQYffh1CNhYPd8kZq6OIESr2AdEqaviHcoUz9U9kK4rz9YTxm
	xCdw==
X-Gm-Message-State: AMke39kY4cmtujFcglrkp8720+S6g2zUTnJIy4YDywSbEyxNp30L+ouqJmjNJNds0z1gsN6HVqMLFlHfcmuda5LA
X-Received: by 10.46.22.10 with SMTP id w10mr9209178ljd.65.1487801335535; Wed,
	22 Feb 2017 14:08:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.156.10 with HTTP; Wed, 22 Feb 2017 14:08:55 -0800 (PST)
In-Reply-To: <CADNbA1pdESCdRAkKB2po-kZ2b26TMSQsas3u4vYFU=SKMOhVaQ@mail.gmail.com>
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
	<20170222204736.GG3283@jama>
	<CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
	<CADNbA1pdESCdRAkKB2po-kZ2b26TMSQsas3u4vYFU=SKMOhVaQ@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 22 Feb 2017 14:08:55 -0800
Message-ID: <CADfgfob+LnNAAqW6mKayt4N5CRz8LbwfAq7hUu8APMhjqiz5pQ@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"Lamego, Jose A" <jose.a.lamego@intel.com>
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
X-List-Received-Date: Wed, 22 Feb 2017 22:08:56 -0000
Content-Type: multipart/alternative; boundary=f403045fb52619f701054925be4b

--f403045fb52619f701054925be4b
Content-Type: text/plain; charset=UTF-8

On Feb 22, 2017 1:56 PM, "Derek Straka" <derek@asterius.io> wrote:

Martin - No problem.  I'll resend the patches.

Michael - Would it be worth waiting before I resend the change sets?  It
looks like at least a subset of them have made it through.


Please wait while I make sure this problem is correctly resolved before
re-sending. I'll e-mail once we're ready.


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
>> > diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.b
>> b b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
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

> Michael: one syntax error in patchwork code was pulled into production
> yesterday. This is the cause for missing patches. The error is fixed in
> the Yocto repo now, please perform a server code update ASAP.


Leo and I pulled changes and restarted so this should be in place now.

--f403045fb52619f701054925be4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Feb 22, 2017 1:56 PM, &quot;Derek Straka&quot=
; &lt;<a href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius=
.io</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail-m_-15=
1223519105699603quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Martin - No problem=
.=C2=A0 I&#39;ll resend the patches.<div><br></div><div>Michael - Would it =
be worth waiting before I resend the change sets?=C2=A0 It looks like at le=
ast a subset of them have made it through.</div><div></div></div></blockquo=
te></div></div></div><div dir=3D"auto"><br></div><div>Please wait while I m=
ake sure this problem is correctly resolved before re-sending. I&#39;ll e-m=
ail once we&#39;re ready.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail-m_-151223519105699603quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div=
><br></div><div>Thanks.</div><font color=3D"#888888"><div><br></div><div>-D=
erek</div></font></div><div class=3D"gmail-m_-151223519105699603elided-text=
"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Feb 22,=
 2017 at 3:55 PM, Michael Halstead <span dir=3D"ltr">&lt;<a href=3D"mailto:=
mhalstead@linuxfoundation.org" target=3D"_blank">mhalstead@linuxfoundation.=
org</a><wbr>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"auto">I&#39;ve seen several issues with hooks. I was=
 working on them yesterday and will continue today.<div dir=3D"auto"><br></=
div><div dir=3D"auto">These are currently managed by hand but we are moving=
 them into configuration management which should help keep them working con=
sistently.</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote"><div><div class=3D"gmail-m_-151223519105699603m_-6994627504914321943h5=
">On Feb 22, 2017 12:47 PM, &quot;Martin Jansa&quot; &lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wr=
ote:<br type=3D"attribution"></div></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div><div class=3D"gmail-m_-151223519105699603m_-6994627504=
914321943h5">On Wed, Feb 22, 2017 at 12:45:36PM -0500, Derek Straka wrote:<=
br>
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
t/?<wbr>submitter=3D&amp;state=3D&amp;q=3D&amp;archive=3Db<wbr>oth</a><br>
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
-mqtt_1.1.b<wbr>b</a> b/meta-python/recipes-devtools<wbr>/python/<a href=3D=
"http://python-paho-mqtt_1.2.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-paho-mqtt_1.2.b<wbr>b</a><br>
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
.1.b<wbr>b</a><br>
&gt; +++ b/meta-python/recipes-devtools<wbr>/python/<a href=3D"http://pytho=
n-paho-mqtt_1.2.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-mqtt_1=
.2.b<wbr>b</a><br>
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
<br></div></div><span class=3D"gmail-m_-151223519105699603m_-69946275049143=
21943HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></font></span></blockquote></div></div>
</blockquote></div><br></div>
</div></blockquote></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<br><span style=3D"font-size:12.8px">Michael: one syntax error in patchwork=
 code was pulled into production<br></span><span style=3D"font-size:12.8px"=
>yesterday. This is the cause for missing patches. The error is fixed in<br=
></span><span style=3D"font-size:12.8px">the Yocto repo now, please perform=
 a server code update ASAP.</span></blockquote><div><br></div><div>Leo and =
I pulled changes and restarted so this should be in place now.</div></div><=
div class=3D"gmail_extra"><br></div></div></div>
</div>

--f403045fb52619f701054925be4b--
