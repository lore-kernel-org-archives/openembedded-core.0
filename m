Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5C272697
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 15:59:38 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id v10so8047257pde.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 07:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=5KgmKiAmpHaSCX133G7UTE2WiPAsB5QToEfOib8uBRM=;
	b=CgEeSKZfJG0mog7kmE2SrLK0w83dciQRKXXUDffXyK7p3Q68VzKyEsTP28T6duxsNm
	gl311N3vAahthabVT2tUf2BGDCiEK+gjtHviCo1agnkM8u6HsvzKv1TVMRb2qUXLYP74
	ZWZstPeVfn4nBfidD3zjzBuLLVpcjft+1bhlvEreUsUuUKWkdcmG63mAn2uX/nJGHYAO
	dE5j+K95evV/4XAwkyNrpvLcTo3K6GKVO41dQRmUq5KnMiVKq4cYdaU0lXASFX9YZFnc
	Gop9xECl/QiVB2/nglXBueoNDzEUL191bTLFUlyXMXQ3EyNPx96itiuR2e6tyMtzyfd6
	+/kw==
X-Received: by 10.66.62.137 with SMTP id y9mr20965621par.87.1419350378459;
	Tue, 23 Dec 2014 07:59:38 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:403a:978d:9b16:287d?
	([2601:c:a700:272f:403a:978d:9b16:287d])
	by mx.google.com with ESMTPSA id zk9sm20488037pac.1.2014.12.23.07.59.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Dec 2014 07:59:37 -0800 (PST)
Message-ID: <54999162.7080409@gmail.com>
Date: Tue, 23 Dec 2014 07:59:30 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Armin Kuster <akuster808@gmail.com>
References: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LaOaz=vsqPPCy-f47vuAHx-rfgd7zZpLXNd3Qyhi36rww@mail.gmail.com>
In-Reply-To: <CAJTo0LaOaz=vsqPPCy-f47vuAHx-rfgd7zZpLXNd3Qyhi36rww@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] [RFC] Move packages from meta-oe to core for X11
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
X-List-Received-Date: Tue, 23 Dec 2014 15:59:43 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/22/2014 06:48 AM, Burton, Ross wrote:
> On 22 December 2014 at 04:54, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     This fixes 'core-image-x11' image dependancy on meta-oe packages
>     since xinit requires xterm, xclock and twm to 'startx'.
>
>
> Why can't we just make core-image-x11 start Matchbox instead?  Adding
> twm and xclock to oe-core seems crazy.

So are you open to move 'xinit' from core to meta-oe?

- Armin
>
> Ross
>
>

