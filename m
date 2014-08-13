Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2D660169
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 10:51:13 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id nu7so8158079obb.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 03:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yOHzCAb3N9kqE5Y443qIMujvO19j4ofJzNeDqvi27f8=;
	b=TSrzB++9dapagWLzkqIw7aVVoRPKRfutETlnYHgtBFYHGYRXS483kTn91/ApNT6GPB
	NSPpBk3zWRlZdutb3oaL/WvXiV4L81bBIhPKSOtn6FZIluRiY5kJr/8jba8N+1wkXHba
	RqmY8kweeyiG3ImGDn55p16rHk8/Qt+RmHuoeY51K60IGN9aO5uAK5uzdoYRyp+A6T/N
	FzzsX5FIVdIY6qvsTlFJxLOYBve/pDd6giFgLmfeAtAtSHfX7mBmydkW5BunNbH2FP5a
	C42hAKR3xt5Sihj7N3/HcpCH/8ntahy9UBC24K6kIjLVvNpw0Le+P72RbNclFsJyHjNf
	b/uQ==
X-Gm-Message-State: ALoCoQnWVi8m1iWLuj74sfv9myWsg1Q6pexM5q1jHs2hGLDvqCX/RGjtTx8oYugRRKWrc+k5piEU
X-Received: by 10.182.142.40 with SMTP id rt8mr2057802obb.80.1407927074003;
	Wed, 13 Aug 2014 03:51:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.171.194 with HTTP; Wed, 13 Aug 2014 03:50:53 -0700 (PDT)
In-Reply-To: <CADV-EXHDKqVR8Quu=Vj7-Tk8BrB-OS1Y=Y0iYi+ES2YNUiREMQ@mail.gmail.com>
References: <CADV-EXHPuDtDk8pnFfJ4QQCVQufidX+7YuuK_FdgsEXj_46t6A@mail.gmail.com>
	<CADV-EXHDKqVR8Quu=Vj7-Tk8BrB-OS1Y=Y0iYi+ES2YNUiREMQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 13 Aug 2014 12:50:53 +0200
Message-ID: <CAP71WjyHMhzdRWmxNwM8Ot=t1O0qFvONyaKqpWSaeEZU_+PKVQ@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Two distros with same MACHINE
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
X-List-Received-Date: Wed, 13 Aug 2014 10:51:19 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 13, 2014 at 12:46 PM, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> I have 2 distro configs that use different PACKAGECONFIG settings for the
> same package. I'm building all distros for single MACHINE. Do I need to set
> different TMPDIR to build these two distros or I can use same dir?
>

yes, you should. i generally recommend to use 1 build dir for each
combination of <machine>, <distro> and <OE version>. keep in mind that
TMPDIR are 'cheap', assuming you are sharing ssate-cache, downloads
and using rm_work..

