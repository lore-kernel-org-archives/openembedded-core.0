Return-Path: <michaelcooper81@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id AD4836C37E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 16:06:05 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id w2so2912804qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 09:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3kILPHLeO0pqVpQavSKI1PKRC65G/+V88cXJI3BXuZc=;
	b=uXqtx0xRwmYKPumbortluKP3DrGSTHKS2h/1k/7R8k8vHcXnr36ws+YseB25VexgCJ
	Znqp7t7NK9/sEklpj3Uaeqz4Azv5uXHq3RXrQnmpENOqSMVMq7//B2Tv6xctAf/GPXeO
	YVekn37yD5UFQS1uFIHrhYKfEgibEkLScP2+7UEi/sm/5le/fqQv7yAe3fgFpkpVAxaO
	yw7Cz/sfTLdtdy23F50t7M7JTCvqGadL2/JG9u3dMGbmMytsbIRhxJDqtL5yX/5a+z/i
	i1rKed52dMyvYrEoumk2y0sogt3hFTxLeX2Ohjq/mgkMvxqXTnOWju8uAeH8WjenfWx6
	Lzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3kILPHLeO0pqVpQavSKI1PKRC65G/+V88cXJI3BXuZc=;
	b=Yf8343SgbQYClbAl7ev3w5ibd/5wMAlrcYwALOfeAhbndvIjffE//hAIPjRCl1JIWc
	tbVpeusxptwbSY7xHyXWNITrgLCbRmikqsXmNpNafsSbMi5d3LW9VJEEhLUsVb1+jwXz
	dZcLYy0faLOSqLjMlXe2UuRybEFl4Fv+I5y/67smTBLmk7xnRFe69JwjlDXlUYWmGb6Q
	sYPZdpouIb4g20JMOprmu+QqD7BXxQgG/FvXaH6PK3l8tsG/8Hg/h23fwsO1KpQz2d+H
	KZWG4n3pXX9pSiU7a9CdtTBqPOrkzcMJXb9dGE4TyL7bRPyamWFuRbQgo1nAtMYejD5/
	GTmA==
X-Gm-Message-State: APjAAAVOx855UHsj2XKLVkFIYnByGazv/hX87U615IabDjM5rI9Ujp+d
	umD7EzFE9T/6qo4X+ENgHzOQOZsz9Jha8BtKzN9tclbh1uoGSlWI
X-Google-Smtp-Source: APXvYqw7cMBs8QPcUT5+20KeaWvLxgikbeEL+YggUJsXHIvR7R6WbVVFL2KStZm2GLPfFZlvQj3ifk00uGgneK55eiw=
X-Received: by 2002:a05:620a:5a8:: with SMTP id
	q8mr4894876qkq.453.1570118766651; 
	Thu, 03 Oct 2019 09:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAEaKURdr0+G66Nm4-nOMVn_3yFUBJJAqxdgzovNuf4o9PyZL4A@mail.gmail.com>
	<daf8cfafd4e22a8a2e91cbf8f53d134281aed2d5.camel@linuxfoundation.org>
In-Reply-To: <daf8cfafd4e22a8a2e91cbf8f53d134281aed2d5.camel@linuxfoundation.org>
From: Michael Cooper <michaelcooper81@gmail.com>
Date: Thu, 3 Oct 2019 19:05:55 +0300
Message-ID: <CAEaKUReUjyOKProTrJqpx6Vnr9iahYeGLte31Msbwa-E5yMqdA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fix #13560 - Partition numbering is broken for MBR primary partition #4
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
X-List-Received-Date: Thu, 03 Oct 2019 16:06:05 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks a lot!
I'll try to make git send-email work next time, this one suffered due
to manual copying :(
On Thu, Oct 3, 2019 at 6:59 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-10-03 at 18:36 +0300, Michael Cooper wrote:
> > Bug: When wks describes extra partitions that aren't in the partition
> > table (e.g. boot loader) and exactly four primary MBR partitions, the
> > last partition gets added to fstab as partition #5 instead of #4.
> >
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=13560
> >
> > Signed-off-by: Michael Cooper <michaelcooper81@gmail.com>
> > ---
> >  scripts/lib/wic/plugins/imager/direct.py | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Thanks, I've queued this.
>
> For reference, your patch arrived line wrapped. It was simple enough I
> could edit that out by hand (been doing this too long, clearly!).
>
> I also tweaked the shortlog to match our guidelines and tweaked the bug
> number reference to the standard [YOCTO #13560]. I just mention these
> so you can sort next time, thanks for the patch!
>
> Cheers,
>
> Richard
>

