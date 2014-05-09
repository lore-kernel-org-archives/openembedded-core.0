Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (unknown [209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 13E266059B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 15:18:55 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id a108so4697846qge.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 08:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RoY6x9HzOsGdEJsx9n3ZqF6bZMq6xWtM6gvL3xYHHd4=;
	b=BPOL/2ApuXwA9oNqlqJidr046VP8nd0mSDm272LS51Tj327mRuBv0obL7z+RCH3YzW
	3b/9KMx0Z1ZoZTNsQY5E/sw2zgVP24eODjEjcGQpidL3IiXGJVV9mDTG5hHj70zXr6/J
	lywdLGzPUiBhFzm5Ab49wTT7zwQC2h5RZfj/h7UldQtFVIsH19LssiXorePyZDJvxdwP
	I6/0APbs182pXwz+3nM/eLkKp5XSgfuA2OQTvb4XZIi3tTQoI6P/B00UJDxx2ObCwTkA
	8/grECJ9upJhf2NE2v3ef1TRytbuOTMEvgrrp5akRq/6hWlK2HW+ruYT+/FVlURZFLt8
	SXnA==
X-Gm-Message-State: ALoCoQnh+/nXqxyAn6+/UjOjOwWP8WPF/6HLpixLjyUoQ0EW3/tjOMsyx9pHndaWIEVJDiQLpJbZ
X-Received: by 10.224.121.133 with SMTP id h5mr15377612qar.79.1399648736404;
	Fri, 09 May 2014 08:18:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 9 May 2014 08:18:36 -0700 (PDT)
In-Reply-To: <20140509150721.GA22774@jama>
References: <1399645908-14499-1-git-send-email-ticotimo@gmail.com>
	<CAJTo0LYCdUJMPN8+pZWXrvsRc9fyiq7gm2dOh0N3gRcqWFP1CA@mail.gmail.com>
	<20140509150721.GA22774@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 May 2014 16:18:36 +0100
Message-ID: <CAJTo0LYAv1e0ko7jK6mm9Uz1Hsqvd7rq8dYshogVAE8mCMa=Aw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: add lcms, libpoppler-glib dependenies
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
X-List-Received-Date: Fri, 09 May 2014 15:18:56 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2014 16:07, Martin Jansa <martin.jansa@gmail.com> wrote:
>> For a start libpoppler isn't in oe-core, so this causes a build
>> failure for everyone not using meta-oe.
>>
>> These are for the basic test applications: I'd prefer to see a patch
>> that either forcibly disabled the checks or added configure options so
>> the dependencies can be controlled.
>
> FWIW: I've sent WIP patch a while ago, but never finished it
> http://patchwork.openembedded.org/patch/57011/
>
> IIRC it doesn't apply to current version now.

If definitely doesn't apply to master: weston doesn't check for
poppler anymore as the PDF viewer was removed.

LCMS should have an explicit with/without as it is used for colour
management in the server.

Ross

