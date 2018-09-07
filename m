Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 599A6797C0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 14:07:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w87E77B0004384
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Sep 2018 07:07:07 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 7 Sep 2018 07:07:06 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, ChenQi
	<Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
	<20180905165227.29435-7-richard.purdie@linuxfoundation.org>
	<a7d35d68-e546-408f-561e-c5a3a8f4aaa5@windriver.com>
	<4f62f20f8d4b9378684b6224ddf7d1bc5cfca814.camel@linuxfoundation.org>
	<6a9fa2c4-b21c-38c5-cd4b-f8f4cfdb39ef@windriver.com>
	<d6d526241f42c97ce71280e180fd73f615a15b4c.camel@linuxfoundation.org>
	<b48197954ed9e662221a9331bc80c5013798b6ac.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	xsBNBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAHNJU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT7CwHcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrs7ATQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABwsBfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <b62bf89f-db69-f458-747c-d61043460b83@windriver.com>
Date: Fri, 7 Sep 2018 09:07:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b48197954ed9e662221a9331bc80c5013798b6ac.camel@linuxfoundation.org>
Subject: Re: [PATCH 7/8] busybox: Put klogd/syslogd alternative links in syslog package
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
X-List-Received-Date: Fri, 07 Sep 2018 14:07:07 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/6/18 5:51 PM, Richard Purdie wrote:
> Just to follow up, I'm trying separating out busybox-syslog's
> recommends from busybox into the higher level packagegroups. The patch
> is in -next and will run tests overnight.
> 
> Doing this is probably good anyway but it does feel like we're working
> around an rpm/dnf issue. I'm open to better ideas...

Circular dependencies can result in non-deterministic behavior.  RPM does not
have any difference in dependency resolution (ordering) for depends vs
recommends.  (The only difference is a recommend is not an error.)  Due to this,
a circular dependency will result in behavior that may change the order of
circular dependent items based on external factors such as file list order, date
codes or ???

RPM does (or at least used to) permit you to specify a way to break circular
dependencies.  But this was a static list of known circular dependencies which
you would simply specify in the macros file which had to be installed first.

The 'correct' way to break this is only specify ACTUAL dependencies, and
realistically there should never be a circular dependency based on a pre-post
install action.  Otherwise, expect non-deterministic breakage.

There is also a way to explicitly set dependencies for the install scriptlets
themselves, but I don't know how this influences the ordering of the
installation.   But this would likely require some special syntax for busybox
(or other early load environments) which likely would be worse then a package group.

(I don't know how or if DNF handles this differently BTW.)

--Mark

