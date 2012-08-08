Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sz9dK-0001vD-M9
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 19:01:22 +0200
Received: by eaad12 with SMTP id d12so254187eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 09:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=KgsifSu4DU4X27JE6S3de+nSruNOPRFk8L9kvlACXSg=;
	b=KhcJtFXLMZ0X7JDa2RORXY73fsUWxiqXDk++KTTzFVVohkhQ1GvTPnew7MqMWz9fnS
	goJJhWc8mh6uwymWCxe9qqRGfaqG1LKzTgmVl+mWc6nbNJCKl/IiU7+VdM8ejV1ZRwxw
	/S+c8eisGImIBiPMlgWhqzcajR5lIRXvPguU+vH08nCg6tqfTe7/bN41MeUeF68trHoD
	3KI/awR6mQiGAodBK5t2VkQXZMHD37N+9H6L+qAt5+TLDXQctnY0tBKr4y7N6oStx0fz
	srSvMaIJm3hsN9EUG8G253viVEj8Dw5hkNJpp4tHX/nRR6Bcg2DSRduCeErdn5pGdOjw
	FE4w==
Received: by 10.14.202.66 with SMTP id c42mr5815384eeo.35.1344444575256;
	Wed, 08 Aug 2012 09:49:35 -0700 (PDT)
Received: from [172.20.0.2] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id h2sm23218530eeo.3.2012.08.08.09.49.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Aug 2012 09:49:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120808150633.GB32611@giant>
Date: Wed, 8 Aug 2012 18:49:04 +0200
Message-Id: <ED067880-C84B-42D9-B3C8-92F5E5B1250F@dominion.thruhere.net>
References: <20120808150633.GB32611@giant>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQkTsXU3R/qjtYDRIU5DDJMawyTbuPeon8NKzeRNKwYTwaN1RJywRwMWPsdVLwlWe9xAsppE
Subject: Re: [PATCH] pigz: Update to upstream version 2.2.5
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
X-List-Received-Date: Wed, 08 Aug 2012 17:01:22 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 8 aug. 2012, om 17:06 heeft Bj=F6rn Stenberg <bjst@enea.com> het =
volgende geschreven:
>=20
> +++ b/meta/recipes-extended/pigz/pigz_2.2.5.bb
> @@ -0,0 +1,11 @@
> +require pigz.inc
> +
> +PR =3D "r1"

Drop that one, it's a new version=


