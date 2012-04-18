Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SKOny-0005Uf-Mu
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 08:55:54 +0200
Received: by wera1 with SMTP id a1so4548794wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 23:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ollZBJlTraHO7H1GCkCWZB+Ts78AwQZqPBcKNrGAcfo=;
	b=oKnmOqwuoIju7pBzuiAqTuc0S6KRwZVisyPqIRm8AGIoQTbSOiXThwOJQxNIBpDin4
	odC+cSsmFFG7v0Kf3ylXN63XyeJcgcD+qIiIk8+J/26RoXonW6uWlDRVeGiNAEG1AgZS
	jRHoZ4+FS99ZsHc8zUKs2aHJtIfPg7mB/vA0iZOn0hPlCes2ORfcUnrj3ccZpkOjBgu4
	5Ih1fKa8SAlNnyWvujzgtjXcBu8z4RYFMIh+DcgzvAkDezM8FaNpsrcL2uXDZWk88Z2/
	AqwvmGjvw0EbedXlQmAx3po9XJdirHqZsRlNQbV9kWAvxauje4r6Fts6J1eP0Z8t+odd
	85JQ==
Received: by 10.180.82.132 with SMTP id i4mr13873881wiy.12.1334731587929;
	Tue, 17 Apr 2012 23:46:27 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 17sm33024037wis.0.2012.04.17.23.46.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 23:46:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1334700068.git.sgw@linux.intel.com>
Date: Wed, 18 Apr 2012 08:46:26 +0200
Message-Id: <6EA0A289-9E34-4DBC-80CC-B0F58A57CA12@dominion.thruhere.net>
References: <cover.1334700068.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnLxieZ0e2yWF9xcmoBUBHRdlX4CYSvR0h4VIVGIh7ghudgGsV39ySiLoCDt4UtIQycU6V6
Subject: Re: [PATCH 0/3] v2 Self-Hosted Image patches
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
X-List-Received-Date: Wed, 18 Apr 2012 06:55:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 18 apr. 2012, om 00:02 heeft Saul Wold het volgende geschreven:

> Richard,
> 
> This set of changes adds the lsb_release command and 
> sets the i/etc/lsb-release file up correctly for the 
> release.
> 
> I also am removing the BB_NO_NETWORK from the self-hosted
> image to allow it to have network, and updating the SRCREV,
> which you might have to do again to get these patches actaully 
> into the image.
> 
> V2: better commit messages

V3: add PR bumps :)


