Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 40FFD6F2DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:14:19 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wm4so7267328obc.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 06:14:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=02aZ3VBwacZwrbJWbBd97xO1nt2mOpw93QV7jCoepVg=;
	b=S4j20RQN5E0B+2a0jqenxMUzhZDpqYt5eKiP7dFsYW84cfwQDrwbz/Ae2nSGwdmJG6
	ucDGNHkOrtlvNfYwjuEqlZgVSyMvm3/c8tJOOeAqAWScNMs9P7amhvaOOytRWOcYb0pC
	G71jI0O+o0Wfqs7eOWLEFXXV4YNbkUjAqAm0GkIkcJCuhSDIr5Ae1MSyR3V53mdm5x39
	uYUFsa2qK2QlyDTguYMMUY1J2D8n3tvGKRqeaiimV6fSKF1pNuhEy2Q/tc+UvVK4vSxV
	NhXN1PfItX7Sv46Chyafp67NhNDaSdC/fjIcvDu+Ky+hWiLeW55dUIelgY6433HHDp/n
	/Mxg==
X-Gm-Message-State: ALoCoQm+jvm7zsQtnJWNtnRlABfRgMOYZnppRHO762hntPV2iKQKV/CpchLTNhqdFmHWSC36lmkb
X-Received: by 10.182.4.232 with SMTP id n8mr17256916obn.34.1393251260861;
	Mon, 24 Feb 2014 06:14:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Mon, 24 Feb 2014 06:13:49 -0800 (PST)
In-Reply-To: <530B4E28.1070308@mlbassoc.com>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
	<CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
	<CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>
	<CAOMwXhMz+_KcMzY1Stwi2g8EyFg+8BVajqrrvAX7Xd02qVNG9g@mail.gmail.com>
	<CAP71WjxHc6+9DDGeQsuAc3Cv7qN+bfPgNT-ju01z6pje3Q2qEg@mail.gmail.com>
	<530B4609.7070307@mlbassoc.com>
	<CAP71Wjx=6Ux7CWmr4FJcLPyp0xah3jFO=7v6izNi2dfNNcWWYQ@mail.gmail.com>
	<530B4E28.1070308@mlbassoc.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 24 Feb 2014 15:13:49 +0100
Message-ID: <CAP71WjzPH+FhSxfrkCfYQJnxhKDP2R851=xphmw=FFy69+bGKg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Conf notes
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
X-List-Received-Date: Mon, 24 Feb 2014 14:14:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 2:50 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> It is working fine:
>
> Indeed, that does work, but only for the first time of if you specify TEMPLATECONF.
>
> I often have build trees that live for a very long time (think months) and I'll
> do something like this:
>   TEMPLATECONF=my-layer/conf . ${POKY}/oe-init-build-env <somedir>
> then later, e.g. after a reboot of my build host, I do just this:
>   . ${POKY}/oe-init-build-env <somedir>
> This renews the build setting for that setup just fine, but in this case, I'll
> get the default "conf-notes.txt", not my layer specific ones.

right, this is expected. TEMPLATECONF needs to be set each time you
source the init scripts.

