Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id BF356700FD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 17:21:48 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id u64so68438157lff.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nG6V4mveueWz9d8oEI4AA3xIaVnxujpWMTf6GaTZkvQ=;
	b=p+yEun54tFpyYlRV6fGIlM89heLxb4SZ2bxu/xisFAItA8KCRIZw0oJBwqmFcFRhd8
	brAC0ZiC5X/CVp5j+hd6/+D6QlUamOlb9seutWmgVnhVF3pKPQvXMURhXzTVWWOBcgi/
	k+WmOvInxmFiyrMh7pyIwIUN/2/12KL4i7+9v71cVXFpSkbTjDSfP1nFE47lk8rR2FBu
	L02+0/ErQGW8OlA1KC9JjOdFzKhgr4yIvKUEDn/Fjjyvf2Gkn9MdhQjZpTx8+GZHhWsm
	m1HtcP5aelY6SFSg+CoyhQw/LEWAprGUHIMHZhpTjHrKzQKvyD5vmFwerzS3SPZhZQQL
	WtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nG6V4mveueWz9d8oEI4AA3xIaVnxujpWMTf6GaTZkvQ=;
	b=fd4toPje2WcRKPKHGBEZOc32CAoDmORdrkicRo5lfO1HRfQPZbpRhEN39AWdYiuGlp
	Y9q+8w9DCguQj+vNeo79sPLLP3VzhACAS1b79ys8N7ZBQCWjycq16aIV//4tpPhzSVCy
	bTJf8N7U8IzJm0+z5ted+pVLgc4E2oieOFIpi8qjzlZORFoAMJKCzzsLb/JwETqUnyxg
	Mf2j9Ut4a1OMfth0G07Qiym9omMcWHegMurtzB8NH65pmLpzw8mezmYYuAGl2aBSAs8V
	Xm7i8WUEV9jJzi6K207JdTqDuVma+w0w0OyCvgGFnT7jWvunCTfTWyWAakFLL4PH0znh
	f8fg==
X-Gm-Message-State: AOPr4FUxGWUrnLXR7CZpSdPeYMgrmaNgw3FucdA922jaJ3Q3HhbNPfkNY6V7o73FCo5hJ9dpaXSpTT02mmnGhg==
X-Received: by 10.25.146.6 with SMTP id u6mr4111732lfd.60.1462382507840; Wed,
	04 May 2016 10:21:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.22.193 with HTTP; Wed, 4 May 2016 10:21:18 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
In-Reply-To: <20160504170600.GA14676@jupiter.localdomain>
References: <CAAPZna1xLfbyYUKa+qcLfeGCv=mqg7JwWtirfAbqfM+TCu5m7g@mail.gmail.com>
	<20160504143806.GA12969@jupiter.localdomain>
	<CAAPZna1M5ibZ8J2vOZ5PmJqAHVwNn=vR8mKrmYmuQ-YdLWopfw@mail.gmail.com>
	<20160504150732.GB12969@jupiter.localdomain>
	<CAAPZna2QkDzsa19=2rrKvypXpN-NOj02X724YVhm6Y+f8RdVXQ@mail.gmail.com>
	<20160504170600.GA14676@jupiter.localdomain>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 4 May 2016 14:21:18 -0300
Message-ID: <CAAPZna0WB0OjbEzo7eh6NctTcrm78O+fAtnFNwb-Ksgscg1x7w@mail.gmail.com>
To: Brendan Le Foll <brendan.le.foll@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: npm class usage
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
X-List-Received-Date: Wed, 04 May 2016 17:21:52 -0000
Content-Type: multipart/alternative; boundary=001a11402948e7ea34053207750c

--001a11402948e7ea34053207750c
Content-Type: text/plain; charset=UTF-8

I think that meta-brendan-nodepkgs link could be on npm.bbclass file as
documentation and example of use, would be helpfully.

On Wed, May 4, 2016 at 2:06 PM, Brendan Le Foll <brendan.le.foll@intel.com>
wrote:

> On Wed, May 04, 2016 at 02:01:40PM -0300, Fabio Berton wrote:
> >    Yes, it helps.
> >    Now I see my error... I need to use
> >    SRC_URI = "npm://[1]registry.npmjs.org;name=${PN};version=${PV}"
> >    My recipe it's getting sources from github and not from registry.
> >    Thanks!
>
> No problem. FYI I have some examples here:
> https://github.com/arfoll/meta-brendan-nodepkgs
>
> They show usage of shrinkwrap and lockdown etc... It's not
> particularly useful or used but really it's my test layer so feel free
> to submit any other modules you think are helpful/useful.
>
> Cheers,
> Brendan
>

--001a11402948e7ea34053207750c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">I think that meta-brendan-nodepkgs link could =
be on npm.bbclass file as documentation and example of use, would be helpfu=
lly.<br>
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On We=
d, May 4, 2016 at 2:06 PM, Brendan Le Foll <span dir=3D"ltr">&lt;<a href=3D=
"mailto:brendan.le.foll@intel.com" target=3D"_blank">brendan.le.foll@intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">On Wed, May 04, 2016 at 02:01:40PM -0300, Fabio Berton wrote:<br>
&gt;=C2=A0 =C2=A0 Yes, it helps.<br>
&gt;=C2=A0 =C2=A0 Now I see my error... I need to use<br>
</span>&gt;=C2=A0 =C2=A0 SRC_URI =3D &quot;npm://[1]<a href=3D"http://regis=
try.npmjs.org" rel=3D"noreferrer" target=3D"_blank">registry.npmjs.org</a>;=
name=3D${PN};version=3D${PV}&quot;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 My recipe it&#39;s getting sources from =
github and not from registry.<br>
&gt;=C2=A0 =C2=A0 Thanks!<br>
<br>
</span>No problem. FYI I have some examples here:<br>
<a href=3D"https://github.com/arfoll/meta-brendan-nodepkgs" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/arfoll/meta-brendan-nodepkgs</a><b=
r>
<br>
They show usage of shrinkwrap and lockdown etc... It&#39;s not<br>
particularly useful or used but really it&#39;s my test layer so feel free<=
br>
to submit any other modules you think are helpful/useful.<br>
<br>
Cheers,<br>
Brendan<br>
</blockquote></div><br></div>

--001a11402948e7ea34053207750c--
