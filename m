Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U08zc-0003pA-AJ
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 12:04:47 +0100
Received: from mail-vc0-f200.google.com ([209.85.220.200])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 29 Jan 2013 02:49:03 -0800
Received: by mail-vc0-f200.google.com with SMTP id p1so366554vcq.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 02:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=0IGXJO5LeObuy2FYeFQJPeFlU0HLkwbbFYddLeaq//I=;
	b=P5efvvKYCOH2IWH6uoowBTpzBAM6I9PdrUoerujKWxLFQvWS9PGjbOTk0AL1qi3eC0
	2q+BjYhOtFoz6rZ5peGxzW//Cis7EdVzm2r7qeoywV5eRJc3Z65jhT0HbKvsaMdYOE5N
	y68KaKbn11FjPveqlSlBwdHukD9ScRKWWYk1ZY2FbQXEZpbS8IP/5c7ERDdqF8BQxV6u
	/pgBo/ZpuBfdZlhGMkTi8eVsH6XI+Pwxf3GNRSqBsoNMhfIdwLffiWYCn2pHK6eytnRQ
	om9gwh3AsLHG2y0J9cFHqfHK4dZA3jViApkdlY8+nok/+F6UFpHiRM+5hBSSx3FhdlNR
	wIKw==
X-Received: by 10.220.218.197 with SMTP id hr5mr487644vcb.8.1359456542433;
	Tue, 29 Jan 2013 02:49:02 -0800 (PST)
X-Received: by 10.220.218.197 with SMTP id hr5mr487639vcb.8.1359456542340;
	Tue, 29 Jan 2013 02:49:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Tue, 29 Jan 2013 02:48:42 -0800 (PST)
In-Reply-To: <5107A295.2060307@topic.nl>
References: <51079663.60504@topic.nl>
	<20130129094059.GI16904@jama.palm1.palmone.com>
	<5107A295.2060307@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Jan 2013 10:48:42 +0000
Message-ID: <CAJTo0LYJ8aza9P0V2X_UszE2yWJjGGacWUstPYeoxF0KcwDYxg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQmqyvgqO2RRSqAU9+dzvO0f8yu7siS8zECx3RJzLS/gOlAH98pPxEsaiaWpwon0UZv8VcecqiaWIjp5+yBt5i6atRuZgZl4ctByD58V3CbU+++CC8bisBQCTOjz6HBs4wOPAFLtZCp6QVgEO5Pt4XKiPosZVcPJbL91Q4xnI9wgTrm96mql+fEIxk6HX5e0jf7s5lwQ
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Multiple MACHINE building is broken in OE-core?
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
X-List-Received-Date: Tue, 29 Jan 2013 11:04:53 -0000
Content-Type: text/plain; charset=UTF-8

On 29 January 2013 10:21, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> (Needless rebuild: Built package X for machine A. Switch to B, and it will
> build X again, which isn't needed because they're for the same architecture
> and the package isn't dependent on the machine. Switch back to A, and it
> will AGAIN build package X, which is beyond just needless, it's a bug in my
> opinion.)

A concrete example might help.

Ross


