Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ua63a-0003tT-VX
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 17:13:28 +0200
Received: by mail-vb0-f52.google.com with SMTP id p13so1647829vbe.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 07:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=cU4qoiuLEEtTWuTRcMXgiXE7fshMBo0MB1/Pqi3L6yM=;
	b=SmdvShSUQMlWzh5Cf78gtRBJkjhNvpC1C3uqPL8rLQoGT/vyVbBVrgGG4GlI/DORv3
	TQTQvKCOdRp+NKP+0QtRRazCxiqB2EGWiny47jqH81+4J8novO9x1geVIx1jA+DQo+mh
	h42E52rOt/AXJu6iP7uHsloROjN5jmhs6KD3RYYtsnbbqdaG7S7WnYldaoRx05yeCMT5
	dwN4l0KuFQfcYxUo0mLQVCO+JQLSXtCem8w18okFwQVT6PjIPCHnRF3A3x6qw+Pd0Ixl
	0AFToadaYU8AbMUj+sC64+jaZFWuqOdt4Vfs4Qa22Qxc0vo5bPi87Etx+ZA1UQ0Rdqmt
	LLbQ==
X-Received: by 10.52.18.206 with SMTP id y14mr4119838vdd.29.1368024924262;
	Wed, 08 May 2013 07:55:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Wed, 8 May 2013 07:55:04 -0700 (PDT)
In-Reply-To: <1368024119-4149-4-git-send-email-ionutx.radu@intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
	<1368024119-4149-4-git-send-email-ionutx.radu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 May 2013 15:55:04 +0100
Message-ID: <CAJTo0LbwTmE1Un=GFVWQok=38Ljzeg0PSJ5ZhqZRQ0b_efD3Vg@mail.gmail.com>
To: Ionut Radu <ionutx.radu@intel.com>
X-Gm-Message-State: ALoCoQlGfa7ixniSE3DMmWZFi+F72UGID+EnWYb9crlu1pCSGQ4eKj8+Wnpf9eom6tHL/ivQ+d+W
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] js: updated from 1.7.0+1.8.0rc1 to 185-1.0.0
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
X-List-Received-Date: Wed, 08 May 2013 15:13:28 -0000
Content-Type: text/plain; charset=UTF-8

On 8 May 2013 15:41, Ionut Radu <ionutx.radu@intel.com> wrote:
> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>

Is there anything in oe-core that still needs this?  I suspect we only
had it for Web, but as we dropped the non-webkit Web a while back I
don't think we're actually building this at all (apart from in world
builds) so should we discuss moving it to meta-oe?

Ross


