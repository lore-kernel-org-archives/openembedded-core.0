Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1SIRZM-0002Xc-Lc
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 23:28:44 +0200
Received: by qcso7 with SMTP id o7so1551050qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 14:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=zhv5jIKd0Y+QXJ0S53FZtUmU68A8nK+4RyWF1zFcNCU=;
	b=j/ne2V7pbsO1HrZ4jo3Bf9k4PBYhFsRtAl8ABYfMg+u5VNjeVU6m4Bzrww8Oi9NrfP
	Vu1H8HNefUq2c8sJJVJzfT6pu5P2p2+ZeC1H80oiJb8v1T6RPEQe76c236NsFE6YMAsH
	GSUu9yzxHYo1NxNJLfdvrVw5+d+erLX1PD9vZGKO+okavx/4RF3pzhjkHdzldxTNMFc+
	AOpzLh37OAiBVLdgoSrt4DPYhJyhz8jYKi7cEndQuP4x73Ncd4tyXlBth6Z/rF64No9t
	NtFu1AcMGBdehKavst3EP0T7PlVNUgFjbRPEONEskXuS9GHwkbWmldQ4J4V0vBHNeIQb
	xNAw==
MIME-Version: 1.0
Received: by 10.224.31.202 with SMTP id z10mr197468qac.31.1334265563795; Thu,
	12 Apr 2012 14:19:23 -0700 (PDT)
Received: by 10.229.94.206 with HTTP; Thu, 12 Apr 2012 14:19:23 -0700 (PDT)
In-Reply-To: <d03c20067d20533415b1af87a73e3ea2315aa21b.1334265557.git.mark.hatle@windriver.com>
References: <cover.1334265557.git.mark.hatle@windriver.com>
	<d03c20067d20533415b1af87a73e3ea2315aa21b.1334265557.git.mark.hatle@windriver.com>
Date: Thu, 12 Apr 2012 14:19:23 -0700
Message-ID: <CAGDS+nm97T4XEgz8zx+SZLuih1Vt1kL5444b8qiANgysZE2JfQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] rpm: Ensure that we check both providename and filepaths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2012 21:28:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 2:21 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> In lib/rpmts.c we need to make sure to look for missing dependencies,
> such as /bin/sh, in both the providename and filepaths DB. =A0Previously
> the system would key off an initial '/' and only look in the filepaths DB=
.
>
> This causes problems when a package such as "bash", has a Provides: /bin/=
sh.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

Tested-by: Steve Sakoman <steve@sakoman.com>


