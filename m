Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id D7BA07146D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 15:10:27 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id 10so4652516lbg.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VBHVWnRjcUUxso0+hqRxKWEAB45sb17idbElRrIGSaw=;
	b=qp+gxJlu+O1OPM04oraZWFh6l9rvdCGDe88E643ILTKopQGG/ZLrO6ln1Mnp7ycx0s
	OHzZQard83nkBASndbqOgqOmfZS1ZBUCl4aBQCWqjBuaphXVEXd/eSoh6H6gdU9tjcJP
	g1HgGI0PO32AMHxdOvIHW3cC/J/l/4fokNycgFtPGPttguqig+ApTcUiuJGxnlbvNhZR
	dZBO3LdMTLCElYyW+ZnoXmNqjtQ4GPgHQyG2D8bhSZyAlL13qlQX5FEsEr2WusIsyFqB
	jkDqh2JCiIGuJlW0ORk6+/0tXtsjAFJYiX/fEbKker7Bj81WjiLCfdVbmFrxZXn/rSYS
	9fZw==
MIME-Version: 1.0
X-Received: by 10.112.157.162 with SMTP id wn2mr27372795lbb.18.1410793827277; 
	Mon, 15 Sep 2014 08:10:27 -0700 (PDT)
Received: by 10.112.189.38 with HTTP; Mon, 15 Sep 2014 08:10:27 -0700 (PDT)
In-Reply-To: <CAJTo0La5gLNDcuwj3TawqphFg2N-a74=nDH_DL7u-crY09KPSw@mail.gmail.com>
References: <1410776160-23885-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0La5gLNDcuwj3TawqphFg2N-a74=nDH_DL7u-crY09KPSw@mail.gmail.com>
Date: Mon, 15 Sep 2014 17:10:27 +0200
Message-ID: <CAAQYJAsfsb7VgBnr-TGrXjgKVwE3HRJWc29ZBoVZ=cWwVv5X2w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: Fix ARM assembly when building __PIC__
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
X-List-Received-Date: Mon, 15 Sep 2014 15:10:28 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 15, 2014 at 4:23 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 15 September 2014 11:16,  <jackie.huang@windriver.com> wrote:
>> +++ b/meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch
>
> This is missing upstream-status/signed-off-by tags.
>
> Also, Andrea said:
>> Instead of patching 1.6.1, wouldn't it be better to update to libgcrypt_1.6.2 ?
>
> No, we've feature frozen now, so a backport is appropriate.
>
> Ross

Yes,  it's just a bad timing...1.6.2 has been released on 2014-08-21...
Neverthless the changelog is intriguing

https://lists.gnu.org/archive/html/info-gnu/2014-08/msg00011.html

Cheers

Andrea

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

