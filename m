Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URle4-0001XA-Nw
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 17:48:42 +0200
Received: by mail-ee0-f49.google.com with SMTP id l10so2278509eei.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=7SAKIyCMMU+9GMmIFXHpo4HYlOvXS43lFupvap+VcVg=;
	b=iqOoiMU49ZM8pP8ggNzIT+JqGrhcDYqYPlhIsr5iFQYzbCqApQreY1wbNP/yYOliKz
	e3NCWas7bB6RPzR4lkATWt/DEODnEaDURrP+Go8yQp4/DEiipPX6EN9QkGO8Ty9cj/Yb
	XsS2mWRLDaW6XKve8nXnt7IxJvfobySlR6PPqHV7OCXwM98zAxaKiIqmS3XrXjODwtwW
	zdohj3F7VYSNQpaY5jdbCLoQ+grOu9+jB3AVx3cHL1V7sHtRfn6qFI22LF+OgrIxnqSY
	6kTfbbIyp5Ta11k98SyGus4T9mlJ/T2SF4bWHtS4O6KkY+Hq7exDFZZv2Er7qxE7Mz6K
	/jFw==
X-Received: by 10.14.87.199 with SMTP id y47mr39836107eee.17.1366039871911;
	Mon, 15 Apr 2013 08:31:11 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id a2sm25962674eem.11.2013.04.15.08.31.10
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 08:31:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZWt2W2w5FvOcPsh5OnrGWcnFCR2mjzYDWCkq8K7etJ6g@mail.gmail.com>
Date: Mon, 15 Apr 2013 17:31:11 +0200
Message-Id: <341AED6F-8BBF-4203-B5D0-6F215C8E7F14@dominion.thruhere.net>
References: <1366020744-2958-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0Lbcv-GkQs-PWoW3mtJWzfp_WuNbwU=A1NVd9R7-=uF0tQ@mail.gmail.com>
	<66033B10-A10A-4660-85F5-D06E1B9C21D7@dominion.thruhere.net>
	<CAJTo0LZWt2W2w5FvOcPsh5OnrGWcnFCR2mjzYDWCkq8K7etJ6g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkmxuCHJsK+Hky/bwcJw2BPCkESDuxSkKln4HWLiIxDqiVN80vNLF+vlmfH+nXLz1tE9Ora
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: remove udev-extraconf from RRECOMMENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 15:48:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 17:27 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 15 April 2013 16:21, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> What udev updates are you referring to here?  The udev in oe-core =
has
>>> RRECOMMENDED on udev-extraconf since 2008
>>> (fc128ab1e4fec27d44cebfa690a9bc233eda0caf) and I don't see a udev
>>> override in meta-systemd.
>>=20
>> The udev in meta-oe, I never used the udev in oe-core, it was very =
outdated and had all the weird dependencies like extraconf.
>=20
> Presumably that's been moved to Angstrom as I can't see a udev at all
> in meta-oe now.

It was deleted in favour of systemd.bb providing udev, angstrom hasn't =
udev the standalone udev since it was merged into the systemd repo.=


