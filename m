Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
	[209.85.222.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7445F60B98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 22:05:41 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id g13so2878263uab.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 14:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GW5bc814wkeNqjjidGx5eXhy85DK3VPEJ+gnXErUmjI=;
	b=PdaJZ1FmjwG15wdhtSDqiU7bnFlWzMLHXKfsmu/ibDUnhi3csQem5HzybIiPkpZHN7
	IHfoWky9AqsVjfPoQq0mzCMgYfWC81EXyJ2yL6npofmYfMikMcYBRQFmahwbiS21nF6I
	zDcpR2TTLit0MOSRh1yVCthYeFv8w3FfvNtZu7iP3LOrq6lHw9Wx3YyeSIax7fVeRH6t
	CHBIRRW3E1ueoy60hcpem/Vzzul/uU/Cu9rKXm1/5sTujJBvRX5VMv8jCctntT42eauX
	0e5sqwBrvVFDPzEkowqDjqR2Di4xwH/aFeV2vYegVj3N6fPDD2WABAr/CXcFFaNaBwRt
	JKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GW5bc814wkeNqjjidGx5eXhy85DK3VPEJ+gnXErUmjI=;
	b=maGOHRvNCSYtVQN0zt3rqCY9tTE+trgF5jOl8/Pzae1TeZrCxUxhghDWdK2TvJ496D
	pavmmNgKUagkJErLp5v+D36vYyh2N1S+A6vxepNyM3ZY55ObrXMiXeJ9O3eVEsi9dzKQ
	/XzVDX2OBxlzVQQ5xKoJNPJRJgN/C8m87LnSntlQ3uAeJ9gleO8+YAbZvunus4hT++M+
	b/2e9fBP/5l3DY+cgHPMUClLsE7C1QdK00z+V0g6hhjLAI8O1/YltqfKUzYVDjmHGyIT
	pmuM1Uqn14ejlhSkmjcJBsK5CodkQgvPqUlTt0LKCft04ADQLq3hLiIMTsVG7RjJFsfv
	9/qw==
X-Gm-Message-State: APjAAAVI9jrHDbPPjZb7Sn0m+hkKma6JEHvkZ+iXsVVeYl6XjlZ++u5N
	+J3jHAb5HXkhWlIBUmuz1XAwtrbjdrIQMdydyLQ=
X-Google-Smtp-Source: APXvYqwv76zoGRWqKdjaXLj95Q05D9fFJW/P+vwHVo/il9F+j/h3/jAEsnLwsW/gIaLLjugSNKllnsJRMt5XqpTjpAA=
X-Received: by 2002:ab0:658d:: with SMTP id v13mr4204uam.71.1581631542231;
	Thu, 13 Feb 2020 14:05:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
	<CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
	<CANNYZj_C7i+2QKaFqjiDh0DFYYuYO7eY72wTR9NKz9JEjDtjCA@mail.gmail.com>
	<CAMKF1sot=-RJ0O-HLQRHWsi4OUHhUKsyi9WzoZiXOJrvaX_QGw@mail.gmail.com>
	<CANNYZj_7pG5EGjOR2BW3beJ3J__37GR29XZFaRotvuG9KFCnOQ@mail.gmail.com>
	<CAMKF1sp_fEAyuGxgxUG=bXuVEMm01NG+g6Vqz29Pseht0nPQDw@mail.gmail.com>
In-Reply-To: <CAMKF1sp_fEAyuGxgxUG=bXuVEMm01NG+g6Vqz29Pseht0nPQDw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2020 23:05:30 +0100
Message-ID: <CANNYZj_tT5QSvyqhk-dOThThcO-rM-jT6PrTwM4pt8y7sPVSxQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Thu, 13 Feb 2020 22:05:41 -0000
Content-Type: multipart/alternative; boundary="0000000000003d8678059e7c4ac0"

--0000000000003d8678059e7c4ac0
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Feb 2020 at 22:37, Khem Raj <raj.khem@gmail.com> wrote:

>
>> Merging these patches will exclude rpm from images, and so will mask the
>> issue, so it's not orthogonal.
>>
>
> are you actively working to fix the test case ?
> In that case it would be justified to hold them
>

The test case that is failing for you (with ipk/opkg and
core-image-sato-sdk) is passing just fine on the autobuilder [1], so I am
missing information on how to reproduce. I have requested this information
from you here [2] and got no answer so far. Or is it some other test that
is failing? That isn't entirely clear.

[1]
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/1554/steps/8/logs/step1c

[2]
http://lists.openembedded.org/pipermail/openembedded-core/2020-February/292774.html

Alex

--0000000000003d8678059e7c4ac0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 13 Feb 2020 at 22:37, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quo=
te"><br><div>Merging these patches will exclude rpm from images, and so wil=
l mask the issue, so it&#39;s not orthogonal.</div><div></div></div></div><=
/blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">are you actively =
working to fix the test case ?</div><div dir=3D"auto">In that case it would=
 be justified to hold them</div></div></div></blockquote><div><br></div><di=
v>The test case that is failing for you (with ipk/opkg and core-image-sato-=
sdk) is passing just fine on the autobuilder [1], so I am missing informati=
on on how to reproduce. I have requested this information from you here [2]=
 and got no answer so far. Or is it some other test that is failing? That i=
sn&#39;t entirely clear.<br></div><div><br></div><div>[1] <a href=3D"https:=
//autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/1554/steps/8/lo=
gs/step1c" target=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#=
/builders/76/builds/1554/steps/8/logs/step1c</a></div><div><br></div><div>[=
2] <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/202=
0-February/292774.html" target=3D"_blank">http://lists.openembedded.org/pip=
ermail/openembedded-core/2020-February/292774.html</a></div><div><br></div>=
<div>Alex<br></div></div></div>

--0000000000003d8678059e7c4ac0--
