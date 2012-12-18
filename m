Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tl0DE-00074H-2g
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 17:40:30 +0100
Received: from mail-yh0-f71.google.com ([209.85.213.71])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 18 Dec 2012 08:25:17 -0800
Received: by mail-yh0-f71.google.com with SMTP id j63so1228527yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=oeyeNTSePqtm5396yU6tVu0DK6GAPI1mH9pgEecCueg=;
	b=XYuqNQ0UzZkkhFgHI2TriG8+kV+dnnLFdCo7Vqmnpq1H5kabi4ibHRCrbAGdWNOp/0
	dJQEcX2RSlDGzquR6FUHkomUHg0b+b5U4qCtUQdarXlyLbJhnUGtkfYTDOC/ssgGdLcD
	k7/zlZ7pD9pMppUe8a9PhN5UrSv5GpUQWZ8wycbRjtfMnEJpvzrS+8Dd6DRpW7tSloAt
	/9VS8D1+AxMKUGKGLCgnph1ZXexnxHjfxm9W/juYet/zJ0qK4sbY//7zzEwGh/6OXB7J
	b2c4MQx6rVFn1ZtK6426QQ2rxll6WILLapsYyg6Sm8rYGlf7yVTTfnlUvcO9Fm46HGjw
	00iA==
X-Received: by 10.52.37.9 with SMTP id u9mr3390338vdj.83.1355847916230;
	Tue, 18 Dec 2012 08:25:16 -0800 (PST)
Received: by 10.52.37.9 with SMTP id u9mr3390333vdj.83.1355847916170; Tue, 18
	Dec 2012 08:25:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Tue, 18 Dec 2012 08:24:56 -0800 (PST)
In-Reply-To: <CAP9ODKr7_SmWEWWDa9fwxJ_QBmCQ24x-wdMHSWCfjmoUAcRt+Q@mail.gmail.com>
References: <1355845633-16899-1-git-send-email-sgw@linux.intel.com>
	<CAJTo0LaCj0EtR519zkt-y6GELWA_kuYSV+OynB935ev-uuXc0g@mail.gmail.com>
	<CAP9ODKr7_SmWEWWDa9fwxJ_QBmCQ24x-wdMHSWCfjmoUAcRt+Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Dec 2012 16:24:56 +0000
Message-ID: <CAJTo0LaYi+q09RuB+90VLmDRAREbC936oxqa8Y2riwCg3Jq=5w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQnlHVVOIhuxVpo171l6L8tbIkLjX/iyKgA7THpbqCn0suDSpS2AKlbwI5qhF3ICwejgJm3RUaDLrMxvRWYufN5CHerBNmGnTIC7UHB0H7FAurChk6U2LVbzjG1B3yAju1NkEdnrEQs1EqTtu/kzaGsXKWudTJFvd4PBehK1tnjLII5lLS24huhaWPH8XoUzto9umx/L
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-toolset-native: should not have mesa-dri-glsl-native in this toolset since there are no providers
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
X-List-Received-Date: Tue, 18 Dec 2012 16:40:31 -0000
Content-Type: text/plain; charset=UTF-8

On 18 December 2012 16:21, Otavio Salvador <otavio@ossystems.com.br> wrote:
> MUT?

master-under-test, Saul's staging ground for the consolidated pulls he
makes.  It incorporated the mesa patches of mine that removes
mesa-dri-glsl-native.

Ross


