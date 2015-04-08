Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB2D60017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 13:43:22 +0000 (UTC)
Received: by layy10 with SMTP id y10so66253662lay.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 06:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=m9ph6v9yRVpEMIZkNtw9LPSGKyjE/qKpFmgfL5EuQ7U=;
	b=IpBlRHeC1ONtKPk5y+KhWFdFfzpFfoH8Bd4oC0H3W4m9+9vsO1ngKeQPUtVUtzb7qe
	SRjdnyB+1bGo+PdS35tv9TKkfQKRD7qSu14M70fuFgNC6MwnjZtpqk6586z4dDnsxI6m
	wc3WiBGQ3J8bUsEnTLQYhbNa5i+tGNbvsxwufHjZ6tzzVzPDI5mt1US+eilG4hEy9X9u
	BxbFGNTLrinBdm5REeOhe4ahQsqLjF1Q1+0vxXw/hjDfYM63kWlMerCCJUVGds9GW7pQ
	+ScqGvmOwNIWQxKANEPtRe3goRZd/+zbWfZzMezj8lSG6FqEJ3G1CTnZooa6W4k09COQ
	xhzA==
X-Gm-Message-State: ALoCoQlTmXbp1ltf2W23piVwN22jKzDy2vx37MlfmhHldacJa/qUhfIYfwQRjgBXn10XYjFzs+ry
X-Received: by 10.112.173.41 with SMTP id bh9mr22947157lbc.107.1428500602835; 
	Wed, 08 Apr 2015 06:43:22 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id f4sm712507lae.18.2015.04.08.06.43.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 06:43:21 -0700 (PDT)
Date: Wed, 8 Apr 2015 15:43:20 +0200
From: Anders Darander <anders@chargestorm.se>
To: "Krishnanjanappa, Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetworks.com>
Message-ID: <20150408134320.GB8848@ad.chargestorm.se>
Mail-Followup-To: "Krishnanjanappa,
	Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetworks.com>, 
	openembedded-core@lists.openembedded.org
References: <1428500004-9535-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
MIME-Version: 1.0
In-Reply-To: <1428500004-9535-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dpkg: add triplet entry to fix build error for armeb
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
X-List-Received-Date: Wed, 08 Apr 2015 13:43:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com> [150408 15:33]:

> 2. Added INC_PR to PR to have an updated value, when INC_PR is defined
>    in dpkg.inc file

Drop INC_PR from this patch.
There's no INC_PR in the .inc file, and besides that, we're not touching
PR at all, unless we're really forced to. 

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

