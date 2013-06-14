Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 53B326204F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 08:53:24 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id da11so249266veb.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 01:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=uu7BuXYNmcR0Lzw0lr38NPL9CC+JfDN2LbeB2klT0Gc=;
	b=n5YNLTnzW814exkEuH4C1LC4q45fJKrvqGAhv4WTaLkPZWEo7iyCXJsmYJJJ8vX3eX
	O9rH9EASJkSpafoIS4QP4UqJUeA82qJyrvcpA/1dGW7ae7uy3afQ2bdorxgylMX0mL62
	mtpUqRL9zuqGpT1PuYaHQex5cPiH5WQ0gOdfwqGNsLFRqBXHzVu+SuCV4Kkvqr6Cphxw
	hMWmGs8IhtFE4Fhv/Eb5oyodgsna7xtspTyRsYE9K4Eyvwhy1BFWROCSDfXGb2gOHrKC
	f83TX1jdCwuy7icXFe6CDb0NreSBZ6Lfuw4cPBpJMWtHsWAY3IqqOMMP11jbIkZyNw24
	Ry6g==
X-Received: by 10.59.1.196 with SMTP id bi4mr564933ved.45.1371200004814; Fri,
	14 Jun 2013 01:53:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 14 Jun 2013 01:53:04 -0700 (PDT)
In-Reply-To: <1371197357-10706-1-git-send-email-jackie.huang@windriver.com>
References: <1371197357-10706-1-git-send-email-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Jun 2013 09:53:04 +0100
Message-ID: <CAJTo0LaX4ZSoN0mNr9eaQLHm7LAh1xEahBfCiimGv4FHSyrTfA@mail.gmail.com>
To: jackie.huang@windriver.com
X-Gm-Message-State: ALoCoQk+6pf084SjGuQoBIZxZRRqpXEYZd79Yr7B+1liIjPPeRXrps+H9cNjngaDPjDPJ6AWNQob
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] acl attr libcap: mark shared libraries executable
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
X-List-Received-Date: Fri, 14 Jun 2013 08:53:25 -0000
Content-Type: text/plain; charset=UTF-8

On 14 June 2013 09:09,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> While it is not necessary that shared libraries be executable,
> if they are not marked as such bitbake will not examine them
> for debug information.  So, we make them executable at the end of
> installation.

Wouldn't it be preferable to change the class that does the debug
extraction so that it doesn't require executable bits on libraries?
Fix the cause not the symptoms and all that.

Ross

