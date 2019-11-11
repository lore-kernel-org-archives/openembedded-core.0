Return-Path: <ryan.harkin@linaro.org>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id F3F377F9B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:54:55 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id i19so10766408qki.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 02:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jdQ5yG2Mgjmzu5E0h6pKB+31G2jZONJyOnK7yYo/KwU=;
	b=n7sNlzfWPSpM34zZ76jYR/XGc2h/iBu0EVOsN3kR36buShD1raBEwt5q1qVpZ//71R
	lH7SiEAL6tTHgG8NruOLxBGL8V5Ex9MLFynwXduDoPgK82yqCbSiMD7gPnGG6mRp8XDB
	4RWlk6MqiFteQA216yFojynGgxvjwvqcPdablRO1sHk9fpI6cDSZjQyZ2Q9eg0WVLKYR
	VWmUNa92Z3POqbXdGoBpyAaqe+Smgc8xkgqvpZ0qV+6/3ZBhGtWcdjFhIQ9GEVYGM7Od
	0eBUmTYXGY2Asy94qk8ea8PhQO7yu19L8zPoDOuD1Ozx/YhfMUO+IokbMrC1QntliKg2
	fjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jdQ5yG2Mgjmzu5E0h6pKB+31G2jZONJyOnK7yYo/KwU=;
	b=MCtzyNac9FbMMdfy0UYHY37jW/X5rEyxqALPTJJzRIwYgoCdAUkkf3FhA5iGPu6IKN
	dWXMmsoEXdQIUYBQ26DsqrXdPrT+7PK5K3wpShtIs4/y77+7h+W2FzAGMyyOOTi//6mn
	YOXpXkJyM28cXUFVRaKU6gVdNZJc/XLfdxRnzm3G2/+MppXU28SdpJYoXZgBuBdc44UH
	pkEmn+sbbxQl8nM9eLsLLTy0asegdH6V9rKz2f5Xyq51tfPvWng7FS1OOLK69BF5KjRS
	bhctOcar71eD0qabEuTePT5UU2qzr+8L4keljfE2+ZW4k0lBqXUCYF4qdX79Em2QzNcq
	XVtg==
X-Gm-Message-State: APjAAAVATGs5HcSh70Ai8Bg2aAJOHV8qiXE9FzwhS9x8hj2m7adXgNuB
	piIJ7SIVos6WuXiQ3onzvlYzfCViB7Qg5jmy+E2KUw==
X-Google-Smtp-Source: APXvYqzEUhoK4aWcDIT876ATJicIxLZ6U2U+2FxvXu/MtUXTwki53IhCyvG/5+99dqt6bhjZi/qm5caDH0lziUtzv+M=
X-Received: by 2002:a05:620a:12b2:: with SMTP id
	x18mr10039366qki.437.1573469696598; 
	Mon, 11 Nov 2019 02:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20190925122349.14872-1-ross.burton@intel.com>
	<CAD0U-hJLV7F3K4VdX0GUKO9LRazWLz1rvp1xmWh6fzgzP3gcFQ@mail.gmail.com>
	<20191106160618.GC2398@hiutale>
	<e3de40a47b9b208f08c3123ad59c8caf25d581d6.camel@linuxfoundation.org>
	<20191107075931.GD2398@hiutale>
	<CAD0U-hK2UWoMU9kih_EtRTVRFKFscXFYpQhbHV_aRgZ9m2+c4A@mail.gmail.com>
	<20191111080816.GY2398@hiutale>
In-Reply-To: <20191111080816.GY2398@hiutale>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Mon, 11 Nov 2019 10:54:45 +0000
Message-ID: <CAD0U-hJSkw4fa=T6vtEb66BDjM6QvMhY-fdJ0cV=AgmbGYwgZg@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: maintaining sumo (was Re: [PATCH][thud] cve-check: backport rewrite from master)
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
X-List-Received-Date: Mon, 11 Nov 2019 10:54:56 -0000
Content-Type: multipart/alternative; boundary="00000000000054bf5b05970ff6ec"

--00000000000054bf5b05970ff6ec
Content-Type: text/plain; charset="UTF-8"

Hi Mikko,

