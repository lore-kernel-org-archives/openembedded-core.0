Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD6E60778
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 10:05:45 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id c13so218648482lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 02:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tk7DR9EpEyhYZpBEETQvmB2RLpINaSEdpwsdzS/tPDM=;
	b=pbTibxRChtMxLl78jSs3JrRjZaW8dED4E4ppJI7IfhSPa3XWkr+YteE/GtFz8YRbtT
	an/e09ElQ2jIgmcMpjEXNHtjRVLIvoMrwAvEeTlpDf7ZoUjxitjY1IMh35f2aVruwg/6
	TcVurpD5GRQHGFvIZtz6gpSIl0CieL9JwjB8/R7QSxR/MIaa3iswBoILv5JcD+5i/orn
	OKzZ8on+hWXwLhOOk086+rf6mJ3EwBaqoDr3EmOvPTA/VhyL8/8Ks9RR2kyL3l6UiBjB
	OfTtL4r9UfyLn9Y1C62+nh8MsLwRIyPbOYG1AYVmnnyDZkj/aM2HnbFgtXnG8fVxhTEZ
	DjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tk7DR9EpEyhYZpBEETQvmB2RLpINaSEdpwsdzS/tPDM=;
	b=f1hQRoZSEiNBt/VjGKuA/cs/j4gO8GoreeHk4XCYLLjoijl/cgbLzjeg9dMbCbFuAV
	1rfCO2Gi3HZwAZ7f5XSOvYkDOESLIEv1h88bX5Gzs+JCqm3LKhML6OgxyRugOGC484Xc
	4SfEL0Z2WoTXAmx9d56Jx4oPkGoDrB+pkYLWEbmw2Ltxpnrz2/3KL9nAn6idjw72wgN4
	04Ye9dB9Im4GP+3XSfN9Kl//UbGZYn4E6cIVngnSjTlZ58/u1m9vtu0FGCmHg+PipaL4
	IjMeP9OlezBsUx9Hm5duPcNGAr4EAb3z8+HNua6nK1GzXlQx9UyyooHZy6OfG5RRf4C8
	Opog==
X-Gm-Message-State: AIkVDXJqouWeTl28c0vaPCa6ui2JYzmExtkymeJGzqSbpNLQG5tR3qIg8tHDdKhWvcENvA==
X-Received: by 10.25.27.145 with SMTP id b139mr12333144lfb.114.1483005946461; 
	Thu, 29 Dec 2016 02:05:46 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	c25sm12913685ljb.32.2016.12.29.02.05.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 02:05:44 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Dec 2016 11:05:27 +0100
Message-Id: <1483005929-8231-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0LZ4S6FWzR6u2Kek_KjcXD48qTWbVLn5Vm2j20fJtyts9A@mail.gmail.com>
References: <CAJTo0LZ4S6FWzR6u2Kek_KjcXD48qTWbVLn5Vm2j20fJtyts9A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/3] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Thu, 29 Dec 2016 10:05:46 -0000


Ok, new patchset:

* Removed e2tools recipe.
* Switched to using 'debugfs' instead of 'e2ls' in selftest.

-- 
Kristian

