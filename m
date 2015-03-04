Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6BAE86017E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 15:20:37 +0000 (UTC)
Received: by qgfh3 with SMTP id h3so26415qgf.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 07:20:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GHwVisOYIqi5zFMyOLtCqUl9kfMMVqGapzP1eqTkkiM=;
	b=Z1IK+fI79wzq2hLZ7HCmXI70MbdeUcWqdo7rBJl3kHH/ehtUJ6Hyoa5fEs940AsZc/
	juGUhVGFAC3DtU2dsuXVaTJ5XHIxrSQeRZl3duntNq+GwFFz+e43dv1ntMQzmJVzN9Xt
	OeqsPiK3UhxrROWPIvD8ZWCaUo7AFow7jM8yCT90tUEOY6p1ollA3ASx1eNS7B3/+pKB
	pzDqCiNqCHYgrGdiKhfn7zhZJ2QNHWTl6SZtJthmrP40it5nlscmbXucGxeT46zG/r5+
	giU5raf7IHIaX0CnusgrCix/+vnFNOPrV9DZ4+/VjDrh3/F6vB3ME2pmqw04aQ24x7b2
	69PQ==
X-Gm-Message-State: ALoCoQmC7QVQmIjXk2ODXj37bxSuhAayjomI4wRTMoMj0ynoCOpFf/z7dPUKjfpcGNrebsHFRWjB
X-Received: by 10.55.15.25 with SMTP id z25mr7833740qkg.87.1425482438708; Wed,
	04 Mar 2015 07:20:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 4 Mar 2015 07:20:18 -0800 (PST)
In-Reply-To: <1424108217.25541.4.camel@linuxfoundation.org>
References: <1424108217.25541.4.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Mar 2015 15:20:18 +0000
Message-ID: <CAJTo0LY0eJWv6y-7MOE_9ty5jg+zzex146eqf91L2ays60d1ng@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Feature Freeze
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
X-List-Received-Date: Wed, 04 Mar 2015 15:20:40 -0000
Content-Type: multipart/alternative; boundary=001a1147537e64be32051077feb2

--001a1147537e64be32051077feb2
Content-Type: text/plain; charset=UTF-8

On 16 February 2015 at 17:36, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I have to admit I've lost track of time a bit however the calender says
> Milestone 3 (M3) finishes this week and that marks "feature freeze" for
> the release. Beyond this point we have M4 which which is targeted for
> bug fixing only, no extra features and no package upgrades in general.
>

Judging by the number of package upgrades on the list in the last few days
not everyone saw this, so I'll repeat it just to make sure:

Milestone 3 is closed, so OpenEmbedded-Core is now Feature Frozen.  Version
upgrades are considered features.  So, no more version upgrades from now
unless you have an *awesome* reason.

I'll be occasionally collating the version upgrades that get sent into a
"later" branch for basic testing but obviously the focus from now until
release is stabilising, fixing, and releasing.  It's probably preferable to
sit on any upgrades you were doing until we thaw so they can be sent
against master instead of needing to be rebased.

Regards,
Ross

--001a1147537e64be32051077feb2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 February 2015 at 17:36, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":1fl" class=3D"a3s" style=3D"overflow:hidden">I have to ad=
mit I&#39;ve lost track of time a bit however the calender says<br>
Milestone 3 (M3) finishes this week and that marks &quot;feature <span clas=
s=3D"il">freeze</span>&quot; for<br>
the release. Beyond this point we have M4 which which is targeted for<br>
bug fixing only, no extra features and no package upgrades in general.</div=
></blockquote></div><br>Judging by the number of package upgrades on the li=
st in the last few days not everyone saw this, so I&#39;ll repeat it just t=
o make sure:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Milestone 3 is closed, so OpenEmbedded-Core is now Feature Frozen.=
=C2=A0 Version upgrades are considered features.=C2=A0 So, no more version =
upgrades from now unless you have an *awesome* reason.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">I&#39;ll be occasionally c=
ollating the version upgrades that get sent into a &quot;later&quot; branch=
 for basic testing but obviously the focus from now until release is stabil=
ising, fixing, and releasing.=C2=A0 It&#39;s probably preferable to sit on =
any upgrades you were doing until we thaw so they can be sent against maste=
r instead of needing to be rebased.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Regards,</div><div class=3D"gmail_extra">Ross=
</div></div>

--001a1147537e64be32051077feb2--
