Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id A49406C397
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 23:42:49 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id t4so6648009ljc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 16:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Eq+FXIdR1sE19GLJVLNz71Wb7+WgVWXgBgfnbkcGnw8=;
	b=Chp8CR2/yr8P9Fhty3xd6m9ljboJChBRNhYJVFAYlmScbjpOB1Hf8rxZ4ixuc6QEfA
	Kbc6ODtkuatoAVq7hYlCL4a2yRF1By4DVLvyOuRZAFRCe0E0Uh545lGxG51zb2IfN137
	ZQfyWidmvFLaT2vGpS/Inn1Kn4oqk+pldY55097/2LKy2ip/MKkV0Z1aAYLWbqFlMVWk
	TVdsX3qLGXi/elB/eyDggmw5kVUIeP5xBepBPOLx41ZympOGDWxJvnHT8RUWvqNLOm5O
	FQtFVi8kNtjMD2sc9VQeemro6om0x096OcW+MwpLjulmzDSzUkvt5eazskuPlMneRJZ/
	0ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Eq+FXIdR1sE19GLJVLNz71Wb7+WgVWXgBgfnbkcGnw8=;
	b=NNvSuRzOVc7EL0agtHbHKE7eagjDwxZdG4G7cwtXfntcHbB+gDluKUQmX5ayp8Lqz4
	x9TEIXqxa3mpAaa6lZ36nU5hAMiIbs11fZOaCR4hjMltYzEoRZHqNWGkewV7EH5owcim
	7NtWazmibLAen22FRbi/I1gNeXXm/dytkQxlGJIEY0dNux940kHHf2CT0+27Qnmb0Dil
	lBestEmCiYlE4Kf1NsPn4lD7yT4TUwgwvshGFYMlSuN0g7W9UNfdSoPcAkAGNMzBatLo
	EMwczn6YSpnOZu3VfPdsNuX1DBkqSpcYW+m163td0oCdTgP7eyAbt6R6v1QIV8ss4vf7
	OpXg==
X-Gm-Message-State: APjAAAV2Ofe/CSkyq6BjFtnMQVLIH/L1XBkHZ+IOhxBuxQDH1uhL7YR0
	QwKmWhEEHmnMejKd8afxhFpe7bXoTcVJY7pAUJA=
X-Google-Smtp-Source: APXvYqwCWyIk3VqyJtaYGpDzOtd6GNDV1MDNVSQUQzF3E/G9QKgZY0BwkZQk+P5mkv163l/5gEj+ETHBwonw+FX6xqw=
X-Received: by 2002:a2e:8888:: with SMTP id k8mr8482073lji.43.1554507770045;
	Fri, 05 Apr 2019 16:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <cfd56541-43c4-5128-3d41-cddc356a3cb8@gmail.com>
In-Reply-To: <cfd56541-43c4-5128-3d41-cddc356a3cb8@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Apr 2019 19:42:39 -0400
Message-ID: <CADkTA4MT3JctYMTFjLZXtJYgaxj6HG=G_nAAe+w0A-JRGXRFxw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Worries kernels supported
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
X-List-Received-Date: Fri, 05 Apr 2019 23:42:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 4, 2019 at 5:28 PM akuster808 <akuster808@gmail.com> wrote:
>
> Hello,
>
> I noticed there are 3 kernels in Warrior. 4.18, 4.19 an 5.0. Do we
> really need 4.18?
> I see its the default version for poky-tiny. 4.18 is EOL but maintained
> by Windriver.

4.18 needed to be around through M3 to backstop some layers and references
that were being updated.

I may delete it as part of M4, but really, since I kept it through M3, I may not
churn it in M4.  I handle all the support load on the linux-yocto
reference kernels,
so it shouldn't cause any one harm one way or the other.

I keep a very close eye on the versions, so nothing is around by chance or
by mistake .. and best to just copy me on the email, since I can
easily miss them
in the noise.

Bruce

>
> regards,
> Armin
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

