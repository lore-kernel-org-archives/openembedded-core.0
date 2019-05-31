Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 611127E5F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 20:27:42 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id s19so10482661otq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 13:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=donyeq9Dr7dxa0GgmXAPOvPT1Iy6bG3+tI6uU9NHSB8=;
	b=IbfcWFOq+KBY7ZniwcrHqwnLT6zrLrzq+jGKwvplDe1m+mb47/mJNKTXn39U49x7Z0
	bETK68ZSJ2mD6nC6FFlJlJczG1A53ExvCjgi9ublq7srZXQGtkgLhycaVxV23n8KRl6r
	Cyo6zE3wz3/beEGBTl5EIA5PWF73YjJtvCMqHXC+NOUMP5oX4Jf/SriPoH8rQPwXEGfC
	QWAB3wroooMbWWi/WRUv1bmr7LMT1CnIIEl21q32DJDYpiZOSFc08I6HTkSp24rrfSqV
	JfYabQw+wUzqPKUVns08oijKUmjcYy+MgYnDOPH6VGMHXCwIhEl3dHxEyu53++NZtzMF
	RxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=donyeq9Dr7dxa0GgmXAPOvPT1Iy6bG3+tI6uU9NHSB8=;
	b=dAv5r99RNp4eppzoab8A1yEeUMw6whjzc6wBQH/Xp48DCB5cZ+2MBM6LX02vHYvUkI
	r6pQq2wZ3iYIAbN0cNQxBAemlTcO5ZOZehnCnwIdzZjVS9biIUpZur5+T+yS7Lguhk7Z
	TB4pDfoI20BaPMIT7ZmsokdkNWsoWrskbIPeyFTUqL5WTa6QDte5PWa++XxhDpVbJAcB
	CmCeLl0+ERyAjGKqyRPATtIjb3TotoubPdGG7G/FMd17YF4G/bcEXpDlrEi4IQr63V0n
	iCYaulO/cGpb6n5suAtU/WQaNoCagaMhJIALX4ZBlYlWoENDwKQXK666UCF+0zZHLqos
	7tSg==
X-Gm-Message-State: APjAAAVEs4N0fm1eaCpytG7siXQIiTqpV2guQ1jUbNfaaE38HYVC9fa9
	Glt6s3oE2cg0vebV5OMPSd9bNfuv4xzkYfjY5b8=
X-Google-Smtp-Source: APXvYqwv5UefYrwmU7by5FCGcRS4YI9MJp8tyUbhyELdm0MputfRtflInwvNeUHKCe6Fw4SAlYCSBv4aMmOOgPdC37c=
X-Received: by 2002:a05:6830:1541:: with SMTP id
	l1mr3348176otp.350.1559334463321; 
	Fri, 31 May 2019 13:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557628550.git.hongxu.jia@windriver.com>
	<892252c3c1961d471cdf37c67a811353ab495e0b.1557628550.git.hongxu.jia@windriver.com>
In-Reply-To: <892252c3c1961d471cdf37c67a811353ab495e0b.1557628550.git.hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 May 2019 22:27:41 +0200
Message-ID: <CANNYZj88dNfVa1DfXPFuOSHbeZw8BBhh8qgycLPgf=MM7s7pDg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] ncurses: fix incorrect UPSTREAM_CHECK_GITTAGREGEX
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
X-List-Received-Date: Fri, 31 May 2019 20:27:42 -0000
Content-Type: multipart/alternative; boundary="000000000000c5bc05058a34d859"

--000000000000c5bc05058a34d859
Content-Type: text/plain; charset="UTF-8"

On Sun, 12 May 2019 at 10:18, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> The upstream git tag has a `upstream/' prefix, such as:
> >>> import re
> >>> pattern = "upstream/(?P<pver>\d+(\.\d+)+(\+\d+)*)"
> >>> string = "upstream/6.1+20181013"
> >>> result = re.match(pattern, string)
> >>> result['pver']
> '6.1+20181013'
>

Have you checked with devtool that this actually works?

Before this commit:
alexander@alexander-box:~/development/poky$ devtool check-upgrade-status
ncurses
INFO: ncurses                   6.1             6.1+20181013    Hongxu Jia <
hongxu.jia@windriver.com> 7a97a7f937762ba342d5b2fd7cd090885a809835

After the commit:
alexander@alexander-box:~/development/poky$ devtool check-upgrade-status
ncurses
INFO: ncurses                   6.1             UNKNOWN_BROKEN  Hongxu Jia <
hongxu.jia@windriver.com>

The code in bitbake/lib/bb/fetch2/git.py actually splits each tag with '/'
as separator and takes only the last part for some reason, so those
prefixes are never a part of the string that is matched against regex.
I'll send a revert in a moment.

Alex

--000000000000c5bc05058a34d859
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 12 May 2019 at 10:18, Hongxu Jia &lt;<a href=3D"mailto:hongx=
u.jia@windriver.com">hongxu.jia@windriver.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">The upstream git tag has a `up=
stream/&#39; prefix, such as:<br>
&gt;&gt;&gt; import re<br>
&gt;&gt;&gt; pattern =3D &quot;upstream/(?P&lt;pver&gt;\d+(\.\d+)+(\+\d+)*)=
&quot;<br>
&gt;&gt;&gt; string =3D &quot;upstream/6.1+20181013&quot;<br>
&gt;&gt;&gt; result =3D re.match(pattern, string)<br>
&gt;&gt;&gt; result[&#39;pver&#39;]<br>
&#39;6.1+20181013&#39;<br></blockquote><div><br></div><div>Have you checked=
 with devtool that this actually works?</div><div><br></div><div> Before th=
is commit:</div><div>alexander@alexander-box:~/development/poky$ devtool ch=
eck-upgrade-status ncurses<br>INFO: ncurses =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 6.1+20181013 =C2=A0 =C2=A0Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@w=
indriver.com">hongxu.jia@windriver.com</a>&gt; 7a97a7f937762ba342d5b2fd7cd0=
90885a809835</div><div><br></div><div>After the commit:<br></div><div>alexa=
nder@alexander-box:~/development/poky$ devtool check-upgrade-status ncurses=
</div><div>INFO: ncurses =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 6.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNKNOWN_BROKEN =
=C2=A0Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia=
@windriver.com</a>&gt;=C2=A0 <br></div><div><br></div><div>The code in bitb=
ake/lib/bb/fetch2/git.py actually splits each tag with &#39;/&#39; as separ=
ator and takes only the last part for some reason, so those prefixes are ne=
ver a part of the string that is matched against regex.<br></div><div>I&#39=
;ll send a revert in a moment.</div><div><br></div><div>Alex<br></div><div>=
<br></div><div><br></div></div></div>

--000000000000c5bc05058a34d859--
