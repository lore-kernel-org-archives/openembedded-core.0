Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SZ0D3-0007nH-TK
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 15:42:10 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga11.intel.com with ESMTP/TLS/RC4-MD5; 28 May 2012 06:30:48 -0700
Received: by qcmv28 with SMTP id v28so1433772qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2012 06:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=9c1DFxWGPfUJL+yALhv+x2C9kNE5AiDHE98CarEJpqw=;
	b=btrG96rB8qqrdoqBVwkbpK5M9Otc9XF41aFPfxr7h80WP+ag/4tcExSPaRUAxUsbIK
	Tw4n22aceipEnXYuNX4TpYDd9H9hM3OAwmDJPW0G+C+IJsYMzirTuX3xoj7DjaiAVJ6c
	vP/Bm9G4UsYxkZ5j7bBZxJiQBJkkXWEqWw8aFONjbK2NeR/uD5P3x4E7snhy3dchweeh
	AFQSKRz1VXhMCtHvUuReJzRfpt94pv3TPno8Vo+PYAoBY3I937lSaQdujcFz4eSMQr9B
	2qOFSQ+biCuineaZdpTB0lgfJokgW2TXZMdVPa7DR6Qz2fb/qURbOrqxlgo4k+fvjc0m
	eZiA==
Received: by 10.224.220.148 with SMTP id hy20mr8312855qab.17.1338211847529;
	Mon, 28 May 2012 06:30:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.162.12 with HTTP; Mon, 28 May 2012 06:30:27 -0700 (PDT)
In-Reply-To: <CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com>
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
	<4FC35FAD.7090505@intel.com> <4FC35FBA.2060200@gherzan.ro>
	<4FC37C81.6080200@intel.com>
	<CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 May 2012 14:30:27 +0100
Message-ID: <CAJTo0LZ5WuTMA=yuLm65PX-sp2Rx_L8UAg4JL1j5JcHvLC=o9A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkdkpEiJ/I2DLozXRpZ1Dg8Z0ZEDVZqtm3G8q4GCnirQ1X8iFFhgYwxaMbvEDyaZ4K9Y7ij
Subject: Re: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Mon, 28 May 2012 13:42:10 -0000
Content-Type: text/plain; charset=UTF-8

On 28 May 2012 14:26, Andrei Gherzan <andrei@gherzan.ro> wrote:
> There is an internal test suite for dbus. You can enable building those
> tests in configure:
> "--enable-tests"

Is there a good reason why these shouldn't be always ran when building dbus?

Ross


