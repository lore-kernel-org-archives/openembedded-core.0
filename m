Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2736.1792831182527643982
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 01:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=RFSzajRj;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Q/J1JHWA;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 895FFEC0176
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 04:39:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sat, 24 Oct 2026 04:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792831181;
	 x=1792917581; bh=yv4qbmX0giIhcsw9jCCcw+lRr9ZNugTD+4PMfhg+an4=; b=
	RFSzajRjy40XzEzXne3Y5UsPin/1r1lMFr/dhRQJ25LV2oUbaWDQZ5Ar+CDDd7M6
	MTsbHVvIBAlyRrtq7LHIfCcDtp/1BsMPUIb6+CdKpj0V99/aeHJwuIXTJ1K7RfTb
	xTsAdtS4lIPDzbklUqhOCeme7sQNFQA74AUZfNv4Ut9yoeCvvlZd6p+M5hDl/8kc
	UnnctpJwrw4yeBTgjHS3eD4Q/qADKMyowdEGtXQBwncTz+HRghug3PLkQo48o3ys
	YbxtspB06RbAyJx9piHTQwXz1vu+rhn8g4rBbmEltHM1GA4KLpBh2hXp3DD1qDVZ
	dthm27I/Znc7HYFI5s1Xkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792831181; x=1792917581; bh=y
	v4qbmX0giIhcsw9jCCcw+lRr9ZNugTD+4PMfhg+an4=; b=Q/J1JHWA85Eywa3NL
	kPV0kkCRy4ME0mrpvB4KKWU2nJbhOT1KRBUHeXcxv4UJk7rkwFVyN5MnJejUMaXR
	YQZZx4syOL3DCvAgkLHnHy5x9tlMXFZrNu7nUIBhxKvQdOn52wMm/e3f4fIOt9B1
	GVp/mOfBcftwRwC+Wnuig0DRZdcMBSEYUY5+r11Ff7XclRbvuG69f0NS70E8oiyz
	XCYH0ZqRvZ69nbnxSrbK6uvDv40yHOgcylWz2GvNgnBJUyH0/3JahOjpkkPpzjoO
	v5amjeRyhkNAKx9JN8sAnnOu3nJmKxQchPZtfhG4dMcuk1+7dM4arwqY50KVBvdn
	dMmNQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792831181; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:veqxOFx1EyhALJ1q4IBJOp+g4zX4hjkQ993CPwNf1Agjr0N
	GwI35U4UZUUj1YLAPOzZ6XVOiYMy49NXI5pfx17ioPy8iQb5UMZOtBtd5nAj1o3+
	/vdC9DlhX4Sa8Bqa9CJNVk45RJXa4Mw9MO+4DMHyxmJF18ezdK5QqOAsYtyqsoay
	pMc1gXwirPK2BfhgANvu8cxFdnlQA/PsQy+rx4uxx3Pt0WNcY8St1ihn0Rg9W0Ei
	Y7yFpqlTsYn69TnYTrreKhMs72nOFck+yYEUG/OY4LI1oCAjSupD4IXVz9RZSlcN
	v+6F8qxohhwBuTIxMrB5DXSuuYvnVqEol0EiF3w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:eMss2mQkgchJ0TkpbSiDL1pzB0DBhPUpFqa1ZwPNJMk=:yv4qbmX0giIhcsw9jCCcw+lRr9ZNugTD+4PMfhg+an4=;
X-ME-Sender: <xms:zW7cal5JQ9UTfjBH1ut5V7Lu0hw0w98-ImqUM2CaPCA5uuBRN7U4Ag>
    <xme:zW7cao5QzEASpB_CB7Ovv0rDDF5kAnB1jzllhlkLJ8JxEKvSrFWqwe2r-v9L3tXIR
    kn__BAP7MQXEN6qzxsxk3gzb1B2dWtBdQaHVDRFa-6yQt6T4iZSYmsQ0Q>
