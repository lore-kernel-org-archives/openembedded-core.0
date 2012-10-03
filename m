Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TJQay-0007zI-KH
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 17:10:44 +0200
Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 03 Oct 2012 07:57:43 -0700
Received: by iebc13 with SMTP id c13so17948204ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 07:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ANvA1AanZf2Ncy/hv/KsW9pBf1WAM1eBeDkyJi2/GRk=;
	b=lnA6TZpwnNTij+yxVOE1RJBa4iY8cAreplxexVbc+jWaXfWG796dPn2RBSQbeljlv2
	Hs1kbcwCOtPMD2eo8OLQapPn+NP6G1sjpAFO7bEjpKrsEIaL4xXLqEXBrhCvpQlqKFT5
	jKfp8Tzv1sKWVKbmW0nzeAI4vA92W734IpWS4mb/Waxl9DqYD/t9HgeaLGjfFTSMcU+X
	jRVLuJdplNDAXGE/GInJ/nJ/+hMXrrqGBlQQQWBHCIG8z+KB3gRnS4RZ/pQLp1chbcH3
	IAn/c8LYlIzfbrDRQ4wiNJOYwcMetkvg3+QFVNO2r6QEmNXNFtnWuZV327YRs0U+KK2z
	qhKw==
Received: by 10.50.161.136 with SMTP id xs8mr2003634igb.67.1349276262801; Wed,
	03 Oct 2012 07:57:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.141.70 with HTTP; Wed, 3 Oct 2012 07:57:22 -0700 (PDT)
In-Reply-To: <506C5062.1050400@linux.intel.com>
References: <1349266338-15222-1-git-send-email-ross.burton@intel.com>
	<506C5062.1050400@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Oct 2012 15:57:22 +0100
Message-ID: <CAJTo0LZQDw61yL4vPMbV-fpw2ezf+L31OB0u-eSLjGKm+O7FQQ@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQmyI7ysojouhN9YyDpxEJJubmJQI/Np0LNwKczkQNDCV1Ix9fp++/zExK08+Gh7216bA0+U
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant: don't break the DBus service file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 15:10:44 -0000
Content-Type: text/plain; charset=UTF-8

On 3 October 2012 15:49, Darren Hart <dvhart@linux.intel.com> wrote:
> Huh... I didn't detect this as a difference from 0.7 to 1.0, so I wonder
> why 0.7 worked.
>
> But I don't wonder too much - thanks for the fix!

It wasn't a difference, I suspect that the 0.7 source had some quirks.
 If there's some weird case with non-standard directory layouts I'm
not understanding it.  Either way that sed with the 1.0 source and
standard layout *will* corrupt the paths, so it's best gone.

Ross


