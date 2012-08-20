Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1T3SX1-00086l-KR
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 16:00:39 +0200
Received: by pbcwy7 with SMTP id wy7so8009490pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 06:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:reply-to:from:to:cc:references:in-reply-to:subject:date
	:organization:message-id:mime-version:content-type
	:content-transfer-encoding:x-mailer:thread-index:content-language;
	bh=RA100LwsFa+oiG8gYpkdnh/AAGqbf7Sh1ZLkdtvlmWM=;
	b=D8dnYIvyanhxkO0Z5tUVDv6SqmT/O7mcwt15t8hSJxyhUSI7nNRjjUwP3xDytjx/Fr
	i2Kdzh5wLGo6G4OGDMvcr4FEqoxjQRN37P9wdTxpMcqkUuGWTrDL/Fw6E77fVR0vE2PT
	xFudUoEcORkUYZnNsgB+O7zjGfd9QwANCKrzHEyRqc2fv3cDxNMlcwKHwrLwXsdfKrzy
	F4evMIR6IkL3daJZ6iDp2QUQFhCxRjEE9b+3ZDvE6x+kE13jQTYA4GlDDkXQw3lqTj5i
	lKL2F42FIZqZlcSO5gXUyPIWMpa8CRRYavw8M7qD23qrjdL67I51iSP6nigCneXkIA25
	OjcA==
Received: by 10.68.236.67 with SMTP id us3mr34534058pbc.80.1345470516229;
	Mon, 20 Aug 2012 06:48:36 -0700 (PDT)
Received: from MARCVAIO (220-244-174-13.static.tpgi.com.au. [220.244.174.13])
	by mx.google.com with ESMTPS id
	jz4sm11147318pbc.17.2012.08.20.06.48.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 06:48:35 -0700 (PDT)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: "Marc Reilly" <marc@cpdesign.com.au>
To: "'Paul Eggleton'" <paul.eggleton@linux.intel.com>
References: <1345422099-26198-1-git-send-email-marc@cpdesign.com.au>
	<1657652.otRuZizLvo@helios>
In-Reply-To: <1657652.otRuZizLvo@helios>
Date: Mon, 20 Aug 2012 23:48:30 +1000
Organization: Creative Products Design
Message-ID: <00a401cd7eda$7e0d65f0$7a2831d0$@cpdesign.com.au>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-index: AQHqBGwD4abyn7kHvY9Atl8/HQpuCwHoS6T0lxppfQA=
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Add recipe for hplip 3.12.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: marc@cpdesign.com.au
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 14:00:40 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Content-language: en-au

Hi,

> > This is based on a recipe for an earlier version which didn't seem to
> > make it into oe-core. I'm guessing that oe-core is the correct place for
it:
> > next to cups, ghostscript and foomatic.
> 
> Since this is something that not everyone needs I think the best place for
it is
> probably meta-oe. I believe the justification for having cups etc.
available in
> OE-Core is that these are required when you want LSB compliance.

Fair enough, I'll respin it for meta-oe.

Cheers,
Mare



