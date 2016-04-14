Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id B932260110
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 20:31:57 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id fs9so29197707pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Qss0HHrreeti1hpiYZ8CL8tIfuUzFitJeLWVbxdEMH0=;
	b=SLQ2PLzR9pSzuSSzuWRMODpNGOMjiqeF6JTYJ0ynUFR6DcKSBDEcVkw9362THa57sj
	V/swwVNUrAce0XwG/ra2/CNIK2/apZvLj/xxCkjtJ6du7El184Z/2nmQOZUYLLEu/V1V
	LjpduldRJb9RMSW9Oyoyst1c3H3EAugbUaiFjdXUrWpbQAU/qTwLPpTfI6UT9B5SrJjm
	PwJ9xSMdQXpgayAvyYxEiZdKrgVzrnNFJhENL73eZ154ZJUiWrypXZRE8WsE3DmIlOzm
	Ws6ASQJQEFUM1wfwDWpTCao+yeOgYSEXLq3/HmQgebp6KJgY4FmUrBA6PbY+gW4Tmzqv
	H/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Qss0HHrreeti1hpiYZ8CL8tIfuUzFitJeLWVbxdEMH0=;
	b=df06WiiY9ZKrz8iC99v0iz+FK+TAsQBOs6UmyiDvEIR1JEq2Rx4MT9yvmaRb0d2b+8
	Q9QmeGdnSwG8sTB/Ay5wK/r5w/orj8UH8XFNJfsCGBlRpDwV6AIhdg3V66ZHXh4j7gEI
	q9NQkT2nK1wKLhHdvdHWQliueuqgw8lTdLn3dNLpzgEmpjk9vrl8CzbelB1g5mIaVfbl
	nkvVc5G2kOTR6PuNjIEOLX849KLj1IyCRu30B1u0w+OUX9GKY1znYlpfEItL08DuAWDq
	xMn9czSx0P43sN2k4NBAKWvS8rDz0otybLv2wM3N7O3lkbpCwLMNXXfZoXM5DENRnvjC
	bUIQ==
X-Gm-Message-State: AOPr4FUjwdAQAaAdv0937SBVGS4x5HKwljfdweFY8FCCawPqHGurM4D8b3cevKM+kJx1Rw==
X-Received: by 10.66.169.109 with SMTP id ad13mr23926552pac.20.1460665918151; 
	Thu, 14 Apr 2016 13:31:58 -0700 (PDT)
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com.
	[209.85.220.49])
	by smtp.gmail.com with ESMTPSA id h5sm59972252pat.0.2016.04.14.13.31.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Apr 2016 13:31:56 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f49.google.com with SMTP id ot11so47977654pab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:31:56 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.235.9 with SMTP id ui9mr24092235pac.135.1460665916100;
	Thu, 14 Apr 2016 13:31:56 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Thu, 14 Apr 2016 13:31:56 -0700 (PDT)
In-Reply-To: <20160414201217.GE16135@denix.org>
References: <1458850608-50481-1-git-send-email-kad@kad.name>
	<CAJ86T=Wbu31V7DqS2jcG8Kf+Ltq0vD9TR2k-XzGu89=BaM0QTg@mail.gmail.com>
	<CANFkWpmtVDEPH0Ou9oarxRP=YPMqPdJCAD_bKGTF+90ocCkAmw@mail.gmail.com>
	<CAJ86T=UUaCp8FK9V+oOwg4Cj7Hu_YH27VWvmRJ0MoP03dSS7Tg@mail.gmail.com>
	<20160410184953.GH16135@denix.org>
	<CAJTo0LY-OG4PL20oQA_KLwR+SxwtrUQjnzsPefGDRUUKZ0TJkA@mail.gmail.com>
	<CAP9ODKpshEqCEGhOoJfv212xOJj_zHVf1Wja-oBEZhhMc-oq_Q@mail.gmail.com>
	<20160414201217.GE16135@denix.org>
Date: Thu, 14 Apr 2016 17:31:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpN5BYcLwvT_jqcFoG6OCsu+6AcuHcL8=a6HgrjF+_VnA@mail.gmail.com>
Message-ID: <CAP9ODKpN5BYcLwvT_jqcFoG6OCsu+6AcuHcL8=a6HgrjF+_VnA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use compress framework to produce checksums for images
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
X-List-Received-Date: Thu, 14 Apr 2016 20:32:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 14, 2016 at 5:12 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Apr 14, 2016 at 04:59:53PM -0300, Otavio Salvador wrote:
>> On Thu, Apr 14, 2016 at 4:53 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> >
>> > On 10 April 2016 at 19:49, Denys Dmytriyenko <denis@denix.org> wrote:
>> >>
>> >> BTW, at least for md5sum (not sure about sha*), isn't the de-facto
>> >> standard
>> >> extension .md5 and not .md5sum? Can we change it?
>> >
>> >
>> > Picking a random upstream (https://download.gnome.org/sources/glib/2.10/)
>> > shows that GNOME used .md5sum until they migrated over to sha256sum, so I'm
>> > not sure there's a de-facto standard as two equally reasonable options.
>>
>> Debian does as well, IIRC.
>
> Debian uses .dsc files for that...

For .iso files, for example, no.

See:

http://cdimage.debian.org/debian-cd/current/i386/iso-cd/

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