On Mon, 11 Nov 2019 at 08:08, <Mikko.Rapeli@bmw.de> wrote:
>
> Hi,
>
> On Thu, Nov 07, 2019 at 10:41:42AM +0000, Ryan Harkin wrote:
> <snip>
> > Not sure if it helps, but I have a Jenkins job that tests sumo on a
trigger
> > (there is one for Warrior also):
> >
> > https://ci.linaro.org/job/warp7-openembedded-sumo/
> >
> > eg. it was triggered when Armin's patch was merged yesterday.
> >
> > This builds Sumo, based on Linaro's OE-RPB distro for NXP WaRP7
> > (imx7s-warp). It then runs the build in our LAVA lab (although the
boards
> > have gone down recently, they're normally up). Once the boards are up
> > again, I'll add ptest to the job, to give it a more thorough workout.
I'll
> > also add the sumo-next branch to the list of build configurations.
>
> Could it make sense to also test sumo-next using this job?

Once the boards are recovered in the lab, I'll create sumo-next and
warrior-next trigger jobs and add a few more tests.

> Also, I would not mind
> seeing test trigger and result emails on this list as long as access to
logs and details
> is open to everyone.

I believe this is public. At least, I can see everything from a private
browser window where I'm not logged in. It's trivial for me to add this
mailing list to the job, although I wonder if it'll bounce due to the email
address not being subscribed? I don't have access to the inbox where the
LAVA emails are sent from (lava@validation.linaro.org). It may be possible
for the lab team to subscribe to the list, I'd have to raise a support
request.

>
> I checked the jenkins build job config and looks quite straight forward.
Did not see
> the actual target testing logs though.

That's because the boards have gone "bad" in the lab. Builds 16 and 17 are
still queued, waiting for a "good" board to run on. I've raised a support
ticket to recover the boards.

Build 15 was the last Sumo job to run, and it's been purged from Jenkins
since it's over 30 days old. However, our SQUAD and LAVA instances keep
their data forever (at the moment). The jobs are still available, if you
know where to find them.

The binaries have not been purged yet (pinned-manifest.xml will tell you
what was built):
  https://snapshots.linaro.org/openembedded/warp7/sumo/imx7s-warp/15/rpb/

SQUAD data for Sumo on WaRP7:
  https://qa-reports.linaro.org/warp7/warp7-bsp/build/16a83e5/

SQUAD results for Sumo build 15 on WaRP7:

https://qa-reports.linaro.org/warp7/warp7-bsp/build/16a83e5/testrun/1937355/

LAVA job for Sumo build 15 on WaRP7:
  https://validation.linaro.org/scheduler/job/1937355

Testing wise, I'm only really running boot testing at the moment. The test
job makes sure the board boots to the commandline. Then it attempts to run
"memtester", which isn't installed, so fails. I did that on purpose
originally, because I wanted to make sure my memtester test failed properly
when not installed. I should update that now I'm sure it works. Next it
runs badblocks across the rootfs partition (/dev/mmcblk1p2) in read-only
mode.

Regards,
Ryan.

>
>
> Cheers,
>
> -Mikko

--00000000000054bf5b05970ff6ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Mikko,<br><br>On Mon, 11 Nov 2019 at 08:08, &lt;<a href=
=3D"mailto:Mikko.Rapeli@bmw.de">Mikko.Rapeli@bmw.de</a>&gt; wrote:<br>&gt;<=
br>&gt; Hi,<br>&gt;<br>&gt; On Thu, Nov 07, 2019 at 10:41:42AM +0000, Ryan =
Harkin wrote:<br>&gt; &lt;snip&gt;<br>&gt; &gt; Not sure if it helps, but I=
 have a Jenkins job that tests sumo on a trigger<br>&gt; &gt; (there is one=
 for Warrior also):<br>&gt; &gt;<br>&gt; &gt; <a href=3D"https://ci.linaro.=
org/job/warp7-openembedded-sumo/">https://ci.linaro.org/job/warp7-openembed=
ded-sumo/</a><br>&gt; &gt;<br>&gt; &gt; eg. it was triggered when Armin&#39=
;s patch was merged yesterday.<br>&gt; &gt;<br>&gt; &gt; This builds Sumo, =
based on Linaro&#39;s OE-RPB distro for NXP WaRP7<br>&gt; &gt; (imx7s-warp)=
. It then runs the build in our LAVA lab (although the boards<br>&gt; &gt; =
have gone down recently, they&#39;re normally up). Once the boards are up<b=
r>&gt; &gt; again, I&#39;ll add ptest to the job, to give it a more thoroug=
h workout. I&#39;ll<br>&gt; &gt; also add the sumo-next branch to the list =
of build configurations.<br>&gt;<br>&gt; Could it make sense to also test s=
umo-next using this job?<br><br>Once the boards are recovered in the lab, I=
&#39;ll create sumo-next and warrior-next trigger jobs and add a few more t=
ests.<br>=C2=A0<br>&gt;=C2=A0Also, I would not mind<br>&gt; seeing test tri=
gger and result emails on this list as long as access to logs and details<b=
r>&gt; is open to everyone.<br><br>I believe this is public. At least, I ca=
n see everything from a private browser window where I&#39;m not logged in.=
 It&#39;s trivial for me to add this mailing list to the job, although I wo=
nder if it&#39;ll bounce due to the email address not being subscribed? I d=
on&#39;t have access to the inbox where the LAVA emails are sent from (<a h=
ref=3D"mailto:lava@validation.linaro.org">lava@validation.linaro.org</a>). =
It may be possible for the lab team to subscribe to the list, I&#39;d have =
to raise a support request.<br><br>&gt;<br>&gt; I checked the jenkins build=
 job config and looks quite straight forward. Did not see<br>&gt; the actua=
l target testing logs though.<br><br>That&#39;s because the boards have gon=
e &quot;bad&quot; in the lab. Builds 16 and 17 are still queued, waiting fo=
r a &quot;good&quot; board to run on. I&#39;ve raised a support ticket to r=
ecover the boards.<br><br>Build 15 was the last Sumo job to run, and it&#39=
;s been purged from Jenkins since it&#39;s over 30 days old. However, our S=
QUAD and LAVA instances keep their data forever (at the moment). The jobs a=
re still available, if you know where to find them.<br><br>The binaries hav=
e not been purged yet (pinned-manifest.xml will tell you what was built):<b=
r>=C2=A0 <a href=3D"https://snapshots.linaro.org/openembedded/warp7/sumo/im=
x7s-warp/15/rpb/">https://snapshots.linaro.org/openembedded/warp7/sumo/imx7=
s-warp/15/rpb/</a><br><br>SQUAD data for Sumo on WaRP7:<br>=C2=A0 <a href=
=3D"https://qa-reports.linaro.org/warp7/warp7-bsp/build/16a83e5/">https://q=
a-reports.linaro.org/warp7/warp7-bsp/build/16a83e5/</a><br><br>SQUAD result=
s for Sumo build 15 on WaRP7:<br>=C2=A0 <a href=3D"https://qa-reports.linar=
o.org/warp7/warp7-bsp/build/16a83e5/testrun/1937355/">https://qa-reports.li=
naro.org/warp7/warp7-bsp/build/16a83e5/testrun/1937355/</a><br><br>LAVA job=
 for Sumo build 15 on WaRP7:<br>=C2=A0 <a href=3D"https://validation.linaro=
.org/scheduler/job/1937355">https://validation.linaro.org/scheduler/job/193=
7355</a><br><br>Testing wise, I&#39;m only really running boot testing at t=
he moment. The test job makes sure the board boots to the commandline. Then=
 it attempts to run &quot;memtester&quot;, which isn&#39;t installed, so fa=
ils. I did that on purpose originally, because I wanted to make sure my mem=
tester test failed properly when not installed. I should update that now I&=
#39;m sure it works. Next it runs badblocks across the rootfs partition (/d=
ev/mmcblk1p2) in read-only mode.<br><br>Regards,<div>Ryan.<br>=C2=A0<br>&gt=
;<br>&gt;<br>&gt; Cheers,<br>&gt;<br>&gt; -Mikko</div></div>

--00000000000054bf5b05970ff6ec--
