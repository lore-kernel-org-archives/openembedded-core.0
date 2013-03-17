Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UH1Od-0003ix-Oy
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Mar 2013 01:24:23 +0100
Received: by mail-ve0-f172.google.com with SMTP id cz11so3618538veb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2013 17:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=FwIpi1AltoforLqLxE4PrAbXqJ5EGVa5Tzh+aBK/4u0=;
	b=BkUgcI+Yw+weZNchh3vF8k+jU7kwG28FGZpb5Uh6Y5uEqbv3LyKpPc7BNheEP3opvn
	CEDyvlwWNYXqHBxXovNmX5L+8Om7tbVxzgJ3MlIPamYQcuh7fqecO+JvFO624Y43yK7v
	Gd6JZyXM8NODSf/+SPConsFWvcl3URePrftgwUn5HhgPl3hGq7/v4EMFiypmZIqIiZ+P
	ellGfM3OAkDRIZfEFRL5WApkTelMFJtjWT5nae4dwSBWKjqgxt8dLTE/sqeqSAY/8KIK
	xQnXfglbnFRbZKRb/pFabgsxHYyUwgBY63ojrWsstI3An+ZPxJJrhY0wjwqr/A+9RZfS
	D4IQ==
X-Received: by 10.220.68.3 with SMTP id t3mr9270109vci.73.1363478853630; Sat,
	16 Mar 2013 17:07:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Sat, 16 Mar 2013 17:07:13 -0700 (PDT)
In-Reply-To: <5144E98B.50105@opendreambox.org>
References: <1363434559-12940-1-git-send-email-obi@opendreambox.org>
	<5144E98B.50105@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 16 Mar 2013 17:07:13 -0700
Message-ID: <CAJTo0LZFD5kre_o1Xs6SzJgU4-0ezj8rca9_D_Ck_ytp8F-ELA@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
X-Gm-Message-State: ALoCoQkwuVXMIKSD+V3SZzfmawtKh76TFjXiwfHD/ygjh0mvQWMv8PIYi1LtkCgPF8YjFT9dFrfq
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] default-providers: fix PREFERRED_PROVIDER_udev
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
X-List-Received-Date: Sun, 17 Mar 2013 00:24:24 -0000
Content-Type: text/plain; charset=UTF-8

On 16 March 2013 14:52, Andreas Oberritter <obi@opendreambox.org> wrote:
> Please ignore this patch. Ross already did this is his hybrid
> sysvinit/systemd branch.

For what it's worth that behaviour was intentional, although we
appeared to have neglected it from the commit message.  The intention
at the time was that specifying both would cause the udev provider to
be nonsense, producing an error.

Ross


