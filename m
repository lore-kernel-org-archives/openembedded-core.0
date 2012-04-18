Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SKZSC-00060k-NL
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 20:18:08 +0200
Received: by wgbdr12 with SMTP id dr12so6490827wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 11:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Bs3kjpgXPv5QngoHD+Q/9GDF+yCxEhZopPo2B32Y/Ms=;
	b=Ks4nduSDXZy1BwmVYqzB4Pmz6KnObXFCiHIizVanOgIG1R6AI9/vH0+tPwj5HRTybL
	vsztjM7P4Y8xxyTeB2MXaKPQ6ks4S764E+jYohUdu2JMwNKR/wIoF7wK9mkvNKUDNaMS
	tiBBxun/7zLUbdC+rjqKS1S+IOe0YMBdQcfGhM9aHwG/VIJtjxo4DraOnp8kXb9rVbZ+
	hxQzB4EKbcbtLnmiatsNX8+8N9gDQ8ojmVRd4VvKEko04C5N6IWmOXbFNdtK9YrwAr+c
	WnA2CvtjSNhYQ1HENQQ+32k+szgC323mw/ZvycdM69nUAVni0q2+USYDGhqItK5g/jOu
	zarA==
Received: by 10.216.134.136 with SMTP id s8mr2090612wei.6.1334772519591;
	Wed, 18 Apr 2012 11:08:39 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm57792574wib.0.2012.04.18.11.08.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 11:08:38 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F8EFE55.9060406@linux.intel.com>
Date: Wed, 18 Apr 2012 20:08:41 +0200
Message-Id: <7A12665A-AD0E-4F79-A4C3-163D5139A90F@dominion.thruhere.net>
References: <1334229041-22552-1-git-send-email-florin.sarbu@windriver.com>
	<4F8EFE55.9060406@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkCz1Mt6RrGqRsdpV1zP39Ev0FOHp8luAsWoGjZaXCnSGR0VwvqSVk1dxTpKxbaUTi+BX1U
Subject: Re: [PATCH] Update intltool to version 0.50.0
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
X-List-Received-Date: Wed, 18 Apr 2012 18:18:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr. 2012, om 19:48 heeft Saul Wold het volgende geschreven:

> On 04/12/2012 04:10 AM, Florin Sarbu wrote:
>> Uprev to version 0.50.0 and move SRC_URI from .inc into the .bb =
specifying the version
>>=20
>> Signed-off-by: Florin Sarbu<florin.sarbu@windriver.com>
>> ---
>>  .../intltool-0.40.6/intltool-nowarn-0.40.0.patch   |   52 =
--------------------
>>  .../intltool/intltool-0.40.6/noperlcheck.patch     |   40 =
---------------
>>  .../intltool-0.40.6/remove-xml-check.patch         |   32 =
------------
>>  .../intltool/intltool-0.40.6/use-nativeperl.patch  |   20 --------
>>  .../intltool-0.50.0/intltool-nowarn-0.50.0.patch   |   40 =
+++++++++++++++
>>  .../intltool/intltool-0.50.0/noperlcheck.patch     |   40 =
+++++++++++++++
>>  .../intltool-0.50.0/remove-xml-check.patch         |   29 =
+++++++++++
>>  .../intltool/intltool-0.50.0/use-nativeperl.patch  |   20 ++++++++
>>  meta/recipes-devtools/intltool/intltool.inc        |    1 -
>>  meta/recipes-devtools/intltool/intltool_0.40.6.bb  |   19 -------
>>  meta/recipes-devtools/intltool/intltool_0.50.0.bb  |   20 ++++++++
>>  11 files changed, 149 insertions(+), 164 deletions(-)
>>  delete mode 100644 =
meta/recipes-devtools/intltool/intltool-0.40.6/intltool-nowarn-0.40.0.patc=
h
>>  delete mode 100644 =
meta/recipes-devtools/intltool/intltool-0.40.6/noperlcheck.patch
>>  delete mode 100644 =
meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
>>  delete mode 100644 =
meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
>>  create mode 100644 =
meta/recipes-devtools/intltool/intltool-0.50.0/intltool-nowarn-0.50.0.patc=
h
>>  create mode 100644 =
meta/recipes-devtools/intltool/intltool-0.50.0/noperlcheck.patch
>>  create mode 100644 =
meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
>>  create mode 100644 =
meta/recipes-devtools/intltool/intltool-0.50.0/use-nativeperl.patch
>>  delete mode 100644 meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>  create mode 100644 meta/recipes-devtools/intltool/intltool_0.50.0.bb
>>=20
> Could you have done this with git mv, rather than copy so that we can =
preserve git history?

Even with git-mv git-format-patch will get this wrong, use -C or some =
magic .config option.

regards,

Koen=


