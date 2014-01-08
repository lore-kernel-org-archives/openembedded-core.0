Return-Path: <ross.burton@intel.com>
Received: from mail-qe0-f46.google.com (mail-qe0-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7E97A6D087
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 14:21:38 +0000 (UTC)
Received: by mail-qe0-f46.google.com with SMTP id a11so1673253qen.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 06:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=90EvTi09iVYcvau2z6+QmnsCfTUxYu9n6/qJ1TM1WGQ=;
	b=K5ax0otEbS1+CinXZ5x35V5xmPyR454DrHezLzzGFmCQHWRN5RGbgzZDOkl+EWi9Qm
	FaauzKW3wbegfJKsjSQhLt/H/z/eD3usBDS5GWYnyz77ctiOxmAs8wtlVkEiPAfm9Kf3
	sqLofH8t1rO3igLqXqQ1iOTmmT+am6c/LAC/NJ1oM6Pe0ZlVzH0XPAIWFGWpaqjolS3K
	kUigYGMjMGqNboZ6/WODZwi+gjJudKjShQJetNus+FAmIRHB92ZsKZyB1/UwPd9PnoDD
	zNxPexuCVDDcKHh8RzqDRz72dBvjP7XJu/jDXle/jsbn509rS+bKJonr8AY+4zqNnkmg
	diPA==
X-Gm-Message-State: ALoCoQktFpvEiDEFk46km6I6CCiepUIw5wol7pDZKPsp+ZEDORYXkepNbCU/JFNMLPI5HnsGNl6o
X-Received: by 10.49.59.83 with SMTP id x19mr15432629qeq.47.1389190899072;
	Wed, 08 Jan 2014 06:21:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Wed, 8 Jan 2014 06:21:19 -0800 (PST)
In-Reply-To: <52CD5DCE.5050003@communistcode.co.uk>
References: <52CD5DCE.5050003@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Jan 2014 14:21:19 +0000
Message-ID: <CAJTo0LYZ8DG9V+C3_C=uXt+yV2i2OfnSZwQGEhnAHQ7gPsAN=g@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: db compile failure
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
X-List-Received-Date: Wed, 08 Jan 2014 14:21:38 -0000
Content-Type: text/plain; charset=UTF-8

Hi Jack,

There were some sstate/manifest changes to master before Christmas
which is why this happens.  You should only get the warning once per
package as it rebuilds and updates the manifest, or just delete tmp:
it will be rebuilt from sstate quickly.

Ross

On 8 January 2014 14:16, Jack Mitchell <ml@communistcode.co.uk> wrote:
> On latest master I am running into the following failure:
>
> http://ix.io/9Kh
>
> I'm also getting a _lot_ of warnings like these:
>
> WARNING: The recipe eglibc-locale is trying to install files into a
> shared area when those files already exist. Those files and their
> manifest location are:
>
> /home/jack/Work/oe-core.git/test-build/tmp-eglibc/deploy/ipk/core2/eglibc-localedata-el-gr_2.18-r0_core2.ipk
>    Matched in manifest-core2-eglibc-locale.deploy-ipk
>
> /home/jack/Work/oe-core.git/test-build/tmp-eglibc/deploy/ipk/core2/eglibc-binary-localedata-wae-ch_2.18-r0_core2.ipk
>
> Can anyone shed any light, it seems as though the something is getting
> it's wires crossed somewhere...
>
> I haven't yet tried wiping the tmp folder but I could as a last resort.
>
> Cheers,
>
> --
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   Cambridgeshire, UK
>   http://www.embed.me.uk
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

