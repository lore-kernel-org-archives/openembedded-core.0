Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UcNHd-0008QF-U0
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 00:01:22 +0200
Received: by mail-da0-f50.google.com with SMTP id i23so545160dad.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 14:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=aW0QqiJ1deUYIuwcBraLEhOS19cKK+FviIEpHZc5vRs=;
	b=iNQjL4tLyqw8SSSpfUjplUjSCvVG2raZn09xYHMv25N/astyuubUjDzkrCMTUmHzAr
	bdB2f2+UyeiHeJNszNoPZm+eHGcEst2Fr/5oZyIeNHPBslWvSpbGH7W+K3XyNXrAgUbL
	yn+GQhQuK7B56QcWPbuaycULFXPM/hJkF1VngwZMMWU5NvJxVqAImPW332dfPEm7QQ9i
	iDaCvVhG9cuBOMjnCtrgE5TgC1pbf1EE6WiCIWbZf2OwqElwmaexM2dC63pC2JLB3zAP
	ZE4UFJrcSODx5WBSBOmHnlxZ/e2wqEjd1xOhNBF7I7TvBA6xZbDI48ww6KQzlNzelh0+
	ZGRA==
X-Received: by 10.68.254.225 with SMTP id al1mr36566931pbd.69.1368567789423;
	Tue, 14 May 2013 14:43:09 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id gi2sm82761pbb.2.2013.05.14.14.43.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 May 2013 14:43:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <518A0B61.4090403@linaro.org>
Date: Tue, 14 May 2013 14:43:09 -0700
Message-Id: <4648F3D2-7FA2-4672-91D4-CC2ADAA4F051@gmail.com>
References: <515ED999.9040100@communistcode.co.uk>
	<D19A794A-8644-4443-9628-2B137F2BC89F@gmail.com>
	<515EFD76.2090009@communistcode.co.uk>
	<0CA85874-9D57-4E2A-B47D-79DAAD3E78A6@gmail.com>
	<51628545.6050106@communistcode.co.uk>
	<5162888A.90502@communistcode.co.uk>
	<6488B785-095B-4077-96A6-0E2004900C68@gmail.com>
	<5189F404.8090300@linaro.org> <518A0B61.4090403@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gcc-cross-initial Failure (is a meta-aarch64 screw up)
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
X-List-Received-Date: Tue, 14 May 2013 22:01:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 8, 2013, at 1:22 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> W dniu 08.05.2013 08:43, Marcin Juszkiewicz pisze:
>=20
>> I will sort it out today.
>=20
> Should be solved now.
>=20

Not yet. Can you pick up this patch here please

=
https://github.com/kraj/meta-linaro/commit/22bc67f2229f3e36a030787a5161172=
71b05aee0



> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



