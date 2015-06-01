Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBBF73D8C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 15:18:47 +0000 (UTC)
Received: by qkhq76 with SMTP id q76so57036232qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jun 2015 08:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=zrdY3XRRbRTn+6R0NE7U49wD2QJ1yZKbpBTE3iWwdYY=;
	b=k2mYF3LvVA8Eba5qP+Bi5UwazoxALyuBfmoFV9hoGGTdvtir4HSl/7ROm+qqyv7do3
	X5A7cyWmnjD7KIGSFyZMma10XNbW5OY9zT8gRWofGy6ZEsJln68lZ0Uve62C/8jUzZCc
	cnygTGKB4NkcOn8Rm5PViSw/ZygX4bKfNQRlWQRqnmfDgv1aTwjhh1PGibR/A1iJ8OuD
	bIioXfoJOb+uaWVNTsqOZtxNalQBpL6Y9mLF9nz6M8B3ZV90iCGWqG4YQ8v9/ZEE7vkl
	/PcNWkQSdNaNs8soGghNcqPL6Yo6KfRvM5Tim5OoN0KqMDi8+mciTBUiyfuucvjljYiK
	blGA==
X-Received: by 10.55.20.17 with SMTP id e17mr38615435qkh.102.1433171929170;
	Mon, 01 Jun 2015 08:18:49 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.117 with HTTP; Mon, 1 Jun 2015 08:18:28 -0700 (PDT)
In-Reply-To: <555B0029.7030800@windriver.com>
References: <55555B65.80600@windriver.com>
	<3693019.ZXHb2MZYRx@peggleto-mobl.ger.corp.intel.com>
	<555AE1AB.8070907@windriver.com>
	<5994133.HlFem3UHYJ@peggleto-mobl.ger.corp.intel.com>
	<555B0029.7030800@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 1 Jun 2015 08:18:28 -0700
X-Google-Sender-Auth: HOtagXDiTDiV-HZWAZkQ0yUn_Qc
Message-ID: <CABcZANky0-8eaermaSJwZLm+45x0Nn-_JgymBKN=oKv0r6b2ig@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Add something like bitbake -cmenuconfig <recipe>?
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
X-List-Received-Date: Mon, 01 Jun 2015 15:18:50 -0000
Content-Type: multipart/alternative; boundary=001a1144d268bd8c9a051776574a

--001a1144d268bd8c9a051776574a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 2:19 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
>> As Chris was suggesting I'd rather we look at setting up a type
>> declaration
>> mechanism (possibly at the bitbake level?) and make use of that rather
>> than
>> creating something just for this UI where possible.
>>
>
> A type declaration mechanism also sounds good, but I'm afraid that
> it would make a lot of changes embed in the bbclass or conf files,
> but the build system itself doesn't need these changes, I'm not sure
> whether it is worth or not, our aim is just make OE easier for newbies.


That=E2=80=99s not correct. Typing is useful to check the validity of value=
s as
well as to simplify the creation of objects from strings in python code.
It=E2=80=99s not exclusively for a UI, that just happens to be an additiona=
l
benefit of using it.

I also agree with Paul, the knowledge of what variables should be visible
to the user in user interfaces should be held next to the variable
definitions in appropriate places, not a separate config file. A flag makes
a great deal of sense there. Specification of what variables we want the
user to be able to edit in the UI is really just a way of specifying which
variables are intended to be manipulated by the user, and this is valuable,
as it=E2=80=99d help the user know which variables are e.g. internal artifa=
cts of
classes, not intended for them to modify. So while it=E2=80=99s used by a U=
I, I
don=E2=80=99t think that knowledge is specific to a UI either, necessarily.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1144d268bd8c9a051776574a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 19, 2015 at 2:19 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><br>
As Chris was suggesting I&#39;d rather we look at setting up a type declara=
tion<br>
mechanism (possibly at the bitbake level?) and make use of that rather than=
<br>
creating something just for this UI where possible.<br>
</blockquote>
<br></span>
A type declaration mechanism also sounds good, but I&#39;m afraid that<br>
it would make a lot of changes embed in the bbclass or conf files,<br>
but the build system itself doesn&#39;t need these changes, I&#39;m not sur=
e<br>
whether it is worth or not, our aim is just make OE easier for newbies.</bl=
ockquote></div><br>That=E2=80=99s not correct. Typing is useful to check th=
e validity of values as well as to simplify the creation of objects from st=
rings in python code. It=E2=80=99s not exclusively for a UI, that just happ=
ens to be an additional benefit of using it.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">I also agree with Paul, the knowledg=
e of what variables should be visible to the user in user interfaces should=
 be held next to the variable definitions in appropriate places, not a sepa=
rate config file. A flag makes a great deal of sense there. Specification o=
f what variables we want the user to be able to edit in the UI is really ju=
st a way of specifying which variables are intended to be manipulated by th=
e user, and this is valuable, as it=E2=80=99d help the user know which vari=
ables are e.g. internal artifacts of classes, not intended for them to modi=
fy. So while it=E2=80=99s used by a UI, I don=E2=80=99t think that knowledg=
e is specific to a UI either, necessarily.<br>-- <br><div class=3D"gmail_si=
gnature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitB=
ake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engi=
neer, Mentor Graphics</div>
</div></div>

--001a1144d268bd8c9a051776574a--
