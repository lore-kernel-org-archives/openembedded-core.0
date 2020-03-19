Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8651A600A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 07:54:21 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id e20so444948vke.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 00:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1fO07HZZo9lSnNJ1aXzhOiIdFQGdkeTrsSN2oqZaZVk=;
	b=a3yK+QnnIyBUZ6sh66kYIWKN5qr6Ca+BLnDY2sE1qPGXoeJjJLgN2bHA2Sf0UOzryg
	qxHmp2jCGioDivE2qnQ2hrS2F5Mbimvc2j+Um7CwIV46xtbIqykA4PRG+NeC33/oL806
	4OWaaKasWPhRbC+O9flqjLpJU9D3maH8kFyIqPTTLbuhOdfpJKNl+xuLiEpFodhFnVG8
	Yzf5BLcalKgRn72OO5hW9O7i0hfoZ7o+LsB9Dc4vh+6v6a0nwWV2Mt+mpiGXLdkgiP/w
	317XqDihMVdozwrEgSuyhQQfka8xXXLNaYyxJHlfxvGZSkOSz3GlhjbTJeoCIAJuni/1
	7qQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1fO07HZZo9lSnNJ1aXzhOiIdFQGdkeTrsSN2oqZaZVk=;
	b=AsebTR/VndPVP61iA5fYCbm3yHJhF87IyTstuDTkboYl9E7cvvHL6xEMSlM9CAdfCh
	HOQR/sXW1aQ9ht/+D5YqHMaDVMN/xxCIgRJXiZ8OJMYysJduUJrJR6zdxbPIqQegQsTF
	oFexRqoAaCUhzaMcJgvgJcdiOOtY8cWfjD2NoZG8/V7GLDf2rA8KJspD9Qj2UmCNwUMP
	8zGDkG/BHYBQvZiCxWeD1aGxjMIPH5bp9JY3BEu7KWn0V9fOw6VmiYJWzmx+rzDGo/+2
	9xBO7bDCSmWCmZboGeWTah5bwuSv8z3XcJXBd+kk5ysq87AibBVVKxzR5bES9Cs/ivHF
	lB8w==
X-Gm-Message-State: ANhLgQ1t1J/TUq0FWm7Phi254vBGkztKTPGoQdhVeVZQlSshDi81ghDr
	YueyR5ywLrqeUnZZjzla0sNLsJLWhHGLdjBoVm/+7bWO
X-Google-Smtp-Source: ADFU+vuIWQ9ANAsJVXkgDT+qfnTgOyxscypq5crti0/KlfXsC7z3urg96UxkO0cQSMc1vY6TjJUaei6XXT9TOSEMp3E=
X-Received: by 2002:a1f:f2ce:: with SMTP id q197mr1328747vkh.49.1584604462230; 
	Thu, 19 Mar 2020 00:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200229101433.30787-1-alex.kanavin@gmail.com>
	<23132fd4872488b259751cdf8bcd8335d703b205.camel@linuxfoundation.org>
	<CANNYZj_orEnKxs6AvyYTauDVexY+Eby2DeRYeh=9=-9i8TzTwg@mail.gmail.com>
	<d415671888365ca180bcfb72000bcd394f0e7b24.camel@linuxfoundation.org>
	<CANNYZj_RZ=Q1Me7_Ye+N4NmQBvW+fE2yDiRdsYu_XnCOGY_+nA@mail.gmail.com>
	<CANNYZj9eiLf7n=Cu7X5A4z+YYz5upiW_9pjTgSPCX_2x2egSvA@mail.gmail.com>
	<5839fa696c78f06c668fe8cb8dbd0a80732c7bbd.camel@linuxfoundation.org>
In-Reply-To: <5839fa696c78f06c668fe8cb8dbd0a80732c7bbd.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Mar 2020 08:54:10 +0100
Message-ID: <CANNYZj8LAkjOZQqT6Kje+pog71PCvo1jQV7AhCvGZ1ea_Fc1yw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] piglit: move to meta-oe
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
X-List-Received-Date: Thu, 19 Mar 2020 07:54:21 -0000
Content-Type: multipart/alternative; boundary="00000000000014b32805a1307a4d"

--00000000000014b32805a1307a4d
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Mar 2020 at 22:31, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > I found an old ticket where piglit was proposed for the core image
> > testing, and the idea was rejected due to its huge install size, so I
> > won't be pursuing this further.
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=10047
> >
> > Would you still say it's worth to keep the recipe in core? Python-
> > numpy (that piglit and only piglit needs) isn't trivial to maintain
> > either (for instance, update to latest version needs cython to be
> > added to core).
>
> That bug is for piglit as a default in testapps. We decided that was a
> bad idea, not that testing with piglit was a bad idea overall.
>

So adding piglit to perhaps core-image-sato-ptest would be okay? (with the
resulting increase in size and do_rootfs times)

Alex

--00000000000014b32805a1307a4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 18 Mar 2020 at 22:31, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">&gt; I found an old ticket =
where piglit was proposed for the core image<br>
&gt; testing, and the idea was rejected due to its huge install size, so I<=
br>
&gt; won&#39;t be pursuing this further.<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10047" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D10047</a><br>
&gt; <br>
&gt; Would you still say it&#39;s worth to keep the recipe in core? Python-=
<br>
&gt; numpy (that piglit and only piglit needs) isn&#39;t trivial to maintai=
n<br>
&gt; either (for instance, update to latest version needs cython to be<br>
&gt; added to core).<br>
<br>
That bug is for piglit as a default in testapps. We decided that was a<br>
bad idea, not that testing with piglit was a bad idea overall.<br></blockqu=
ote><div><br></div><div>So adding piglit to perhaps core-image-sato-ptest w=
ould be okay? (with the resulting increase in size and do_rootfs times) <br=
></div><div><br></div><div>Alex<br></div></div></div>

--00000000000014b32805a1307a4d--
