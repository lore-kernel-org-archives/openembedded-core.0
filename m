Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAheh-0002px-M1
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:06:48 +0100
Received: by mail-vc0-f171.google.com with SMTP id fy7so386897vcb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 05:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=IXAvyEBuBICC9wQuagor5sv8Eewa0CgVd2tUEiUaL7Y=;
	b=K1nA5CCgwGImuJIgNjkNnhn3KMPOfSXRzDWN67KTZQ1CDhGnbc39Z1yUFu+RUYDVEs
	6j5DI4zY81oasmB8rhrv4nXiH6LQ5d6IJXtSYcrtPRrk9Lli6tVDO50Xd77M5QYWUljV
	k2+Z6oopA/ozzVeiFk+TjJhIaP4OW5zItjKwt5uAsiWSIXjyw6nwnS3KOeoRdP8wfa+X
	c/Ir+Zkk83t8d/ZHjYkzuiQo++os3ah2XjfkPELVBMPWNOPIAGZ2FDitePZ85eKihb/+
	u8PQu8WmI/dwqIakOhDKLiTaYlMF9fybp3ERk4ec25WYOYFFI+gnJqqIyPKPytNw/8NO
	apFg==
X-Received: by 10.52.91.39 with SMTP id cb7mr776050vdb.71.1361973026719; Wed,
	27 Feb 2013 05:50:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Wed, 27 Feb 2013 05:50:06 -0800 (PST)
In-Reply-To: <cover.1361859756.git.wenzong.fan@windriver.com>
References: <cover.1361859756.git.wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 13:50:06 +0000
Message-ID: <CAJTo0LZ73LuCF-OzNefH+TOa_SwLY+s9rHasqNCPbmBa1pBWvw@mail.gmail.com>
To: wenzong.fan@windriver.com
X-Gm-Message-State: ALoCoQm+69NtiZUSPHjg+JD2Qjq3l0Ce62CNraKbFoYVPT7RH904KihZg/wo36rOBc0w+XJTv0Pt
Cc: scott.a.garman@intel.com, Zhenfeng.Zhao@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1][denzil] alsa-tools: remove warning message
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 14:06:48 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 06:26,  <wenzong.fan@windriver.com> wrote:
> Remove those warning message for alsa-tools 1.0.24.1 on denzil release:
>
> * Note: the latest alsa-tools on master is 1.0.26.1 and doesn't have
> such issue any more.

And what about the current stable release, Danny?  Does this need to
be applied there, or is it safe?

Ross


