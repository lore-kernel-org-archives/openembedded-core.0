Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1ADBE77FC3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 17:14:31 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id 191so25284308oii.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 10:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=cFnzukVpMM/GBUgaRfRcum0aSlsG3w/+9beiVrTNrvU=;
	b=Y/RGGWwmCuUrEswrz5IcDNfRmNBKUOtcbPi5FKIYmalLt7uNe9vbisligBRFpUb14h
	h6HD3mArotjVduRZx68vyVJHbWh+2Q0LvWIV+wvhgMsguNApu1gAsiGG4xx7ikhBZMTE
	oAcPD1B661o8taTRvRTXueHcffOnbCl3qjWrHSakw93rtw81IeLFqq08cbwqP1m2CQcy
	7YEuNJQLj9lSyv4r7LoX4yEfGEfFeJMkv5aGMR2LT5/G9tQ+irFcVJXGAwz7DJ82OW8k
	kH6zGoRFUdLlZWEjYQpYwC2Usne4gIMHAWk7UGFZu8APAJ2Oi4KMlfxsDCsFPssJ/qi9
	1H7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=cFnzukVpMM/GBUgaRfRcum0aSlsG3w/+9beiVrTNrvU=;
	b=QH1vGF83FQC7w5XrJ7TGKwitf3cofRoKlueJ+iYAZMtpv2FtEUaNJtZbIyU9bhB2Sc
	QDiknatTMZBmdau+5R4KuA6+2JZmRoCYnci8fWvxbmYQdFW23rfkp334BjAue0ppFf23
	WQIs0FrPwfVJIzrUmxkmkmDNqCm/F+Esza7A5IHYWJz5ytslO8zcnVj+yCVx6GDJjouW
	snwuFiMdOy3pBUYIjdKpVUWm40/1o1WzKLttVyt3EvISn6eiLMeCH8OhkHN7yLXz+hvE
	+FXQVOFdb9x+jomukClz+Z7Mq+ePzWhtUYtq5/p6JXZlNKdjKUrGRqOPwxcBIlEhWb4/
	nB5g==
X-Gm-Message-State: AIVw111EbvZOLjuEjEd8KuhGBZv0oHKGkT5clQH3C5ayT7nkBOW9K/91
	ytDrEoawUoLfISVD
X-Received: by 10.202.215.213 with SMTP id o204mr4653256oig.23.1499879673065; 
	Wed, 12 Jul 2017 10:14:33 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F424.dip0.t-ipconnect.de. [93.232.244.36])
	by smtp.gmail.com with ESMTPSA id
	x74sm4181541oia.23.2017.07.12.10.14.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 10:14:32 -0700 (PDT)
Message-ID: <1499879668.20211.140.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 12 Jul 2017 19:14:28 +0200
In-Reply-To: <7127c3cb-ce85-e682-2aab-2f20615ca027@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<1e9c0f3ee67bdcb9a810c1a3e0bdb31a283a6c0c.1499803885.git.anibal.limon@linux.intel.com>
	<1499842297.20211.103.camel@intel.com>
	<7127c3cb-ce85-e682-2aab-2f20615ca027@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/30] selftest/cases/package: Call parent setUpClass method
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
X-List-Received-Date: Wed, 12 Jul 2017 17:14:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-07-12 at 10:44 -0500, Aníbal Limón wrote:
> 
> On 07/12/2017 01:51 AM, Patrick Ohly wrote:
> > On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
> >>      def setUpClass(cls):
> >> +        super(VersionOrdering, cls).setUpClass()
> >> +
> > 
> > In Python3 one can simply use super().setUpClass().
> > 
> > Not sure whether that's worth a V2 by itself. There's also plenty of
> > other code outside of this patch which could be simplified like this.
> 
> Yes may be is better to send a patch changing all the cases to the new
> py3 form.

Definitely not something for this patch series. However, I think
new code should avoid the more complex form whenever possible. So if you
do a V2, then I'd prefer to have super() in your patch.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




