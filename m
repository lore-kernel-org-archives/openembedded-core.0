Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SDgag-0000s1-ER
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 20:30:26 +0200
Received: by yhjj56 with SMTP id j56so528806yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 11:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to
	:x-mailer:x-gm-message-state:content-type:content-transfer-encoding;
	bh=es4bJo8v8SXqUe1ehFORTS7BP5EVcxKbIbG4ox0G/EY=;
	b=nbDYCxi1hC5QyyaGpxaBttC4z9t4mRj4JeA3TQTecXSGBtn0XRXRqam3dy0AS7r/5K
	itqgfBUKiISytE2K4Dfp5lK+YM77s3No+mRKw68VYME/vy0iFiDHrV0gD+Sprmk6t7/b
	HvMkfKHj+aBNAxNMNhlS0rxj31MlkUuGDqYUqcnPyvnL+Ha7ie/LjubP5BqDdVtv5BUo
	WQGKbMD62A1feExbvxIEAYEHGbgDGQPmvEw5exHpmV4Us6rJX8KQQfsPGXem87cy4krf
	w3L0KlviGyVsBRMjKHCGLmtPOHCrQqGkxLM7q5rf0ERHzzpY9fVFPcNVJHjF4JU6R4vD
	j/8w==
Received: by 10.68.213.202 with SMTP id nu10mr11516620pbc.37.1333131680783;
	Fri, 30 Mar 2012 11:21:20 -0700 (PDT)
Received: from [10.61.32.129] ([69.38.219.78])
	by mx.google.com with ESMTPS id mg3sm1859846pbc.51.2012.03.30.11.21.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 11:21:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120330181051.GB5488@denix.org>
Date: Fri, 30 Mar 2012 11:21:32 -0700
Message-Id: <596E47ED-E724-4EF1-B963-7D76FCC5E7AF@dominion.thruhere.net>
References: <1333101001-13652-1-git-send-email-Martin.Jansa@gmail.com>
	<1333104939-25404-1-git-send-email-Martin.Jansa@gmail.com>
	<20120330181051.GB5488@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlZHnmgR5GeAwCwCMRz1fFsDlpBhSKEOvG3RhBUKSCPd+kjD6DOHVRaE6J9A/x28PBbvW6Q
Subject: Re: [PATCHv2] rootfs_ipk: don't echo opkg-cl output to log.do_rootfs
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
X-List-Received-Date: Fri, 30 Mar 2012 18:30:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 mrt. 2012, om 11:10 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Fri, Mar 30, 2012 at 12:55:39PM +0200, Martin Jansa wrote:
>> * log_check can find some files with ERR or Fail substring e.g. in =
"Source: " field
>>=20
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> This one looks better and it does not change the regex string, like =
the patch=20
> sent to bitbake-devel...
>=20
> Acked-by: Denys Dmytriyenko <denys@ti.com>

Acked-by: Koen Kooi <koen@circuitco.com>=


