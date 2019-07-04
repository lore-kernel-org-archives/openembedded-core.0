Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 262347D3D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 22:28:44 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x15so6969045wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=CU/r4oT67s0mMPh1fs8ueSgmzyQaJV3zpx+8Sk97zhw=;
	b=TF/tBxQK53TqhHeMEG1SmUngRWxsKB06ebDtjdPl5tkq+oDRop8CE4+sV7cgzgUa3O
	dnewkmJXxYoB+9qZ8E2VvQVjN5lliJzemkGo65fvl/PCBx6Ki+Pcrty5+zH5VlS6FQBl
	z4epuY5MJoEN8XBNiCP4dPh6M4WcDaclbVLXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=CU/r4oT67s0mMPh1fs8ueSgmzyQaJV3zpx+8Sk97zhw=;
	b=uZli4nCT+HYLsRWGNzQPagHIFP3tRfqUiM7Xc7Za6Z1Z6rilGW+KB9PO/Iv+9IiM3R
	gE8fstLvd56yDKZ6EyJyAxN5bW1IJa16FCEuxblKXTKyRbGCS7CsxpNh4XwD24oZMzG4
	l4G8Q9YmBD21NkzQ5k9CT0V/kBp1Jvrm2sNFEnyNOzUXjjOz29K0X6RgfK85p1AcnTRs
	QAV0MFGeMz//TTN0pcvAPpSmioYTsR9IvVQV/AWpLf6XgjVIfFB7lbDV2W4b54WjOxVl
	ubDjq2xJdEMcqd/y3brFAGyYpVnKSuiMzS3ypzg+tpmYFB+XTmgquQgtmx/Z+G2kcwI/
	LpWw==
X-Gm-Message-State: APjAAAUaWjgE+wf4szUFmoNDYGn7zQVC+Eo0/FFwaPClQuDFrnipq6NU
	azRXzUp8A+UUS3AoMW/SoADqGQ==
X-Google-Smtp-Source: APXvYqxN6fnTeDmOUM7F5QncmJnHFBl1BBT0EqRJHR678iJ3MExnkWa7jfg/81st/50VdY/1CpaEeg==
X-Received: by 2002:a1c:770d:: with SMTP id t13mr165493wmi.79.1562279325725;
	Thu, 04 Jul 2019 15:28:45 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s11sm3145432wrr.59.2019.07.04.15.28.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 04 Jul 2019 15:28:44 -0700 (PDT)
Message-ID: <985c750cab28264567c6e4e532160d44ed07fbbb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 04 Jul 2019 23:28:43 +0100
In-Reply-To: <a8811c40e7aab0303c7069c5acc00823567821e6.camel@linuxfoundation.org>
References: <20190703150405.GA23280@linux-uys3>
	<1008b3f46332ba67abe67586b176bc7f565b11ad.camel@linuxfoundation.org>
	<20190704142709.GA3410@linux-uys3>
	<a8811c40e7aab0303c7069c5acc00823567821e6.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: build failures due to pigz host tool
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
X-List-Received-Date: Thu, 04 Jul 2019 22:28:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-07-04 at 16:57 +0100, Richard Purdie wrote:
> On Thu, 2019-07-04 at 10:27 -0400, Trevor Woerner wrote:
> > On Wed 2019-07-03 @ 05:10:14 PM, Richard Purdie wrote:
> > > Is there any way you could try pigz 2.4 on your machine, see if
> > > the
> > > problem still occurred there? If you do rebuild pigz, could you
> > > apply
> > > the debug patch in master-next?
> > 
> > I've updated the pigz in the $PATH jenkins sees to pigz-2.4.
> > 
> > However, my builds are always updated automatically and always
> > build
> > from master; there's no way to insert ad-hoc patches into a build.
> 
> That is fine, even just the PATH adjustment will be interesting to
> see
> the results with, thanks!
> 
> Was that version of pigz patched? FWIW I've patched the one on our
> opensuse151 worker so we'll see if that helps shed any light on
> things.

and it did:

http://errors.yoctoproject.org/Errors/Details/250609/

pigz: abort: internal threads error (16, 10)

which means from:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=110ccb56b88af177c0153741a31a9d34b1f75abf

+     if ((ret = pthread_cond_destroy(&(bolt->cond))) ||
+         (ret = pthread_mutex_destroy(&(bolt->mutex))))
+-        fail(ret);
++        fail(ret, 10);
+     my_free(bolt);

so pthread_cond_destroy or pthread_mutex_destroy returned EBUSY.
Further digging required but at least we know which code path we're on.
I wonder if suse did something odd to libpthread...

Cheers,

Richard