X-ME-Received: <xmr:zW7caqHWjsIlTwVcwjPVkMeKCTU0TbY8fOlXRr3EuGTK6qwiJ-GI0wQ90bvvq9GPmlup_CJ9nw5DzNN87ItKPl0DaTOTaykMtaqgSCo>
X-ME-Proxy-Cause: dmFkZTGqno2upoqUgx6krwwRrfOoXxVrX3HxWv1NZ6d184JEVJpwCUrxoa//O5Nth92mW0
    KlI3600PpCu4nB0eTZXyhDGn8RzzBGRqKBAA+EOQj8A0gYN+4818o5cSyCwgyEsxCOIdAn
    8HDI7FQSZOqV+uFn2V2tQb03TsxFZWHQTmaUGoH/J8wHHkxA4feysTVl8og9zgsWwvUFr1
    2LhPVQMUS45cjdJnGQYS0f0LUy9htITS9uEW+HBAMpig2wxFQtXcx6M+iNn2J2c7qTgPpj
    TiZSH+pN/T118Sq2bXtw6SsJyiljJ3+eKIdGai4XwWLlb+eEvG6mLjFqzKFAFKpjf0dikR
    oaOuL2P0ql6ib1C0eoGR004m1w0/9evl3/UIMLg9vEEHSfXBjwrCdl4uZ720fKFCfnI0Or
    yMZ5+OOeHRTV4BBZveXTCxxwDYmkKAWnxwIExcfLNa3KNfEIb3SDo0dN3DqN6rCBRKeQ+o
    59KcUA85ooxYf805dca/9Q2xRII9/XPMZ3oW7W7WtG9pcuvyAe8tUEhubSDpY18w1tjA0h
    QqGA3jFK12z5tTtzjRgacM+8j3D2Vaj9y6scEyL3VXDX1DzIwLE+BDxVjuELsbm+h4d52E
    180NyjqmR/Qp4DRmKdJnBJZmtqeXvJQwp84YHGab3dCb/fY72e1bU+6BAybw
X-ME-Proxy: <xmx:zW7capRR7M0a3Ui_qfzPDnyteL_d3vVl4NOTRzTSuMGBjHMjL0h7RQ>
    <xmx:zW7carsxIHWJeriZ7Bcf-KyVKUQYSQf-wy5tpKmWRPno42l4t0nn5Q>
    <xmx:zW7cagwaX2uE2l_ADd-0kXYxPsDl05bGLzyA7iOGZnR9UB8PwDROWA>
    <xmx:zW7cat6RiW_KLOQF2D7VFdQmAWphND5GIfMU4bMLcF5vGFInJEb6KQ>
    <xmx:zW7cap-XbBYzGmlcC0qXjhmTgUzHNU_rrv8bzIb6_ZAtj_2e1n1ZOPfv>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Oct 2026 04:39:40 -0400 (EDT)
Message-ID: <41343f21ca75314a48eb33241ce3bd0ce97a7214.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH scarthgap 00/19] Disable compromised CA
 certificates
From: Paul Barker <paul@pbarker.dev>
To: Jeroen Hofstee <oe@myspectrum.nl>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 24 Oct 2026 09:39:39 +0100
In-Reply-To: <06e1700c-7028-4a57-9b20-fb3bd141862d@myspectrum.nl>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
	 <06e1700c-7028-4a57-9b20-fb3bd141862d@myspectrum.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 08:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248584

On Fri, 2026-10-23 at 22:05 +0200, Jeroen Hofstee wrote:
> Hello Paul,
>=20
> For what it is worth, [1] should do the same for scarthgap /=20
> python3-certifi,
> but without porting all new versions back. I don't really mind which=20
> approach
> we take.
>=20
> [1]=20
> https://github.com/victronenergy/openembedded-core/commit/4b6650b6cf7d5eb=
cd60a0bd41c7d9bda3a750a21

Hi Jeroen,

We do want to follow ca-certificates updates on our stable branches.
This has been discussed with Yoann and the TSC before. Failing to keep
CA certificates up-to-date can result in inability to connect to
services signed by a new cert. There have also been other certificates
removed since Scarthgap was released. And lastly we should keep the
different copies of the certificate store aligned where we can.

Best regards,

--=20
Paul Barker

