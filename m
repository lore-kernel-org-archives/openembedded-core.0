Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 061E371984
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 10:43:47 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f188so5169479wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 02:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ir31SjGTEI4n34T3LBevgn7zXFu9sdBeW22PbqUhf0s=;
	b=Knar14h30SbFSYAwQTauhDYZD/Z49nmw2rv0R8NDzl4fiJP8I3M0bJudE4iNpfSv8r
	6Z7O4BxX4wz4sWj9K+OYfVuPCE4ipTvi9AuAp/TqdvHBqi795ETtB/t5HEwntc0VgTrk
	yNmT8pMToYroIdvW47OYubW1zgmdPyunAaVDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ir31SjGTEI4n34T3LBevgn7zXFu9sdBeW22PbqUhf0s=;
	b=i4uZSwFDVVLMoaneX9+Ui89uskbo/p7VH3VQnVYEMsmxz/mAQ5bmUbXrOCvuUWoypK
	cEko3nitMGQZerry2/QLe6stG30Vl0PwWi/1MlMSYAlTaNNEJuUp5ejRcMfQheohDOOh
	5EfTf9AmT0tn/tGEhV0OwDdKSn91Trkffz6vow78UYBwx7NPeNY9QalnHnj+RM4Ud03g
	d9cgz5ayZvFmbragShxUww9Y5tFrOU4njqMYjY7iXJ+9oCqArZX/iDQmqgWU8XZvosn7
	dRn6ACEb80hg/cboLBmgOVne9uPAG+YVkcG5fkTtE+FHXveRpGa1vBUlUk7oQfIMshIH
	lH8w==
X-Gm-Message-State: AA+aEWY+nRT14OUJoIVL9J/ExKieuqYNgWH5C4gilqmfV/LZlrYhQpwp
	H/PDoMlZKA29FP1jxsSpp9CAsA==
X-Google-Smtp-Source: AFSGD/W1/d9KsT8MN4/3efW9TIdTLqn0xn85bgmGB6wDM2leNOjKQmqg4X9iZInLgTjryV2ccgY5kg==
X-Received: by 2002:a1c:8c05:: with SMTP id o5mr6283778wmd.29.1545216228507;
	Wed, 19 Dec 2018 02:43:48 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w125sm5006025wmb.45.2018.12.19.02.43.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Dec 2018 02:43:47 -0800 (PST)
Message-ID: <62200bb7528e2f863ca074790a7407fc7c73630d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Bradley Bishop
	<bradleyb@fuzziesquirrel.com>
Date: Wed, 19 Dec 2018 10:43:46 +0000
In-Reply-To: <CAJTo0LY=EtEJpniVngfbkxbg3ibnEY9qvR18kOSpjFejh_tomA@mail.gmail.com>
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
	<E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
	<CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
	<CAJTo0LY=EtEJpniVngfbkxbg3ibnEY9qvR18kOSpjFejh_tomA@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: OpenBMC <openbmc@lists.ozlabs.org>, james.feist@linux.intel.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: flto automake
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
X-List-Received-Date: Wed, 19 Dec 2018 10:43:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-12-19 at 10:00 +0000, Burton, Ross wrote:
> On Wed, 19 Dec 2018 at 01:07, Burton, Ross <ross.burton@intel.com>
> wrote:
> 
> > That however leads to the question of should we just change the
> > defaults? Does anything break if we use gcc-ar instead of ar?
> 
> Answer: yes.
> 
> > x86_64-poky-linux-gcc-ar  rc libgcov.a $objects
> > x86_64-poky-linux-gcc-ar: Cannot find plugin 'liblto_plugin.so'
> > Makefile:932: recipe for target 'libgcov.a' failed
> ERROR: Task (/home/ross/Yocto/poky/meta/recipes-devtools/gcc/libgcc-
> initial_8.2.bb:do_compile)
> failed with exit code '1'
> 
> I don't know enough about gcc...

The -initial compiler doesn't have lto compiled into it so you probably
need to use binutils ar for that part of the bootstrap.

Cheers,

Richard


