Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id CA605758E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 01:41:07 +0000 (UTC)
Received: by qkhq76 with SMTP id q76so18115074qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 18:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=sK/MyX3uchbI64YVtsgM5Jzm+uHRh9p2Sbhaqz8Di3w=;
	b=Tt7C5BIBd7Vi8cq54Bg3TXmJrXCjTEyAm8qTxToJxIG6KLngKPG8xfILBGW7sXuS/i
	e7X1aBGMXUBpaACLYKztHW+XTKSAmsd0sypwU4eZXCCeCrEQ8B4E2Db24I1ZhTZ4qbOC
	tcFFkSLPi9V1Q6QJjDLjTNJgAAjV/H0Ty9Gmhc9Aoj4WzrbEEy8lFfKEIdvA7IcBJMju
	/gMKBgsnaO36Sr3KOPd5i4NDkWZoLgUUXMXByvn30XYNPuxpA3z9q5QxMvtOhGrkJ+pn
	P1IhZ4cp7sb9VgZmU4SQ1QM1+tC+PrqSU/v5drrmiuxwk99QBCmVjhzQFDsEYwvx4l0r
	AqZA==
X-Received: by 10.229.58.73 with SMTP id f9mr721557qch.30.1433900468292;
	Tue, 09 Jun 2015 18:41:08 -0700 (PDT)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id w67sm3520902qgw.41.2015.06.09.18.41.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Jun 2015 18:41:07 -0700 (PDT)
Message-ID: <557795B1.6020304@gmail.com>
Date: Tue, 09 Jun 2015 18:41:05 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
References: <CAJTo0LY2C3d6ewKs7f1V0U9k7vqMQ47kCnANetzGz1OhMtfTFg@mail.gmail.com>
In-Reply-To: <CAJTo0LY2C3d6ewKs7f1V0U9k7vqMQ47kCnANetzGz1OhMtfTFg@mail.gmail.com>
Subject: Re: [RFC] remove neon from oe-core
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
X-List-Received-Date: Wed, 10 Jun 2015 01:41:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Sounds good to me.

- armin

On 06/09/2015 12:14 PM, Burton, Ross wrote:
> Hi,
>
> Since Subversion moved away from neon it appears the only user of it in
> oe-core is GStreamer as a HTTP client plugin.  By virtue of being
> maintained I suspect the libsoup plugin is generally the better choice
> there, so as neon is now unmaintained upstream (last release September
> 2014, doesn't work with latest GnuTLS release) I propose moving it to
> meta-oe.
>
> Any comments?
>
> Ross
>
>

