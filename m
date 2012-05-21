Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SWQSn-0007QT-I2
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 13:07:45 +0200
Received: by wgbdr1 with SMTP id dr1so4228385wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 03:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=7Dt/mWxPUym5ubrpD6eYu3U/OWpt8IPXdIn+1ySntzs=;
	b=f3t7nKRm87jBTn+pxg1kNYl7tpbf6wXyuBee3ETW38HoEEknNBgVYLoo9nVTO/CkvF
	ZRAl6qpX+xbbG2KEbLH7w9SLUIaDfBSv5w6/uCnnfH/VKWxf4kR6IcSK732AAgJwuRTy
	YC6bAWDDTCuMg1c9JYSO82uc4QD5o2hguqPOR+pR4BtY9a/Wp+BfxKIbvYI2cwGGly/Y
	9PQjmE2WhOoFq4kys97/MovU9CdxVJcGgoXNiZiYZgmAW1dB+jljiH2CMFEpXS69+Fnl
	VuI4pdBdNaVcIMNxzMNPycewEed3qNlniuUjx4ibhWG6M04O/Q8c8k6vekZNtITuG5um
	3PEw==
Received: by 10.180.109.229 with SMTP id hv5mr36831959wib.0.1337597858382;
	Mon, 21 May 2012 03:57:38 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id eo5sm8627772wib.0.2012.05.21.03.57.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 03:57:37 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKqF=gnm9O7wA+7qDmXpesBO3qNS8QtnGVQmM=srL=4Qfg@mail.gmail.com>
Date: Mon, 21 May 2012 12:57:35 +0200
Message-Id: <34ED02DB-EE8A-4F76-BD6B-2CE2456B1EB7@dominion.thruhere.net>
References: <cover.1337581961.git.sgw@linux.intel.com>
	<cd6ae3da72e2e0052b409d73bb9533f63070e4e9.1337581961.git.sgw@linux.intel.com>
	<20120521065305.GB3166@jama.jama.net>
	<CAP9ODKqF=gnm9O7wA+7qDmXpesBO3qNS8QtnGVQmM=srL=4Qfg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkeEswANtNfEl8Ra4qfBlSB1gVZ685CbObjSLRAqt+u3NrOe3wec2CiaqCnWA/NHk4R35BF
Subject: Re: [RFC v1 1/1] Reorder and -dev
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
X-List-Received-Date: Mon, 21 May 2012 11:07:45 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 21 mei 2012, om 12:48 heeft Otavio Salvador het volgende geschreven:

> On Mon, May 21, 2012 at 3:53 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> the rest looks ok, but I'm pretty scared from such changes, does your
>> buildhistory diffs show just *-config file moves or something else =
too?
>=20
> It would be nice if some images could be build before and after the
> patch and check before proposing this for merging.

Indeed, run the buildhistory output through Pauls analysis tool and =
share the results.

regards,

Koen=


