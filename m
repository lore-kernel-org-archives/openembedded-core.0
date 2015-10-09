Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 95EE7734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 08:01:15 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so59215575wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 01:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kKPxix8Nhg0RO47zqF9FzyvyQLW0dXGgK4Wx/s5Yv+Y=;
	b=YxBYeMcDEnIelKyoOtMaZcIda0c3RdJWDJH1arln1moaYvkANiKE+5k8IuLrN5dwJr
	gB/lb4z/jeDPbFfZiCxnlaAUE9RqJ7bFmPtTyJFQOPl+TSwkPWAYgUL3MnxzCffZ3VJd
	5DdeQlMEezzgxau+rLq5gqiagf7U5h6JOepaDk7GkxxHZ+tq6sqMd47MrWQ0VQlsMyF7
	VBoZdnbLBfelFPki23S2tq/kB1slNclJiErhZ+qLlBhfscgHCIFKxbDzO8jaAnfEFqyA
	temlPB0zt3FZpmLAF02I5iOXsBxG0Ws1vTXjh/c+J5++l+dTq0R8nYP5+MfnXY/yVT0B
	U55w==
X-Gm-Message-State: ALoCoQlTd31AVW038f2CPVxxMWo3ep7Vj7B79628SomtObFEgx/tKOqXiyhcDB588Se+PmE1TGFc
X-Received: by 10.194.9.97 with SMTP id y1mr14862287wja.84.1444377675346; Fri,
	09 Oct 2015 01:01:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Fri, 9 Oct 2015 01:00:45 -0700 (PDT)
In-Reply-To: <CALbNGRR58ahf=31eD0EP2430qsd1iEAdg0hShtXGbUm2i6uvvw@mail.gmail.com>
References: <1443789718-6846-1-git-send-email-jussi.kukkonen@intel.com>
	<560EA62E.5020901@opendreambox.org>
	<CAHiDW_FqJrLeBmqOCe_hK50WnV9qgWYLGMk+=+owp4Hrmkffnw@mail.gmail.com>
	<CALbNGRR58ahf=31eD0EP2430qsd1iEAdg0hShtXGbUm2i6uvvw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 9 Oct 2015 11:00:45 +0300
Message-ID: <CAHiDW_FzYihD+DXw7wStcb_1Pg75Aq9t97X0R2X-RWrSHbuXEA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: RDEPEND on libgl
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
X-List-Received-Date: Fri, 09 Oct 2015 08:01:18 -0000
Content-Type: multipart/alternative; boundary=047d7b5d8d9942d28e0521a762ed

--047d7b5d8d9942d28e0521a762ed
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 October 2015 at 10:19, Andreas M=C3=BCller <schnitzeltony@googlemail.c=
om>
wrote:

> I did some tests with this: On a simple gtk2/3 image starting a gtk3
> application crashes complaining libgl*.so cannot be found. I checked:
> It does not help to install egl/gles2 on the image: libepoxy relies on
> libgl.
>
> Isn't this a bug? I thought one of the targets of libepoxy is to
> abstract away different gl implementations under a common API. Or in
> other words: Does this mean that running gtk3 requires desktop OpenGL
> installed?
>

The reason I've not sent a patch yet is exactly what you describe: I've not
figured out yet if there's a bug somewhere or if they've essentially made
libGL.so.1 (or at least a full opengl implementation) part of the GTK
API... In any case I guess the dependency should actually be in gtk as
epoxy can't really know which GL libraries are going to be needed at
runtime.

 Jussi

--047d7b5d8d9942d28e0521a762ed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 9=
 October 2015 at 10:19, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=
=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@go=
oglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I did =
some tests with this: On a simple gtk2/3 image starting a gtk3<br>
application crashes complaining libgl*.so cannot be found. I checked:<br>
It does not help to install egl/gles2 on the image: libepoxy relies on<br>
libgl.<br>
<br>
Isn&#39;t this a bug? I thought one of the targets of libepoxy is to<br>
abstract away different gl implementations under a common API. Or in<br>
other words: Does this mean that running gtk3 requires desktop OpenGL<br>
installed?<br></blockquote><div><br></div><div>The reason I&#39;ve not sent=
 a patch yet is exactly what you describe: I&#39;ve not figured out yet if =
there&#39;s a bug somewhere or if they&#39;ve essentially made libGL.so.1 (=
or at least a full opengl implementation) part of the GTK API... In any cas=
e I guess the dependency should actually be in gtk as epoxy can&#39;t reall=
y know which GL libraries are going to be needed at runtime.</div><div><br>=
</div><div>=C2=A0Jussi</div></div></div></div>

--047d7b5d8d9942d28e0521a762ed--
