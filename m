Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 50CC361883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 12:19:18 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id tb18so3724809obb.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 05:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ZrIa3EVtUbU85cXh/ZT0NIxSBms2WhsAdWzOzH+SdDQ=;
	b=ozuu9v7rHAMxRtigvBm2bQiLJtv/QmgWOW6SZgaXSq6ka+YnxM6UOZn6lWloCiOSnD
	3Yn1gMruWjZOa6yrYQadMOTFkGuzKz06ZLnGdEDlxYApxHnxSHt+XAgOgGwcXmDpUFxd
	FPrsOciezoWyjYpW3UB4PaXd32RFcylFavDCtAau4LLqmCRqQuTyZxOzrbknoKJW+65v
	FHbFI+3KqLmRY2fQbi2we+XsplUe7SSDoeixCCB1vlsYt0d6iCCJtAoOVXA0Y+4ZVLpi
	7Zd0lU+U/TtrCYGTBrZmTjU2q0ubaE2F/SwZx6LSpYLxcXqoBdOhb4cMRoFGbnvlmKNF
	8QXQ==
MIME-Version: 1.0
X-Received: by 10.60.145.241 with SMTP id sx17mr939147oeb.57.1375359558389;
	Thu, 01 Aug 2013 05:19:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 1 Aug 2013 05:19:18 -0700 (PDT)
In-Reply-To: <1375342673.3362.7.camel@ted>
References: <1375283605-25870-1-git-send-email-otavio@ossystems.com.br>
	<1375342673.3362.7.camel@ted>
Date: Thu, 1 Aug 2013 09:19:18 -0300
X-Google-Sender-Auth: -VtfSX-v9G7foY9IaT7YIHKwm1Y
Message-ID: <CAP9ODKrKdvyBtMLUzDztyfZHgC0=Y6p37Q_nHjoVb-cZ8=6CJg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Thu, 01 Aug 2013 12:19:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 1, 2013 at 4:37 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-07-31 at 12:13 -0300, Otavio Salvador wrote:
...
>> +    # Avoid readding the removed features later
>> +    d.delVarFlag("DISTRO_FEATURES", "_append")
>> +    d.delVarFlag("DISTRO_FEATURES", "_prepend")
>
> I quite clearly said this was a hack to allow you to see what the
> problem was with the code and that it was *not* an acceptable change to
> go into the core. I don't see any mention of that now and that is a
> little frustrating to see this being proposed as a patch.

I forgot to add it to commit log, sorry. The idea was to send the
working code so people using it could use a valid one. I understand we
need to find a better solution for this but I am clueless about where
to look.

I can work in another solution if someone can tell me what needs to be
done. I looked at bb.data_smart code and didn't find any other way to
fix this.

The finalize code would be the other place I can think about changing. Any hint?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

