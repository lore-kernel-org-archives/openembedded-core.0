Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A0093784B0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Aug 2017 00:44:27 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i76so1307847wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 17:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hpb+fUDYoWLmWaGSlf1IW2aLJvFnMDkcxB/IRHYnCGc=;
	b=t9Fu9cYns0/o/kNbSB1lSMTEoh0JIZkBE/tAFoDPoO5UmH2iR9LW8bsbH5Z0Kvt5rp
	3YJaLkIJ1tu0EmayMifiqMdDK24cjb5dcULDLQvSCPtJIegYGcfvXPTnJc7wIRrhXx6n
	vjRyc06KUkl5ng514v5lXNe2hqtX6bFrZoH0L7rET44UrM/fRL8ntyn0Jsvc4c+WXJ/X
	jGl5/Pfjnnq2kEWm5MB3Cb7MVhgPWMrGjSOb8dwenBeNl0Alvc68v0CPOmKSig0+9JF5
	nC8S8eQ0NUQeolMnUI5h8gxnR2IXat9hUTNON7OprkmQ2r/SHUyAg2dGrBqgUM/5Y8mn
	puZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hpb+fUDYoWLmWaGSlf1IW2aLJvFnMDkcxB/IRHYnCGc=;
	b=PYY6q1NeO+Xdq7t4IxBLGuFMNwq6TQkgBSdCTJ7HHV1CS7uQx6nkGq/XXisk8mSeft
	J84tF1A4xKRCozfethhf9B+ZSsnsF7q332gPN1klbXRuFL74GJabRGydG5hFqEnpNnqy
	nnMbE2z330TOPHY+DaRL/hRwpSJCTwqBbawu+QdNtzjFIoIl+DpAe4ustaeGfjc+Avzq
	K2o40Wz5ww4EU8UZRw28QBHdX9I1VFu4DrrBrmKqsLMXaUfWjkJBlSdjjpqrFNtK8svN
	TczQoODXGs6gCHZdDyBIVaXGilsp52hAhDZXuTRVrHjygpy9Dv0yksaD95ZmwfIcI/wk
	YHew==
X-Gm-Message-State: AHYfb5gqWiXW5mUajN2skMzpwOkup3MOBpR5wgRW4fFufira1r87CxXB
	pAKpuiBhsAGWfFq0dRlDZGRc3uYxJA==
X-Received: by 10.28.182.7 with SMTP id g7mr74955wmf.66.1503708268428; Fri, 25
	Aug 2017 17:44:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.169.70 with HTTP; Fri, 25 Aug 2017 17:44:27 -0700 (PDT)
In-Reply-To: <CAMKF1srnsbiCdnoF1tUM8-c-dKGTnv7nsqShKaO_Vqr9Sm0FZg@mail.gmail.com>
References: <20170824053753.36121-1-jose.alarcon@ge.com>
	<CAJ86T=Uip8WChxD_q_jWxCPPmUqw87yJLyn5F29ztbJfMpVMOQ@mail.gmail.com>
	<17938e56-c1d0-5316-0263-b954006f9015@ge.com>
	<CAJ86T=VczP+UyDTzRb8zcRreNVp7Ez43cfDquh2ysKy_fqGnFw@mail.gmail.com>
	<1a320d13-7d4a-7412-5377-e64a728afdfc@windriver.com>
	<CA+chaQcvg_rktq4iOazbzJzWGa6m6EdDA=RM-x8yg=4_aMtqyg@mail.gmail.com>
	<CAMKF1sos=AR9916RZgoDMjNYTrOyo8uka6cKfPB2wLujjg3n5Q@mail.gmail.com>
	<CAJ86T=Xrtt5xn+DKO1=aC76cWDgMmpqmXbaArSjemU2rC14-dA@mail.gmail.com>
	<CAMKF1srnsbiCdnoF1tUM8-c-dKGTnv7nsqShKaO_Vqr9Sm0FZg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 25 Aug 2017 17:44:27 -0700
Message-ID: <CAJ86T=V=DTXGbR4_gCmc-feHR6DH-bhCENHRAJab26koZvFn-Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: EXT: Re: [PATCH] libinput: remove obsolete touchpad patch
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
X-List-Received-Date: Sat, 26 Aug 2017 00:44:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 25, 2017 at 5:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 25, 2017 at 4:37 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Fri, Aug 25, 2017 at 3:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> OE-core minimal kernel has been bumped to 4.4
>>> so at this point I think its fine to remove it since there
>>> is no reliable way for OE-Core to test out validity of
>>> this patch
>>
>> If that's the official policy then let's bump OLDEST_KERNEL and make
>> the point clear to everyone.
>
> its not official policy. However we do try to minimise patches we
> carry as much as we can moreover I was thinking from testability point
> of view, we don't know what harm it can cause when you dont need this
> patch.

Yes we do. The case where we don't need the patch (ie kernel 4.4) is
the case we *can* test.

If the patch is found to cause problems with newer kernels then
certainly it should be removed (or updated as Martin suggested), but I
haven't seen anyone suggest that it's causing any issues.

