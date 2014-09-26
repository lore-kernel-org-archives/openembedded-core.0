Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id BAA4E65D59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 21:07:57 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id hn18so295799igb.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 14:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ylO4YnVrmIDO+OW6b4tbO73N/39U5X6jUtaxUXZxwfI=;
	b=nsfN+CGytnSwxTxtUYeZb5QwPOKQWYqVmTVtxUvaZ5Exr20h0Y4wYLgOzCegIdIaMZ
	2cHj3CiWKPChtgoXcwEekLUdnq9bo99UOREyl29Lqop3SvKrL/qn0nuvBmX5odXHpqXW
	YLnPBJCV1PLGaiFacXdB2CWe/AUvtKLhs0wQ1WRUyIXk5kwljs2QpYJOf77vvUZcmqGj
	BfU8yPiEi2ngBbYniakt7VCZInx0yfLWVeU/yUotZFnhOe4vvWsj/xH6+A15U8Xec+4U
	XK8ImgyxOC8UynYWDEGvLBOrlpiOQEQCAgqn98TBk31/WXlWnfPbg/0/AYaNcTH/p9tb
	XgCQ==
X-Received: by 10.42.180.5 with SMTP id bs5mr30158061icb.70.1411765678709;
	Fri, 26 Sep 2014 14:07:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.240.6 with HTTP; Fri, 26 Sep 2014 14:07:28 -0700 (PDT)
In-Reply-To: <CAJTo0LbE-jeFDQ0JcQEK0aDT297HtFXNOyh-sH=nB+j--vC5kQ@mail.gmail.com>
References: <1411749218-11056-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LbE-jeFDQ0JcQEK0aDT297HtFXNOyh-sH=nB+j--vC5kQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Sep 2014 14:07:28 -0700
Message-ID: <CAMKF1spTpCemh0Z8vF1nwNzBgTQV10oep41wu90-R+P2DNdKOg@mail.gmail.com>
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
X-List-Received-Date: Fri, 26 Sep 2014 21:08:06 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 26, 2014 at 1:15 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 26 September 2014 17:33, Khem Raj <raj.khem@gmail.com> wrote:
>> CVE-2014-6271
>
> Is this meant to replace the patch I sent last night, or did you not
> notice that?  It's been a funny day here, but I was about to send the
> C-Pull with that integrated.

Now that I see, you posted half fix like my first set. So either way
the second patch I sent
it needed to complete this vulnerability. I dont care whichever goes
in for the first one.

>
> Ross

