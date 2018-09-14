Return-Path: <geissonator@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id DBAC779972
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 15:13:27 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id i10-v6so4905787oth.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/qsZEcYq//6VJNdp4fLdeYO9xJoEwiPVUEoA79OWkmI=;
	b=AI0LT8+DIlM6+Hl5S6EJBt0y+Fyd05HWIaTq7mmADUTvnXEa0MKW1pu6IIwxMr/Iyk
	CX8YNCNs0TrjCHeo/iPt6Q4ftZVhZS82aliFxdfU1CBrIbjH02L1ZKtefyVqWWfCVuYu
	rNUu+xw3L8ShAT0yVht3D/KY8QBVQInbrCRJ2rvsKTgsAI/Xw0yGoPvn8tU+eLzx4zLY
	CBhsiY/e/HL7XTE5B/Y2pCA4f43KvwnYF+pHc3QZr9qQuqwiA/TeYdb8Q6tpMWZ/gw8Y
	Lti11nJctvqqk1FgaB5Z3q0kFmj7cv7OH/4adpOhAn3EcD7+Swr5F/cXEAbyqCUR1M9v
	En2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/qsZEcYq//6VJNdp4fLdeYO9xJoEwiPVUEoA79OWkmI=;
	b=SC9DgAT5oBEH/Yf0udsMja7Oauvh1xloVvC1t0n5G95PxbgdV4P5ahXx05d4g6bYVw
	BlpJm2gOwMNvhYiNVYd7MIw3JnCHJv7l6k1K5YZbIUtuZTFAvigM9sumpHNCt4DUj08E
	0YJHngNXRcMgGF+Dv2ySnCBj/qa6Hmhqugz66ZotGQph9Sy/x6TKZTF4tezhBuQihFXh
	AoTByacv9Pxdc3wtRC4CTZ/M8z/C9P3APqvVCH1sgSk8Bm/A9eivHkHRqwIIRKUYe3VI
	gFQ87TTAIuPBYcTinHyCikniQdfPZpcF77bPAxCyk6WfFAo2NUw9Ozeyms5Xz48u2rFW
	DIVQ==
X-Gm-Message-State: APzg51CgVKlf3al5tJPCg9w+5/95spWPZDXpytrQdMDUq3Z9v/4V66Ls
	mcEsR6Xm9c80Ttf2MlkDgEpGj9TIeDDVbrrK1SZr6A==
X-Google-Smtp-Source: ANB0VdbT5MTyXHVEw8VfeSdChKh6n7+KcrdY+h4/yohRKMSNFaeouWxyRYqN6LVBIftCNhw4veKLjjnxMXIJAvSzeuE=
X-Received: by 2002:a9d:3f9a:: with SMTP id
	r26-v6mr4486991otc.113.1536938008536; 
	Fri, 14 Sep 2018 08:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
	<CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
	<CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
	<CAJTo0LYBrnBuL-jTw6cDXf6qztp8H5YpphBgsrrUyUuaQ-KoyA@mail.gmail.com>
In-Reply-To: <CAJTo0LYBrnBuL-jTw6cDXf6qztp8H5YpphBgsrrUyUuaQ-KoyA@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 14 Sep 2018 10:13:17 -0500
Message-ID: <CALLMt=pHOQHswPeLF-rWpA2QXmtkL8Hc9RKav_j6tF1MuozVoA@mail.gmail.com>
To: ross.burton@intel.com
Cc: alejandro.enedino.hernandez-samaniego@xilinx.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Fri, 14 Sep 2018 15:13:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 14, 2018 at 8:06 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On 14 September 2018 at 00:49, Burton, Ross <ross.burton@intel.com> wrote:
> > On 14 September 2018 at 00:30, Burton, Ross <ross.burton@intel.com> wrote:
> >> I suspect simply adding python3.5/*/test/ will catch the bulk of this
> >> now and in the future.
> >
> > Gave this a go and annoyingly the manifest generation must sort the
> > list because the glob works for everything apart from packages after
> > tests alphabetically, so the tkinter and unittest tests don't get
> > moved.
> >
> > I guess we could change the manifest to put the tests package at the
> > top of the list, and be sure to respect the order when generating the
> > lists.
>
> So I went and did this.
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/manifest
>
> Does anyone have a problem with this?  Basically all the test code is
> merged into python3-test, including the previously separate
> sqlite3-test.

Nice, thanks Ross!  Looks good to me. Will you be back-porting to
python2 as well?

>
> Ross

