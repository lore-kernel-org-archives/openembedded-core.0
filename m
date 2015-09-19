Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 41B7073CC7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Sep 2015 00:55:35 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so28292872igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 17:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ryUe89JD4iJ94yMEBbcBK8a7/rKhxZpiMFMdgEZyHJI=;
	b=VTJbOI99TgKydlywBCir5hWHlnHJk+Rbxe8OHjHo1qaUzkkm6lPGRaW8PM+OOz+lg1
	SjRfMlM5aEtdL6dcGSwhJ7TzdusGjbrSyUGZZ355BlPxGMPTalMzQGbbQypQIAoK9x00
	mDmvq1fePGFLaSXCovviQ+EZBMQDxBBYmr/hJwOBviruPqEBs0FqLlUFTkfAGqJUZu2k
	x+LkI4ZNW58nJpFBCt+sMImVeK3QAogPU+FTWb/RHxJIAMLFZ9Z7JTwOk91bYbSjsQLK
	apWFMdJoF61tIEwFyRj0jtGYJBHmGNkoVwyx9YPkF6mKEHq8lMPDuPtVKz4pybUjt+QH
	1iug==
X-Received: by 10.50.122.42 with SMTP id lp10mr962701igb.75.1442624135681;
	Fri, 18 Sep 2015 17:55:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Fri, 18 Sep 2015 17:55:06 -0700 (PDT)
In-Reply-To: <ead9754fdacb95aa9d2f02f5880886d4707f13a7.1442585757.git.paul.eggleton@linux.intel.com>
References: <cover.1442585757.git.paul.eggleton@linux.intel.com>
	<ead9754fdacb95aa9d2f02f5880886d4707f13a7.1442585757.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Sep 2015 17:55:06 -0700
Message-ID: <CAMKF1sqF2gL_gNTEnXuoVnggoBVJVQePHHS6+gj6JZMvczkvDA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qt4: remove already merged patch
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
X-List-Received-Date: Sat, 19 Sep 2015 00:55:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 18, 2015 at 7:16 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> This patch was merged into the 4.8.7 release. This was missed on
> upgrade, and we didn't notice because our quilt-based patch handling
> code ignores already-applied patches.

this is a problem. My host quilt fails on me on duplicate patching,
this should be default otherwise we will accumulate dead code.

