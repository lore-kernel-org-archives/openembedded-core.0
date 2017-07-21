Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1C44A7840A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 13:01:36 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id q4so51189680oif.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 06:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=RKKVaHnzmiVElyK6iOZr8Zol9oQ9NW8Uk/+WyeLeDkI=;
	b=keMXtgLe6joKrv7fP+Qd2jzr9yy0RS3ZN/IL9mx3/lvYGfRYolRMOXespifoWR90Jz
	ESQssg6cix/Tes3EqxLJ7lZv5JqtNXddf3UKlqm9ouTHPtRpQdtrR89gEfc5tFN8L4WD
	QrE69uiXTQPQkiYwk0TWzIoYLQO/gIK7rVqJ0MMhXHHF9bt+qiUldSypfMKrLtpciqWs
	Z4Rm+LrkzmmNvV19oo8MUDXmGyOrYyCMd8FnvAwvaKNCYgY+AwOSmxu0+B22beKNkqXb
	R3fYHxVTnceM0CYDoDP0l2sCogMTVkbGp4fjkH34/Krr8ElHkJXcQjZ5xLuv+42jTaip
	3g0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=RKKVaHnzmiVElyK6iOZr8Zol9oQ9NW8Uk/+WyeLeDkI=;
	b=IcjSIe4WsOD5fmbfF94K4CeYFCSVNMUDWhfk+W0/rLIkZSG73LmK0riTB1cdP6Ekge
	FcLYxJoyC04lljxvP9ObNxjMYAs2tHfGrG0Y8p2LTKxJaWrzXNZ3LL4KWS5szQe8Bg5J
	bkwJ5TenhAB9dRHgfa/7eJIbvo2TGCH+gTW0y9RqbJ+dQF0BG3HLJI1wVRxgcdUuGY6D
	ypAEpStfRMdL3By24SzafszSG3cjp2H8vvej7UxGm5mLV07bti2veTE6MaAf2a6JvxWC
	nF6XW9neLH/VxloBMcCyNkHobUQiql+ZroLjPMqj3GLtdEs2R+QKibaRzy4M/m1z/2Cl
	bgPQ==
X-Gm-Message-State: AIVw110LG61zJuO+oe1OlaeyaKi01vIaM6+EMDG1aAi3dufEHfi69DlS
	j4SzCkUZIERFjspk
X-Received: by 10.202.108.130 with SMTP id h124mr2143638oic.289.1500642097691; 
	Fri, 21 Jul 2017 06:01:37 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C109.dip0.t-ipconnect.de. [93.232.193.9])
	by smtp.gmail.com with ESMTPSA id
	r10sm1885392oia.30.2017.07.21.06.01.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Jul 2017 06:01:36 -0700 (PDT)
Message-ID: <1500642093.15277.15.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Tom Rini <trini@konsulko.com>
Date: Fri, 21 Jul 2017 15:01:33 +0200
In-Reply-To: <20170721112103.GJ14320@bill-the-cat>
References: <1500590631-2028-1-git-send-email-trini@konsulko.com>
	<1500623241.15277.10.camel@intel.com>
	<20170721112103.GJ14320@bill-the-cat>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image-vm: Convert vmdk/vdi/qcow2/hdddirect images to IMAGE_CMD
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
X-List-Received-Date: Fri, 21 Jul 2017 13:01:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-07-21 at 07:21 -0400, Tom Rini wrote:
> On Fri, Jul 21, 2017 at 09:47:21AM +0200, Patrick Ohly wrote:
> > On Thu, 2017-07-20 at 18:43 -0400, Tom Rini wrote:
> > > The support for writing vmdk/vdi/qcow2 images has not been converted to make
> > > use of the IMAGE_CMD infrastructure and instead relies on custom logic for
> > > adding tasks in the right place.  Convert these images to making use of
> > > IMAGE_CMD.
> > 
> > Thanks for working on this. I still have
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=10204 open for
> > enhancing vmdk/vdi/qcow2.
> > 
> > However, your patch doesn't go as far as described in that bug, does it?
> > Instead of allowing, for example, IMAGE_FSTYPES = "wic.vmdk", it merely
> > changes how IMAGE_FSTYPES = "vmdk" is implemented.
> > 
> > The current patch has its merits as it simplifies the implementation,
> > but I think it would be worthwhile to go all the way, even if it changes
> > how images are going to be named.
> 
> Ah, interesting.  I guess the first thing I would argue against is
> saying that hdddirect should be masked.  There are reasons to want to
> have a raw image created.

I'm not sure I understand what you mean with "hdddirect should be
masked" - it's been a while that I looked at the code.

> I will take a look into using CONVERSIONCMD for vmdk/qcow2/vdi to allow
> for wic.vmdk to work.  But we also must have vmdk.xz work (and fwiw with
> my series you can get arbitrary compression that we support done, I did
> vmdk.xz, qcow2.lzo and vdi.bz2 just for 'fun').

The same is true with CONVERSIONCMD. They can be chained multiple times.

> But I'm not 100% sure that I like changing the normal case from "vmdk"
> to "wic.vmdk" or "hdddirect.vmdk" just to get a disk image to throw at
> ${VM_TECHNOLOGY}.

Yes, that's the biggest user-visible change. Basically the internal
implementation (multiple conversions chained together) becomes visible
in the end-result.

That is a good and a bad thing. The good thing is that it is visible how
the .vmdk image was created. The bad thing is that some users might not
care and get confused.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




