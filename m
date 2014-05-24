Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (unknown [209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id B1A7265FC8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 May 2014 02:37:12 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id as1so5843725iec.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 19:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4McrmHBsaVxHPP+8saESSFUSSw29Rz+5QMvmRdGHX9k=;
	b=RF9PHtuq0ivShNaKOeo/ArtO9Tw74hwOYl+ZfO+dLnaI4z+xaK/nXeEi8MlgTR64Dk
	qWMw49QIF/ILQ1Er5Z2u1SBe/VWcxKWpVuPTli9fRa5oOvMyANutXbXAJbl5lzM1G63r
	LkaEIQxwvscOG3xEVVoBmSP2Aemqbr08AQtccIc4WUh0BfdqPXe/awVPtEncIhOjlzhs
	KKI0mvjD5mhwtbD6IAJxFl+gi+xkdGrv6q9aoHk1jmqCS9HTIZuC/F5aVOJp+aORVoR2
	Zwa058CC4p51zcXbMy0nkRU1rhI53FUvyhC4r2C0bnamLOzqFPdx3UL/oIPT6g4AEXSE
	gb5A==
X-Received: by 10.50.65.3 with SMTP id t3mr9038779igs.20.1400899032086; Fri,
	23 May 2014 19:37:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Fri, 23 May 2014 19:36:42 -0700 (PDT)
In-Reply-To: <1423131.I8v84STvfF@peggleto-mobl5.ger.corp.intel.com>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1400672277-7181-4-git-send-email-Matthieu.Crapet@ingenico.com>
	<1423131.I8v84STvfF@peggleto-mobl5.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 May 2014 19:36:42 -0700
Message-ID: <CAMKF1srVR0u6OLL_6ZAFLjcbvf2iHNRbTRbZGX5yGtGgX1CUwQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] libav (9.13): remove DEFAULT_PREFERENCE
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
X-List-Received-Date: Sat, 24 May 2014 02:37:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 21, 2014 at 4:57 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>> Use PREFERRED_VERSION_libav in your distro definition instead.
>
> Why? PREFERRED_VERSION_libav will override this in any case...

I would rather ask why not ? we are pinning to older version is there
a reason for that ?

