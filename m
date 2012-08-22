Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T4DU0-0007eE-ES
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 18:08:40 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 22 Aug 2012 08:56:34 -0700
Received: by obceq6 with SMTP id eq6so1350307obc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 08:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=tjeJelVZg3tDru7zsyiYy9741PsrY4RhAfyQ9sr4fbM=;
	b=b+Xj1iMrqLcrjO3xdj1vIa0Yt/Vk4Y06yJofU7x+ZzyRoJGSEwUH/uPAPEFQYurPz8
	qLyRoQDzcdEpGjQAE3E+zwk+i/A2b1BELyJybm79MNkDEf/woTO2NHHAekXeN5MOTCG5
	hP+qdLKAZhxFuduEzNlLsp01MeTK+kL7s4Mba784XH5PnZSMFrdEnamtxh1nWPMISull
	PiWLU+aHEHz92UGtdx3GkMqAGC00dD2ciyWXeTKV1fIMtoKF2FL/iTEY6q8uZMgcJCYg
	CtZdF+uYp6sleG3Y98FJ6W3Ah9OdP/YNQCtYsG8+ArKrZxf1Dz9zVBQXd/JMSplpuNXj
	22JQ==
Received: by 10.182.108.71 with SMTP id hi7mr16605699obb.21.1345650993967;
	Wed, 22 Aug 2012 08:56:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Wed, 22 Aug 2012 08:56:13 -0700 (PDT)
In-Reply-To: <CAJTo0LarhQSinwUHXuruO-OiCBOw4j89ko2n4RvctREApS5NZA@mail.gmail.com>
References: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
	<CAJTo0LarhQSinwUHXuruO-OiCBOw4j89ko2n4RvctREApS5NZA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Aug 2012 16:56:13 +0100
Message-ID: <CAJTo0LbJaRyPCexNT8nVhY-qvh19UxH9WSf22==GF8kjWuFaAg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmcVJZTxBmpr7AndO1jWKsMYnp/g0vOS9NHsWzvHFB5u2x2zd55c55zvRU+oPvHUmgGMb+E
Subject: Re: RFC: One X Server To Rule Them All
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 16:08:40 -0000
Content-Type: text/plain; charset=UTF-8

On 22 August 2012 16:15, Burton, Ross <ross.burton@intel.com> wrote:
> Some rough numbers: a core-image-sato rootfs for RouterStation Pro
> using kdrive is 25959477 bytes.  Change kdrive to Xorg (Xfbdev and a
> few important modules) and it grows to 26342094 bytes, approximately
> 380kb growth.

Forgot to say - as I'm still working on this, this was the size
difference in the rootfs.tar.bz2 so that's compressed difference.
Expect a breakdown of files and size differences shortly.

Ross


