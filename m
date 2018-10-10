Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id 75EE660103
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 14:16:05 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id 22-v6so4212360oiz.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4PqlfV+TGudspUe+H30eJ1kCzfo0ZB7rGGDAhnoz98A=;
	b=a9icUEegY7x4aPX707VbIQMHCVXbJNyXrVAIpg+ZcYq+duPsrJffO28w8LIQ43R5Iw
	sf2L4iKCugBzyLq7hUUytqmg0T+pxagOz8Gv5c4LgMBfCcTkZYkbmABmZRdG3YM+6nEQ
	jzSxPkFbQaXSjgcryxmk3uJOr8VuaWHA1KbZ18OOQ2akgFNBQCOWHKgRwga4KxRJWMvT
	0U+jJosw7Rwo2iRCePDUP3JokEJ+KbxPVPqj0sQGrS3WmxydNxGM4qBUadNuFdiuz22r
	ex92OSx9QJFiGFWUB8ncBTMOa4pbdp2drtj83aK4wN1GDduzyZbnBGpyPDSnYyczyDEq
	Sq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4PqlfV+TGudspUe+H30eJ1kCzfo0ZB7rGGDAhnoz98A=;
	b=PHO3UVhZoZ1Sove36wO6MNymkFbg18KSbUV2tu65RqpnE1HX4AGcjabl1YyhRKKT3K
	94tasQOuKPZVANbc6ewth92/4EKpiVMitH5tvXSdKiWJo+KT+racqWMPhAal8TCui1va
	WYIIH9QSX9DeyoyQ2R8sIahLbtx5PUwnDj2EAuVUJ0bZoB3r3O3r+Ptq+sAlJSjbPnCv
	kPa/mv8IoKLeY78zK5GJT+DWhVbtONwt2+Xw6cOin6fOn+otShVZDF/L0Nr82HQrFrDe
	lqQPSYhwAoqve+XG6CZP0TJhDmA6BH5xd+LCfRvviGxJvuNBfwwZlSpoaY6dDBeED15y
	Dqhg==
X-Gm-Message-State: ABuFfoi04VkQvW6xfqSe8UKaCn6dz9MjV9AwkQwJZPg8AwR0VCGqmJwt
	h5dkrxgndxQD74D7wVO1nHTRSh0scwbTqKTundcu+Q==
X-Google-Smtp-Source: ACcGV61Dd7wc1qr9xOqNMsItE5/gRkoNKjrAsvyXtLO3605BXg7ei/mvgVihfcyzSQea2aM8QPPvaTEGF56erGA3doo=
X-Received: by 2002:aca:54cb:: with SMTP id
	i194-v6mr1813810oib.340.1539180966281; 
	Wed, 10 Oct 2018 07:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20181010081035.10735-1-pascal.bach@siemens.com>
	<222d0fe27ce0839f25a69d8f13d1f99462e15d99.camel@linuxfoundation.org>
	<2722effc-4b30-fff0-3a00-1a694ba16fcd@siemens.com>
In-Reply-To: <2722effc-4b30-fff0-3a00-1a694ba16fcd@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Oct 2018 15:15:54 +0100
Message-ID: <CAJTo0LavSEBaOSQe0jj9oDbvRp7dUM_F8kPQNSSUsZ0cJSPjjQ@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 1/4] cmake.bbclass: use CMAKE_SYSTEM_LIBRARY_PATH instead of CMAKE_LIBRARY_PATH
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
X-List-Received-Date: Wed, 10 Oct 2018 14:16:05 -0000
Content-Type: multipart/alternative; boundary="000000000000bda1550577e07ea1"

--000000000000bda1550577e07ea1
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Oct 2018 at 15:12, Pascal Bach <pascal.bach@siemens.com> wrote:

> The problem is "cmake.bbclass: allow cmake to find hosttools" it has the
> side effect of making all hosttools available to all recipes.
> In the case of libproxy this leads to it finding python, which is included
> in hosttools, and thus building it's bindings.
>
> This kind of defeats the purpose of having recipe specific sysroots.
> Is there a way to make only selected hosttools available to a recipe. Like
> for example git? Maybe use git-native?
>
> I think the patch "cmake.bbclass: allow cmake to find hosttools" in this
> form does more harm then good. The rest of the series should be fine.
> Should I resubmit the series without this specific patch?
>
> One more thing for libproxy. It currently disables python explicitly via
> `-WITH_PYTHON=no`. But this option doesn't exist anymore as it got replaces
> by `-WITH_PYTHON2=no` `-WITH_PYTHON3=no`. This is why the auto detection
> kicks in. I will submit a patch to clean this recipe up too.


Per-recipe hosttools is an interesting idea but I'd say it's quite likely
too invasive.  This change has actually fixed cmake, and exposed the
problem that the recipe is broken and should be using
WITH_PYTHON2/WITH_PYTHON3: fixing that is the correct fix.

Ross

--000000000000bda1550577e07ea1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, 10 Oct 2018 at 15:12, Pascal Bach &lt;<a href=3D"m=
ailto:pascal.bach@siemens.com">pascal.bach@siemens.com</a>&gt; wrote:<br><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The problem is &quo=
t;cmake.bbclass: allow cmake to find hosttools&quot; it has the side effect=
 of making all hosttools available to all recipes.<br>
In the case of libproxy this leads to it finding python, which is included =
in hosttools, and thus building it&#39;s bindings.<br>
<br>
This kind of defeats the purpose of having recipe specific sysroots.<br>
Is there a way to make only selected hosttools available to a recipe. Like =
for example git? Maybe use git-native?<br>
<br>
I think the patch &quot;cmake.bbclass: allow cmake to find hosttools&quot; =
in this form does more harm then good. The rest of the series should be fin=
e.<br>
Should I resubmit the series without this specific patch?<br>
<br>
One more thing for libproxy. It currently disables python explicitly via `-=
WITH_PYTHON=3Dno`. But this option doesn&#39;t exist anymore as it got repl=
aces<br>
by `-WITH_PYTHON2=3Dno` `-WITH_PYTHON3=3Dno`. This is why the auto detectio=
n kicks in. I will submit a patch to clean this recipe up too.</blockquote>=
<div><br></div><div>Per-recipe hosttools is an interesting idea but I&#39;d=
 say it&#39;s quite likely too invasive.=C2=A0 This change has actually fix=
ed cmake, and exposed the problem that the recipe is broken and should be u=
sing WITH_PYTHON2/WITH_PYTHON3: fixing that is the correct fix.</div><div><=
br></div><div>Ross=C2=A0</div></div></div>

--000000000000bda1550577e07ea1--
