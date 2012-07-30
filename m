Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SvpDs-0002qU-0V
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 14:37:40 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 30 Jul 2012 05:25:42 -0700
Received: by yhpp61 with SMTP id p61so4151090yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 05:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=tgn6EKYU2piNtAKA5aYnfVVpJiNiyEU1FO23UPLIkro=;
	b=ZN/tPT1RXEGl34jw1axdNuyd8pL4ETR8BhyojEZynHutzFhGqWVdfKgmHS5RjapfBX
	SH8G/OiLk1qqYEabkfuAYhcLItkHgFyTZKmGk4WdAxvCCr6UFRfgDBLj0xDgtNKlEEA4
	H/URTWEh1NW7CsgmLAQ3+wrkyJJbdWYdCLb4iFzoGTrriShjKyoyv3KzKtbl8xQLPSRT
	5+BFOciaVnr3NGfPTyUKhRIzu65AVrmDf+v2jPnMrQcKZl7S1CD5VZYvqNbxxKIbuBa6
	LOqVn7gg6NNCulWgVncAu+STVR1q2n15MjFHg/ekvr9UWGE63IKrW2coYWiUhLJrjiSN
	GOkA==
Received: by 10.50.217.163 with SMTP id oz3mr8187359igc.5.1343651141634; Mon,
	30 Jul 2012 05:25:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Mon, 30 Jul 2012 05:25:21 -0700 (PDT)
In-Reply-To: <1791255.KrCA1u10OF@helios>
References: <1343650687-2307-1-git-send-email-ross.burton@intel.com>
	<1343650687-2307-2-git-send-email-ross.burton@intel.com>
	<1791255.KrCA1u10OF@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Jul 2012 13:25:21 +0100
Message-ID: <CAJTo0LbQgCFKHbCHV8SLjMhD16hyWd=6ng=9iTLKb4h4Vuka7A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQm5H97KvqVkHffChhLhOm+B6EjNYRyn66iZAuPmZc78U687hJNY7icsFQ00aIzn/3hWIuiP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] buildhistory: reduce the numeric delta to 10%
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 12:37:43 -0000
Content-Type: text/plain; charset=UTF-8

On 30 July 2012 13:22, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> I don't think I picked 20% completely out of thin air but I wasn't especially
> scientific about it either, so:

FWIW, my situation was that I was messing around with the Mesa
packaging and it wasn't reporting a package size reduction due to
package re-arrangement. 20% is fairly large for a "not significant"
change IMHO, I'd be interested to see what sort of "false positives"
it threw up with 5%.

Ross


