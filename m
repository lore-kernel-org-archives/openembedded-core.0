Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SK2c2-0003wQ-Bv
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 09:14:06 +0200
Received: by wera1 with SMTP id a1so3846310wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 00:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=1WJz4I/uwDZS8oQ25SqUTkvqTtlpELc7FTfxsdgQ8KQ=;
	b=ZSy8WqtkscFvws086wqW5sLk9D1x6gDG+EM4KZPMZnW2Rno6nff4M1YqMo8z+nhPEC
	p2FdK3pvzx6vvL293xgGHsSKmOLfTIVBWsQJ39Qz14vCismXve2c3UXjj8W49HX4nWWX
	w9w1zCgU7RAE+r9Urko8aZ4OfrGvZD2becRmeWqS3QTuXUSsCVHA29UsF1B0B2uoG89B
	f6yjlqrrLLKMK+ZIHSwgnm71vfwy7M2Lgmbhn30KoQ9NvWuN+gy8REgcLCR2TCNgUH1J
	e7F7USa2XGm+Dr3p5mbXFrlV8pRdvcmPZT5l0xfvXmYQSNAlpznSX6oqrUUldkC9Dxz4
	6vlQ==
Received: by 10.180.88.169 with SMTP id bh9mr25801917wib.5.1334646280762;
	Tue, 17 Apr 2012 00:04:40 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff9sm24921769wib.2.2012.04.17.00.04.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 00:04:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5ad851d6c479b34fb05833a6397cd86592d0d899.1334616144.git.mark.hatle@windriver.com>
Date: Tue, 17 Apr 2012 09:04:38 +0200
Message-Id: <002DDBF4-133D-49A3-A23A-A7F5F02DD108@dominion.thruhere.net>
References: <cover.1334616144.git.mark.hatle@windriver.com>
	<5ad851d6c479b34fb05833a6397cd86592d0d899.1334616144.git.mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlO8Up6mVyVVyAWgqZBF7k/MDm+whHv+i0emFFZpZ0TvQn+iOLAvViNkFlVwU71nDsI/dyL
Subject: Re: [PATCH 03/17] coreutils_*.bb: Sync up file path with busybox and minor cleanup
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
X-List-Received-Date: Tue, 17 Apr 2012 07:14:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 17 apr. 2012, om 00:45 heeft Mark Hatle het volgende geschreven:

> We need to ensure that the filepaths used by coreutils and busybox are
> the same.  Do this for base64, mktemp and df.  Also remove references
> to hostname/uptime in 8.14 version as these were only relevant for the
> older 6.9 version.
> 
> su from the 6.9 version is removed, as it should come from shadow.
> 
> (No PR bumps, as the previous patch did that.)

It should have a PR bump, bisectability and all.


