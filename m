Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2LEc-0002zs-Ue
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 13:33:19 +0100
Received: from mail-vc0-f200.google.com ([209.85.220.200])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 04 Feb 2013 04:17:28 -0800
Received: by mail-vc0-f200.google.com with SMTP id p1so8897480vcq.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 04:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=ZsOFLc9nKSh0uWequZaxXn0jEKr127Hwh2JlW7k1Rbg=;
	b=UY3ODSZiBxNc6PG57gd1ml6UhZAudUvSIbZaOYEcUh9cnDzzOgWF+wsCcCer2K8lA8
	LuHZ3GkC0ILBspoK03aSFNli18/dngiAaXoNo0zt9gp0Kxr2IdXNAVqLnRel9bsVMXsO
	L8Qdi4ANw54BLVdXkUTZ1F3HbblkGuG/zZiVg7VtO/s654VQGtjRBtZLhAt30/8hmDbN
	ky3mG2L/gH+ClkENnFO0fb/QbuXKYbkGxIHsi10l4BLEySChFx3cZ7WU0WTNPvZjGh25
	Il/Evvfmp1Vp9AKhOzI3aMUomA41u71k+rsLkf0oWhAsoDhPJ2LlPfvdAAWcY9Yzy+8B
	XMSg==
X-Received: by 10.220.116.5 with SMTP id k5mr21863160vcq.55.1359980247466;
	Mon, 04 Feb 2013 04:17:27 -0800 (PST)
X-Received: by 10.220.116.5 with SMTP id k5mr21863154vcq.55.1359980247370;
	Mon, 04 Feb 2013 04:17:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Mon, 4 Feb 2013 04:17:07 -0800 (PST)
In-Reply-To: <cover.1359886551.git.cazfi74@gmail.com>
References: <cover.1359886551.git.cazfi74@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Feb 2013 12:17:07 +0000
Message-ID: <CAJTo0Lb1waqNT=niZT3bReJ2Z+3Caox8rKngqMupHWDZQL_TDQ@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
X-Gm-Message-State: ALoCoQlexjdeh4G4W6NBo+gKDul2BaajsvbT8zbZrTg5l4oMewE0YD/b18Kg3CnBObtjP3CGFK36kLL3sh8sbJw72JpBc+6AYHqQiDkZ1yjCiYEu1fWcGNw43AzwW6kWAZu1ZsDWcwEtbXANhSgMchC19+XMCLvcIIbW6J7YCrVcAbb9TXjwsKuDhak/07+60DaPsXUji5ks
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Automake-1.13 fixes (batch 4)
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
X-List-Received-Date: Mon, 04 Feb 2013 12:33:19 -0000
Content-Type: text/plain; charset=UTF-8

On 3 February 2013 10:17, Marko Lindqvist <cazfi74@gmail.com> wrote:
>   libmatchbox: replace obsolete automake macros with working ones

I've just pushed this patch to git, so you can replace it with a srcrev bump.

Ross


