Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id CF4B271A74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 13:42:28 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id e75so56423191itd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 06:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=+iWoN5PKiLX4epjjqHwhtpJVwpfLBqr3CVJVBTtsyz8=;
	b=vGcfzalIvq+7ic3QVO/tgaPeCunzNLds4taJLN7eLc0DZxHS2xA2oGzLzZm/LNcS9e
	7P3g28GalSm+Xxq4N7R5IkFmq49hNpnG/h16tcdPFiF6nUNfJZu9nmmLpw6Z9/En9mVx
	axeO0taRSl6RKYG5bVtp5rxkeD/xka/HlEMZLddYsPOaFdfNGJX5YyIqCv8OcVgpOcnx
	UA+sSv7BIZKBmu3HoxZRhitxL3yYjXuHwxeBNzY/2daqMH0oO1EZUr1nvcC1LbROv/Yc
	VNFcwDA8ZLrXzWpHfeQ6F7z6ZlbuC5WAfwVNnAH161roZ4AsQvuGAUMzJNWQsqmGNieW
	ZhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=+iWoN5PKiLX4epjjqHwhtpJVwpfLBqr3CVJVBTtsyz8=;
	b=UICYkO122cRuBiPjp48d88bSekXCtwzrpYB2ahGz/GQj/ESvxiUTGAMxcUhfL0SaDi
	Gj+NqM70wz2VzYWTln+ZJjJVi9aVg7e5D6qDwiil/6swZRj6fMXWJuPzWBOV/87v+yVD
	zEB5nEX8deAsIKfXR2yl9k9UO89lsOCYGJPMQhvzcNx4cbAvhqtCgpzoDDJJLYc+721E
	Ag7t08EgWkGrsiLOrsq/YWdbL7e7sLzRV3H3AueVHG0IuEyoJvZsEvjPZHPuJg1dKI5F
	MKD7yzBKBgOW9g6unXTJ4bYA84pwodjKAPQstZ9/m1yNlpmKuSWkKYguc/ySlOR4SYwI
	OIVg==
X-Gm-Message-State: AFeK/H0ti1/dBh40TO1Ou0EwOLjB3FBXKPnHNAQM0FLyZOY5GOKxMf0vq5OQHS2tJXjmQLxH
X-Received: by 10.107.136.93 with SMTP id k90mr25812411iod.224.1490708548021; 
	Tue, 28 Mar 2017 06:42:28 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D2BA.dip0.t-ipconnect.de. [93.232.210.186])
	by smtp.gmail.com with ESMTPSA id
	s97sm1909697ioi.50.2017.03.28.06.42.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Mar 2017 06:42:26 -0700 (PDT)
Message-ID: <1490708543.6396.397.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 28 Mar 2017 15:42:23 +0200
In-Reply-To: <alpine.LFD.2.20.1703280651250.4321@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703251400150.8339@localhost.localdomain>
	<1490621485.13980.263.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1703280554060.2771@uk63952.mitel.com>
	<e91ff8ce530942ef8f6711d3c7726f36@XBOX02.axis.com>
	<alpine.LFD.2.20.1703280651250.4321@uk63952.mitel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Replace "if test" file tests with POSIX file tests
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
X-List-Received-Date: Tue, 28 Mar 2017 13:42:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-03-28 at 06:54 -0400, Robert P. J. Day wrote:
>   i'm fine with that, as long as it's officially POSIX. that also
> suggests the alternate tests:
> 
>   [ "${VAR}" ]
>   [ ! "${VAR}" ]

I personally prefer this. ! instead of -z feels more consistent (when
not using the special "-n", let's also avoid the special "-z" and use
the more general "!" instead.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




