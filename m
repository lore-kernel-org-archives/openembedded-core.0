Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1F12E7E8A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 18:51:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45TYvF3kF9z2M;
	Wed, 19 Jun 2019 20:51:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560970282;
	bh=b85bnkakfUuPEakfrydBuCR5qvzDh5OeusgmL3KacSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kHA3fpUw5bp6k1hivBfReoNCEhzX4V/bgtOkcZDCfphlVFAWzK6DS+KEmVBcizYiY
	NjAY5EZ4mRnb59gJ/mOW+LL4cyyl1vuNATnIA2nghzDTjLx7SS4VGHOm/92zadbmuO
	vGgtm6MQ4vEF4TJ718LMj5/mpch9kTu+Wx2jfDHKUUJLLwhU/ioZkecAiDz/r124nP
	1VqO17BMV8VMOFjqVt0F3o9H9zYx5jp9o56D7TsTDtFyZLuWQfZ8ociLN8vcT82ZBU
	yZSB7aJM9VVtiV2h2kRPWR4oHmtQP6kWic7aZA0B2f8cweD40kOQSVnTFWVG3DlZfy
	qyvhVu17ttjJZ1/1fk+Ok79X6HTh23wC0FPkcMgAOd5CNd4il7tukATn8fLhwRWGiY
	bht/J7L2SycSDbQnvSXzujngPmvA8zjKzk1NTZEMeBWXg7c0IEhlyDpMXNjfv1pTzU
	gl/Hh+XK7bcWQA764YBSvGvnYjG3y5RnSlrcYOjulOb3sZjfMt2jcMdidHobqLlzyA
	uG/g5ciMWvz7IGH/auKu+lT9u5MkF+z9hPu9aX1KL3CnA6hVSwDXB2Pqm4bv05DPmV
	UUodX1Trnk74qW8Mu/rfEE1GoqFVlcctyry4BX7TNSwL86SOot5QV/GnyvYuR9lG3q
	Aak8RI4ovwH9TM96dsu+w6ZQ=
Date: Wed, 19 Jun 2019 21:51:19 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190619185119.GA4497@localhost>
References: <20190619175429.22836-1-bunk@stusta.de>
	<715abcf8-ff17-a012-391c-a25dbf4451d4@gmail.com>
MIME-Version: 1.0
In-Reply-To: <715abcf8-ff17-a012-391c-a25dbf4451d4@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libxslt: Fix CVE-2019-11068
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
X-List-Received-Date: Wed, 19 Jun 2019 18:51:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 19, 2019 at 11:32:00AM -0700, akuster808 wrote:
> 
> 
> On 6/19/19 10:54 AM, Adrian Bunk wrote:
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  .../0001-Fix-security-framework-bypass.patch  | 124 ++++++++++++++++++
> >  .../recipes-support/libxslt/libxslt_1.1.33.bb |   4 +-
> >  2 files changed, 127 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch
> 
> Thanks for the CVE fix. Is master affected?

This was sent for master.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


