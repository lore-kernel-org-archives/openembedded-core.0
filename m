Return-Path: <ruslan.bilovol@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id B82617F344
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 15:37:16 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 97so14353682otr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 08:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cuEfHBhvP9h6zq5iPV8D2XC5Z8qgOy6kypYuSdc/FYE=;
	b=RVurhrJplrjigTmZyyNL/5x6sMmHrCcY5kh91unHyUBk618kmfrf2Ldv2AZzrFQ+u4
	XtpIsT2srGqwlV82IVBzYiR8OsB4yh72xD8S5c+d3kiKe/dCNJzXVozSZ8EB4+LAIMFx
	ZTMVJwJzszrCrrVHPyte69tKxjQcFgQrhbIdf9X8oFj6ZCP+JXJSJfKbai3iYKX9MP8B
	NYAIruMZE8cgnI8cyqz+qGsluGV4DTqc94UFEijrb9Q4c739w71mvXkbvyWmGLwg+lN/
	0I8a0CWqzHrEkraDeZHCyOlFf7EfpzHaATOaQYQ10I2953B5ZJtNhxtmFlweJieWVL6O
	7yhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cuEfHBhvP9h6zq5iPV8D2XC5Z8qgOy6kypYuSdc/FYE=;
	b=l29dFKGSqqizRXsfJaVuPudVjKztZ1aiCXLi060KAawiMbSsuJkUxCb6NGUOzFeY0R
	sesDj74dgoQSyDyPAylKR2WG54Gq0ME/3D9qYJOnS7SSNA5EnEZ8In7y/+FuY+z2vFCN
	tFAS/OE4E44eNb4u9YxShJZMWndp5eFfU0yNHTz4LeMavs/IKmMeUSUSoyYRe+wNEZdm
	H6Gbr5GQ5p4U+WDW3qAND6xlQywGiDZ6bdFtlJkk1CxTysuJrSyGcmfrtcXrCzd2DQvK
	1KK6NNqvOr0nazphYpSeqO6GGDJgxvolD8SUo+GDLp4DcvFN3oocgcxseXGR4Hw5Y427
	qJdw==
X-Gm-Message-State: APjAAAViASlfiyWSK5+qn9pMdwL6rfIUe6GYOg3ntg3tyFwP0rKi+PTO
	oJdydi61FnhPv4F6aUgYa89PtJkWhiTB4QJgNb8=
X-Google-Smtp-Source: APXvYqxNK/iyMts+Tri0rDOXnaJlFX1ZYOMwRwU1hvI0iF4vDJwPF2BVSP46gPr2tpLF8wLfc3s7AvVfQP196DyopNE=
X-Received: by 2002:a9d:6749:: with SMTP id w9mr29522102otm.293.1567525037566; 
	Tue, 03 Sep 2019 08:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=otbSH85m0WnBj0Q2z9Bj2ZGwzGzcM74-GuaXtt6PeReP60Q@mail.gmail.com>
	<3f13cb86-a12b-aba7-e8a1-517f25ba7f1e@balister.org>
In-Reply-To: <3f13cb86-a12b-aba7-e8a1-517f25ba7f1e@balister.org>
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date: Tue, 3 Sep 2019 18:37:06 +0300
Message-ID: <CAB=otbStRoA_SXcVe+PHcifHqqryyrbMMxCmkTjT3r61X3prTQ@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OEDEM 2019
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
X-List-Received-Date: Tue, 03 Sep 2019 15:37:16 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Philip,

I can see now this event in the list of ELCE co-located events.
Is day 2 track track 2 (Yocto Project and OE maintainers meeting)
restricted to attend to mainatainers only, or regular OE developers
can also join?

Thanks,
Ruslan

On Tue, Jul 30, 2019 at 8:33 PM Philip Balister <philip@balister.org> wrote:
>
> We are working with the Yocto Project on a two day Summit event. This
> should implement part of the ideas from the the last couple of developer
> meetings.
>
> Philip
>
> On 07/30/2019 12:58 PM, Ruslan Bilovol wrote:
> > Hi all,
> >
> > Is there any plan to hold an OpenEmbedded developer meting
> > in Lyon, France around this year's ELCE 2019 (October 28-30)?
> >
> > I see that OEDEM 2019 page isn't created yet and I didn't find
> > any news in mailing lists yet:
> > https://www.openembedded.org/wiki/OEDEM_2019
> >
> > Thanks,
> > Ruslan
> >

