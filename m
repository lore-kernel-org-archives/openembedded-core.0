Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SmQCn-0002v4-MY
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 16:05:22 +0200
Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 04 Jul 2012 06:54:01 -0700
Received: by ghbz12 with SMTP id z12so6112015ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 06:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=dK4RhQGS50gYpdytrgKUwJxnPChPTNuaRt7dra9HCzk=;
	b=k3Ywjzn6z6sIDPkwpTB33mvZv3nkN2zWSsEx6o7dzsZgQ/JLGKoARHlpuAnx+WDeau
	0dWs9iH6eJv+KlH9rLwpN3o/d/FfYMujono4YCmIc5fnP5yb8jN4yCBra7OVxZpg6La5
	erLddKnZcxXY+h3ZrYuH5yKQV3xPTlZ+q5rSb3GDnNAx92DwKIyO2zdxHaXmnbwgGKTR
	JXWqPOlxU2nyBXiLR5NvTp6HNr6RbP3x62Icje6ymJ5tSpFBFbVA+vtx81bSIYwKr2//
	j6ESu+mSgqVkOl5arWxytfJ01ZlpV9P2JCuj9RDA8Wq8RhfC4zhhxRJ+br/BHTd/b3pR
	Eopg==
Received: by 10.68.228.2 with SMTP id se2mr19439131pbc.109.1341410040003;
	Wed, 04 Jul 2012 06:54:00 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id rv9sm17760602pbc.43.2012.07.04.06.53.57
	(version=SSLv3 cipher=OTHER); Wed, 04 Jul 2012 06:53:58 -0700 (PDT)
Message-ID: <4FF44AF4.9080007@intel.com>
Date: Wed, 04 Jul 2012 06:53:56 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: "Damian, Alexandru" <alexandru.damian@intel.com>
References: <CAJ2CSBu1HFggNOqVQt4jnH6_swNmUa5T+RrWf06h-epcNBkbuA@mail.gmail.com>
In-Reply-To: <CAJ2CSBu1HFggNOqVQt4jnH6_swNmUa5T+RrWf06h-epcNBkbuA@mail.gmail.com>
X-Gm-Message-State: ALoCoQmwKBOXuPLo9ATLpcDsxO1QqcDSTbJoJHJ5g97uQp/YKI0QipoCSmLC8B2UtwpHe4ZminkK
Cc: openembedded-core@lists.openembedded.org
Subject: Re: erroneously marked packages
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
X-List-Received-Date: Wed, 04 Jul 2012 14:05:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2012 05:26 AM, Damian, Alexandru wrote:
> Hi Saul,
>
> Some packages don't need upgrade, even if they are in the list, because
> the detection was wrong.
>
> How do we handle those ?
> I'm talking here about:
> - u-boot-mkimage, the 2012.04.1 version is already in the tree
> - js, the 1.6 (target) is older than current version
> - mobile-broadband-provider-info, target 20090309 is older than current
> version
>
It may be my list is out of date.

If it is already updated because someone else did it then my list is 
olde, then you can ignore it and the next milestone list will reflect 
that it's already updated, such as u-boot-mkimage.

If there a reason why we can't upgrade then you use the 
NO_UPGRADE_REASON_pn-<PN> tag.

>
> Alex



