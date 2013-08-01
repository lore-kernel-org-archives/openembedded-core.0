Return-Path: <djszapi@archlinux.us>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 22F396B1EF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 16:38:52 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y11so2232073pdj.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 09:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=eepntFtUeRA6kjHXJkLhg126gICZkyy7zsDGnqnirn4=;
	b=AfbcCAdl9kjtcqGpRWvAnEKYYhTzXzKtjAW+NjZUdUdkyV+/ldeI8/lFzG9CjFgPQR
	UplisPmnKsOk8XBCw/RxnN414ZBMT+Msft6GU8fqx/H5f7WAqKVYhGEclFawFk47v4Zz
	YkJyNIPm+Yv0m+dYwmwESyhjo9+X1L/pJ36d4gH0HPXKGjLxhE1ATbrwab7hZ87oy0jo
	pCwHZhs/GqTCeBVXnVz0L5/xgbyvNA9wwxaKnNzjhajmw+DioZvRPWfPcEDqfyTm3ma9
	n+4YfjEbaHgUZziDeha72oyL5wPhBNlVrZnFJKSUCFN+yrDhQY6FL79HNOIfwZ0CBKiC
	ocWA==
MIME-Version: 1.0
X-Received: by 10.68.163.131 with SMTP id yi3mr3244888pbb.55.1375375132298;
	Thu, 01 Aug 2013 09:38:52 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Thu, 1 Aug 2013 09:38:52 -0700 (PDT)
In-Reply-To: <CAJTo0LaYiJsuJG6BNEHiCL8Ga+4EZ9S+vvAKRkiNyXQ16v1fMw@mail.gmail.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAOMwXhNbDzsi4=mBb+0=iqdxafnAezRsMvJbG1dPetCTMEhJQQ@mail.gmail.com>
	<CAJTo0LYPD48S3rjYPfh5HPyeuzxrx=ZiJOguz5doxjd2r3PAXw@mail.gmail.com>
	<CAOMwXhPi108Q0yWNPgZ-XfGA99+AUpaL+oPSH9W5yS8HhuZd3Q@mail.gmail.com>
	<CAJTo0LbVOSEz53G8TT0hn4UKyyhhJu6uacRb3XbCjnwBej7zGQ@mail.gmail.com>
	<CAOMwXhNfdQ_41HybptW0xgqBZhOGOx7pgdJ8M5F+qVs5Qd5vvA@mail.gmail.com>
	<CAJTo0LaYiJsuJG6BNEHiCL8Ga+4EZ9S+vvAKRkiNyXQ16v1fMw@mail.gmail.com>
Date: Thu, 1 Aug 2013 17:38:52 +0100
X-Google-Sender-Auth: kStjdL8dScF-Bq1BCjv3fc7WZ_g
Message-ID: <CAOMwXhNXO+ZDSh3Kt41g=K1Jo_EDGSGkX6-DUTHN1hMz3QF2yg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQk1B4KkdoRPZt4udvf9NRHQga/UFev4ItFeUnGY6VJia7t0ITuvJzEbvCm1+6ZOp7p/gmh3
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] u-boot: state the MACHINE when skipping u-boot
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
X-List-Received-Date: Thu, 01 Aug 2013 16:38:52 -0000
Content-Type: multipart/alternative; boundary=047d7bacb46e31a0e504e2e57a5e

--047d7bacb46e31a0e504e2e57a5e
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 1, 2013 at 5:35 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 1 August 2013 17:33, Laszlo Papp <lpapp@kde.org> wrote:
> >> I'm not sure what you meant here.  Do you mean a situation where the
> >> local.conf says MACHINE=foo and the user also sets MACHINE=foo in the
> >> environment?
> >
> > Yes.
>
> But there's nothing wrong with the user doing that at all.


Why do you think compilers warn in such use cases? Because they cannot know
if you are doing something silly, or something unintentional. It might just
well be that the user wanted to type something else, but got confused in
which case he might get a hard to debug issue later, or even if not hard,
it is additional issue due to his.

--047d7bacb46e31a0e504e2e57a5e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 1, 2013 at 5:35 PM, Burton, Ross <span dir=3D"=
ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.bu=
rton@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 1 August 2013 17:33, La=
szlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&gt; wrote:=
<br>

&gt;&gt; I&#39;m not sure what you meant here. =A0Do you mean a situation w=
here the<br>
&gt;&gt; local.conf says MACHINE=3Dfoo and the user also sets MACHINE=3Dfoo=
 in the<br>
&gt;&gt; environment?<br>
&gt;<br>
&gt; Yes.<br>
<br>
</div>But there&#39;s nothing wrong with the user doing that at all.</block=
quote><div><br></div><div>Why do you think compilers warn in such use cases=
? Because they cannot know if you are doing something silly, or something u=
nintentional. It might just well be that the user wanted to type something =
else, but got confused in which case he might get a hard to debug issue lat=
er, or even if not hard, it is additional issue due to his.</div>
</div></div></div>

--047d7bacb46e31a0e504e2e57a5e--
