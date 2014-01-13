Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2296B5D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 14:31:09 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id va2so94153obc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 06:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Yjmxu+xK09fUQhJ6VJBVL51QQ4O7y5yEr7bwUnXJVhM=;
	b=rjrw7jWxp8hA0iI45aSMkROsJpnF0+X5oYiIQDcS8tBXRAJLT8VOXZImy3+nvJcSOe
	6r4phOJatRYSrgwL/5+tGkLKIXcChoSfkAucz52VFP8RdL+aqM0Os+Xue2l1dGZG70Qa
	rBJcn7wh+gqIplkoE/RiR8bgOJXyGOAdWFlNHhX8GURxMty1s1qSi3gGHxNIYcFLQXCS
	qXdgn0wLCRSK9SsSyk2h4r/vVYyDSM/oJxIEJh6pbpVSbuI3HfBG2gS3nVE6iBJgibYc
	5uWZLrB95AiVn2uC2v48bMi8KFuyEGFCW4EAeaRdD4qp6kcnDN94tWx2AMm6JjPTqcl3
	z3wg==
MIME-Version: 1.0
X-Received: by 10.60.98.40 with SMTP id ef8mr20842826oeb.13.1389623470335;
	Mon, 13 Jan 2014 06:31:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 13 Jan 2014 06:31:10 -0800 (PST)
In-Reply-To: <52D34B77.5010401@windriver.com>
References: <CAP9ODKpJzcrWy2RjpLJeS-KJCrNHYM+UPh2-NU9icnaBuJSSXA@mail.gmail.com>
	<52D34B77.5010401@windriver.com>
Date: Mon, 13 Jan 2014 12:31:10 -0200
X-Google-Sender-Auth: 80A0WIemNnljHzD1HqeO5LKhcOA
Message-ID: <CAP9ODKodgc_GussuVWxFHDK=zOmCiP2uyajmoJ8rce8Yh_nLfQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC bugfix backport into Dora
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
X-List-Received-Date: Mon, 13 Jan 2014 14:31:09 -0000
Content-Type: multipart/alternative; boundary=089e013a182252305c04efdaeda9

--089e013a182252305c04efdaeda9
Content-Type: text/plain; charset=ISO-8859-1

Hello Robert,

On Mon, Jan 13, 2014 at 12:12 AM, Robert Yang <liezhi.yang@windriver.com>wrote:
>
> I think that we need fix it in dora since gcc 4.8.1 is affected.
>

Do you have a patch for this already?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e013a182252305c04efdaeda9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra">Hello Robert,<br><br><div c=
lass=3D"gmail_quote">On Mon, Jan 13, 2014 at 12:12 AM, Robert Yang <span di=
r=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank=
">liezhi.yang@windriver.com</a>&gt;</span> wrote:<blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">

I think that we need fix it in dora since gcc 4.8.1 is affected.<br></block=
quote></div><div><br></div><div>Do you have a patch for this already?</div>=
<div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://code.ossystems.com.br" targ=
et=3D"_blank">http://code.ossystems.com.br</a><br><span>Mobile: +55 (53) 99=
81-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: <span id=3D"gc-number-242" class=3D"=
gc-cs-link" title=3D"Call with Google Voice">+1 (347) 903-9750</span></span=
><br>

</div></div>

--089e013a182252305c04efdaeda9--
