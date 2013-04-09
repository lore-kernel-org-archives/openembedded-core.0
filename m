Received: from mail-vb0-f44.google.com ([209.85.212.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPc7k-0003Mr-IM
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 19:14:27 +0200
Received: by mail-vb0-f44.google.com with SMTP id e12so4996143vbg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 09:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=j5SGGmhVXNNhLxKo5hN4k9+3W38YLXEx5FoCwVc4Nvw=;
	b=IOO8YSEesw+na4BZAH/6dn1RRInJXz84wZUq6J8vYB+no+5GZ8ggTLsaPIlXQvTaH5
	CNECsrB4ZSOaprH9HmXWMt4laJ/y05G9fhJyx7tVSyNJ7t4H2mkK/i2D88gdLSGR/Stx
	MucqS10ujPUX1Nq3EHGR9KvqxV+UmDzfc3YS9yYDGIgeoF7hNj9Ye1Ax++yNO51bovPm
	lAkhNbcCIw8yGgdQWeL7Hwrsq2GRKbRYYYfOnefgFdytfO44YaanT4zU/hXjVw1nxmmH
	CcogOYsDlaemw/sXIqgm0kMq8kirPKfPVkHBZoOqORltihn7L0JNs73M/HKsRb5O7wRW
	kVSA==
X-Received: by 10.58.143.116 with SMTP id sd20mr20033644veb.39.1365526623874; 
	Tue, 09 Apr 2013 09:57:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 9 Apr 2013 09:56:43 -0700 (PDT)
In-Reply-To: <CALbNGRQ0y3+eMKJESmwo0LnwihNZ_H8NViE1BSr+9igjonJ3XQ@mail.gmail.com>
References: <1365517194-30916-1-git-send-email-m.cavallini@koansoftware.com>
	<CALbNGRQ0y3+eMKJESmwo0LnwihNZ_H8NViE1BSr+9igjonJ3XQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Apr 2013 17:56:43 +0100
Message-ID: <CAJTo0LaQXb_1LU=APaUJbkNnyXSjEsKngj7vB1sBAC538WufQw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQl4cdROB6QRdKV2unacdL4RvQQb844WK3Den0jn9i1KGjkTEXTlvWWhjKUuCemKBMON/bL8
Cc: openembedded-core@lists.openembedded.org,
	Marco Cavallini <m.cavallini@koansoftware.com>
Subject: Re: [oe][meta-oe][PATCH 1/4] xinput-calibrator: calibrate touch screen with xorg
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
X-List-Received-Date: Tue, 09 Apr 2013 17:14:46 -0000
X-List-Received-Date: Tue, 09 Apr 2013 17:14:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 April 2013 17:49, Andreas M=C3=BCller <schnitzeltony@googlemail.com> w=
rote:
> On Tue, Apr 9, 2013 at 4:19 PM, Marco Cavallini <koansoftware@gmail.com> =
wrote:
>>  * Taken from oe-classic
>>  * This patch includes pointercal-xinput
>
> 1. Is this a 'core' component?
> 2. If so: Why not importing from meta-oe there were several
> enhancements (mainline) meanwhile?
> 3. I am again(still) working on this ( systemd/udev plug & play ). It
> would make my life easier if we wait with this migration

Erm, yeah.  I didn't notice this was from oe-classic.  My xterm
grumble still applies though!

Ross


