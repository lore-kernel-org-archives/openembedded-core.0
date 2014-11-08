Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id B08B86B7CA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 00:18:35 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id x12so3076006qac.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 16:18:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aF3twkypTeJykQYsAmFiukkX0hqOlws2TuZOjcuP1VQ=;
	b=Wpz4mppHM/aBKc5fXxDuA+lG2b0V4qykFWaQT1ATnCVsNTdSB1dbdPX8gT3+81yaAE
	38h+ZnuTTlY8F10CqZ6glUOolIkpNy5ncNOi0duzitsGye8h+Zuvw2eRTngOxRjAQO02
	GNjDQKWxK2x+ux7e21QtJSrqjsIID3XNEHLwckyTpVzqvDt2Y90urD7g/+2yIuCR8HlN
	BGVWMdWsT1GRcCmFOQHfofANuFYtaohuaG+dAJ2DmKFxS1MZjpscli6BcNMxYyQt2EJ1
	rSpd8ZCmrX47BZHjMvqAXna1Y7+D3ZUIyOzTjjif8BsCVV0rGy5zCGWY0Cqb4JF+bnR3
	gXew==
X-Gm-Message-State: ALoCoQkBercYocENHt0MPRv2Y41g19vtnUtJ4n/ZGbQ/PyvSyqZrXwpotgOiaQtFIWLX2Z8sHVZQ
X-Received: by 10.140.96.101 with SMTP id j92mr21134532qge.87.1415405916130;
	Fri, 07 Nov 2014 16:18:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 16:18:15 -0800 (PST)
In-Reply-To: <1415388117-227154-1-git-send-email-mark.hatle@windriver.com>
References: <1415388117-227154-1-git-send-email-mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 8 Nov 2014 00:18:15 +0000
Message-ID: <CAJTo0LapReh=rJ1t21B-0SqPHZ84r+a-inJFykxsb1Hmuo+y=g@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix intermittent failures during configure
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
X-List-Received-Date: Sat, 08 Nov 2014 00:18:40 -0000
Content-Type: multipart/alternative; boundary=001a113a9d8ad815e705074dde44

--001a113a9d8ad815e705074dde44
Content-Type: text/plain; charset=UTF-8

Hi Mark,

On 7 November 2014 19:21, Mark Hatle <mark.hatle@windriver.com> wrote:

> If configure or any of the components it uses from the shared work
> directory
> change, do_configure may fail.
>
> An existing do_preconfigure was created to handle these conditions, but
> a 'sed' operation was missed, and a call to gnu-configize was also missed.
>

This doesn't apply to master, can you rebase?

Cheers,
Ross

--001a113a9d8ad815e705074dde44
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Mark,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 7 November 2014 19:21, Mark Hat=
le <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.hatle@windriver.com" target=
=3D"_blank">mark.hatle@windriver.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div id=3D":16s" class=3D"a3s" style=3D"overflow:hidden">=
If configure or any of the components it uses from the shared work director=
y<br>
change, do_configure may fail.<br>
<br>
An existing do_preconfigure was created to handle these conditions, but<br>
a &#39;sed&#39; operation was missed, and a call to gnu-configize was also =
missed.</div></blockquote></div><br>This doesn&#39;t apply to master, can y=
ou rebase?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Cheers,</div><div class=3D"gmail_extra">Ross</div></div>

--001a113a9d8ad815e705074dde44--
