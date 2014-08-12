Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 231E661585
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 18:58:13 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id j107so9954567qga.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EEcyxqfQSjg2Dl9y1ww+nq4Hm2Unapqxb+bF2++DlGQ=;
	b=fJ3yc+sKSAj+OeMzsA9u7z/0L+cJ5ewx3651eJtI6oRk9KsdT0RcN3uDyBsqowjjI4
	HHPruwuHisBaLJnCAbI5LbGWpTezR6jIy7oet0elGkiP0WdFfVzPVu3Yr9GKh5NALr45
	dPrsSJJWyhMlUQuzlYpqaZAI4/jG5JwXvRE5p8fG05pQWEX2fQP7j+QNm6m32boOmFbZ
	INibLpuPzcyh/xJAPMaEm68Ocaq1wCLYNKsj4lBJfEigOXVfgGuU0fQyTlZDJQfyi3om
	TNNcJAClfzr9K5b3X3UlWAWowB/o/eIg6C7nQY+Uwgp8P4TNZ0Y2p8fMGm2sFSn5yxte
	4yEA==
X-Gm-Message-State: ALoCoQn0hitKlHzxLeyUAon5lXNBkv9x1ry+nP7Klk7aTFuN94dwF9mLtN+A6ybSvvICUSP9V/bc
X-Received: by 10.140.82.242 with SMTP id h105mr9321907qgd.98.1407869894733;
	Tue, 12 Aug 2014 11:58:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.95.235 with HTTP; Tue, 12 Aug 2014 11:57:54 -0700 (PDT)
In-Reply-To: <53EA5178.7020209@topic.nl>
References: <53EA5178.7020209@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Aug 2014 19:57:54 +0100
Message-ID: <CAJTo0LY+Kp14Sn4bdFtX4eYCK4Oea52MEG-=s6TbG_CKoMx9Pg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Autotools and "foreign"
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
X-List-Received-Date: Tue, 12 Aug 2014 18:58:16 -0000
Content-Type: text/plain; charset=UTF-8

On 12 August 2014 18:40, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> Is there an alternative to manually patching all of these packages to get
> them to compile once more?

Depends on the package, but generally you'll need to update the
automake macro at the top of configure.ac (and submit a patch upstream
as this should have been fixed years ago).

Encouraging said upstreams to use autoreconf instead of (likely)
home-grown crazy would be a good move whilst you're talking to them.

Ross

