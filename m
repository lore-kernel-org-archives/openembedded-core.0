Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 28D977DFF4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 10:10:38 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id o4so14565367wra.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 03:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=AAS6cUPoczNI218GSX4C8/F/Wh357QL5KWGALF52NpM=;
	b=WrIqVN0qUwGHR/7IblElnCmVSKGRzsbY6fuDQbJ+qpUBe/QMhIwaF2uyMc9gMJPiLR
	x4WeuDjKIjTcyLa1Il2xA5O7+IR97tDiMnh+uahmQeuRkGbuJbO8s0ShAJ4sF0gj5n7l
	xxTKKMbqORTJz6Dtn8BD9ZgDx84uXUWjwqKLMzh/aM7sq5/t6hqYrRB/8CIK/xwuunFq
	VBfC3ti8afNNOW4q7G4aKsvCgJ9CXMio59KG6aKYoCjZSfNircmRKQCIL3qpFZTYUjvo
	nqRHcmALS39aUxIPUfgAD8wWkJmir8QOY6cKkaARWo6SfFFWNIsf1uOI1lm9E51Grwxt
	D8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=AAS6cUPoczNI218GSX4C8/F/Wh357QL5KWGALF52NpM=;
	b=CUIXfJEdpFrCHr9raecjoplYrnZCa1CqG/dMsGB3V4eZXhtEC+A1UuJXLbJNPAhdi1
	MvmOJOUEQzqYchta6uXbn6QMTRaWGRfPwa0ta4GxqsR62EJKkDoIO9IiR9EdcGuXIJAg
	q3e3kVbKvdRmXiQdTS/ERL0r8vldt+UEXdAIPtAYXGhQdYlS2ZBo51pOTbGHVB0bfPs3
	i0hbFkuneUjVB60FIfX6nTyq/gGa+pMU7G8ws+a3gxE9hWvpKtLpvsJPT9tnhf6X3dtx
	c4rRsoR7YmPZnxXSH6wa9OaD9b355wJP1iHtaeoGuQf/HxmOJAUCAuVtFXY31NaVC6+0
	EuBw==
X-Gm-Message-State: APjAAAV+Ef/aaNltF9/uT34SgVq6RulbfxU2zvYAO2iEp0Bs1oAYaANF
	LlnW/JlP+MwS9SOiwwQ/fuk=
X-Google-Smtp-Source: APXvYqwQmMExUp1MNk1Jb1SdY/V5byrm5toVaAznmmFCnt2XrlHQWyfW/LM2LF0SDGP/+GnyMtSAYw==
X-Received: by 2002:adf:dd43:: with SMTP id u3mr17637659wrm.302.1557742238722; 
	Mon, 13 May 2019 03:10:38 -0700 (PDT)
Received: from bluca-lenovo ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	x9sm15626315wmf.27.2019.05.13.03.10.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 13 May 2019 03:10:37 -0700 (PDT)
Message-ID: <41ac4abea0dd66e99d21bdda69acd08ef81807e7.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 11:10:36 +0100
In-Reply-To: <CAMKF1spVZzywgp8PE3OuZ+x60tkyXgHCD3QpDfMfkVFefEMZrw@mail.gmail.com>
References: <20190509214007.13927-1-luca.boccassi@gmail.com>
	<20190510120932.29765-1-luca.boccassi@gmail.com>
	<CAMKF1spVZzywgp8PE3OuZ+x60tkyXgHCD3QpDfMfkVFefEMZrw@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: enable portabled by default
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
X-List-Received-Date: Mon, 13 May 2019 10:10:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-05-10 at 09:45 -0700, Khem Raj wrote:
> On Fri, May 10, 2019 at 5:10 AM <
> luca.boccassi@gmail.com
> > wrote:
> > From: Luca Boccassi <
> > luca.boccassi@microsoft.com
> > >
> > 
> > portable services have been declared production ready with v241, so
> > enable
> > by default and install the files in the main package.
> > 
> 
> what is the rationale to enable it by default ?

Hi,

commit ada8a5d9175b disabled it by default because it was experimental:
"Add a new PACKAGECONFIG item 'portabled'. Default to disable it
because it's still experimental, according to the announcement letter."

Now it's been declared as stable by upstream, and also given machined
and nspawn are enabled by default I don't see a reason why this
shouldn't be as well, as they all provide the same "kind" of
feature/functionality, albeit on a different level.

> > Signed-off-by: Luca Boccassi <
> > luca.boccassi@microsoft.com
> > >
> > ---
> > v2: Just enable by default, and let the files be installed in the
> > main package
> >     as requested by reviewers.
> > 
> >  meta/recipes-core/systemd/systemd_242.bb | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_242.bb
> > b/meta/recipes-core/systemd/systemd_242.bb
> > index 73e03c7a77..f15d125bf8 100644
> > --- a/meta/recipes-core/systemd/systemd_242.bb
> > +++ b/meta/recipes-core/systemd/systemd_242.bb
> > @@ -81,6 +81,7 @@ PACKAGECONFIG ??= " \
> >      nss \
> >      nss-mymachines \
> >      nss-resolve \
> > +    portabled \
> >      quotacheck \
> >      randomseed \
> >      resolved \
> > --
> > 2.20.1
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > 
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 
-- 
Kind regards,
Luca Boccassi


