Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9A065D53
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 18:15:12 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so12100694wgg.28
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 11:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=Mh6BjQXkeljY8ddeKgHiDxWRYJXqqktl3ltIYJ0LwqA=;
	b=jNL9G4B+39puhhd188ERfSSJWJ9JPQ5ttUl/IfdGHR105XxFyqVdn/4YH87358mKia
	MCDR77oMjyK869AfDP0zQp21cEjlUbMCdqqB8kGTw2oJ6ck3ESymo+yPuNWXnP06SmLT
	VPt52gSskGVgK8Inb/sT9qOI5KS+gwhryugZHhgmfE+LqujgsmHf/ErXRKDT508eR+Z5
	K+t74VU14YMiz8Wlf/i4p7oztYDMsq+/ucG6bhR74kZHlGBfCmC+WrpcQ3X5anEur4VT
	l9nOyztc6Z3avmIfwHoq+GhbSIElz3tUpJQLRlg8AREuWHuOrRw9lGs5MgnDiCMUoTsc
	yMmA==
X-Gm-Message-State: ALoCoQnCW3PDP65Z9+g9Nsei+d/T/gMAEqvrbF1DKDu01tK5qLSKjhnw6wmI1ySapvLLElY+JPvQ
X-Received: by 10.194.176.68 with SMTP id cg4mr27072wjc.132.1408904113576;
	Sun, 24 Aug 2014 11:15:13 -0700 (PDT)
Received: from ?IPv6:2001:610:612::ac71:2cc0:b1e4:a02b?
	([2001:610:612:0:ac71:2cc0:b1e4:a02b])
	by mx.google.com with ESMTPSA id
	di7sm93407107wjb.34.2014.08.24.11.15.12 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 24 Aug 2014 11:15:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <53F9FA38.6040809@balister.org>
Date: Sun, 24 Aug 2014 20:15:43 +0200
Message-Id: <F1AB33FC-5B35-49B8-8690-78BD416098FE@dominion.thruhere.net>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org> <53F99AC9.7030604@topic.nl>
	<53F9FA38.6040809@balister.org>
To: Philip Balister <philip@balister.org>
X-Mailer: Apple Mail (2.1878.6)
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Sun, 24 Aug 2014 18:15:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 aug. 2014, om 16:44 heeft Philip Balister <philip@balister.org> =
het volgende geschreven:

> On 08/24/2014 01:56 AM, Mike Looijmans wrote:
>> On 08/22/2014 06:44 PM, Philip Balister wrote:
>> ...
>>> Can we also move to hard float abi?
>>>=20
>>=20
>> +1 to that.
>>=20
>> Especially since "neon" implies "float" support on the Cortex.
>>=20
>> We moved to hard float on the MIPS (mostly broadcom) many years ago. =
I
>> always wondered why the ARM never made that move.
>>=20
>=20
> The problem in the past has been binary blobs compiled for soft float.

You mean softfp, which is very different from soft float.=

