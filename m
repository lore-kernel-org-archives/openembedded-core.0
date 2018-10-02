Return-Path: <ptsneves@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B911F71E5A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 08:23:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q8-v6so1242695wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2018 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NI+t7M6psp3YDCUqYqFL4bQEH5DiEGvHREzp7z++M+w=;
	b=U0TKTKK8V9uTe2wudNrBnOk2mAnDl0pvlSpngT6bx/0lLOG7XfdRotFPQ9X0vwq11D
	/6Ma0EhtxL+1GPJj1EOUscfWficDyDBXX7fhRl5B0QI9ndzpDU3GT0GCP4naDOFGkik4
	X8aW73nyWjd8lEOpmcx/wlygD3Y2f2aaxgMlR7riSglEJKkQK7sNJZgxVxqGccpdrJeL
	Ff6RI3CxtbTYnWyAf45c+cCq8lzlU4tI7xcpLr/RaahbbChBiVSUIk0iG+gPnYj1H3IC
	uufQNz5aHDf6fz5JaIXN1vwQvyQej5mUbxYdbMpYF4AFYzFiGiHKAX82phLoU0qReeA2
	a9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NI+t7M6psp3YDCUqYqFL4bQEH5DiEGvHREzp7z++M+w=;
	b=iUhLF3sZIJ1mXnmEOeP9CvRUTg8iLGPAH7+9GOW+PpIU3yy7O+bKXrFV4/1CzoyKj4
	6E3QA/HvqIW9QT0MpAD4o6Ys5BvJAtRaWSVWPXDW7xgblKSOUr9EilkXN1wG4wWFG+pE
	WmswsTADGNHnJmXconHDx23ExM42C77Eh1uFxBCif/netnIq5vqvBFC0CAXPMAw7z2zu
	5/VmI12BCmE/g3rT6+xAqRcHRjct05yX1zrZVvOc8oeoXssd0eZmDtpPPZdw6IYmWAh0
	PTuK56hvrjsLLHckL0nT8A4CUbt5RXWvVOLHFQy6obiZLDJLpGEdyOJcYtV+qYunnGuF
	N3Zg==
X-Gm-Message-State: ABuFfoihyzlniK/KZy8RS64+cqm0/uoUHjhrS73/1bGBmgLZhwPjuUvL
	bKjR7t95pvkXfK3DchShWH5RDv05S40uXzBUUA==
X-Google-Smtp-Source: ACcGV62L2go8ZNu5CR30m1+esR+0yKiTQP4uc5REZ19ygTKDQn0+RN/q6GPbeSBGjooMgh0tyEgZ1+TBUAWApzrtG/A=
X-Received: by 2002:a1c:41c5:: with SMTP id
	o188-v6mr1166277wma.34.1538468586363; 
	Tue, 02 Oct 2018 01:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <1535651376-25467-1-git-send-email-ptsneves@gmail.com>
	<1535651376-25467-4-git-send-email-ptsneves@gmail.com>
	<a4268dca5b5db6759cce2f089f5065708112082d.camel@linuxfoundation.org>
In-Reply-To: <a4268dca5b5db6759cce2f089f5065708112082d.camel@linuxfoundation.org>
From: Paulo Neves <ptsneves@gmail.com>
Date: Tue, 2 Oct 2018 10:19:53 +0200
Message-ID: <CAJO0J4gkXiv++K+aTHJF2O_Hq8MFDKPCpy+vWz6Ym1ZrLY00Bw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 4/4] testimage: Moved write_image_test_data to testimage bbclass.
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
X-List-Received-Date: Tue, 02 Oct 2018 08:23:06 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Richard,

Would assure you if it generated the test data on image creation *and*
on test task?
If not please describe more or less how I could collect which
variables write_image_test_data depends upon. Just a high level
description would do.

I have really been in a good spirit to get this topic merged but I do
not see a clear guidance for me to fix what was clearly broken.
Actually the current code put there by intel should should be reverted
in my opinion, as it broke all the controllers besides simpleremote
and qemu.

Paulo Neves
On Tue, Sep 4, 2018 at 12:30 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2018-08-30 at 19:49 +0200, Paulo Neves wrote:
> > Previously the write_image_test_data was a rootfs post
> > process command. This function ran only when the rootfs
> > task was ran. Due to this if a variable was changed
> > or added to the datastore that would not trigger the do_rootfs
> > task, the variable would never be written into the json
> > file. Consequently the do_testimage task was potentially
> > unreproduceable and could fail if for some reason this
> > variable was then used.
> >
> > In this commit we move the recording of the datastore to the
> > start of the do_testimage task. The do_testimage
> > task then reads this freshly generated json and passes it into
> > the normal test machinery. This approach allows for the test
> > machinery to still be loosely coupled to bitbake, and thus
> > still allows for the tests to be exported and used independently
> > from bitbake. The caveat is, if there are datastore changes
> > then the bitbake testimage task should be run before the tests
> > can be ran independently again.
>
> I'm not sure I agree with this. The test data really should be written
> at either rootfs or image generation, not just before the tests are
> run.
>
> If you wanted to run the tests independently, after this change you
> have no way to generate the data to do that without first running the
> tests at least once. That doesn't make sense.
>
> The correct thing to do here is to ensure the write_image_test_data()
> function indicates which variables it depends upon and hence reruns
> correctly.
>
> Cheers,
>
> Richard

