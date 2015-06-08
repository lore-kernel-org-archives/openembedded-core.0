Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id C0B72732B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 15:16:28 +0000 (UTC)
Received: by ykfl8 with SMTP id l8so53490688ykf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jun 2015 08:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jC3AcSy6a8Yva9EpgeOuJssmgiqhR8JzD2vEo9CzHL8=;
	b=Z1sPlhYS7F7qkG21o564Sh++b8VSwxYIiJ3fmpm13UB/+T22shGsqS9T9EjrY/kM1C
	OzMi9tlcl6rIKsCSq86N2NfMBt2/SUIf+olm7sQ/2qgOiSbfROtqZLCUrnJ7jIEQO35N
	oHeSKYNzJ7n0HIQnwfPFwHtu9heUOkbapQy+Gn8eBBuQTIaQ6TOHxo8n83AZEp/cCgO4
	UXwgBEqr+i88N3CIuY2nmFyX10NhtstcwBTb6Z8+Q9+01rX1xhGlxyb8rtnAKOm64wtj
	KU2HgZuSccmszM/NYPfzXIN1ahBQPDzzjoc+0HNNfiUK9vuq8sGEhaiwdy+SnZ3zsx5k
	d8Tg==
MIME-Version: 1.0
X-Received: by 10.129.38.134 with SMTP id m128mr16276937ywm.92.1433776589680; 
	Mon, 08 Jun 2015 08:16:29 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Mon, 8 Jun 2015 08:16:29 -0700 (PDT)
In-Reply-To: <CAJTo0LbT2pH3HBQz0RXkf_UqVj4oCv8TthkvGRTC8LtgU=2LCw@mail.gmail.com>
References: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
	<1433354849-16843-8-git-send-email-juro.bystricky@intel.com>
	<CAJTo0LbT2pH3HBQz0RXkf_UqVj4oCv8TthkvGRTC8LtgU=2LCw@mail.gmail.com>
Date: Mon, 8 Jun 2015 11:16:29 -0400
Message-ID: <CADkTA4MznMXQX9ECdyQTQGFuVe3aTGLkFruj6ad5_ZTn_tGtLg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] core-image-minimal-vms: new recipe to build images for VM
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
X-List-Received-Date: Mon, 08 Jun 2015 15:16:28 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 8, 2015 at 11:15 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 3 June 2015 at 19:07, Juro Bystricky <juro.bystricky@intel.com> wrote:
>>
>> Simple recipe that builds core-image-minimal in both supported VM formats:
>> VDI (VirtualBox) and VMDK (VM player)
>
>
> I'm not convinced we need this in oe-core as it's just a IMAGE_FSTYPES
> assignment in local.conf for the end user.

FWIW: I was thinking the same thing.

Bruce

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

