Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C393676ED5;
	Mon, 31 Aug 2015 19:13:02 +0000 (UTC)
Received: by iog7 with SMTP id 7so46028881iog.2;
	Mon, 31 Aug 2015 12:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DDLNNJ+7wBpRdgCC8mdb9j48yZBEHZRIEH99MxmxfJs=;
	b=VGwCimH0cd2NYVmdzS3IxCcMTo4kZFYZXejyBbHHm/34k+seAmW5AIrsbXrANYTTkz
	O9URxklccsCidXjw25fHnOBLCbxqBn4Byn/8Xvl7zIGdwk1oSJCsnMgkcjday2OYqfLV
	O41+sXCHysfx7prRNBFOq1mh6ogswoe5+3PnWZEw66Xlp6ujQozmcutlzR+plztRNbMg
	GI+Ssps3dhXnqus4RvXhd5QeQNglqsH2WCFPiYIX7E5+08MGHAkgp0RtaSKgyEJwS2TA
	/fE/gAQS1RgF85Ei/EUsSyC8EvPsP8RwoxMHP/C2EsG92X9KMe7qMFgBbS0zIghQRFKH
	bfyg==
X-Received: by 10.107.149.77 with SMTP id x74mr468275iod.112.1441048382463;
	Mon, 31 Aug 2015 12:13:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.202 with HTTP; Mon, 31 Aug 2015 12:12:33 -0700 (PDT)
In-Reply-To: <20150831184113.GF2465@jama>
References: <20150830114819.3628250369@opal.openembedded.org>
	<20150831184113.GF2465@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Aug 2015 12:12:33 -0700
Message-ID: <CAMKF1srpZV1h5gwHXNOmoHFNqR_g32pTPneER8yJmKqtJCpazQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Christopher Larson : update-rc.d.bbclass: explicitly dep on initscripts
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
X-List-Received-Date: Mon, 31 Aug 2015 19:13:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 11:41 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> update-rc.d.bbclass: explicitly dep on initscripts
>>
>> update-rc.d doesn't just want an initscripts package, it wants
>> initscripts-functions. In the case where VIRTUAL-RUNTIME_initscripts is set to
>> nothing, update-rc.d still needs initscripts-functions to satisfy its runtime
>> dependencies. Further, we shouldn't be using a *runtime* virtual in a *build
>> time* variable. This should resolve image creation failures with
>> configurations without sysv initscripts when a recipe inherits update-rc.d and
>> doesn't inherit systemd.
>>
>> (From OE-Core rev: e6642ae0849e5ac3174c643a7693af25d829d6d1)
>
> Unfortunately this means that I cannot PNBLACKLIST initscripts recipe in
> DISTRO which provides own initscripts implementation (which also
> provides initscripts-functions).
>
> What's even worse is that I'll have to overlay whole bbclass to get rid
> of this dependency :/
>

would it help if initscript-functions was also PROVIDED by initscript
replacement ?

