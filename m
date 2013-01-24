Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TyOmO-0004kS-4i
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 16:31:52 +0100
Received: by mail-vb0-f49.google.com with SMTP id s24so7213326vbi.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 07:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=+PNtC62UFkVP1SjHo7OrUPXN7KCPydwIyXwcZgzof6A=;
	b=MtoCkDWIumOUmttgLo8ijaVp36oHqqzFpz/0BSo5O7cHG1nzgFm4uADuf2GrC/AEdz
	eNEFJxF6eq4CiExYIWarFr1YlZG6TYeQiq2jZsLO89XT6vmnsk1GYJidKWL3XCFBbbkS
	KDFsOCa25U9SCZQpSI38sAOf6xqsfiYlFpUsDECtSvWiO2TuVZMqLRH6IG58Hm70178o
	uA74+M+C5QL2bwE1gArmogn3TrDizxOuHyNMzLorJwx4DkM8q5qzqp31JXmQbjcrYfw8
	b4kOCpFZQ5o0bOGc4BmEAI3IKO2pPwZ9QxowAvKLNXMCuAcVkGoklkZkQOHJeMBr19/3
	dLmQ==
MIME-Version: 1.0
X-Received: by 10.220.154.148 with SMTP id o20mr2195956vcw.54.1359040578938;
	Thu, 24 Jan 2013 07:16:18 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Thu, 24 Jan 2013 07:16:18 -0800 (PST)
In-Reply-To: <CAJTo0LbN7djNS17qDc60716+uSSgjKbtXHnUvsCWq6Bm_zKigA@mail.gmail.com>
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
	<20130124134801.GD3012@jama> <51013F96.80302@intel.com>
	<CAGiJk9ca5XZXMamBFOr+syV08WK--2CYONS_0f=rCxrZkm+n-g@mail.gmail.com>
	<CAGiJk9dpU1vpqUZt_+3aS4Bu97_kEkftPrOameF-LAB1qd2qDg@mail.gmail.com>
	<CAJTo0LbN7djNS17qDc60716+uSSgjKbtXHnUvsCWq6Bm_zKigA@mail.gmail.com>
Date: Thu, 24 Jan 2013 16:16:18 +0100
Message-ID: <CALbNGRQhr3GGp+Hx2jMOs0sEXCw5PNYdQhfoiHL0Kw1AxWvf6g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Thu, 24 Jan 2013 15:31:52 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 24, 2013 at 4:03 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi,
>
> A fairly uncomplicated way would be to have a variable that defaults
> to multi-user, but allow images to override it (e.g. all the X images
> in oe-core would do this), and set the symlink at image creation time.
>
> Ross
>
So I would have to touch all my images to save GUI-less guys from
systemd warning? Hmm

Andreas


