Return-Path: <drew@moseleynet.net>
X-Greylist: delayed 432 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 17:00:58 UTC
Received: from mail-ee0-f52.google.com (unknown [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id D57CC60173
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 17:00:58 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e53so4816996eek.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=moseleynet.net; s=google;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=33M7TidDo5B5+q+rl+TBJVyw4EkyCSldOynJ3GLP/mc=;
	b=UbUzk2G66xXwPuaKTsxkHttmelo3ijWE9ECEu1mNneqeXibCj4CqXI3eeiHiWego34
	mig4AFUZdrtE7QxXoO6jbqfuLc8qQVLum0YSyQwieBLVX4/tjMvVmrumGyDUypdskvFg
	WgnWz9RbY/uxGy5xE9Lz68cCHoaWgUhyGmJ8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:content-transfer-encoding:message-id:references:to;
	bh=33M7TidDo5B5+q+rl+TBJVyw4EkyCSldOynJ3GLP/mc=;
	b=l5lsDV6cxewgoFdTbrA9EC+CCKfq64sAMl1BcE6PgCqgTmWXrUYTWsTQ4wnsk6yMaT
	vGk6jAA+VlGWrLIBQwCFQrYCi5p/gSbQfslvqjAIRtSGG8vyp8HGuZ/gLit1Q3mmHk0e
	madlKKkUUc+3bNc9b87T6rHHz1yNagIiaI5Nh9h9mRKBGcis2sLaIudjxkHKAg0eOdjZ
	lZVmWumPsh+HRgICJi0lrpkdKtYWw+MgZXY/KZzS/DjmKurNM33L/8QCRdAQ65Uc3eJG
	ZV3upzD1/EQwiUs0xHdZM+GsSVBx1X9jZuDyFW6mInyb4aP8QdA1mYxZbutRi/jbn6yp
	SZOw==
X-Gm-Message-State: ALoCoQnozTtaG9Li2k66fte6PdECXQ7nqXePQE8h5qST+dx7qPJwLBVO4b2QHdnatHqNKn9VWsqn
X-Received: by 10.15.33.67 with SMTP id b43mr29739085eev.39.1399913626805;
	Mon, 12 May 2014 09:53:46 -0700 (PDT)
Received: from [192.168.1.33] (cpe-174-096-222-251.carolina.res.rr.com.
	[174.96.222.251])
	by mx.google.com with ESMTPSA id m2sm6384380eey.36.2014.05.12.09.53.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 May 2014 09:53:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Drew Moseley <drew@moseleynet.net>
In-Reply-To: <1399912450-27861-1-git-send-email-drew@moseleynet.net>
Date: Mon, 12 May 2014 12:53:42 -0400
Message-Id: <256005AE-6E85-452F-97A8-E50AE3E243DB@moseleynet.net>
References: <1399580261-16249-1-git-send-email-drew@moseleynet.net>
	<1399912450-27861-1-git-send-email-drew@moseleynet.net>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1874)
Subject: Re: [PATCH] mesa-demos: Specify the lib dir to locate glut libraries
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
X-List-Received-Date: Mon, 12 May 2014 17:00:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On May 12, 2014, at 12:34 PM, Drew Moseley <drew@moseleynet.net> wrote:
> From: Drew Moseley <drew_moseley@mentor.com>
> 
> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>

Not sure why "git send-email" dropped the V2 that I thought I put into the 
subject but for clarity this patch completely replaces my earlier one.

The modification of glut.patch is no longer needed.

Drew


