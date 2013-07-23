Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id E59FE6077D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 15:21:33 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id gd11so316750vcb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 08:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=aQCS5g4ihWXs3gkXwgr69nYLN1T+TBstP9Kj5XQU28k=;
	b=pLk/nsjHIwFuGlLqemqLwZRWog/2B1gjmdjli2UthD3/FkOUaOjgblmpJgeKlCPZPW
	xOhTfRP+D25FITqeznYnGwEfU8hbFdQFPSub9w6HMygp+rOxYvlSxnyZCH56huPxXeHx
	gWIJ57hLA49oSMczxkyRbjGHNF6LSRLR9HYkNcNzHJ7IzxAQmu+c+ymQ8aDd+U6kBDwt
	RWh9zFzdogrcKvpycbLKcMscHzka46l4/xRxC/EqSrsoNJjDUg15xSXzk10xIttUePPm
	Ke5m3//hrHpwPY6bVgbH84+qXqmfQHBS/JwTrND7HcweCwrHNOG8yaqVpCBrm7HOM51n
	9Bdw==
X-Received: by 10.52.185.101 with SMTP id fb5mr379299vdc.1.1374592894246; Tue,
	23 Jul 2013 08:21:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Tue, 23 Jul 2013 08:21:14 -0700 (PDT)
In-Reply-To: <51E840B5.2080106@linux.intel.com>
References: <1374163718-26829-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
	<51E840B5.2080106@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2013 16:21:14 +0100
Message-ID: <CAJTo0LbmYyr76=72_o4Jris60Gm8gH2LqpJ+1=1dhSA-m+bA9Q@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQm930pxBbRq7w7z7jf/9tYFRJDi+3urrNptyltM4rfWs1pHCYm9TsSMiZEld8RaUN9N5a7V
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] distrodata.bbclass: Include PRSPV variable in upstream version checking
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
X-List-Received-Date: Tue, 23 Jul 2013 15:21:34 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2013 20:23, Saul Wold <sgw@linux.intel.com> wrote:
> I thought we were going to look into use regex instead of adding a new
> variable.

Specifically, I was thinking something like this would work:

package_regex.inc has an optional new variable, REGEX_PV_FILTER.  If
set, this will be used with re.sub to filter the PV extracted by
REGEX. Something cloning the syntax of Perl's s/// operator maybe,
using / to split the input RE and the replacement string.

i.e. REGEX_PV_FILTER_pn-docbook = "\./" would replace all dots with
the empty string, thus changing 1.2.3 into 123.

Ross

