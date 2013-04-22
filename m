Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UUICc-0005AP-4G
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 16:58:46 +0200
Received: by mail-vc0-f181.google.com with SMTP id ia10so6161269vcb.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 07:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=AbGGn8BRByXwnrP6BnPRNHAfA+fCD9MhpWoh4pYJDcM=;
	b=WJ7EWxAK5BlCkGVYSTUhw00kxRLDOQ3M2KnFcf67cfc/eK5ZvMZdGxqa/qtorK3mSI
	iXpi9XNuCLO/zvIxmU+FeO4Y8oVHIFFy/ZcftzaCnvLN8zrgJhNZbSWbnxQJOZSezmw1
	UtZBKEn/lA/vnRS9muaoc3ybWlapyrzwu6ZJHhnrx7fbKX20DeoOTEd3gg1/sTQg2MNq
	4iXJIzx14SMOZRoIeBoQC818M4LL0d1a9j6gN3p9SoQqxoZMdBnDaBm0cxb8u4HJk1+R
	39MEQg1rBiPcUR1bZsrQQpJeVtyb5hsS8M8w+H2g5Hp8jsEReM11O9iTh9QdfexsBn87
	N7Hg==
X-Received: by 10.52.23.115 with SMTP id l19mr16540150vdf.55.1366641666728;
	Mon, 22 Apr 2013 07:41:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 22 Apr 2013 07:40:46 -0700 (PDT)
In-Reply-To: <51754581.3090005@communistcode.co.uk>
References: <51754581.3090005@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Apr 2013 15:40:46 +0100
Message-ID: <CAJTo0LYMc0F=OG-xUQztpveQdYAPKnj0W_8Vb-wRZRL7F5+bSQ@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQntaSOblO+fgNUyrXA1b5hfVG+1k+S9P70XJKc1ss/ZafAVVLgKSIbfvUPV1NRShKfQD+H9
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: systemd post-install failure
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
X-List-Received-Date: Mon, 22 Apr 2013 14:58:52 -0000
Content-Type: text/plain; charset=UTF-8

On 22 April 2013 15:13, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Booting master today I had a systemd fault. Enabling debugging I captured
> the (attached) output. The gist of which is:
>
> So, looking into systemd-system-update-generator, it seems this is what
> takes card of the post install scripts, which I know we're having problems
> with.

Not quite - the system update generator would be used if we were using
systemd's native systemd update protocol, which we're not.  This
generator shouldn't do anything unless you've got a symlink
/system-update (see
http://freedesktop.org/wiki/Software/systemd/SystemUpdates for the
details).

Ross


