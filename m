Return-Path: <daniel@dnil.se>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2301C6A886
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 10:07:18 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id e11so4242812qcx.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 03:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=vqF0aHNuNhVc84WJSocdEHs0D2BKsoMwuzOyk/9bnDg=;
	b=QtIAop6rVZ9h2AWq8wjFD0MqAT3LDFbpE17/9g6bTs/R0U7hz+p2/82FMQxZY5fmQc
	6UryJhhmSf0AmmaSz39eQpsZij8+14rJAKQUtiHkykkGLT2bm5amBCvt7VqGhbRHphzR
	eeg8OH+ofNfFwEbpcNtBpC3zZxwlrg11dHlUbheKOTXvyS7JaWx/MPTaUEt3WcnNi0Nh
	7xOiQQq+cLjo9fx8OwNBBrBoCYE3kN6fCAZSg5sot8eLQPuGOXcir++fkdtZf8FFrz0d
	JFZwDi3O/4+FFC5ezYh6+AEoSOGIZh8e7ladplikENBmhl3S5aN6LOMuQGI+KT1KUhE4
	I9NQ==
MIME-Version: 1.0
X-Received: by 10.224.51.202 with SMTP id e10mr38431142qag.86.1374574038517;
	Tue, 23 Jul 2013 03:07:18 -0700 (PDT)
Received: by 10.49.74.10 with HTTP; Tue, 23 Jul 2013 03:07:18 -0700 (PDT)
X-Originating-IP: [81.235.235.25]
In-Reply-To: <CAJTo0LakgfLTuXy_9w+QuHo6cvafd3qaw4=EgCwyYKKTepkyeA@mail.gmail.com>
References: <cover.1374511663.git.sgw@linux.intel.com>
	<CAJTo0LakgfLTuXy_9w+QuHo6cvafd3qaw4=EgCwyYKKTepkyeA@mail.gmail.com>
Date: Tue, 23 Jul 2013 12:07:18 +0200
Message-ID: <CAHt75b53sON+j4b5RfNEaZUgSj6-7MYjjkkFCF1wYVDOFCoLcA@mail.gmail.com>
From: Daniel Nilsson <daniel@dnil.se>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlHQleCh31uCCWeKoYyKW0rNjcKOQQ5e0EPMLEZlpT7pKLjvEoeRO0luk3daTsE/U0ZuC//
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/27] Ready for Pull after final ACK
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
X-List-Received-Date: Tue, 23 Jul 2013 10:07:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 23, 2013 at 11:45 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 22 July 2013 18:12, Saul Wold <sgw@linux.intel.com> wrote:
>>   glew: Update GLEW version number in autotools patch
>
> This is just going to hit us every time we upgrade the package, so if
> we're going to maintain a non-upstreamed build system then can we a)
> squash our patches to our patches and b) use a do_configure_prepend()
> to inject PV into configure.ac?

Agreed, maintaining this in multiple places is not ideal. While still
learning in the area of OE-core I was not sure what a correct solution
to the problem would be, hence a "quick fix".

> (oddly I can't see this patch on the oe-core list)

My bad, realized too late that the oe-core list was subscriber only so
my mail bounded.

Regards
Daniel

