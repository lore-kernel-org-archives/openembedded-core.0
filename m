Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2B73C6DCA6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 11:45:01 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id lc6so3336752vcb.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 03:45:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kfeoUUpvas5MgkuN2RbFi4l7D7mCT35RBYgiKy14syw=;
	b=VTGjn131Seq7T5hsoajJ6g4pcP6SbvVrAwEhDzk0mdrAvGqzsybPq6YW/nYj2kjZHd
	QlsSRPZJwflH2dhkcAnBSQSNIaNJjSi0WqePS84IU/oR09DwyP3I0IdXZvkLV5Xt/eQP
	xLAB3oXaXspM9kznrN+szyTHFH5VqdTaEs8qojsSRY08FyKCISD+xOIzdRJE2zmoNtb3
	81cYg2QHARBTXw+OqW3/a9QpG43+RXsNwWJ91cjyDEDXz/IiZzG260yU3xrVqw533dGt
	F0DODM7q/JrCezXq81AXkne5QmbyZpgqiptR5UadX7l/eaYTh6Hy/NrFQO+2StmFQ3wq
	wVJw==
X-Gm-Message-State: ALoCoQleRxqUNhuQs5pj9DOLHpJc9Aas7oW2pZRqjTh7pBZx7pcHKYXqowEk5z7+dxAEto0DZ7EC
X-Received: by 10.58.145.200 with SMTP id sw8mr354883veb.68.1386589500078;
	Mon, 09 Dec 2013 03:45:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 9 Dec 2013 03:44:39 -0800 (PST)
In-Reply-To: <1386588627.25847.77.camel@ted>
References: <1386588627.25847.77.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Dec 2013 11:44:39 +0000
Message-ID: <CAJTo0LZbjuaySmTz8q3YEmMxULBWtTTALG7t0zAoMSppGHdVCQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Build directory reuse issue - make WORKDIR machine specific?
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
X-List-Received-Date: Mon, 09 Dec 2013 11:45:01 -0000
Content-Type: text/plain; charset=UTF-8

On 9 December 2013 11:30, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> b) looks attractive but could be confusing as we'd no longer have
> PACKAGE_ARCH workdirs, they'd all be "machine specific" however they
> would still get reused by sstate as they are today. It does however
> neatly sidestep the set of issues we're currently seeing.

As someone who often switches between mostly-compatible machines
(qemux86/qemux86-64/genericx86/nuc) I'm often hitting problems like
this.  Most recently libproxy was using a sysroot that didn't exist,
which prompted my cmake patch.

Presumably the change would replace the package-architecture element
in the path with the machine name.  Seems reasonable to me: a more
logical layout of files without any meaningful impact to performance.

Ross

