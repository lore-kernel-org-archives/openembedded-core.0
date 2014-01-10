Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8B16560DF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 15:35:48 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u57so4064411wes.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=sRZ8/eyha+Y2vJOqusW0G5m6xaMATMX5M833UuQnLL0=;
	b=VK6z3mJ/I16ZUEaDJJCdcAi55BlmLqD2AF1un56p7ln8I/iXM/Z7wT7Kd8tc8UsZTO
	QOgO/O/dD3A732uGRtiWvRQP6AmmAZV/Peea1nX9em7g5m2ForDEzU/tLIMtYvZ9zFaQ
	6DFmFCt1xBuEiBiQBt3O1lmku9EMNg3hWJOyfi02WiZKJZiZHHt966qcrE7zwo33XFh9
	w20Wgc4+r1cZ+v1X3d9xsEuXV/ndontd8uzJ6fdCSCDhg/jmoAfqwdxGv0Ho4FgB/OOD
	raLb9g28aHSxRXN2QraxBvZHdQ76S1AiSQdsyN/34s1duV8ZsyjYBr4vc6zzkVt/HWCH
	hOQA==
X-Gm-Message-State: ALoCoQnqjI+e7DZh0dCrIUj/UiZc9IsmjzzBfTuHaROEA+5K+YHR9ceN+Za2eivAZBVjhGRAkjxs
X-Received: by 10.180.108.42 with SMTP id hh10mr3308823wib.15.1389368149044;
	Fri, 10 Jan 2014 07:35:49 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id z2sm3116642wiy.11.2014.01.10.07.35.47
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 Jan 2014 07:35:48 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <36564971.Qsvan2fIrZ@helios>
Date: Fri, 10 Jan 2014 16:35:37 +0100
Message-Id: <21F55DFF-09C4-4D65-8209-EC3F63F72DD9@dominion.thruhere.net>
References: <52CEEE43.1090209@linaro.org> <36564971.Qsvan2fIrZ@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1827)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: unmaintained layers
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
X-List-Received-Date: Fri, 10 Jan 2014 15:35:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 jan. 2014, om 15:01 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Thursday 09 January 2014 13:45:23 Trevor Woerner wrote:
>> At the last TSC meeting the topic of unmaintained layers came up. =
Here
>> is the sorted list of master layers from the layer index [1], would =
it
>> be possible for those in the know to indicate which layers are, or =
are
>> suspected of being, unmaintained?
>=20
> This is all very interesting with people piping up that their layers =
are=20
> maintained, but I'm not sure it helps solve the overall problem.
>=20
> We have some immediate issues with patches to particular layers going=20=

> unmerged. That's in the process of being resolved.
>=20
> However, looking to the future it was suggested at the TSC meeting it =
would be=20
> nice to have some kind of measure or indication for the layer (ideally =
in the=20
> layer index) as to how well-maintained it is. Is there a practical and=20=

> objective measurement we can have about the layer's maintenance =
status? I=20
> don't have a good idea of what this would actually mean - how many =
outstanding=20
> patches it has? How recently it has been built/tested?

Or how long it takes a patch to get applied on average.=20=

