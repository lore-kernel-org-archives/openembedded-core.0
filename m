Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id B06137F302
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 09:48:31 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id v18so64903501ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 02:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ONat8F7BL8fqgz6TvVIDWVi2O86ea/4Wqp5ZM2bCvnY=;
	b=PUbMBsIq0HS0OZY1Q9knnOyVBJIRe0SqXe3mQQqag21g47atCyL7+ujY+QaVdZrdRn
	oB5D3ZqxxJsY6dMZzDbfzu69gUkz08X5dWwyFNBaT5oDwHq9KASB6yGMFk1r1+pBKsy5
	PxySn0VGBpa8DCZUtKqA13GRcwjoHzTb9+G4fdKh1Jus7SPL2znRGe0p7iLc+vZ4REIk
	KhqKxxpVeVqRybt9pcf/y0QaHSUB16c03VaBCxJnbdcSgUIL/rlT/xTRXy9RU2MAeLty
	JxJZqTrmu2zbEfAEn5NiIPZ6/D/OGYjMqgT5w3mSzvYi51Gp3Uxuc95vSxRUNFWnYHdq
	d3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ONat8F7BL8fqgz6TvVIDWVi2O86ea/4Wqp5ZM2bCvnY=;
	b=WIVaSNNh8isxtnzxoYPTjEg61ZtWG/cV3Ef6VVRYeFnFK5uuIVcoxcBmu9SrXjTZBm
	HPIkmNLT6Sbrdd38yRsdBtg8xMxgwfdXNRIwbQe4p644fgv5r8QNjNxh36ydG+2LT/9Z
	dBNUwQP/+iLEc76zf08vX0j0PXSmpZ1VxIh8Ansfyx9OT43gVPzjLT9isYXT931ZcaZf
	1SZAU2MNhWEn6lpfTntelHuEf1C6tESJ0QYNZMLOztDznmjH86i41BR3oG2I5ZOTphBB
	Qr011BlJ4IhS+6HrzPhB64xT4gj+tgVoRcxUI7Ht0E2RSkIp11wbOCVz06K0N7Teu32W
	smJg==
X-Gm-Message-State: APjAAAWjXR+RjRlixirRlZc11lFeS9QDYsbu7DzymuAx0hE1H++thuG9
	gUdeuPOkcOTHAptgC832JgjARA4fNA2Qj8XDK2M=
X-Google-Smtp-Source: APXvYqzMfwtvRTGNG0c1mBr2oYd0UCDVqR6w6QUBxS0QpeRBPlpQENaPNpn6KsmuHI9Q8XIJOEvwDG2PQJO6lqB4Wlg=
X-Received: by 2002:a2e:854d:: with SMTP id u13mr65405474ljj.236.1564566512078;
	Wed, 31 Jul 2019 02:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=otbSH85m0WnBj0Q2z9Bj2ZGwzGzcM74-GuaXtt6PeReP60Q@mail.gmail.com>
	<3f13cb86-a12b-aba7-e8a1-517f25ba7f1e@balister.org>
In-Reply-To: <3f13cb86-a12b-aba7-e8a1-517f25ba7f1e@balister.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 31 Jul 2019 11:48:15 +0200
Message-ID: <CAPybu_2XioOxrcbyWe0-5uhR_jfa_emqejhDZrWQwq4NNuUqPg@mail.gmail.com>
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
X-List-Received-Date: Wed, 31 Jul 2019 09:48:32 -0000
Content-Type: text/plain; charset="UTF-8"

BTW, Is there anything for Embedded Recipes or Plumbers?

On Tue, Jul 30, 2019 at 7:33 PM Philip Balister <philip@balister.org> wrote:
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
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Ricardo Ribalda

