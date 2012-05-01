Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SPLCt-0000k7-4W
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 00:06:03 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 May 2012 14:56:18 -0700
Received: by pbbro8 with SMTP id ro8so72896pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 14:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=mlifufg8fTgLPsrq3JUrBMpAbzI+7hx5j7A/RUo9wmE=;
	b=LV9SekLydLoHX1DiaSKmCr2SmSB9wClpARtuT/OqwrvMBVhmTvdepYCshj1mxxyGLM
	OaHHNhZg3hUOrqWawnaOI8Fo5CtUm2G9sb+LMDnTf7jeP5oX4x+zQpIzHKjseRqSDDs9
	7LRQUv/czX8QVSXYrIcAZDtNjgmv0q7M2PjOBr34lGQO7+g87sc0/Jq1USO7lsDxnc5w
	VeeDSziHXyHQJoLeAvyoD49xIeF8L/wn70B2pceu8VNeVRP7SFJhEWkuvEq84IwSjOan
	ffHyfJDSxQsJf1LPcxqJfenEvydX1/n6gTiYCp1ODLM1UCx52fa65IwfYUn+IvTyJAgk
	CX6g==
Received: by 10.68.134.72 with SMTP id pi8mr55396580pbb.18.1335909377203;
	Tue, 01 May 2012 14:56:17 -0700 (PDT)
Received: from [10.1.10.192] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id i5sm34767pbf.19.2012.05.01.14.56.14
	(version=SSLv3 cipher=OTHER); Tue, 01 May 2012 14:56:16 -0700 (PDT)
Message-ID: <4FA05BFD.8070402@intel.com>
Date: Tue, 01 May 2012 14:56:13 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FA001F0.7010705@intel.com> <4FA052CB.6050508@intel.com>
	<CAP9ODKpym3UOZGGhkjVH6UW3d8mGwijoPOCp9jAUq72MEgTLrQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpym3UOZGGhkjVH6UW3d8mGwijoPOCp9jAUq72MEgTLrQ@mail.gmail.com>
X-Gm-Message-State: ALoCoQkB/9h4dd8DOCpAlVHkzzwYtWJjsUD+X6bEz+rIxwWVLjE6OOecTSITZQHeXcxlTAKeyrFr
Subject: Re: Yocto Project 1.2.1 release plan.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2012 22:06:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 02:47 PM, Otavio Salvador wrote:
> On Tue, May 1, 2012 at 6:16 PM, Scott Garman<scott.a.garman@intel.com>  wrote:
>> Sorry about this folks - my denzil-next branch was based on oe-core and not
>> poky. So I've just deleted the branch and will be re-creating it shortly.
>
> Grrrr :-(

Just talking with RP about this on #yocto - there will be both oe-core 
and poky-based branches for denzil-next. Right now Richard's been 
maintaining the denzil-next branch on the oe-core git repo, so what I 
needed was a poky-based branch, not another oe-core one.

My apologies for inadvertently implying that there might be be an 
oe-core based denzil-next branch.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


