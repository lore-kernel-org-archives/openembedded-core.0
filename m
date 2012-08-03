Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SxFAz-0002vq-3V
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 12:32:13 +0200
Received: by eaad12 with SMTP id d12so131662eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 03:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=6JCchhEXIX5SxMqeICX6En6WrJDW2t+vYacP7r3fBAs=;
	b=n5byQHG9ZZRMCvCUUwqhIqSwGwGGOtUg8UmXrLyPQlLRUQaIbPOSm5rPCwUJi0dEqg
	Zl9Cb6oQWPKeJ4Ch0YVdzhZGNa++0UQFC93XTgOU5Aa7jDrUW+XEfAN9UcQNI0CuKr+P
	lTDPGLmLgwecO9+Usiv4mO7kZMEHXk/ziAswZ0jcJaWmh/55jLF+rPdjzkNuVzH6pBi/
	Rlm4kGaueZi7X05eJELdvn0IqYxA6OfSw7eveiz6VgPw256lQW1NSiuSQRWDpvBm0IYf
	/sJDwfJWTzurlz8J0/67esD6HTqEYR9H5c9uuKnq9lxswfgWIHAvFCDs4SMVdHW4/Sq6
	0HEg==
Received: by 10.14.178.67 with SMTP id e43mr1444163eem.44.1343989232558;
	Fri, 03 Aug 2012 03:20:32 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 9sm24471092eei.12.2012.08.03.03.20.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 03:20:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALRxmdCf1vZF21Ruxw_Bi7=uvbQ6-s3_rHU=LtVS19_hR+vvtQ@mail.gmail.com>
Date: Fri, 3 Aug 2012 12:20:37 +0200
Message-Id: <8F468D35-13B9-4FCA-B39A-C030EB69302F@dominion.thruhere.net>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<50183924.8010309@windriver.com>
	<CADkTA4N_mFVkWx7G=E8BoCDYktkNXxO-zLrw_r9e0sO-wE5FjQ@mail.gmail.com>
	<CALRxmdDzaizHQ8m1NFRp2-Ucn9Pm6vZJX=pTTdZ5aLx-61OUzw@mail.gmail.com>
	<50195AFF.1070507@windriver.com>
	<CAEsOVNfbJAqrDf-+DQh3h0pWtf-qDuQqKfC+_oBRHgyY4B6Obg@mail.gmail.com>
	<50197DFA.5070003@windriver.com>
	<CAP9ODKobAsEeouwR+dA2tLNHBxDaxYSunwbbLMs5rV-ES5XfDg@mail.gmail.com>
	<CALRxmdCf1vZF21Ruxw_Bi7=uvbQ6-s3_rHU=LtVS19_hR+vvtQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQnTn0iOfYN1G6KBzPKMOoX3EGdb10NrK0XtC0otTI38823GKYVK2e3VkrMA7YIev/ReC5bO
Subject: Re: static busybox?
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
X-List-Received-Date: Fri, 03 Aug 2012 10:32:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 aug. 2012, om 00:50 heeft Stuart Yoder <b08248@gmail.com> het =
volgende geschreven:

> On Wed, Aug 1, 2012 at 3:05 PM, Otavio Salvador =
<otavio@ossystems.com.br> wrote:
>> On Wed, Aug 1, 2012 at 4:05 PM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>>> On 8/1/12 1:59 PM, McClintock Matthew-B29882 wrote:
>>>> This is one approach, to change busybox completely for a specific
>>>> added layer. But, what if we only want to make this change to =
busybox
>>>> if the lxc recipe is included in the image? What about other =
packages
>>>> also requesting changes?
>>>=20
>>> There is no method within OE to change a configuration of one item, =
if
>>> another item is included or not.
>>>=20
>>> The way to do this is use the PACKAGECONFIG options, and then pass =
via a
>>> per-recipe configuration if you want lxc support enabled or not.. =
(or
>>> possible lxc becomes a distro flag?)
>>=20
>> For lxc specific case I think we can just have a recipe that sets the
>> busybox' static option. It seems to be the only difference we'd have
>> for it.
>=20
> Do you mean a distinct 'busybox-static' recipe that lxc would
> depend on?

Exactly, we already had exactly that in OE-classic=


