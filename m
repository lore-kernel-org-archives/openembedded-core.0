Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id AEE256B5B6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:57:00 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id kw10so853184vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=I33s0D71gS6+8lSy+Y82k1Q5YOVUn5v07WVv1UlfN+Q=;
	b=n+JVd4fw2E+gHF1bBb4ObC78QxqAwfmrcKWoTlmYrtyiOaIOsNWgHodZw4YHkDdA/4
	u3gEKwhmSFEotcW2Q8MMQvZpUK7MOZOrVICfPW0SVUnkHOjNJCfFyRfjpWeojkirmQCQ
	9tWLBDy5Tzd26PnIzLh/wAKsdYCIw5SoRCD5S0+l37IF2FHZUQpkaI6uFz1pBch756Nu
	PlN4ktvxg0K1KTbxx1MRr9u112oGnxPXXhoeZOeM+YgZw7Zea2svsz/n2m5DASGv8Clo
	/AXR5jlV4ufsEQGCZMyL8ECvRL4vOXrkfYnzxa6aGPbH6JAV7Km8fB4z4ly0teD/+gtb
	yKGA==
X-Gm-Message-State: ALoCoQk8WIez85+PFnENnRp/DGl83ximaCX8mU/KKN1N0esChS5yqkGF1q7Glsj71S+CP8D4f5s5
X-Received: by 10.220.86.1 with SMTP id q1mr6181539vcl.91.1376038621154; Fri,
	09 Aug 2013 01:57:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 9 Aug 2013 01:56:41 -0700 (PDT)
In-Reply-To: <4E6FE015-D994-457C-9219-C2010C795EBA@gmail.com>
References: <1375973136-11264-1-git-send-email-ross.burton@intel.com>
	<4E6FE015-D994-457C-9219-C2010C795EBA@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Aug 2013 09:56:41 +0100
Message-ID: <CAJTo0LYD1KyPuptkcnUBdfu8L68JYzsNMqNUODyQjjYrK6kymA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][V2] oe-setup-builddir: substitute ##OEROOT## when using templates
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
X-List-Received-Date: Fri, 09 Aug 2013 08:57:02 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2013 21:26, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Aug 8, 2013, at 7:45 AM, Ross Burton <ross.burton@intel.com> wrote:
>
>> -KBRANCH_genericx86  = "standard/common-pc/atom-pc"
>> +KBRANCH_genericx86  = "standard/common-pc/genericx86"
>
> This seems to be unrelated to what you are doing with this commit.
> secondly this belongs to yocto mailing list not OE-Core

How did that slip in there.  Sorry. :(

Ross

