Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id A9F8565C5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 20:07:24 +0000 (UTC)
Received: by qgii30 with SMTP id i30so10740897qgi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 13:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9RwTsXeYaLcqRm/jx/MO6KVl4H20e8jy+Lmbl0wDxT4=;
	b=PDdRtJdWCzZmQ9f2TBpLfYw2f+mRIqpYe/2uHGbDPPD+IgU9IfFOZ/JO/+ceTbDybH
	kPjersV3uluYnA/W+URc0ubVxQ9NZcXNbcA+4fP38ilbygFUfh/4iGbNrPcwqQweCVyV
	rbQAkJtW0EO+8r3Cyo7GxZjnu73ztDMn4nPYf1UgVauhSFLbn3P09RH0RGmmHJVtfQtj
	XhNRDgbb57vHLwtnr68OgUtVd8ARp/PTm+TUG/d08bXcfeuI6XLMApq39Ls+66E1Uucx
	Y7bJ/Il4dwqxeoXWUnNA8CXf2A6Ltg8klRGi1uI4J/9I5Z66FnZ0obDuQWV6n2NA4Rvo
	MrDQ==
X-Gm-Message-State: ALoCoQlTWAQWkEGTQxBdg+Vyj0kQJxSHIj277bVnCgocHLKQdW4p34WBkiRC9CQMEXMvb6E41/bY
X-Received: by 10.140.231.19 with SMTP id b19mr21730178qhc.22.1435608445113;
	Mon, 29 Jun 2015 13:07:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 29 Jun 2015 13:07:05 -0700 (PDT)
In-Reply-To: <AA8A0B9B-E310-4C1C-9DF9-884455D6FC14@mentor.com>
References: <1435602230-12093-1-git-send-email-drew_moseley@mentor.com>
	<20150629193248.GG2393@jama>
	<AA8A0B9B-E310-4C1C-9DF9-884455D6FC14@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jun 2015 21:07:05 +0100
Message-ID: <CAJTo0LbMs=Zz4TzsUqpbv-Wg9eWU29V2os5o6FZxcVBqPduAzw@mail.gmail.com>
To: "Moseley, Drew" <drew_moseley@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Add blank r600 PACKAGECONFIG
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
X-List-Received-Date: Mon, 29 Jun 2015 20:07:30 -0000
Content-Type: multipart/alternative; boundary=001a11c12f006870b60519ada39f

--001a11c12f006870b60519ada39f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29 June 2015 at 20:44, Moseley, Drew <drew_moseley@mentor.com> wrote:

> It=E2=80=99s very possible that this is not the best solution for the war=
ning.
> The line that sets the GALLIUMDRIVERS_LLVM33 variable right above the lin=
e
> I added is ultimately what I=E2=80=99m trying to have behave properly.  P=
reviously
> setting PACKAGECONFIG+=3D=E2=80=9Cr600=E2=80=9D was sufficient to enable =
this setting but
> with commit hash c2cbe0f60e6d19ab9a8321be74d636d2c36671a8 this now throws=
 a
> warning.  Any suggestions for a cleaner solution?
>

The problem is that the recipe overloads PACKAGECONFIG for it's own
purposes.  We either change that, or add the stub like you did.

(I almost mailed exactly what Martin did too...)

Ross

--001a11c12f006870b60519ada39f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 June 2015 at 20:44, Moseley, Drew <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:drew_moseley@mentor.com" target=3D"_blank">drew_moseley@mentor.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":41d" class=
=3D"a3s" style=3D"overflow:hidden">It=E2=80=99s very possible that this is =
not the best solution for the warning.=C2=A0 The line that sets the GALLIUM=
DRIVERS_LLVM33 variable right above the line I added is ultimately what I=
=E2=80=99m trying to have behave properly.=C2=A0 Previously setting PACKAGE=
CONFIG+=3D=E2=80=9Cr600=E2=80=9D was sufficient to enable this setting but =
with commit hash c2cbe0f60e6d19ab9a8321be74d636d2c36671a8 this now throws a=
 warning.=C2=A0 Any suggestions for a cleaner solution?<br></div></blockquo=
te></div><br>The problem is that the recipe overloads PACKAGECONFIG for it&=
#39;s own purposes.=C2=A0 We either change that, or add the stub like you d=
id.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(I=
 almost mailed exactly what Martin did too...)</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c12f006870b60519ada39f--
