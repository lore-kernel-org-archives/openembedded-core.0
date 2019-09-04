Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBF07F260
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:52:10 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id s18so9594773qkj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OY0DjTVx65uA3Gn5A+OZKPRc/1dqsXtSF+cXsgk5Zmk=;
	b=rHzL/88/76OGoqZyD6wbpFyhaRwK5WzFQkmZiczl0T4tb/krWwvl9dW9UZj9rM+kLv
	iXh6maTQ12Qv7WoqmFLA+I5uRgNMiPxQWdqrwCmJE0+EMB4dOvK3QW8WyMNLY3HqR7u5
	RWv4HZw0wBlB1Ie7xkWv38nk8welwyFC7r0hCXl4IGSjNFg34U90FVP+XV10pZ35t9KA
	3Tt3Rlt0K9iChf8xi0IolSsyZk/UQbUFDtsfQjqPpcA7vnMx2Hx8Wf+SjIKlaMcV4zke
	qFECiK+EvEr5owr0TXUhMV6DJwVVmAwGT+xb9O9tFH9xftRlk1paxm8p16pypF1vgIyj
	Cnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OY0DjTVx65uA3Gn5A+OZKPRc/1dqsXtSF+cXsgk5Zmk=;
	b=evs1TIy+kbqjWRiGLPXnvPcYixoRrOcIbFRhXQ1qADiQHwIeuO2Hs5MYFWfLO2+t1v
	fG75EKpSDXfSIdhboYB7mZg+DK60LPJY6FhHHlefoX2E0rS49oynxuA7m6os1um4RCIb
	gaHmS0obo9FWP5DurwvUNEUVjnxprzP95gTXsD5bMVCNWBC6xZY4JCTv0KPMuJOBmyJJ
	5vSikQVBvkO76LsvfY5vWxrraix78/UNLHksYH7kjilGYxjgG3WLqROav9AX8xaXVzy9
	nvtX7QndEHjTvCN5LVxNgnlrjPknXYYt8usAtLWp05bs0faIbCBsT5qOxOBS1qPIp9Zj
	656A==
X-Gm-Message-State: APjAAAV46g6G4gMzwNX4dVrr0PQe8oSMEgVwHBso96WeicA8LWYHVZmW
	SP7u/DdoXW6WD2oRvqo708lSEbHaUaddWIL1Kz42KVqp
X-Google-Smtp-Source: APXvYqzf6W6uLB+SVeLEoip47TbTWU+CrW9rrrvqY/ft0xhWY0ox4Y6DD6npavQY/C0iCtp7Y1uAoxQBizO/AyJWfbo=
X-Received: by 2002:a37:c403:: with SMTP id d3mr34379244qki.212.1567623131280; 
	Wed, 04 Sep 2019 11:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190904181009.8374-1-raj.khem@gmail.com>
	<9c7b636db80cad1b2d9a29b287d1e0500aadf668.camel@linuxfoundation.org>
In-Reply-To: <9c7b636db80cad1b2d9a29b287d1e0500aadf668.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Sep 2019 11:51:44 -0700
Message-ID: <CAMKF1spk-xuPUuRXZm2BXhWJ2r75jUXJ4U3e=69+oL5s33h+cw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] python3: Expose PYTHON_BINABI in global config metadata
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
X-List-Received-Date: Wed, 04 Sep 2019 18:52:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 4, 2019 at 11:49 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-09-04 at 11:10 -0700, Khem Raj wrote:
> > packages can use
> >
> > find_package(PythonInterp REQUIRED)
> > find_package(PythonLibs REQUIRED)
> >
> > while we control PYTHON pointing to native py3 the libs and include
> > directories will then point to build host version, which can result
> > in
> > unexpected combination and if we are lucky we get errors if its quite
> > different e.g. py2 libs/includes and py3 executable
> >
> > This variable can be then used to export PYTHON_LIBRARY and
> > PYTHON_INCLUDE_DIR so that above find_packages can work correctly
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc   | 3 +++
> >  meta/recipes-devtools/python/python3_3.7.4.bb | 1 -
> >  2 files changed, 3 insertions(+), 1 deletion(-)
>
> Putting this into the global namespace seems like a really bad idea.
> Can we not use a class like Alex mentions? I thought we already had
> one?
>

yeah I think we have what is needed to form the needed vars via PYTHON_DIR
I have sent a v2, this patch can be ignored

> Cheers,
>
> Richard
>

