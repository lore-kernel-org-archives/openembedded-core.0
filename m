Return-Path: <twoerner@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id A7A057CF8D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 14:27:12 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id m24so3721058ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=V3WgbO0jNDkSS35pVR11MHdHaSevzFqrlzaQPDJly1o=;
	b=vYMbN4oQ3RyBzyVSEcAA2BlhIyQ/fVypQs21U4pjIksiXHnGIGfmqyo5gjQPvujArP
	+IaY9iH77xgUF4lw2dXYehf2ZTOz9aFY+DTpiAtNP04PZjwTZwHVDa0KrFCGjTtrHfRf
	0s/jJakhywEkbWRI5N/lk25BjqMb95oCN9mlHr2VgGxoxCTrNQpUcdBkzFKSiXKBroSu
	Jy8LZq8ixRRJX/3DIdofi7AJ0F4f0b7yAMbaJ3/LKnNxKX0q2tv7seSXSSqd4eM9ocaV
	ub4+VNohSFnEwO6kjKEguumj+Iw1tDfPeKVR6PYqnIijXv/oc/dCqKVhu4j+uB7O7nYq
	7YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=V3WgbO0jNDkSS35pVR11MHdHaSevzFqrlzaQPDJly1o=;
	b=V1jYBH2BJAcfkF+mBm1nnpFUMMZMFkzmdoJ2h15XqmA1eMJ0oVbhv6nhw3FhbY1fYD
	3vuxC8oHnDW2oJuecdVI7Vues3qB/nn7Ub4AtUiFXYukxE7W8gidS3rzOrwiguQeFyee
	kanoBJeT1Ag/9r8RhUf+kcZHUAfVRH1zeFudJliKYZMaEvZmhj53GyoKy5FvSjp0soAX
	RsPhslpFYGW4pWC6U1MkqzYAmareTEXD5B6u1cLHCrz57Dhs6n7v92jKYdDeU+tRCROA
	4ZZFmS8UdHYGu8Wko8kYCO+oq2Vug22DWhEOmDu+TN43z85qWcVZvqpIRgsySj51NCd1
	w9Xg==
X-Gm-Message-State: APjAAAUm1BJXvXD7V3xAS0yKbRav+pG89URF6TzgfFpYCRRSDHprompy
	FB+6/biEHwzQQh0DFZqGmhyZiNgET9g=
X-Google-Smtp-Source: APXvYqxf1padNmzHG6fNlssqZRK76ETK29smE4c+5LUdcm5ZbBv10Sa8pCtHRKit9UPU6nwe81HwYA==
X-Received: by 2002:a02:ce52:: with SMTP id y18mr47903045jar.78.1562250432889; 
	Thu, 04 Jul 2019 07:27:12 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id t5sm4441760iol.55.2019.07.04.07.27.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jul 2019 07:27:12 -0700 (PDT)
Date: Thu, 4 Jul 2019 10:27:09 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190704142709.GA3410@linux-uys3>
References: <20190703150405.GA23280@linux-uys3>
	<1008b3f46332ba67abe67586b176bc7f565b11ad.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1008b3f46332ba67abe67586b176bc7f565b11ad.camel@linuxfoundation.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: build failures due to pigz host tool
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
X-List-Received-Date: Thu, 04 Jul 2019 14:27:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2019-07-03 @ 05:10:14 PM, Richard Purdie wrote:
> Is there any way you could try pigz 2.4 on your machine, see if the
> problem still occurred there? If you do rebuild pigz, could you apply
> the debug patch in master-next?

I've updated the pigz in the $PATH jenkins sees to pigz-2.4.

However, my builds are always updated automatically and always build from
master; there's no way to insert ad-hoc patches into a build.

The job of my overnight builds is to keep tabs on master branches and ensure
they continue to build, not to test groups of patches in anticipation of
pushing new things into the repository. Therefore my Jenkins build flow has
been structured this specific way on purpose.

Since these failures only occur for me from builds kicked off by Jenkins, I
won't be able to easily help test patches unless I were to create a new
Jenkins workflow.

