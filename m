Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyLkS-0000lj-Vz
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:17:41 +0100
Received: from mail-da0-f70.google.com ([209.85.210.70])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 04:01:40 -0800
Received: by mail-da0-f70.google.com with SMTP id t11so9374409daj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 04:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=Se5Lu1EtB0KZ7KhkUP3cBZNhLz3vpC6ObXCwfEDeqI8=;
	b=YfXP85Ebr5PtY9EivQ2lFufmuC7zMrwy5FwycKJBLdJ0z23foTsKpcaudn0weVRF/r
	gcv6tfmWr/5qdMZb2oTGu4Eb/eLlLYwAL5ZK9QK6GxZ3Lw9Mn8KsGkuUFLb4e2iLGhIl
	bQDx8eR7RZiPZoTocU3uP7LJhXwgrJcEgd2Blqy4+LP+9LR1O1YgXR5SQ99lr+y54Sq4
	4cUfxv7hvg2YD9QQhVJPryhOuMKCPj4cS1q1/t3JPkz9kIzI0oZcXHcu+M1jNMNeSabr
	08rJcvrTnffXE2x3DDdS5hQdXTN6M43AwOk/HvodBPifKRlyb/vLYajgWQe0UQf3z+F0
	JKWw==
X-Received: by 10.68.203.137 with SMTP id kq9mr4031734pbc.115.1359028900050;
	Thu, 24 Jan 2013 04:01:40 -0800 (PST)
X-Received: by 10.68.203.137 with SMTP id kq9mr4031725pbc.115.1359028899992;
	Thu, 24 Jan 2013 04:01:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.66.253.233 with HTTP; Thu, 24 Jan 2013 04:01:19 -0800 (PST)
In-Reply-To: <510102F4.70108@intel.com>
References: <50FFFF81.8010203@communistcode.co.uk> <510102F4.70108@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 12:01:19 +0000
Message-ID: <CAJTo0LZfGGSdQwKMshr8PNUVZfk4Nwhr67-9iFbGw2=V=YqN8g@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQl/B7Q3azP1ag9X5OS5ptYJTokcQZ42uZQW39kzoop9aoENyRVWMyC0h+l9TirctbLXgdp7WsZYhPLWTzhGFm8dNcv7ypTLfmbtT+e25eA9Sb7BafZdkLjnI39du6/xRd5NgRCL/HjxC4TvJpzTtkOlnfbUGVK1fTTJWEqAzVk7IRZl09m4FVDP7amzm4Xu6genuzZU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd: /run directory not created
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
X-List-Received-Date: Thu, 24 Jan 2013 12:17:41 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 09:46, Radu Moisan <radu.moisan@intel.com> wrote:
> Possibly because /run was a link created by the initscripts which are now
> disabled when systemd is the init manager. I'll look into this and update
> 00-create-volatile.conf so that systemd will handle the link creation in
> stead.

I wonder how my images booted...  initscripts is sysvinit specific,
the systemd startup should handle this somehow.

(insert standard argument that we should adopt /run across all init systems)

Ross


