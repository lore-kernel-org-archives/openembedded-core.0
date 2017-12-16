Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id C68AD78650
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Dec 2017 12:07:17 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id BAFA25C134E;
	Sat, 16 Dec 2017 13:01:12 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 16 Dec 2017 13:02:19 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <129da6c9-63f8-c660-ec6c-d6b9ba28e480@linux.intel.com>
References: <20171213180624.30839-1-stefan@agner.ch>
	<cce87fc26f1e975fe9ee6d9321bbb870@agner.ch>
	<56bd3e44-1478-9095-4fef-3f7453b7ec94@linux.intel.com>
	<a2a011e2de41685295946b44f13102f4@agner.ch>
	<74fb0f2c-574b-56be-1bba-6b859ee07029@linux.intel.com>
	<d31c5759f38e450334b7762afb5e7496@agner.ch>
	<2e3178d0-c6eb-97f8-c524-bcee54091397@linux.intel.com>
	<37d7ff0a6470bb60cf62d73585b3c3f8@agner.ch>
	<dbdaea03-62b9-3437-5da4-897b633f813d@linux.intel.com>
	<d74719f7fc9f92cfdc443720915252e5@agner.ch>
	<eb8c0e61-9433-2d83-ab23-eed945b476df@linux.intel.com>
	<c7efc74858b05a59105bd21fb6669e48@agner.ch>
	<2ddf3fe7-20f3-87e0-969d-a0ed83cf9256@linux.intel.com>
	<4a6b7a11117ca59fa8b5ffd60c889387@agner.ch>
	<84080427-d60b-6527-b0f4-938fae379559@linux.intel.com>
	<b0d062d27983acc3d7ec40061b661699@agner.ch>
	<d86099aa-2449-6afd-38a9-8bc3270f3e35@linux.intel.com>
	<129da6c9-63f8-c660-ec6c-d6b9ba28e480@linux.intel.com>
Message-ID: <6343b842ae337aae5b3dc32e566414dc@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513425672; bh=bLbHlPzfRePSbo6cUFGcsnE4VJPV4xS0s4z2TsNd2dU=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=I+OZ4Fn3vY7vYAwQnXyTZO56Nu0v/mTSQVSQkH4qWQJLL+33bqIyvVeNaULY8MXnDHJjoKilguXRilCBy3oZr6nnVy6xY4V2Tqx/cf0GkH25mYhj3mqJeLA+GfE24fQalcjChAVTWe0MRZ5hjtDcgzZDhpa/r958JyXFI0c4/J0=
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC] opkg: avoid running postinst scripts twice when using systemd
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
X-List-Received-Date: Sat, 16 Dec 2017 12:07:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2017-12-14 19:04, Alexander Kanavin wrote:
> On 12/14/2017 07:49 PM, Alexander Kanavin wrote:
>> On 12/14/2017 07:40 PM, Stefan Agner wrote:
>>
>>> Oh, I see, well that simplifies it, doesn't it? E.g.
>>>
>>>      # If package managers support postinsts and the package manager is
>>> present on the
>>>      # rootfs, then it will handle postinsts just fine, no need to deploy
>>> scripts again.
>>>      if delayed_postinsts and not runtime_pkgmanage:
>>>          self._save_postinsts()
>>>
>>> And with that it will be as it used to be before the above commit, and
>>> the way it should be.
>>
>> Sorry, but no. You are making an implicit assumption about how rpmrootfs child class behaves here, which is not a good thing to do in a parent class.
> 
> What you *can* do however is move the "and not runtime_pkgmanage"
> check into the child classes for opkg and dpkg. I'm fine with that.
> 

That sounds sensible. Will send a patchset.

--
Stefan

