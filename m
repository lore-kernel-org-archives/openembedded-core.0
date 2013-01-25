Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tymn6-00087R-0k
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 18:10:12 +0100
Received: from mail-vc0-f197.google.com ([209.85.220.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 08:54:36 -0800
Received: by mail-vc0-f197.google.com with SMTP id gb30so694274vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 08:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=pplGaMaBs/Xd86odJLyarypYLQq1h+UhZ5P51kEUiTI=;
	b=iwlTKST50RU07e9ZnW7Y7sf3X9OWqT7ouzAH34JXPTHkuoqEOfx+WIyCUzck6tEQh9
	Q17/u6IcZCtAvljNjtTv7XqITvPY4BsdHccpmRZzaQhG09ADGFzNmHuaVvJCBV81He/p
	58ava7kfo68BLgYh1X9af5QmCS+cf2GaaJrSY2xz6YBlI8Q5kEF79WLkcaQfoFS2M5V1
	YYuDy3E+dgmjaBq4RKYQGPNijPy6aAfsbMZerCMa+ozKCPXIAIWtNSAWo9RC0JxkBJYZ
	YurxtEla/0IRs0LO3uavWyfnznUB7U0WLkmm5hHn6BE3CQxVT6eF784OryNF9Nw1PAFX
	ebiA==
X-Received: by 10.220.226.70 with SMTP id iv6mr6768498vcb.9.1359132874904;
	Fri, 25 Jan 2013 08:54:34 -0800 (PST)
X-Received: by 10.220.226.70 with SMTP id iv6mr6768493vcb.9.1359132874808;
	Fri, 25 Jan 2013 08:54:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Fri, 25 Jan 2013 08:54:14 -0800 (PST)
In-Reply-To: <1359130842-21997-1-git-send-email-jstashluk@dekaresearch.com>
References: <1359130842-21997-1-git-send-email-jstashluk@dekaresearch.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 16:54:14 +0000
Message-ID: <CAJTo0LaNy=CGKtrEfFwAMJt=FXj99A5u4vTX=L=vSrWcyBG7dw@mail.gmail.com>
To: Jeremy Stashluk <stashluk@gmail.com>
X-Gm-Message-State: ALoCoQlX3M5EftAOqBrshh1PJ8flo1aLzgtPIXN7Ai7ZIAxUDBHeNBw/kIezjJn8JEL+XJOjaf3JQdEuyxZ5rtLsqWjvfQAPkgnkYSQqLKZyMJ9WvFBqFvK9tmnIx6fIpBo7X7vLpAlCEbp3l3zb8BcC1TM1mZRPoqPnQ+2FniTS4AwXtSzrreZArHrPv7uCWO8boOS7Z7ty
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] gst-plugins-gl: add package recipe
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
X-List-Received-Date: Fri, 25 Jan 2013 17:10:12 -0000
Content-Type: text/plain; charset=UTF-8

On 25 January 2013 16:20, Jeremy Stashluk <stashluk@gmail.com> wrote:
> +DEPENDS += "gst-plugins-base virtual/libgl"

You're missing a dependency on GLU:

| configure:22832: error: GLU is required

Ross


