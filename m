Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 470377063A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 19:31:01 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id i17so3794770qcy.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 12:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1eSiIgA/5oOUPHtKcxTu+7m0TVC/HfphB3vdampf6rY=;
	b=bWWYz1qNoWLB1Bhz3Cyxbni0/86Q8a3EeKjsk2kavgp/1UXHhGl0CnTeN8GkXWycie
	cWYGCSLNdo49RGNUt7Db8qd8SzdSeSOKZ1HRJhSepfIP317+JfIICfcLRKVOzCNFxSs/
	SdBukk+bPNtKICqXJnXXwj8uS3xp/cyOaHP8t0/JOqtVdWwbvyf9yjdgzo+mo3taIcfJ
	McHlMlMprn5UyMvj9h5M9ufWz4T0eqF0/bJd7WgWl3hgKCi8xBtLTDylPrZCwMEfT4HG
	SDpTP4WEfEC24mLCHt+wgY8MauafAn9K+5TMxOGqyx5Or6XFpyIj25RCdyTU+05+HcWR
	vc7g==
X-Gm-Message-State: ALoCoQnpRDzhwjq1SqFDhTVwc75OhKKpMjB1nvXgjJqxZH+Oj2WmblEGwrrz49j8K5psos1ijZVB
X-Received: by 10.140.47.129 with SMTP id m1mr3463902qga.95.1405711861521;
	Fri, 18 Jul 2014 12:31:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Fri, 18 Jul 2014 12:30:41 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407181455510.13980@localhost>
References: <alpine.LFD.2.11.1407181455510.13980@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Jul 2014 20:30:41 +0100
Message-ID: <CAJTo0Lbefya8wCNvhfVXXytN+HH0nuMbsEO7XPfTk5kVzQ0XxA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: patches can be either ".patch" or ".diff" files, yes?
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
X-List-Received-Date: Fri, 18 Jul 2014 19:31:08 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2014 19:58, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>  not sure where i saw this recently (i'll track it down), but some OE
> or yocto doc claimed that patch files *must* be suffixed with
> ".patch". i'm pretty sure it can be either .patch or .diff, correct?
> as in, it's perfectly valid to do this in a .bbappend file:
>
>      SRC_URI += "file://0001-first-change.patch"
>      SRC_URI += "file://0002-first-change.patch"
>      SRC_URI += "file://0003-first-change.diff"
>
> as long as the filenames match, of course. yes?

For a file to be handled automatically as a patch it must be .diff or
.patch, and it appears that it can be optionally compressed
(identifying extensions being .Z .gz .bz2), so foo.patch and
bar.diff.gz are both automatically applied patches.

Ross

