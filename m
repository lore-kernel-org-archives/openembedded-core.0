Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SqeqB-0001Ts-Os
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 08:31:31 +0200
Received: by eeit10 with SMTP id t10so772512eei.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2012 23:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=7UGQpVuKovngdmZxa/bniyaxzyHWUjwFYpm+ZbExSbw=;
	b=iod+DgOVSPFwAqh4kwjxH4toIgTZMWc0VBd/fFYk4UzHAZj8VuCC+iw33I6px5RFhW
	R4rf3OsrYA4Zfhtwk91/dDRdbTpIuDvlnbHeshScCue35c8lnp+IEiUPzgQJJxOU74jn
	eRVbXocbtLHL+x/AEVC+BHmUT6FjNyPMznKBFA3nl4faNU1MbYHBbmCzALM+1Ubd0hKF
	6asUEMWImNy8p1BBs9xZDLfeTt0F1F/FuK2f1UIXlf4d9H0aAFCP5AfFxkKXN9Pj9DwB
	wepGiBPlFcRtqtq56l8/LhL3zR+xMyy0W/PbJ3WYrL+FEx1wS08oN1EONs7LZEYlmeLH
	e6xA==
Received: by 10.14.178.133 with SMTP id f5mr7769991eem.32.1342419614054;
	Sun, 15 Jul 2012 23:20:14 -0700 (PDT)
Received: from [172.20.3.200] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id t6sm15744674eeo.17.2012.07.15.23.20.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 Jul 2012 23:20:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
Date: Mon, 16 Jul 2012 08:11:18 +0200
Message-Id: <29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQneWx4jmhBgUeuovps5CX62PvDsbolYKswjR6E4CRkGMlykOuqmkhz0VVgD9u4q5zDTDXMb
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Mon, 16 Jul 2012 06:31:31 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 15 jul. 2012, om 23:25 heeft Otavio Salvador het volgende geschreven:

> On Sat, Jul 14, 2012 at 6:59 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> The recipe is autotools based now, the COPYING file was replaced with =
the complete GPLv2 license text.
>> No more 'lspci' needed ad runtime, but zlib and libnl are needed =
nowadays.
>> Add 2 patches, one to fix cross builds and one from Linaro to fix C =
state parsing on !x86.
>=20
> Please add proper Upstream-Status for the patches; it is nice to have
> those to track the pending patches.

Isn't that field only used to put in "pending" and then backslap each =
other on doing such a good job?=


