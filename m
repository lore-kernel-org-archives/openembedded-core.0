Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id 69DDA60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 17:08:53 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id p5so382055vbn.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4GdfFoja6mdQo85l/SlrygAbeU/mi38K5+znei0uQIM=;
	b=c8Vbd+vdHlRoXoTz4g8M0IolBrzvht6NAwIqvVFd7QLhH08WJMkot7uEgmziJ30VW2
	3r+74vXbmhd/5xgzGjtv4z+rvTN0xoxhvtGfsgflOBfagy8Bs/pIUdD2OAsVCjoCpxBR
	kqHgu97T9Ok+1QtW+JcbObPer/brXOEmH4Llp/2KTqnRRMNWG9cRzm+4mpkGMfNsRljQ
	1z53McuFMdScdkIqvhMsnldknAi0EwCP1R1KDApYSYhAS9PYkZ0O0pe2X2wgu5Gz03Yr
	JdfqOAZBhwFm/T5t8oh03uPGvSOpmu52YPYZUg24cOKn4qIA0pp9AEM8u5mh7JF4mTr+
	hwzg==
X-Gm-Message-State: ALoCoQk6aC2au38ySzRMUR30xUqhFYqYj08LWiBjPIIHkPzSmIYWcemhNOfgM2DJW0nQKbhGXVcS
X-Received: by 10.58.37.232 with SMTP id b8mr1612036vek.27.1390410534463; Wed,
	22 Jan 2014 09:08:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Wed, 22 Jan 2014 09:08:34 -0800 (PST)
In-Reply-To: <52D497EA.20301@windriver.com>
References: <cover.1389598673.git.Qi.Chen@windriver.com>
	<1d073230c282c6e62cd24b164bc42f383a55544a.1389598673.git.Qi.Chen@windriver.com>
	<CAJTo0Lb3ysqtjm-fN5vCqpOONEAUH-N+eeC3a=t+PqG8bOWe1g@mail.gmail.com>
	<52D497EA.20301@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jan 2014 17:08:34 +0000
Message-ID: <CAJTo0Lbs0CswS8pQ0D-HudN-B8e6F0z8dBH694xxkrGocexBHA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd-compat-units: make run-postinsts.service work correctly on target
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
X-List-Received-Date: Wed, 22 Jan 2014 17:08:54 -0000
Content-Type: text/plain; charset=UTF-8

On 14 January 2014 01:50, ChenQi <Qi.Chen@windriver.com> wrote:
> As you have started working on this problem, I think I'll just drop this
> patch.
>
> After looking at your branch, I think there's only one thing to look out
> for. When we're using ipk/dpkg as the package back-end, and
> 'package-management' is in IMAGE_FEATURES, there would be no
> /etc/*-postinsts.

I started but didn't finish - as you've taken the systemd bugs could
you finish this off?  Pretty sure I filed a bug to go with it.

Ross

