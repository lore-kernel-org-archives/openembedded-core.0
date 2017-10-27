Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id B0AB8782F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 17:41:24 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id r25so5806410pgn.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 10:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZGMYd5w+KaODDYvhToz7U9m5oLSwPK5WnLr/8QeW3w0=;
	b=WP9ESJLsruo0vKnjkN734Mum5tWkaWb/G4dn8ThjZVpU4qu8jfCK5yi1uq95JAA+eJ
	DAeLwcQH36xfClvt/I2cu+JqTGyaqpNFptnd0bJ2bxXSKmEuLJ96KS71D9FL+ZDzsa8C
	5mX7q7lOs3dnHsRRC/rABpAx+ee0lWLdNaiVtn2FdzDmi/iF1+1av7+U+vrJE9uNjswN
	GP5t3eFGfL583E2CJv7vJQXwNuxLbP4oJYof8NUF70BWAGL4j9PM4ufcZjYqmuQ6votM
	t9lhaAwyrAn5bO67aVh8aVv3fWeRVH5iJHE1rF6FYGPN+IDO9mckSwHFpO9SKVHCj+zp
	K8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZGMYd5w+KaODDYvhToz7U9m5oLSwPK5WnLr/8QeW3w0=;
	b=jrHTJ7Cm76noos93dXnnmucChaLC+qD2SsZdrc/N2Xk9Sz228+OBNPATf39edjRSF1
	4EjN00xjszRtgyzR7ou5cI/+wjezAUaElngOvVqu9NY2EyoYhHN647/CxLE3fBr6vHqR
	B43whAgpg2a8vfb3mLMSFEIvgNyi86df8wRWLF3samwT522wbLn9kvIjEXqd/KdYQ/Ze
	t9qsooamY9AouysuU8qhlsefml4oeStWqAwyvZ597ofeA5z3vp6utnbevSMxawCrTwjF
	eNGs8q/1PUDIEhPq0dzJAsvf1q0yMkDYSaL4KRO0N3EcTWvWaWBezQI2Quot41JVUO6e
	znCw==
X-Gm-Message-State: AMCzsaXcyvNTIJdkenA0IcR0hgXKqkCy6LWsCHhjYuHYfKchHZafYUGz
	P3zetiBXExNM4gk6OSDqq66Pau8+v++WHMHUpiQ=
X-Google-Smtp-Source: ABhQp+Q7mSO6AcnBSknm6vDguIfGDYPkhwmoES78OWkr5XHGtgVRjPQSXKk2hYR747R3364/dpgEI0jYY9SapW4ZMUY=
X-Received: by 10.98.148.9 with SMTP id m9mr1121281pfe.111.1509126085993; Fri,
	27 Oct 2017 10:41:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Fri, 27 Oct 2017 10:40:55 -0700 (PDT)
In-Reply-To: <c9e9b752-e023-2d2a-224a-111af9ab512b@linux.intel.com>
References: <cover.1509097262.git.Qi.Chen@windriver.com>
	<4a6127f002e0fa3552e1dbdec8b8d9f94265384a.1509097263.git.Qi.Chen@windriver.com>
	<c9e9b752-e023-2d2a-224a-111af9ab512b@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Oct 2017 10:40:55 -0700
Message-ID: <CAMKF1srySfU7g2y=UfdejFVjB1RG1GMZ9+pfdP-isUGZkbaOiw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: fix miscompilation on mips64
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
X-List-Received-Date: Fri, 27 Oct 2017 17:41:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 27, 2017 at 5:41 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 10/27/2017 12:43 PM, Chen Qi wrote:
>
>> +This patch comes from https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803
>> +Upstream-Status: Pending [Taken from gcc bugzilla's attachment]
>
>
> Then it should be 'Submitted', right?
>

It has to be on gcc-patches ml for it to considered submitted

> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

