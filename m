Received: from mail-ie0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TzvBJ-0006dZ-7h
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 21:20:05 +0100
Received: by mail-ie0-f174.google.com with SMTP id k10so907263iea.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 12:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Zp28qb4WZeaRiRER97B1hlGQZsayPNnUeet0QMGchR8=;
	b=C2dvbD3ODcckz0f2GylOwUqbWJES6SC3w783XzRrBrspnaF7EoPmpXeAHlXs8rPJw8
	LmqWG190jXiksCTZ9Pu/7NOoiI886ypm6mKJvSoQH/gRi/QVf42FmYveGYfOk7HMsNbC
	AmM4WWjCsIG5LFEkU2DOx1BAaFFKfnjR/twxhvLgNAg4Lc3aHEpsRgHaQJW8y4TNesWh
	afdpQrt0Oj2x6AIj7czzeGI5xTYfkQSj7JZnaG/CE9o124ELSgWR4yMsdBZk4jn0NARj
	Rqe426ViJ/WCNUkNuF9/A1MykW0imCWbhFhv7DvzIJDwXFrSvXD5uMTEUAZXXy3G52GX
	cN+w==
X-Received: by 10.50.184.199 with SMTP id ew7mr5965982igc.84.1359403453964;
	Mon, 28 Jan 2013 12:04:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Mon, 28 Jan 2013 12:03:43 -0800 (PST)
In-Reply-To: <CAMKF1srOXjd2Pn6dou6zwZhpcJxiOQL2VwA7E6nLLf+GOAGRkQ@mail.gmail.com>
References: <1359269665-1843-1-git-send-email-raj.khem@gmail.com>
	<5106C6ED.2090204@linux.intel.com>
	<CAMKF1srOXjd2Pn6dou6zwZhpcJxiOQL2VwA7E6nLLf+GOAGRkQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jan 2013 12:03:43 -0800
Message-ID: <CAMKF1sosEhzX6GoNfBpgP9OtSAW-zGMDg8ThHeGCV66v9ZigXA@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] module-base.bbclass: Call make instead of oe_runmake in do_make_scripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 20:20:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 28, 2013 at 11:11 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> s/that/than/ (this honestly through me a bit :-)
>
> oh!,
>
> Richard
> should  I send a V2 or would you amend it


OK I have fixed the typo in the pull branch I posted a short while ago.


