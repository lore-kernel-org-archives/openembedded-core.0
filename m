Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id A6754610DC
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2013 12:08:19 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id q58so2395652wes.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Dec 2013 04:08:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HF3oQtklOXCIMz1+a+H/nNODAwf9bOy8ZdXZzAZE1jk=;
	b=G6hdLGuadHegHp/rZ/tquSTW1l+NmelpQWbp2BwfT/Qw+IofCswhe/7yXjnqUDBPpu
	wAfAhQR0OqYDUjc7Kr8xBoEGZ980a0YhbN06dUzqrdQE2F6lP8cJDibXMmWkKGT9LXVU
	fh/Qtkw3ImATfOZaq6ZUq9eThW7cdRfERD56qb9jjst0UJmCRcvUkgrIpFYcowr0vnXL
	V2PaqNWtOdroDn2kmpYwv4uvMOhfvhMoSzhLQCOZ16618kDf2PwWXGGHwzKrUTnPGLoz
	ECSXqY/ZJp7wHyreaKxv3aTJBa3JGWujUGBdSsAjYmx35E2sBShw9v/+y6o4NZxIs0WZ
	SVcg==
X-Gm-Message-State: ALoCoQntOgsBicztFUq4N7plDE79FCA/kzn2gaLnxhpPy5kC1R9zPN236iOA1g6Du2wTkJdp9VN8
X-Received: by 10.194.175.202 with SMTP id cc10mr11039685wjc.48.1386504498513; 
	Sun, 08 Dec 2013 04:08:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.150.199 with HTTP; Sun, 8 Dec 2013 04:07:58 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAP9ODKrK7e_TT84ZcW=ruiSCsdbGmgKkbpZum-sevn=mVTqZTA@mail.gmail.com>
References: <1386439921-11748-1-git-send-email-andrei@gherzan.ro>
	<CAP9ODKrK7e_TT84ZcW=ruiSCsdbGmgKkbpZum-sevn=mVTqZTA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sun, 8 Dec 2013 14:07:58 +0200
Message-ID: <CAK18fxEfLZQ2AViSCWO7h_Jo8bJyHt04qUuK_y6=F35P5H40fQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/1] libav: Add v9.10
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
X-List-Received-Date: Sun, 08 Dec 2013 12:08:20 -0000
Content-Type: multipart/alternative; boundary=089e013d0f481d200f04ed04bc88

--089e013d0f481d200f04ed04bc88
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Dec 8, 2013 at 1:42 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Sat, Dec 7, 2013 at 4:12 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > This version includes libavresample needed for packages like xbmc.
> > To use this version add:
> > PREFERRED_VERSION_libav = "9.10".
> > Removed git version as being an older version of a 9.X release.
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>
> Any reason to keep the old version? why not move to this release?
>
>
In upstream they keep maintaining two versions: 0.X and 9.X. Probably
because of some incompatibilities - don't have any tests that would sustain
this statement. So until somebody really uses 9.X and confirms that
everything works I would suggest keeping this setup.

-- 
*ag*

--089e013d0f481d200f04ed04bc88
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
un, Dec 8, 2013 at 1:42 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Sat, Dec 7, 2013 at 4:1=
2 PM, Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro">andrei@gherza=
n.ro</a>&gt; wrote:<br>


&gt; This version includes libavresample needed for packages like xbmc.<br>
&gt; To use this version add:<br>
&gt; PREFERRED_VERSION_libav =3D &quot;9.10&quot;.<br>
&gt; Removed git version as being an older version of a 9.X release.<br>
&gt;<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
<br>
</div>Any reason to keep the old version? why not move to this release?<br>=
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br></div><div>In upstream they keep maintaining two versions: 0.X =
and 9.X. Probably because of some incompatibilities - don&#39;t have any te=
sts that would sustain this statement. So until somebody really uses 9.X an=
d confirms that everything works I would suggest keeping this setup.</div>

</div><div><br></div>--=A0</div><div class=3D"gmail_extra"><b style=3D"colo=
r:rgb(51,51,51);font-family:Arial;text-align:center">ag</b>
</div></div>

--089e013d0f481d200f04ed04bc88--
