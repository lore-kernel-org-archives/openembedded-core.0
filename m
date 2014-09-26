Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id B97CB65D59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 21:04:07 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id lx4so796969iec.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=pAgED+/RujHIjh9eXndvpJDRTh6hMWOGIJ7ZglEZKGE=;
	b=ZzGdNxbin+edtX1p8bk5m5Aef56c9ETWCxR7OyZq5L3E+bvG0ppwUkgSxfuIYng3fR
	2myfKeOj/EeWaMqMWP+Vkn5KKEdgInBPI8fMoDCIuoW859KB6NKPTir2pmBqSAWUApsV
	EhyfLuFdtjBb3RKkHiikYppw06tg5tlSHLwdlkR3UNgTQNlR4Hi80vX4ePXos1LZRv/i
	OLhBJP1kTl9lqv+yMXnyhIa8dqHIrspShSdJx5kl22kJJFbh8vDDkrxPIgzAdrm2D18R
	dcWTy253dqi2bUHw95GrqvuVIk//Vvl5utDVwUscabYH8y4V5isxkvSGqMI3VXzOdHkT
	5ZGw==
X-Received: by 10.50.87.99 with SMTP id w3mr34873147igz.4.1411765448747; Fri,
	26 Sep 2014 14:04:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.240.6 with HTTP; Fri, 26 Sep 2014 14:03:38 -0700 (PDT)
In-Reply-To: <CAJTo0LbE-jeFDQ0JcQEK0aDT297HtFXNOyh-sH=nB+j--vC5kQ@mail.gmail.com>
References: <1411749218-11056-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LbE-jeFDQ0JcQEK0aDT297HtFXNOyh-sH=nB+j--vC5kQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Sep 2014 14:03:38 -0700
Message-ID: <CAMKF1srp+cTCDK+4kK1KTwt6k-YTUkdqzYDsCcvW4p0=PC4asQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] bash: Fix shellshock vulnerability
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
X-List-Received-Date: Fri, 26 Sep 2014 21:04:17 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 26, 2014 at 1:15 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 26 September 2014 17:33, Khem Raj <raj.khem@gmail.com> wrote:
>> CVE-2014-6271
>
> Is this meant to replace the patch I sent last night, or did you not
> notice that?

I did not notice that

  It's been a funny day here, but I was about to send the
> C-Pull with that integrated.


>
> Ross

