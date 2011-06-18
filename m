Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QY4MF-00047q-27
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Jun 2011 00:51:15 +0200
Received: by vxa37 with SMTP id 37so1267221vxa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2011 15:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=Hh1Q485Rw4EGTLXvuFESBjAWBNYKbe3R1huS4evKNKg=;
	b=eqnBqpeZnC2Xp8Imulc0axVRWpyVzW4QQOwzoAgt1Sacj80Ln8JfZGzvCmAeOX/YIa
	EAx4RGnnzwxDjqtDdW1T5h7ru7IynQ/LBwwEEphY+YxeZHSeWrInd2mgicLgjC3eMQlM
	FyB/tTymQigCbcOGnn6TtiRXrBaG5zYJyR0Dc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Rd1RKhlXxBnpOgNX38qiwYJCsM5gagmQty9urKx+5+IbgKADUO2zWkiv38Ojwhh+5q
	a/KGCGT+1OyFmJ/zxbRXRa1s46LWyVtbLA3nO3HCfQP2mzokdZGD9N0P7lWJFjKS1mr5
	KnDWKE7mHCd5TmmXbeLfEdsbMohooodZ+hhzU=
Received: by 10.52.179.131 with SMTP id dg3mr2060907vdc.9.1308437263085; Sat,
	18 Jun 2011 15:47:43 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.181.2 with HTTP; Sat, 18 Jun 2011 15:47:23 -0700 (PDT)
In-Reply-To: <201106171842.49291.paul.eggleton@intel.com>
References: <33AB447FBD802F4E932063B962385B3554AE4989@shsmsx501.ccr.corp.intel.com>
	<201106171842.49291.paul.eggleton@intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 18 Jun 2011 15:47:23 -0700
X-Google-Sender-Auth: 0DojQ3cB3V7pyU5S89lByTdxlM4
Message-ID: <BANLkTinEe9RWC+mBf24OnggqaGfR-O8g5Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] RFC - combo layer repo tool
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
X-List-Received-Date: Sat, 18 Jun 2011 22:51:15 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 17, 2011 at 10:42 AM, Paul Eggleton <paul.eggleton@intel.com> wrote:
> Hi Ke,
>
> Great work. Here's my review so far:
>
> On Monday 13 June 2011 14:15:04 Yu, Ke wrote:
>> --- /dev/null
>> +++ b/scripts/combo-layer-hook-default.sh
>> @@ -0,0 +1,14 @@
>> +#!/bin/sh

First thought on starting to read the patch: why are we home rolling a
parser when the format is clearly ini style, which the ConfigParser
module parses just fine?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


