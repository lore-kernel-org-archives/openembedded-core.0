Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id EDA3365D45;
	Sun, 20 Apr 2014 17:15:41 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id 10so2590590lbg.21
	for <multiple recipients>; Sun, 20 Apr 2014 10:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pkqWH1k8wpvA/b4dMLJSJW7XXeavkKrGhTpticlWFuE=;
	b=DzEUtc2MaxgwGP5HaSjSRUWCcydFJjj4jwjyo8vU4F4HPx56I7QiwkXxdK6LElJvJW
	LI3sWnmC1Tllco+oS/xNG9WAHetke5mtOfsnVYsI1glTfpFy38M8oBFx4pjyqwhvF8bu
	KMjUzUiYg4wAM0Io8MniuHJ+Dk5gN2/4NGoIJsF+E/bM+F/mgam+ciN6fwqm4XZgwqm5
	JLAqUegYE7IIY6srxNXRBiMUgeC31Aj2GWUIYiHJB6SgnipxnBC+BF6/Hm0fFHqk4p2W
	caiHskD0aGQXHoHWk19V/n8fnsM81zCRfM4r2UxCJC6s7181KkQWkjR1K5ixVcWjq9Sl
	AJNw==
MIME-Version: 1.0
X-Received: by 10.152.235.3 with SMTP id ui3mr23414979lac.2.1398014141296;
	Sun, 20 Apr 2014 10:15:41 -0700 (PDT)
Received: by 10.112.53.73 with HTTP; Sun, 20 Apr 2014 10:15:41 -0700 (PDT)
In-Reply-To: <CAPbeDCnP_Qr1fUS9MAFZ4mLCRcoNJ=M1n8Umx-8m6m0b8Sxm0w@mail.gmail.com>
References: <20140418183632.GG2486@jama>
	<CAPbeDCnP_Qr1fUS9MAFZ4mLCRcoNJ=M1n8Umx-8m6m0b8Sxm0w@mail.gmail.com>
Date: Sun, 20 Apr 2014 19:15:41 +0200
Message-ID: <CAPbeDCkwiD0ZKAYS=AAkUEQnZvVNvFjNAgqtmJ8mcW_HXSV_DA@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, test-dependencies 2014-04-18
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
X-List-Received-Date: Sun, 20 Apr 2014 17:15:44 -0000
Content-Type: multipart/alternative; boundary=001a1134630a4877ff04f77c889d

--001a1134630a4877ff04f77c889d
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 19, 2014 at 1:03 PM, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> On Fri, Apr 18, 2014 at 8:36 PM, Martin Jansa <martin.jansa@gmail.com>wrote:
>
>> And more importantly floating dependencies, reply here
>> when you start working on some of these.
>>
>> Found differences:
>> ccid/ccid/latest lost dependency on  flex
>> console-tools/console-tools/latest lost dependency on  flex
>>
>
> I'll have a go at resolving the console-tools/flex floating dep.
>

If I understand things correctly: libfl.so from flex provides default
implementations for yylex() and yywrap(). console-tools/loadkeys provides
its own implementations for these, so linking with libfl.so is not
necessary.

In order to remove the floating dependency I can patch to either remove
@LEXLIB@ from LDADD, or I can pass "-Wl,--as-needed" in LDFLAGS, both ways
seems to get rid of the dependency on libfl.

Any preferred way of handling this ?

/Jacob

--001a1134630a4877ff04f77c889d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
at, Apr 19, 2014 at 1:03 PM, Jacob Kroon <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jacob.kroon@gmail.com" target=3D"_blank">jacob.kroon@gmail.com</a>&gt=
;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">=
<div class=3D"gmail_quote"><div class=3D"">On Fri, Apr 18, 2014 at 8:36 PM,=
 Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.co=
m" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">And more importantly floating dependencies, =
reply here<br>
when you start working on some of these.<br>
<br>
Found differences:<br>
ccid/ccid/latest lost dependency on =C2=A0flex<br>
console-tools/console-tools/latest lost dependency on =C2=A0flex<br></block=
quote><div><br></div></div><div>I&#39;ll have a go at resolving the console=
-tools/flex floating dep.<br></div></div></div></div></blockquote><br></div=
>
<div class=3D"gmail_quote">If I understand things correctly: libfl.so from =
flex provides default implementations for yylex() and yywrap(). console-too=
ls/loadkeys provides its own implementations for these, so linking with lib=
fl.so is not necessary.<br>
<br>In order to remove the floating dependency I can patch to either remove=
 @LEXLIB@ from LDADD, or I can pass &quot;-Wl,--as-needed&quot; in LDFLAGS,=
 both ways seems to get rid of the dependency on libfl.<br><br></div><div c=
lass=3D"gmail_quote">
Any preferred way of handling this ?<br><br></div><div class=3D"gmail_quote=
">/Jacob<br></div></div></div>

--001a1134630a4877ff04f77c889d--
