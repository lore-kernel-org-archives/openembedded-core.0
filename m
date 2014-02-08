Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2CA6E30D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2014 12:07:55 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id up15so4384334pbc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2014 04:07:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=aXLASsbU4E26LAoppLYos5cDRSvypnd/kuGhAOkFjB4=;
	b=gaB56q7iExiimxAuTnMuEbKhOvS/VSdAX2c+9cp4dMHWgDkNzFm7tIxFziKPCklUbh
	A7Rh0eyGYCdh0OpI9zGb5FDDydkVc6MBQ7gZF6lFyFtCkWiF2sS5MN2fJaXbPyTE+koa
	cYMC9klbZNB9ATVPp+12xPcmz4+h0jAcAQ6/V+ZpQNquZjscrubL/qhW6MkiXaYXr/yh
	dxSkNg3yz6aBB/GkG7HPrCTOrkD5TdSkdCTuWK2ZOrupxi0cZlLBvLYEwFN0agsqQmMO
	1DQXqr9nZuW8/kjSUjlt596k9nZAUW85F92igtXLjoNnu+uJzAxGSys4vQwH/YA1IDzy
	C43A==
X-Gm-Message-State: ALoCoQk6cNjbU7FIsZj0pkG8BRrl6i4OUa7k+hipBdcYlixTr1XVXB9hUai+CNmwxAXRUZ1e0Kao
MIME-Version: 1.0
X-Received: by 10.68.189.5 with SMTP id ge5mr25602310pbc.42.1391861275724;
	Sat, 08 Feb 2014 04:07:55 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Sat, 8 Feb 2014 04:07:55 -0800 (PST)
In-Reply-To: <1391860744.32614.52.camel@ted>
References: <1391598835-1631-1-git-send-email-lpapp@kde.org>
	<52F25D84.6060501@linux.intel.com>
	<CAOMwXhMUuS2-dV1xe0YWFxOeD08ByUHHm8DPaqeT=4jAFzHXVA@mail.gmail.com>
	<1391860744.32614.52.camel@ted>
Date: Sat, 8 Feb 2014 12:07:55 +0000
X-Google-Sender-Auth: 4RwdxuoT8w3c2OcCelMqzfEw9WE
Message-ID: <CAOMwXhM8FgqC+z-fo9VNDyn=imUhomLmm+hQUSX4k9r7AsXJyA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/recipes-core/base-passwd/base-passwd/noshadow.patch: Split it into two parts
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
X-List-Received-Date: Sat, 08 Feb 2014 12:07:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Why is it a nightmare? For instance, maintainers in other projects
leave a "Pushed, thanks" note.

See how much discussion this generates already, instead of two words.
While you are at the change to merge it, you are already in place to
leave the comment. However, contributors need to go and find the
corresponding url, etc. Please note that contributors may want to know
whether their voluntary work got merged without even a checkout, for
instance double checking from mobile, etc.

... or is the real problem the lack of maintainer man power?

On Sat, Feb 8, 2014 at 11:59 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2014-02-08 at 11:50 +0000, Laszlo Papp wrote:
>> Saul, would it be possible that you leave a short message on the
>> mailing list in the corresponding thread if a change is merged to
>> avoid such things in the future?
>
> We did used to do this but it turns out to be a nightmare for Saul and
> myself (the people who usually end up dealing with the patches) to do.
> Its relatively easily to update checkouts and note if a patch was
> merged.
>
> Cheers,
>
> Richard
>
>
>

