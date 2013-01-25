Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TypNr-0007uM-4R
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 20:56:20 +0100
Received: from mail-qa0-f69.google.com ([209.85.216.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 11:40:43 -0800
Received: by mail-qa0-f69.google.com with SMTP id hy16so982403qab.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 11:40:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=GCBe27V1G/O/G73Dn1bSVwAma2C7S7oWsoADND/giqA=;
	b=PFcfCtemeAO0PBk6nyw+GpLlwSBVTBIYDZPNsLfvWSPZBi9WF+aHReBavOOaDOwal8
	k8Vp/eJ6sai9XbutZUGQHZG0NABzHEBMSOzxqOciwMVS0EJVs25zldqUrKDgaVVWJS3L
	CqoWHKO6O0UdCqzzH5pChkhBlzxiTAuds6J+K39fgY6lFpcusZClsOzCGpVmXLAoLPWJ
	j09K1m09l93d5h74dlJTz3X/wNkHBHXDdcdeHmkeNFidgFajNG+fO8o15zyyZtUbCWRk
	JYJUKY4qRHk+1iiC+X0UlgXCzedKfrjCofJzaQoPFRkrQk2nS3ApMEYnXJVdQGG7CHy2
	ZWOQ==
X-Received: by 10.52.72.232 with SMTP id g8mr6349382vdv.69.1359142841688;
	Fri, 25 Jan 2013 11:40:41 -0800 (PST)
X-Received: by 10.52.72.232 with SMTP id g8mr6349375vdv.69.1359142841601; Fri,
	25 Jan 2013 11:40:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Fri, 25 Jan 2013 11:40:20 -0800 (PST)
In-Reply-To: <21577255.rquHYp0Wn6@helios>
References: <1359135782-8953-1-git-send-email-ross.burton@intel.com>
	<21577255.rquHYp0Wn6@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 19:40:20 +0000
Message-ID: <CAJTo0LbUOtmgXVuruj6NmwaMr_x07TPK=nHCceOMd6cBgJKAPg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnzmMqqxEF2iAv5Ceg0gpwHk+etgsueaj0hU081MlkfS3Sh3DMjP0k9psXHuAkz6t6t19ZSU2jJtW+GM1q03wIhILo2BIsVXziu53Wv+qOD1upNxqov/QLETtsMRyKaOGL50FCdDwJCCwEGVOlBaYzbz2bk4CSaayrje8PKi8B5qgvXjR/fDZobNQQx+fCIt8vjWtQP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/wipe-sysroot: add script to safely wipe the sysroots
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
X-List-Received-Date: Fri, 25 Jan 2013 19:56:20 -0000
Content-Type: text/plain; charset=UTF-8

On 25 January 2013 18:16, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Friday 25 January 2013 17:43:02 Ross Burton wrote:
>> Add a script to wipe the sysroots and all of the relevant stamps, so that it
>> will be correctly re-populated.
>
> What I'm missing from this and/or the script header is when you would need to
> do this... ?

I primarily use it to verify that build dependencies are correct (wipe
sysroot, build package), but it's also useful if you end up trashing
your sysroots as it's vastly faster than wiping your entire TMPDIR.

Ross


