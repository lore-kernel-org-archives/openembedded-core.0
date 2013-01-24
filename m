Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyP6x-0005Cz-CN
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 16:53:07 +0100
Received: from mail-vb0-f72.google.com ([209.85.212.72])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 07:37:33 -0800
Received: by mail-vb0-f72.google.com with SMTP id ft2so14104543vbb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 07:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=QrkJX3oF5kDiViYDBAdpDMmyPe8nnndNlAFjzhO1QQ0=;
	b=eAv6x2lngasXBD2p8uji3FTENTref22cNK9zf13apINXRE8MM7gj/mDfnbzpOSB21E
	72P1HqylW+52m7iv+kb6ZKs1EaN4UHcBV17U+HiXpKzxEzxCEj+kraPouxKJv1UIijO5
	CCzB7xHd6OxSX/NfXF7llNmRy21ZDMZTX9X3iJGkVYh1vWZlTPiNwdhc0ime9xq3iebN
	D27R7CDsm8FiBfJMirjFLTk01VQOigVmhvtK9jg454mLoOo3AGaF/JwLgGPW9GR5jYRr
	SKy908OdPAP0cEMmodcSKHLg426RD89VG0G8wzVJuDvFrMDl7K9LW/rMEMWn80d9qG00
	I1bw==
X-Received: by 10.220.154.76 with SMTP id n12mr2256461vcw.69.1359041851008;
	Thu, 24 Jan 2013 07:37:31 -0800 (PST)
X-Received: by 10.220.154.76 with SMTP id n12mr2256451vcw.69.1359041850934;
	Thu, 24 Jan 2013 07:37:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Thu, 24 Jan 2013 07:37:09 -0800 (PST)
In-Reply-To: <CAGiJk9ca7C5UWwLW0GTsiqSxH=TjOHfQ_bd4L9YgiKW+151cuw@mail.gmail.com>
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
	<20130124134801.GD3012@jama> <51013F96.80302@intel.com>
	<CAGiJk9ca5XZXMamBFOr+syV08WK--2CYONS_0f=rCxrZkm+n-g@mail.gmail.com>
	<CAGiJk9dpU1vpqUZt_+3aS4Bu97_kEkftPrOameF-LAB1qd2qDg@mail.gmail.com>
	<CAJTo0LbN7djNS17qDc60716+uSSgjKbtXHnUvsCWq6Bm_zKigA@mail.gmail.com>
	<CALbNGRQhr3GGp+Hx2jMOs0sEXCw5PNYdQhfoiHL0Kw1AxWvf6g@mail.gmail.com>
	<CAJTo0LZR4BjQYHPfaBtGpDe9Oi1qTuv=wAvhCkQ6EtfNkuLKtg@mail.gmail.com>
	<CAGiJk9ca7C5UWwLW0GTsiqSxH=TjOHfQ_bd4L9YgiKW+151cuw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 15:37:09 +0000
Message-ID: <CAJTo0LaEiSg-V_kFPLMVDfz51GunE97JwPUHTDW_WWjCXoPOaA@mail.gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
X-Gm-Message-State: ALoCoQnrQRYAy0UEGJKcoxpzhzZCK8pjWJ812RlUfdlpmwvhuVgJEZiBzQCEgZmeGV6aIhBdZZ8+8STLqYse9/1HKuA6rxEL4jqa1xaJsEISMuu5Vu8M7C8H7U5PAoba6kerMafT3HSA2Fh2N7lvj8rtp0h7YN3Vs3WdK9oIvnPEd3Zam6D7ck5Y9t2fIhNuEx15AkHmcF2I
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Thu, 24 Jan 2013 15:53:07 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 15:30, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
> There is no reasoning why to change the _default_ so that others have
> to change their image rather than you have to change yours.

core-image-minimal needs to boot to multi-user.  core-image-sato needs
to boot to graphical.  This isn't a "we'll make this change, screw
you" situation, oe-core itself needs to be able to select the default
target, and I'm not terribly happy with a warning on every boot that
doesn't happen to involve a display manager.

Ross


