Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UVJXd-0005Pq-0q
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 12:36:42 +0200
Received: by mail-ee0-f51.google.com with SMTP id c1so240234eek.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 03:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=oQ8DmyAhcyonfl/lzQavBNxyWFUDpqXdxvYg56fkfB0=;
	b=jyLPeLrRk/FtsknSQUkIGcdivM5KY+/95NBd1uJyXJGX2qQchkiS8ZeksOakfkQVvC
	mcC1GUcGSYxfb7gxTS5JCV4uLFLPcwZnQAwYBS4gMWa3oqoRRi7ePBfVUGQdYo4MHck6
	iBOjmT3Wmz1rlxAO6efdzuPoUyZDaeBo5PAOQ4sF5KO61ZDDfidCR3yGANI/qKZNdJ2H
	KAw9nJ1C/SFSQZgvNRQb6bRIbi0tKHFenErenxc1olT1NhrKE6FEgwYXkiOa1+1/uMpI
	KGqifYig2F+plyuGRRaK3YoH5tkCH6NMXZLImclbfP+rV2gMuHVbMtSQosXC5x6FyFt4
	HNSw==
X-Received: by 10.15.52.70 with SMTP id o46mr29487053eew.14.1366885137871;
	Thu, 25 Apr 2013 03:18:57 -0700 (PDT)
Received: from ?IPv6:2001:610:612::20f5:6e66:7523:2d78?
	([2001:610:612:0:20f5:6e66:7523:2d78])
	by mx.google.com with ESMTPSA id f9sm9499667eeu.11.2013.04.25.03.18.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 03:18:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LbGvgEg_V8ZqskPCsOqn9koSDW94FAOQ_RdPpiPKEOMfA@mail.gmail.com>
Date: Thu, 25 Apr 2013 12:18:56 +0200
Message-Id: <0B91B38F-8849-4AC4-9211-0E3E5F44D48C@dominion.thruhere.net>
References: <1366882349-22368-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LbGvgEg_V8ZqskPCsOqn9koSDW94FAOQ_RdPpiPKEOMfA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkYlW2fajoOmFcoCr/xi3/mJf+Trtpjk1aITGFDhZmUg7Exxi+BsSk1rWj90jqhi4YEO4eZ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins-gl: make it work for both openGL and openGL ESv2
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
X-List-Received-Date: Thu, 25 Apr 2013 10:36:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 apr. 2013, om 12:12 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 25 April 2013 10:32, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> -DEPENDS +=3D "gst-plugins-base virtual/libgles2 virtual/egl jpeg"
>> +DEPENDS +=3D "gst-plugins-base"
>=20
> This "jpeg" dependency disappeared, was this intentional?


AArgh! no!=


