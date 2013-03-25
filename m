Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UK4MM-00008a-AX
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 11:10:36 +0100
Received: by mail-ee0-f41.google.com with SMTP id c1so756036eek.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 02:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=TDOKUaiyHri5/30ePynZpI6Z85lgWHVSvaSwXBu/ju0=;
	b=GKjKmB05vRKbqGgNCBpISYQOXN9oyYmynJFbda0xuJa9Pn1hNX+T4Ej9hGf70Ku//u
	du9rpDlb6f/Fev6l1G2rAMHY2+xfA3hmOe8nRIkZkDmPgCH/OzuL+EaD1zmFoGbNU6GZ
	BEZJHlqS626P+2AIAWbAV37Ch5f/BTB31d9LhqE8anS8KaS8fd6Xmu1v1ERjOCtoXrcx
	KxcG7TlOCx6WISH+huzOBn8GdxUWSwmkDtjymXPAPk2SDTrTEwizKu7XCOJwyNW8zIBI
	YL8kfKHlOrMrTWDFaTI7txBbmcH5hF2h3JjWHqvRRzKwScf5xslOirjNocOvvxUD2yqW
	MhlQ==
X-Received: by 10.14.216.2 with SMTP id f2mr32322394eep.44.1364205213499;
	Mon, 25 Mar 2013 02:53:33 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id s47sm6546447eeg.8.2013.03.25.02.53.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 02:53:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <51501E03.8020907@linaro.org>
Date: Mon, 25 Mar 2013 10:53:30 +0100
Message-Id: <86C5E727-9B40-42A1-91BF-5B7A18AC377F@dominion.thruhere.net>
References: <1364203928-32746-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<104941556.xik0AZR0dJ@helios> <51501E03.8020907@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQmQbmEVMSRJZ5YE7oM2YJ3sNMQPjfJXDhDYdMjrgMdl0e99ngWkMl/TnpbXok90kWoLmThA
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] powertop: add 2.3
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
X-List-Received-Date: Mon, 25 Mar 2013 10:10:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 mrt. 2013, om 10:50 heeft Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> het volgende geschreven:

> W dniu 25.03.2013 10:43, Paul Eggleton pisze:
>=20
>> Ah, your version misses out quite a few things from the older recipe=20=

>> (alternatives, uclibc compatibility, etc.)
>=20
> What are alternatives to powertop when only powertop provides it?

busybox, as usual :)

>=20
> I am doing uclibc build in background. Will also take care of
> libncursesw -> libncurses change.
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



