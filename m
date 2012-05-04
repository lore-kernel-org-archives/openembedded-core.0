Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SQNlt-00060X-VX
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 21:02:30 +0200
Received: by wgbdr1 with SMTP id dr1so2612462wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 11:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=/AoA/FEXOLbt1QxiDjTgnPtLK+dvxaorY8Vea1Fe1dw=;
	b=jDv3MnwaiSw+Cai8eW5h84DMvpgj7KdoYss1/CUr17EA+T/CbfyzHHUE/sGjvIFrBp
	ObJj1aTbrE6z9XIsQOO0Mut3COErfZt9S18YeNZ9rGN5InBMm8HNX3fLb2OBzwfyuT+j
	nXBnDWSL4AxZuziH+ktneYjXPfCNZyh8SdCJVpQKZkz09+iIjfX9JheK/j2CpCcysccO
	GjCcpR8JesAcRuOt2AMcgYfyaHVHRyBgJ19PxT+/n+uT3sPxUG5n0jTpviIhZJlwNkaz
	M9+WrEGdkYhaLPQu6q8IYcTl84/oRslDZb2EE+Rm8HqWIGfldtFwDbfFGFOroJm4CGTu
	xGFA==
Received: by 10.180.104.65 with SMTP id gc1mr15427961wib.13.1336157563099;
	Fri, 04 May 2012 11:52:43 -0700 (PDT)
Received: from [192.168.1.34] (5.Red-83-49-41.dynamicIP.rima-tde.net.
	[83.49.41.5])
	by mx.google.com with ESMTPS id ff9sm3042226wib.2.2012.05.04.11.52.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 11:52:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <20120504182726.GA15097@denix.org>
Date: Fri, 4 May 2012 20:52:39 +0200
Message-Id: <E2F798CF-6423-4462-823E-88CA06A019E2@gmail.com>
References: <2FE2EDAA-66BE-4D28-AE9E-344308BF0DB3@gmail.com>
	<20120504080242.GD3163@jama.jama.net>
	<E4CB1C49-5AAE-4A6D-9218-83F2ED109A08@gmail.com>
	<0E974700-0AC5-4D2D-8CED-9B50FFC36854@dominion.thruhere.net>
	<BEB5EFF4-B2E1-40DC-A12F-60ACB097C4E3@gmail.com>
	<20120504182726.GA15097@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
Subject: Re: How to fix warning: set SYSTEMD_PACKAGES as <existing-package>-systemd
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
X-List-Received-Date: Fri, 04 May 2012 19:02:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Denys,

On May 4, 2012, at 8:27 PM, Denys Dmytriyenko wrote:

> You are trying to fix it in oe-core/poky layer, where it doesn't use =
systemd.=20
> There is a .bbappend in meta-oe for that.=20

Yes, you're right! :-) Ok, I'm slowly starting to see how its important =
to trace
any additional .bbappend recipes.=20

> For these 2 please report them on openembedded-devel mailing list, =
where
> meta-oe things are being discussed. The last warning is confisuing, as =
it
> reports the recipe is in poky/oe-core, but it actually comes from the
> corresponding .bbappend in meta-oe.

I'll submit these two patches to the openembedded-devel mailing list, =
once
I go through the sutmitting patches README. :-) God, the things you have =
to
do just to submit a simple patch! ;-)

Best regards,

Elvis=


