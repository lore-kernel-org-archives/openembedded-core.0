Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id A72016041E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 14:21:25 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id x14so676360vbb.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 07:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=xblbdJCUvr8eBdbZ7KPJskWH366pl6B1pws2yoEWKq8=;
	b=Ous2H5DI7e4Uz4+5XnmVGEdYsz0a9SAMTgJv//l5kW8e3yv71mhmgGE1SWHEi0YMIa
	uX6DtcvFMpMJIO+vltcuMX7DxwoKqa2NnMXa79HkCxffwGvdW6ScbgbH0H3MUL0ZgMrn
	0gf2JB03OO9JHlP1IdUVaLQy9QhT7XJMjJ/3kRpjqQFVvHa8oAUfHS45y2mPp54tkOc0
	1Ni12dNewdPXJciFF2UTc0ofM88tgQSEOb+HOe2HlFeTvmsso7dB+ZXWSDE8x6PEHxWX
	6wpVARe6YetTMwIdT7TX76v6j56VhK8GOpV5KoLQEm3ZsUHd6KxCyYJCfS57uT+TogpG
	MueA==
X-Received: by 10.52.163.46 with SMTP id yf14mr2996289vdb.58.1372342886208;
	Thu, 27 Jun 2013 07:21:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 27 Jun 2013 07:21:06 -0700 (PDT)
In-Reply-To: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
References: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Jun 2013 15:21:06 +0100
Message-ID: <CAJTo0LY--AwQsoe8LKxdqFptoa7TXd2AhqexP6XvnC_Ua+v52Q@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQl0mZkn/tZ32eLsH61YK4uBU3nTo64UkEDXkC8gD2kIGg++UUDuczXpiGL/y4rmpKkw9cT6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3 v2] sanity.bbclass: Check for the known broken version of make
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
X-List-Received-Date: Thu, 27 Jun 2013 14:21:25 -0000
Content-Type: text/plain; charset=UTF-8

On 27 June 2013 15:08, Mark Hatle <mark.hatle@windriver.com> wrote:
> See GNU Savannah bug 30612 -- make 3.82 is known to be broken.
>
> A number of vendors are providing a modified version, so checking
> for just the version string is not enough.  We also need to check
> if the patch for the issue has been applied.  We use a modified
> version of the reproduced to check for the issue.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

Verified that this detects the 3.82 in Debian's experimental
repository that is well and truly broken.

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross

