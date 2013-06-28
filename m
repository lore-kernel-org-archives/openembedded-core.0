Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id 50CB1601D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 18:22:58 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id w15so2023540vbf.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=RudAN4aldhY9FVdjSmLCOIPLUnQ256XalIJsAxVKR3Q=;
	b=Sa9Hg2k5xO+2bGlUaIRL8S0Ehh8FXfqDAn+aeymj+eUTQVSdKhm7VzV3hyjcMv2UMK
	IYiO6/lVUJA/eGattOSjfdOoBY55OVi9kkWTQ21eeZmrOGSOgOGgWiWyPHK/2ufsPScQ
	c+bt7C1twfsPw9TJGxjHRHAq2crIVYWXjYi3Sjx0XXp3ACXtwkH/gC3NIo6kyPxEyKOU
	6pSOIMiF8CVkmGyhsusr5kut4c+w+0zaJLfuqyXz3URgQouT0WOwOSL/dTzmRG2qn4l/
	9Su3LeD+jjwsMZMMJISn0JiRD9CnDgpyDbQWeQk+iS58W2mAaaAIWU1ZJBKj5Oj9mCwb
	92XA==
X-Received: by 10.52.18.171 with SMTP id x11mr5004981vdd.92.1372443778916;
	Fri, 28 Jun 2013 11:22:58 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Fri, 28 Jun 2013 11:22:18 -0700 (PDT)
In-Reply-To: <CANyK_8eND7_B2N62z2GC-ieHFF0=zJ8vnSi-Gv6Rq7ht9qdHBw@mail.gmail.com>
References: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
	<CAJTo0LY--AwQsoe8LKxdqFptoa7TXd2AhqexP6XvnC_Ua+v52Q@mail.gmail.com>
	<CANyK_8eBqvC7nSKzE8Dg2imQ31+_9RdGqB5_GbuKB6YSaHw04w@mail.gmail.com>
	<51CD8C13.2070409@windriver.com>
	<CANyK_8eND7_B2N62z2GC-ieHFF0=zJ8vnSi-Gv6Rq7ht9qdHBw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 28 Jun 2013 19:22:18 +0100
X-Google-Sender-Auth: dCMPgUSNe9hEAWuZrE2VzAUCEGA
Message-ID: <CANyK_8dCyGToAF+dSDwbR5cnDUe6p2QHUM-9TRr2BUUkYN_CEA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3 v2] sanity.bbclass: Check for the known broken version of make
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
X-List-Received-Date: Fri, 28 Jun 2013 18:22:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 28 June 2013 16:11, Paul Barker <paul@paulbarker.me.uk> wrote:
>
> On 28 Jun 2013 14:17, "Mark Hatle" <mark.hatle@windriver.com> wrote:
>>
>> On 6/28/13 5:20 AM, Paul Barker wrote:
>>> If you know what fix you're looking for, the applied patches and build
>>> script can be seen at
>>>
>>> https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/make
>>
>>
>> Looking at that list, it appears the commit referenced above is indeed the
>> one missing.
>>
>
> I'll email the relevant people within arch linux later. Most of my important
> builds are done on Ubuntu server 12.04 anyway.
>

Bug filed: https://bugs.archlinux.org/task/35968

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

