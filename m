Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id B6B1F601DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 13:07:39 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id gd11so3898884vcb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 06:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=FCbFBqzdRE1bAr8pqY/KVSIgwZLxtIPDsEWchhAW4vk=;
	b=QcrCb6UqTICD6urLGSUpYMu8S+Z0xIQiHVP6/kKNyUzWT3XEcsprbxnPCKO12pYXiD
	96BCpyOFnYW5OS2zOMd0028q28yI8A20JvnLdSX8VmmLOVA1Im1tR2saWXYsV+VlIbxi
	6ZnZLIubsKGe4O5XFROsZ+lClHpJYmSq2eyxINOIClS4L7Q9KCuXWiQ764Y1DzpCug7e
	MXZeqC0DAuG4MtTjkn0yj87pd22rib8wva9JY65S6fo0G6umWkOq+miifDsDVPmeJOsg
	cWNOj38dWtABzHgwOCr4/npoAMHlIQX5OYrpaTubskS20P7Xl8FibRQ56tU/nI8L3l9i
	4XhQ==
X-Received: by 10.58.165.4 with SMTP id yu4mr243011veb.39.1379423261147; Tue,
	17 Sep 2013 06:07:41 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.109.72 with HTTP; Tue, 17 Sep 2013 06:07:01 -0700 (PDT)
In-Reply-To: <1379416979-10333-1-git-send-email-jc@vtkloud.com>
References: <1379416979-10333-1-git-send-email-jc@vtkloud.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 17 Sep 2013 14:07:01 +0100
X-Google-Sender-Auth: fvyEqNs1S8Q2EU1QwPHp_QRsYpg
Message-ID: <CANyK_8dVMs0gt59z7fL0Woa-zjKW2M6p+qczQBBjJXSibhsNQg@mail.gmail.com>
To: JC <jc@vtkloud.com>
Cc: JC Verdie <jc.verdie@innotis.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Integration of former (deprecated?) libao recipe from https://github.com/tworaz/oe-tworaz/blob/master/meta-jlime/recipes-support/libao/libao_1.1.0.bb
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
X-List-Received-Date: Tue, 17 Sep 2013 13:07:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 17 September 2013 12:22, JC <jc@vtkloud.com> wrote:
> From: JC Verdie <jc.verdie@innotis.org>
>
> Signed-off-by: JC Verdie <jc.verdie@innotis.org>

Couple of tips on the commit message:

First line of the commit message should be "libao: add version 1.1.0"
or similar and should be and fairly short, put the link to the source
within the body of the commit message and possibly reference the
author of the recipe you're copying this from if you can.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

