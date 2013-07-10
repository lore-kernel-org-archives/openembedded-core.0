Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id BA37B608C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 14:35:18 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id da11so5992319veb.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 07:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=mD70v4A/N/kZ7tuTJlgxfKboa57kj3VcySIUV1rxHMU=;
	b=WfObjF5Tr+bsvLQDcRlObAn+pJSCQ+4GUuD6EtpxGBWB78ZcZmxHwJu/BaoPB9XWYl
	ImTbdV7nz2LGFtAa5Xpkka0dHhRcNeETth/S2180cGfr3TNai7pjosnAPmbPORVvSJhn
	q2SqRUJ2AN3lmDwEyU7QrI6R1+wFHivPck+hSq7Wi7erqMeK3gC88uu9dJq+ZcoPjBl4
	5XUfGZfm0st9QQ1M07dBl+3RgtccyzMfL0E9vYSfodDn7Ix8JCzQ/J+5yEADIzywznHb
	5HZtBD8KEQIyJSReCgHpFYT7p3chYXpaNzaqc3lt9nAfmIeX7Yy4HsdA/kF4vJj54gMf
	j2PQ==
X-Received: by 10.220.1.9 with SMTP id 9mr19332814vcd.37.1373466918832; Wed,
	10 Jul 2013 07:35:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Wed, 10 Jul 2013 07:34:58 -0700 (PDT)
In-Reply-To: <20130710124115.GB3288@jama>
References: <20130706213931.GD3288@jama>
	<1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
	<20130710124115.GB3288@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Jul 2013 15:34:58 +0100
Message-ID: <CAJTo0LZiDgWj+Ezz201tUA-QkGEtb=NKZ4xhNWFzJLcgfiJtow@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQkCkDCxNhSF9+nCeLmT9ESO2jIDq6vKCkSfVa9pk/h2SesdrDP6kRwc1UXNAC1snKRWxGxs
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] test-dependencies: add simple script to detect missing or autoenabled dependencies
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
X-List-Received-Date: Wed, 10 Jul 2013 14:35:19 -0000
Content-Type: text/plain; charset=UTF-8

On 10 July 2013 13:41, Martin Jansa <martin.jansa@gmail.com> wrote:
> Build with last version of this script is still running (after 37 hours)
> Building recipe: gnome-desktop (485/1848)
> but I've tested it in smaller builds and I'm happy with current
> functionality, I'll send found issues in tomorrow or day after that when
> the build is complete.

As this has been on my todo list for a while now, come to ELC-E and
I'll get you a beer. :)

Anyone volunteering to run this on oe-core master this weekend?

Ross

