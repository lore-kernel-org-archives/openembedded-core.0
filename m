Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f49.google.com (mail-bk0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id D96CA61FE1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 09:46:25 +0000 (UTC)
Received: by mail-bk0-f49.google.com with SMTP id mz10so2384814bkb.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 02:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=qGUKk+BYHwl+lpoG6vLQLwEbcf4zVzo6rypbMobZZT8=;
	b=W6K54moKeIcycBCYM6kYkpvFih3h+u40g8i2X5h2fuAPHSqNxm0R2n2VDQyFmJ3Y7Q
	NbPppngtoadyEiuXUedHi33jzWOWrFLe5KnizS+gm0PXPR4bNHtLGrOlgIeghvg6bOuu
	qSRnuXdAhuf+cEPgaSrKclgPpwQhRRlgmfRASzdnBOBBl3dhSQT6uDPxrauvPJLIoUVG
	yKTmteY+c2b46bj80z1kdW1YpgyLn9ft0ro2YrzD86HioXRDVR9YFyzJjAAsfZ2yjr+/
	tWP2a4TVYxZmZy5Z9qoLnSE1A6FLoXZDUZKNmCC1KDf6s3NR/Asyxnr+iCPMB/9yMLvW
	SFMw==
X-Received: by 10.205.9.129 with SMTP id ow1mr3765003bkb.43.1374486385746;
	Mon, 22 Jul 2013 02:46:25 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116]) by mx.google.com with ESMTPSA id
	kz11sm6616388bkb.11.2013.07.22.02.46.23 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 02:46:24 -0700 (PDT)
Message-ID: <51ECFF6F.60601@dresearch-fe.de>
Date: Mon, 22 Jul 2013 11:46:23 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <51ECCF5C.2020505@dresearch-fe.de>
	<CAP71Wjz6vU5iiSoc9LqDczGo_SJ02ppRJizQui_MLYKPK_61Wg@mail.gmail.com>
In-Reply-To: <CAP71Wjz6vU5iiSoc9LqDczGo_SJ02ppRJizQui_MLYKPK_61Wg@mail.gmail.com>
X-Enigmail-Version: 1.5.1
X-Gm-Message-State: ALoCoQmCgjW0xr1/iuQvyodGwI8rGoiJaWhcO4/IzQLViWA99ZAvWtCJUFVq0ELu8bCgD37uMbzM
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: SRC_URI and latest HEAD revision with git
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
X-List-Received-Date: Mon, 22 Jul 2013 09:46:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 22.07.2013 11:01, Nicolas Dechesne wrote:
> On Mon, Jul 22, 2013 at 8:21 AM, Steffen Sledz <sledz@dresearch-fe.de <mailto:sledz@dresearch-fe.de>> wrote:
>> After being OE abstinent for some months i'd like to ask what is the current suggested method for recipes building from the HEAD revision of a git repository (we need this for continuous integration).
>> 
>> I read some RFC's in the ml about PKGV/PKGR stuff, but i miss a final decision, documentation and a good example.
> 
> you can use ${AUTOREV} for this purpose. You can look at poky-bleeding distro config for such an example. 
> 
> e.g. http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/distro/include/poky-floating-revisions.inc

Hmmmm? This doesn't seem the work.

Here's what i tried in my recipe:

------------> snip <------------
PR = "r3"

SRCREV="${AUTOREV}"
PV = "gitr${SRCPV}"
------------> snip <------------

But i get package versions like

  gitr0+53b64e717404d282d0c58b7fa4a4e74ab2ca81ba-r3

where SRCPB is always 0. :(

A bit more description and/or a complete example would be very helpful.

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

