Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5BE73D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 17:42:00 +0000 (UTC)
Received: by iofh134 with SMTP id h134so64109750iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=/PzWjLBkqQoWYdGgC96esWkf+wyDeByFA7ZOpH2EPL8=;
	b=PYSWWTAccX8RV2I+wAxIQ8yW7vib3/TW9KGi1Qctu4fV/IqaUrb3acqrkpa+6g+Spj
	pi+59YpeFoEZ0YWDQPOzk3uDCkPJEBJsGgTeowhAQrHzNsV11/P38zuLYDOA/iuSaFCE
	ynumQgwd8IvBK4ZoZw0ptz/n9Y8yKQMW5JXHnEpaD9ZHGDFDdOdnpjx79QWdRCDIMyEW
	3Yfm686WeZPLWrgxC+Uk5GUbpgAlyzGGs3KucHn2S2UQ5Lal9yjsi1qAYqwsKppii4t6
	+mzJXyvKGArsy+RzoOaCSfFLqIRZpt6Gb8naP4JXC8JkEQPqCQPV6W/9RCrMr/td3WR2
	3Ixg==
X-Gm-Message-State: ALoCoQlCdnOZDWI/OAZsYmIGqP3BIi6N+44c71XDL/Yx4143AhlqwsIxnh/pSZZ5kn2o3UgwrJWP
X-Received: by 10.107.34.11 with SMTP id i11mr15679132ioi.6.1442598120193;
	Fri, 18 Sep 2015 10:42:00 -0700 (PDT)
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com.
	[209.85.223.182]) by smtp.gmail.com with ESMTPSA id
	b16sm4122283iob.39.2015.09.18.10.41.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 10:41:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioiz6 with SMTP id z6so63844143ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:41:58 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.7.225 with SMTP id g94mr15817473ioi.28.1442598118746;
	Fri, 18 Sep 2015 10:41:58 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 18 Sep 2015 10:41:58 -0700 (PDT)
In-Reply-To: <ead9754fdacb95aa9d2f02f5880886d4707f13a7.1442585757.git.paul.eggleton@linux.intel.com>
References: <cover.1442585757.git.paul.eggleton@linux.intel.com>
	<ead9754fdacb95aa9d2f02f5880886d4707f13a7.1442585757.git.paul.eggleton@linux.intel.com>
Date: Fri, 18 Sep 2015 14:41:58 -0300
Message-ID: <CAP9ODKq3dy3hRAWjAgMJTxvzX+JRBMAfitrax6wrFr9AZ2SDCQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 18 Sep 2015 17:42:00 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 18, 2015 at 11:16 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> This patch was merged into the 4.8.7 release. This was missed on
> upgrade, and we didn't notice because our quilt-based patch handling
> code ignores already-applied patches.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

