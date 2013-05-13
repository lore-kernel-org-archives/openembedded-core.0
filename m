Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UbozC-0006Nu-7J
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:24:09 +0200
Received: by mail-ve0-f179.google.com with SMTP id oz11so5410986veb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 02:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=0JWWSvCquWUfhWujLo2XPl0igwdVSgtaHtkr4digC/E=;
	b=fYy4Pe3aWfi9z83mGRALysfG0NH8XVHuwtV20ANsFLvT22NIcr+KGFmr2LGRfQEOl2
	cgQsMt9+WNOUehpp0Bqu36rfsqPrLPI4dU7rBtyeRQ6U35w2UL59CL6Ql5A1eq+drWQU
	tFZW5ZMEHTuAdkFfibrFMIeS6QD6NyFKv7G/Tkv2swBXqq88cIyfbQZXdxJ1KknC16Yp
	PxUpoaIAv6sLNrh1g1Ji8xH2uHVmKMOsrJex9vol7MswsO5UHExwQCg+k0MB2xBFWp38
	IKh8VdZuJZwr2hoTUdt+a1nf5ZbAXriVNpkPiGcWRGRi6qYOjgQEvpHH051woQ8atJbl
	Mn/g==
X-Received: by 10.52.165.99 with SMTP id yx3mr14930289vdb.34.1368435952501;
	Mon, 13 May 2013 02:05:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 13 May 2013 02:05:32 -0700 (PDT)
In-Reply-To: <1368413938-7757-1-git-send-email-net147@gmail.com>
References: <1368413938-7757-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2013 10:05:32 +0100
Message-ID: <CAJTo0LaFExB-DxJCJ-Sranagpbxc56sT9ahBwgtBLH0PVq3_9g@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQkt6vBpRMG57DAgNOAsyIRZ5BrnVcLhJB2YYFm52PVwE1jHmwSuD1u4Se1ZU2iNgTTJ2F4q
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] connman: add iptables to RDEPENDS
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
X-List-Received-Date: Mon, 13 May 2013 09:24:17 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2013 03:58, Jonathan Liu <net147@gmail.com> wrote:
> The connmand daemon requires libxtables.so from iptables to start up.

And the automatic dependencies-from-linkage code seems to be working just fine:

$ dpkg -I connman_1.13-r20.0.2_core2.ipk
...
 Depends: iptables (>= 1.4.17), dbus-1, ofono, libdbus-1-3 (>= 1.6.8),
bluez4, libgnutls26 (>= 2.12.21), libc6 (>= 2.17), libglib-2.0-0 (>=
2.36.0), shadow, base-passwd, wpa-supplicant

So the question is can you verify that this dependency isn't happening
for you, and how do we fix *that* problem.

Ross


