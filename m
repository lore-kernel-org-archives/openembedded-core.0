Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7708460167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 17:24:57 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id i13so10227462qae.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 09:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=elIZycWt3q/W8lgvfQnv8eLJG2AmK0nwUOgn1I2s3S8=;
	b=G7cJGqXtImUWiq7fLMczn5YbVcP0GuhxQiHhmBFniNteZ+y6jnGVFt8xxw+YidD/Hq
	mtSpa6pR9E1lgUJ2Qa6HoSbwNwfuj8Ro/CSqB98iZn6rS2Ih6o32swcYXbJoi2cu0ctG
	5kP6vuy6d3ZqS6wUtOEhDWL8XoIHUFHJ3ZHER9iGBNwbmMse7BAc8WppS1OV8iGn2XuO
	WFVjQnng9kUFlCPvgqTGWEsQMRp+ihkYGUo2C5sirCeKThrKPJCQ70ex7Jyy+CrVR9sl
	DaozB4kMp2eMv+x+HfzKGv9lQKf5byFgKZs0Un7cMJxfWOamG/XMf42UwWrFQ9179wZc
	Q/AA==
X-Gm-Message-State: ALoCoQlRXIZHd5+3VVRk9ZE4rc4LYEAggbF6nSSWdrtQVWgW2cfEjqldlcBcSDXaUPsplgNcHxm9
X-Received: by 10.140.109.244 with SMTP id l107mr4487004qgf.80.1415899497623; 
	Thu, 13 Nov 2014 09:24:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Thu, 13 Nov 2014 09:24:37 -0800 (PST)
In-Reply-To: <1415832933-372-1-git-send-email-wrobell@pld-linux.org>
References: <1415832933-372-1-git-send-email-wrobell@pld-linux.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Nov 2014 17:24:37 +0000
Message-ID: <CAJTo0LbHecBh1J3MqhpXzsrXmUv_963LS+VDD0Vrg_rzFukynQ@mail.gmail.com>
To: wrobell <wrobell@pld-linux.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Replace Python 3.3.x with Python 3.4.2
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
X-List-Received-Date: Thu, 13 Nov 2014 17:25:04 -0000
Content-Type: multipart/alternative; boundary=001a113b7e50980f780507c0ca1e

--001a113b7e50980f780507c0ca1e
Content-Type: text/plain; charset=UTF-8

Hi Artur,

On 12 November 2014 22:55, wrobell <wrobell@pld-linux.org> wrote:

> Replace Python 3.3.x with Python 3.4.2 (bug #6857)
>

This patch has long lines so didn't survive SMTP, can you push it to a git
repository somewhere?


> Despite further work needed, I hope this patch can be merged, so further
>
work on Python 3 support can be continued in smaller steps.
>

Personally I'd prefer to see a working Python 3.4 integrated in one go
instead of having a broken 3.4 integrated for an unknown about of time.
Hopefully anyone else who is interested in 3.4 can step up and work on the
outstanding issues now that this patch is public (which is another good
reason to have a public repo with this in).

Ross

--001a113b7e50980f780507c0ca1e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Artur,</div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On 12 November 2014 22:55, wrobel=
l <span dir=3D"ltr">&lt;<a href=3D"mailto:wrobell@pld-linux.org" target=3D"=
_blank">wrobell@pld-linux.org</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div id=3D":fj" class=3D"a3s" style=3D"overflow:hidden">Replace =
Python 3.3.x with Python 3.4.2 (bug #6857)</div></blockquote><div><br></div=
><div>This patch has long lines so didn&#39;t survive SMTP, can you push it=
 to a git repository somewhere?</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div id=3D":fj" class=3D"a3s" style=3D"overflow:hidden">Despite f=
urther work needed, I hope this patch can be merged, so further<br></div></=
blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":fj" class=3D"a3s" sty=
le=3D"overflow:hidden">
work on Python 3 support can be continued in smaller steps.</div></blockquo=
te></div><br>Personally I&#39;d prefer to see a working Python 3.4 integrat=
ed in one go instead of having a broken 3.4 integrated for an unknown about=
 of time.=C2=A0 Hopefully anyone else who is interested in 3.4 can step up =
and work on the outstanding issues now that this patch is public (which is =
another good reason to have a public repo with this in).</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113b7e50980f780507c0ca1e--
