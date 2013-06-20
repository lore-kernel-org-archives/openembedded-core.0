Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 86F2961A47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 15:46:58 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wc20so7260343obb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 08:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=2FmKOpWJjoEly/PLOe6AcbbM8ecMOeUiCXi5QY+iYfA=;
	b=mMvTJ0ihuuGNQT/aeMLJFmD1bhkslMxnhhrQuRa6mToKQaida6ezfKMFOtkqOjr3aq
	UypPk+aYjCUoVQUsoSHblJ4OZnRt2Lf1h6yM9BmZ/rTJfLNp58dnmtFiXrJ99VHU+ZM8
	SD2d6rl4C+33knKBHOnv0MBDgv11JZN3kJSeod1HZszVJqcOLV1RGquYm+toyackIW34
	sMpdcitpwbowDGK0Ih4C2TMId3Dt6fD9RNBJYSTU1Br22+i4J56QuGp/NpZd4j860Lv2
	d7b8jiTn4ULvIyBRSJ0CNosQpAZyJqj7SnWpbLPXfMYNMsXObAIdtQ9tOHVWExqzyILd
	lVOA==
X-Received: by 10.182.230.198 with SMTP id ta6mr1782101obc.98.1371743219394;
	Thu, 20 Jun 2013 08:46:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.27.165 with HTTP; Thu, 20 Jun 2013 08:46:38 -0700 (PDT)
In-Reply-To: <1402287.LPEgl0HhT9@helios>
References: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
	<CAP71WjzvRgqYtJdBVt_epRVZ5bb4aVbPiEq8z4fw-EfEsnVgGg@mail.gmail.com>
	<1402287.LPEgl0HhT9@helios>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jun 2013 11:46:38 -0400
Message-ID: <CAP71WjyCZvkwDuCM0DGJRBaeCySZkeiuhB6GxKGRBfemjHgQRA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQkUvnDo1FTEWjHA8Or3mrLxUW/6BRBm6HP4f/qg91I/h3LglWv0hn3XGmQ/AD0AnKRirHr7
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with Qt5/mesa and eglfs
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
X-List-Received-Date: Thu, 20 Jun 2013 15:46:58 -0000
Content-Type: multipart/alternative; boundary=001a11c3311250be3704df97db69

--001a11c3311250be3704df97db69
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 20, 2013 at 11:42 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> I wasn't watching closely but my impression is there were a large number of
> changes associated with the mesa upgrade. Is the upgrade itself necessary
> for
> the fix?
>

no, i don't think so. I think we might be able to just update the patches
that deal with the X11/no X11 support. but i haven't tested that yet. i
just did a quick test by cherry picking the complete commit (e.g. mesa
upgrade) to verify that it's actually fixing my problem. now that i know it
does, i will try to just upgrade the patches without the mesa upgrade and
report how it goes.

nicolas

--001a11c3311250be3704df97db69
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jun 20, 2013 at 11:42 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton=
@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":206" style=3D"overflow:hidden">I=
 wasn&#39;t watching closely but my impression is there were a large number=
 of<br>


changes associated with the mesa upgrade. Is the upgrade itself necessary f=
or<br>
the fix?</div></blockquote></div><br>no, i don&#39;t think so. I think we m=
ight be able to just update the patches that deal with the X11/no X11 suppo=
rt. but i haven&#39;t tested that yet. i just did a quick test by cherry pi=
cking the complete commit (e.g. mesa upgrade) to verify that it&#39;s actua=
lly fixing my problem. now that i know it does, i will try to just upgrade =
the patches without the mesa upgrade and report how it goes.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">nicolas</di=
v></div>

--001a11c3311250be3704df97db69--
