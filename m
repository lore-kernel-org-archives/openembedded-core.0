Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0189B76710
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 23:58:44 +0000 (UTC)
Received: by padhk11 with SMTP id hk11so21089604pad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 16:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=Hw9o+Qym7em9ISnwEc28E7Xfw2WIc5euNLCF1jSqYRU=;
	b=rTYETlceZOxZ8pTNTWc9K8wxTW4z/ISfGnvmHjjRTdBruL2RKz5vq7WbrYpU09qyvm
	IXYZmJAT3D74jnC0gvswvfl7wn98nW6LJnrzJdes/SAoIVd50S8TND9I9s0HQ5nZf/qd
	nIE7Y6PORSvwGiV8ds0W//DcmHQ5rMY0i4zwd448bgx1BdRTcTMy3PcV+Twc33uDaS/D
	ww6/0M/ohGTo8FxiD9EmmQe2b1KCNGK+/0d7Ke2l4bsJ4RShT4Z+D8TMOkKkvmGrqPs9
	c9AxKLIHKYfDDe/RoFus/CBiVmP2UgwuZIrvxXDcXzvubrDfVn/wz+idstNiYsFTK9zV
	Gz7Q==
X-Received: by 10.66.124.200 with SMTP id mk8mr36201767pab.25.1446076724615;
	Wed, 28 Oct 2015 16:58:44 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:64b8:1072:ca0d:242?
	([2601:202:4000:1239:64b8:1072:ca0d:242])
	by smtp.googlemail.com with ESMTPSA id
	oi3sm30334475pbb.53.2015.10.28.16.58.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Oct 2015 16:58:43 -0700 (PDT)
To: OE-core <openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56316130.5090908@gmail.com>
Date: Wed, 28 Oct 2015 16:58:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: [Fido][Dizzy] tzdata and tzcode back port request
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
X-List-Received-Date: Wed, 28 Oct 2015 23:58:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Please backport these changes from master to Fido and Dizzy.

tzcode: update to 2015g
931dda4d9adbefa68b8e6e9796d55a9e3d2bfcee


tzdata: update to 2015g
a0e7311b207e6ea156c89c22388695192ba57f43


and possible

tzdata: reinstate changes reverted in 2014c upgrade
402723ead0b07255497bc137327f2aac0f6c74b0

Fido is at rev 'd' so you may want to backport 'e' or just jump to 'g'

dizzy is at 'b'.. who is maintaining that ; )

- Armin

