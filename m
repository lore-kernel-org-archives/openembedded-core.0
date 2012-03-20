Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9uEc-0005iP-BX
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 09:16:02 +0100
Received: by wera1 with SMTP id a1so6605016wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 01:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=GrlOlunQTAyS/cqVS5mYkxbsT1KX2dR557Syi3jzqoc=;
	b=i0WCtgd/I4vyggrpyYTSx3p4s2yZL2niRr89Vw1e4OStDzVsh7kX7NQDioGt4fpAaa
	IjZgZCEi+93rZdGzo96TUY21VkTtj2OiFLMWJXr9W3jWCV4vi2FzX6W+BNqJ1IQwCzNT
	vWJKhGpWXegZ1+Y+kftLzVZ6VkLhz/3Sc9ivhzFzBH2ieMkBfJUIESVjmfK1e+8TnQ2n
	g5SQlqRfqnntiIDjoPIdppprlXgEF+7P4h2i3sNJKyUx5R0f+CGQ4J0k9RN2udM8CDO6
	XbdQYnpdX2Yk9+cZRsEI/UZfXLLkVdjb25OCgovIZlrqqzUH1CXuV526dUCSFpAcEoNt
	99IA==
Received: by 10.180.14.73 with SMTP id n9mr26468860wic.16.1332230830262;
	Tue, 20 Mar 2012 01:07:10 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w10sm3672245wiy.3.2012.03.20.01.07.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 01:07:09 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F681A97.4020201@windriver.com>
Date: Tue, 20 Mar 2012 09:07:05 +0100
Message-Id: <665F9083-9747-4972-BCDE-BCE209266221@dominion.thruhere.net>
References: <cover.1331877464.git.xiaofeng.yan@windriver.com>
	<22ff60ec34d2c54393d4ceb2a81394c6512baa17.1331877464.git.xiaofeng.yan@windriver.com>
	<4F679F53.40302@linux.intel.com> <4F681A97.4020201@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkBLrALhCEXkKuOtxgm+XBYT6y3QCGQGIUMcNBzgSslSmFBjQ6dqBqKxOqhg9nqewtWQUfP
Subject: Re: [PATCH 2/7] archiver.bbclass: New bbclass for archiving sources, patches, logs and scripts
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
X-List-Received-Date: Tue, 20 Mar 2012 08:16:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Op 20 mrt. 2012, om 06:50 heeft Xiaofeng Yan het volgende geschreven:

> On 2012=E5=B9=B403=E6=9C=8820=E6=97=A5 05:04, Saul Wold wrote:
>> On 03/15/2012 11:23 PM, Xiaofeng Yan wrote:
>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>=20
>> Why do you rebuild the tarball here are rename it instead of just =
copying the original tarball?
>>=20
> because many packages come from non-tarball and they could be git =
sources , So I archive these sources after do_unpack.

But if you have the original tarball and reuse it, you'll get the warm =
fuzzy feeling of matching checksums.

regards,

Koen=


