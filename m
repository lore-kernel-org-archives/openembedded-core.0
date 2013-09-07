Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id A6A4C6BD5E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2013 17:23:45 +0000 (UTC)
Received: from [192.168.0.247] (83.252.255.124) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Sat, 7 Sep 2013 19:22:04 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CABcZANkbW5UhgrRsbWACJdJZDKm-Wu5J++ZwBQu_CiW5FzMBBQ@mail.gmail.com>
References: <CABcZANkbW5UhgrRsbWACJdJZDKm-Wu5J++ZwBQu_CiW5FzMBBQ@mail.gmail.com>
MIME-Version: 1.0
From: Anders Darander <anders@chargestorm.se>
Date: Sat, 7 Sep 2013 19:23:36 +0200
To: Chris Larson <clarson@kergoth.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Message-ID: <d210503d-b491-468d-ace9-69e18ee4cba3@email.android.com>
X-GFI-SMTP-Submission: 1
Subject: Re: Regarding ca-certificates & its usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Sep 2013 17:23:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit



Chris Larson <clarson@kergoth.com> wrote:
>I'm emailing as I think we should determine when and where
>ca-certificates gets pulled into images and sdks. Should we add it as a
>RRECOMMENDS to openssl and gnutls, or should it continue to be pulled
>in manually when and where appropriate? I'm not really familiar enough
>with openssl and gnutls use cases to say, so I'm hoping someone else
>has an opinion on this. Thanks,

Well, I intended to suggest that we keep the current situation, as I can see quite a few use-cases where you're using openssl or gnutls, and only want your embedded system to connect to your own server. In such cases, it makes a lot of sense to only supply the certificate k and our root certificates) that your going to trust. 

OTOH, we're now having support for BAF_RECOMMENDS for all packaging systems, so aging an RRECOMMENDS to openssl and gnutls wouldn't be any huge problem. 

For newcomers it might make more sense to have the RRECOMMENDS set. 

So after all, my strong initial feeling is now rather ambivalent....

Cheers, 
Anders 


-- 
ChargeStorm AB / eStorm 

