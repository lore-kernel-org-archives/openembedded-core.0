Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 160B560088;
	Sat,  2 Jul 2016 19:55:51 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id f89so9158731qtd.0;
	Sat, 02 Jul 2016 12:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tcwM/tlyMJSX3Z0dNqdCX+QqACa5a2YRY/DynvpN6no=;
	b=a+5qjS1nhutDBMChZwMzOpgs0NrOkszklwLGIHEh3HljFp/0Enk35FsDSnK54D7NQP
	UsTyOxUKiXPcWiTCBWxWYcC6xZUSXiZSsX8Htr1TSQj+Yl0ZxqAtHkzjS6QWcfN77uZb
	Nr1+nIRyHrNyNGmHCLZMrqUaQVRp1jT+m4n0qgDWrDp8cRywhIVAzsze8217cxoGj9Xo
	8+gMrHPx0DvCF6m7Pj1ZaLZ7U4iLXWmVqLaPiV1jMbV7MlJDpaH46QrX+uUafDPDw/Ni
	ovE+5Dvfj3HMvFyzGiz3vC/T8LD3W5ExVatplNt3pF0CgVxJ0w2uwW0iZCwV8PKM82mF
	/PDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tcwM/tlyMJSX3Z0dNqdCX+QqACa5a2YRY/DynvpN6no=;
	b=C1bPMtIeHG/XIPiYAIOM9RaNoInCmsgNtkjyWjyg1P8SQkN0tUSjMnfm0YrARopPCy
	6USqCagZOz25n1QyLYmZA73hphhi5FZy9AkIIkFlK0G21PVNuTZJ7GKEzcna26tQGTsb
	LBgOa295bgP+oFj//ZukB48zOJJUzbkBt8RzkfILUD1knHBr4DMBitJcvbdHx40TQzkI
	eZrYQp7USWdeGm7WQNqXdvQwyeHbvmLsaOT24i22fNv+C2yivFqgkIhITOg3u5vwTaT3
	lxEY7QPoOAKGMDPtf8+rpuCNIENmVQ92hI8ravP1kXwi8hp4q/jv+pZuDYMzz65Vj8fQ
	g1LQ==
X-Gm-Message-State: ALyK8tIIKu0h23qRER7KHa/Srolo91ZLNpHQjTwDrc0e37C88vrARxs5/OOK1Z2oI9zl+nvBiA0/e4J+lRqz4g==
X-Received: by 10.200.42.43 with SMTP id k40mr7476736qtk.98.1467489352531;
	Sat, 02 Jul 2016 12:55:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Sat, 2 Jul 2016 12:55:19 -0700 (PDT)
In-Reply-To: <4128fb32-07bb-94d1-6b77-acb8984635fd@linux.intel.com>
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
	<CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
	<33320.10.7.198.51.1465487815.squirrel@linux.intel.com>
	<CAHPquwP2RDW3T5hiizow6=1xJzwgCPDDs=z+OHgaEedcXTh6bg@mail.gmail.com>
	<CAJTo0LZhrKJvg=m05_SUPktikELaDRq8gTvvtjfhaj_9Uq+vPw@mail.gmail.com>
	<4128fb32-07bb-94d1-6b77-acb8984635fd@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Jul 2016 12:55:19 -0700
Message-ID: <CAMKF1spHQUaQC_xN+y+OFNT1Q885OMCnJ1bcZSR53eM=FGZybg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] the fate of Vala in OE
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
X-List-Received-Date: Sat, 02 Jul 2016 19:55:52 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 10, 2016 at 6:21 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 06/09/2016 07:36 PM, Burton, Ross wrote:
>
>>     We do use Vala for internal gstreamer-related projects so I would
>>     volunteer to support it in oe-core.
>>
>>
>> Would you volunteer to maintain it in a separate layer if possible?  If
>> nothing in core uses it and it can be maintained out of core then I
>> think it should be moved out.  Currently, vala support is in oe-core but
>> nothing in oe-core uses it... so the autobuilder can't tell if it works.
>
>
> How about?
>
> 1) vala compiler recipe and support for generating library bindings stays in
> oe-core
>
> 2) we take care of updating the vala recipe to latest stable upstream
> version
>
> 3) we make sure that vala recipe builds correctly and library bindings are
> generated without error for libraries that are in oe-core
>
> 4) any other issues, such as compiler not working properly, or issues with
> bindings for things that are not in oe-core are handled by 'the community'.
>

We need some ptests to verify vala, so keeping some apps for that would be good.

>
>
> Alex
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

