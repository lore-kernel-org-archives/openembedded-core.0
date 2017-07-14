Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1E8DC78227
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 17:19:32 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 62so26118718wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=qORQYFkb54cz7zhKNaaifTixuLIQk/NFHI4ukWBt7kI=;
	b=m0fc/Jkl7h3cGlNKRohElgFc5Ar0qoGDZYQy0SrzAG4yXrpDqZXpk8eYp2VqpL2k3q
	5GuKo4bK132D7H4G5XX10xwvcQsuFtSYiPU1eFJAQ0LpIr38Vq1JB4+c58scU/VC+mY7
	bKatlhB0lZuwxUjTf2iTwxL9CbWSCi4z0S+6eNNnEj92/Of61Y8GBaDqb59ybFQVlmqv
	sRlvlLdpyjbjtBo8ugSc5/RNokdGfB1jW0TK8yF48TB/aXzDCgF9NneX7p01WBnVg33s
	8Qgz1bL31GAfg5usHrePP5G7h4yu/F5s2xdR+DtSLOGpgOrV3Ed7ybR8hC0b2BLIbtUy
	5d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=qORQYFkb54cz7zhKNaaifTixuLIQk/NFHI4ukWBt7kI=;
	b=ojvZelGejoXlqJdC+ZS44h4YIvDivJ8KCoOyLon3acjEtoEw2T5NfYmKJlPzlHP1rK
	mElNXshNrchGr95+ODqIGlTUL2zbrOmqyyeb/W5KQGS5qw2YVbD+4yk4MxUKz280FrvA
	rmdtX00MOwWDNNn4xHYSy8ByKtBXJoqd5UerCGfLcLQVKp9nSrGp5ZtKE9CPxHupDfza
	iZw3dEXvCEeW1OpAD9SRd2qL+DQANdbS0ht4bhdkkYT+6UTNOSl2L+FYs/BUp0NcOzYH
	e42EJLzynkNYG0dBaOXra6df95SahJFZgOfF33EpyXAx0Ru8dWkeWDDyqffIg0odi9G/
	xv9g==
X-Gm-Message-State: AIVw112df0rtmoaEBfj/aXGAAI7r2bUdrx2KHxNbmdb0YCH//5ccPNnN
	BOEGjdJvHN4m9k5N2Lc=
X-Received: by 10.28.150.139 with SMTP id y133mr3365099wmd.61.1500052773541;
	Fri, 14 Jul 2017 10:19:33 -0700 (PDT)
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com.
	[209.85.128.176])
	by smtp.gmail.com with ESMTPSA id v8sm7111146wrd.28.2017.07.14.10.19.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 10:19:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f176.google.com with SMTP id 77so70378020wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 10:19:32 -0700 (PDT)
X-Received: by 10.223.139.218 with SMTP id w26mr4879296wra.206.1500052772236; 
	Fri, 14 Jul 2017 10:19:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.73.84 with HTTP; Fri, 14 Jul 2017 10:19:31 -0700 (PDT)
In-Reply-To: <20170712161907.13526-1-ross.burton@intel.com>
References: <20170712161907.13526-1-ross.burton@intel.com>
Date: Fri, 14 Jul 2017 14:19:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrKoTvH5ddakeOkWSa9Wh2jb75yM8mP97sr0OUYEgC+XQ@mail.gmail.com>
Message-ID: <CAP9ODKrKoTvH5ddakeOkWSa9Wh2jb75yM8mP97sr0OUYEgC+XQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: fix build race on src/intel/vulkan
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
X-List-Received-Date: Fri, 14 Jul 2017 17:19:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 12, 2017 at 1:19 PM, Ross Burton <ross.burton@intel.com> wrote:
> It's possible that src/intel/vulkcan can be written into by sed before it has
> been created, so add the required mkdir calls.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Has this been send to upstream? Upstream-Status?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

