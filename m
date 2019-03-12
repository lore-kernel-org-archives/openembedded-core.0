Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id A6BB26B11A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 02:21:07 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id z25so866975ljk.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 19:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WTWNC3qqmDaMYCbO3KBy/JxrJYU039LqA5Xm38yyhKw=;
	b=CrqIITsel2aNNUvbZetL7GJmFYtfe58p0PzmEvOdg5RE/VWpq1SrwfB+k+w8vqCPME
	Y2nvFpWIJX2Q0sfoMoSjEQS6sKgfyrxnscg7dzAdUGS4c1pVNduFsXf7TN0+zReekQkE
	04tj/nD3gbRVZ2K+PvGRwr0RjZj1OHzP9lLGLk2fewLmBFtZ68Xu0qfazo3pnnzjV5iZ
	Le8IkuiBVUIhakDB9EknXNjna0lb/olnhSR2iAaS8AO/JPh/KOYUal8JwhlMkboGkNRZ
	C3NcCmsHojdS0D3aZtqwjhpVQ3ff0BET6c7ioSfuzDy7UL3S+rM/Rfcr46Lh5a2MeFm+
	9/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WTWNC3qqmDaMYCbO3KBy/JxrJYU039LqA5Xm38yyhKw=;
	b=A3r0K3L/aTuJsBTPHZgIU1w5wVMX60v4P/b6u/5R9XEl0nGyNeR19NB1od4klpnU/+
	hQoYS2wqFh6GPSVDJhUXpUx4MJTv0GAEMXCKUUR62+g8vaRwvfQiqbdnvfkb3MXT6Sls
	pHuOlJbpphzFyCvEJOfNEHChAXkSQAaiJxDuoI/+x+g7/sblMyyfbmQOs1Prh8pW0lAy
	+qhc9uFu/azhFccN13pBd+KCMaiGyq7AFr0eZKqp/PKd69rWM/7d4zBgOMts2zI95HCZ
	Rjk6c8+7nvQc6qCM10diVvGqy+HOVp5t4aIKNZ7oXDBqTrjGdJT/hLO3kUdrNAfFJu5g
	4SVQ==
X-Gm-Message-State: APjAAAU72CS9Zc8WOAHzXEaGNy/Eyw0WhlQnwBZSg+V6WB6BED/dO4JF
	aQXrZKsJTBvxwXCSE9HfLlrai1pvJVi6WMgDASg=
X-Google-Smtp-Source: APXvYqyqw01yhp6/t8Ytqh/m6Mhu1bx7bqNnUudcPlWgpdwShaS5/d357C5VKfLc+0dK+oNiww7yEMC22JSbPcHiokc=
X-Received: by 2002:a2e:9b15:: with SMTP id u21mr18234059lji.82.1552357267850; 
	Mon, 11 Mar 2019 19:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190311034537.7190-1-bruce.ashfield@gmail.com>
	<682c60768727b20cd0ff14a2765dc60775116243.camel@intel.com>
In-Reply-To: <682c60768727b20cd0ff14a2765dc60775116243.camel@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Mar 2019 22:20:57 -0400
Message-ID: <CADkTA4O_fwU9OJM_fBLkW1x4iYNi5ZBz5W1-HWGwT0UQscKXwg@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto/5.0: fix system tap for arm
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
X-List-Received-Date: Tue, 12 Mar 2019 02:21:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 11, 2019 at 9:41 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Sun, 2019-03-10 at 23:45 -0400, bruce.ashfield@gmail.com wrote:
> > -SRCREV_machine_qemuarm ?= "1fbecad0e6a68b6c57b4f6ef8207e7e90ea764a3"
> > -SRCREV_machine_qemuarm64 ?=
> > "1a0da7e50b77c82841efb501c648dbaca699eac2"
> > -SRCREV_machine_qemumips ?=
> > "d9dd6d4cfe689efd5cb7bbacd118a3888ac7c517"
> > -SRCREV_machine_qemuppc ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
> > -SRCREV_machine_qemux86 ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
> > -SRCREV_machine_qemux86-64 ?=
> > "1a0da7e50b77c82841efb501c648dbaca699eac2"
> > -SRCREV_machine_qemumips64 ?=
> > "5f072445126e6a9e44f9435a552f4fcf6fc15499"
> > -SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
> > -SRCREV_meta ?= "4faa4419884d2bbe65f637befd71a1e95629eaae"
> > +SRCREV_machine_qemuarm ?= "23b538073fdc803b0a749de77677508671e246af"
> > +SRCREV_machine_qemuarm64 ?=
> > "37c8f2a3df1e3154087538a27228fad0c6e172c5"
> > +SRCREV_machine_qemumips ?=
> > "50b5b709ac6b1d14ac815f9a002c50a196306b02"
> > +SRCREV_machine_qemuppc ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
> > +SRCREV_machine_qemux86 ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
> > +SRCREV_machine_qemux86-64 ?=
> > "37c8f2a3df1e3154087538a27228fad0c6e172c5"
> > +SRCREV_machine_qemumips64 ?=
> > "8322515ba7a858c47386b95c6e7201c8a3a41175"
> > +SRCREV_machine ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
> > +SRCREV_meta ?= "8fbd119bd954443b1cae496d7797c458faa02495"
>
> Looks like these commits weren't actually pushed.
>
> I still see 1a0da7e50 as the latest on v5.0/standard/base and this is
> resulting in failures for master-next on autobuilder ...

I just double checked my builder and they were pushed, at least the machine
branches. I did just explicitly push standard/base, hopefully the build issues
are cleared up now.

Bruce

>
> Thanks,
> Anuj



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

