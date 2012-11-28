Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TdqKv-000723-HB
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 23:42:37 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so10359852lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 14:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=0UayGIYTkAt53BJZmyY7rs1GB/DziNg2AbLBCE0w5zA=;
	b=uTkjxh42WygArcbLYeJRl38WmQS2TQWoSah2WLuQXi44402Xt/0S34fEE8LQiuDxNo
	cy0C4NWzUs8ohRI4FSx0PsbUNljKk8CkqmuC7jUDOU4QgF/gyKvOUmxR7jsCtT3ogYZt
	6zgzGbnNxgMecSFYGvui+O6DWGtmTtFx6Xj/XuJAiI6izn0fEaQKfCYzDtyjx7fyNdm9
	pGBRwEmgpMCg7zAN1mNMGhDaI90F0zB5Ln4NeCKmxC03U4r/u1O9ce71XIFPkIuSmEYc
	S9p8SoHgFbTs7WkWJ+pns/qlXzSGthzD3AeIGywARjXCQKhJU07TMWdtmLec/8y113Dp
	QKrw==
Received: by 10.152.124.111 with SMTP id mh15mr19581872lab.20.1354141698633;
	Wed, 28 Nov 2012 14:28:18 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.42.162 with HTTP; Wed, 28 Nov 2012 14:27:58 -0800 (PST)
In-Reply-To: <CABcZAN=m3EwpqUi8D_hmBzqHwsmVg6W+EUXm6Q3_geFgtsJyTA@mail.gmail.com>
References: <alpine.DEB.2.02.1211280631130.31857@oneiric>
	<CABcZAN=m3EwpqUi8D_hmBzqHwsmVg6W+EUXm6Q3_geFgtsJyTA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 28 Nov 2012 15:27:58 -0700
X-Google-Sender-Auth: qievfNFcWCVYyHCAZ2Tvm-H9Dxo
Message-ID: <CABcZAN=Z1y8ZsX9p8_eLhsDcyS+P6kYsoRjSgoE98-L9TaV6JA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: some simple questions/observations about package groups
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 22:42:37 -0000
Content-Type: multipart/alternative; boundary=f46d042f954eec2e5204cf95ae84

--f46d042f954eec2e5204cf95ae84
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 28, 2012 at 3:26 PM, Chris Larson <clarson@kergoth.com> wrote:

> p.s. as with other things i've put on my wish list, it would be great
>> if a variation of bitbake could list the available package groups.
>>
>
> Depending on whether you want the metadata package groups or the packages:
>
> bitbake -e <some core-image inheriting recipe> | grep PACKAGE_GROUP_


Erm, wrong button. To continue: or..

bitbake -s | grep packagegroup-

Also, to comment on something tangentially related from a different thread,
technically the PACKAGE_GROUP_ variables were the first to use the term as
far as I'm aware. *tasks* were then renamed to use that name as well, which
is where a bunch of the confusion probably got introduced.
-- 
Christopher Larson

--f46d042f954eec2e5204cf95ae84
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, Nov 2=
8, 2012 at 3:26 PM, Chris Larson <span dir=3D"ltr">&lt;<a href=3D"mailto:cl=
arson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&gt;</span> wro=
te:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"gmail_quote"><div class=3D"im"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">

<div>p.s. as with other things i&#39;ve put on my wish list, it would be gr=
eat<br>
if a variation of bitbake could list the available package groups.</div></b=
lockquote><div><br></div></div><div>Depending on whether you want the metad=
ata package groups or the packages:=C2=A0</div></div><br>bitbake -e &lt;som=
e core-image inheriting recipe&gt; | grep PACKAGE_GROUP_</blockquote>

</div><br>Erm, wrong button. To continue: or..</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">bitbake -s | grep packagegroup-</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also, to=
 comment on something tangentially related from a different thread, technic=
ally the PACKAGE_GROUP_ variables were the first to use the term as far as =
I&#39;m aware. *tasks* were then renamed to use that name as well, which is=
 where a bunch of the confusion probably got introduced.</div>

<div class=3D"gmail_extra">-- <br>Christopher Larson<br>
</div>

--f46d042f954eec2e5204cf95ae84--
