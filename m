Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UX75Q-0006u7-9D
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:43:04 +0200
Received: by mail-vc0-f177.google.com with SMTP id gf12so228800vcb.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=SW1jUDyVxH8uQHT0r8GU1nYsn2jInsCj23i9jw1Fm7M=;
	b=ai7Acn4kjuf6yvMEMhhEdsaEiSvLGgoks0+adQmdXkB/PVb+1P5bIPFsAlhql7CGp5
	ZJ8n0MaMD2AcXcz3PVm5pixiU/A8j30WihtRqCHuEzllhTyCwQ8UZXj8B32NlZQm03WU
	kiHGoKOrE2CjQXU65s+DTUEmZ2ORDYkdNhWtxu9M6Yebt0syLf4JKzejDa2PYANQLfdl
	bT1cvT+Hkh58Kq/pVfVE645cByvL375N1HiFjSsp28FOJt8WLSdRSAbvm6OHd6PUz0m/
	MPYi+IJYRmzxxHt/Yq8Qnm90dr9c1X4neg70XxT1bPW7hMDA33xwHgo0pZw8J5LWo9/z
	x+yw==
MIME-Version: 1.0
X-Received: by 10.52.170.204 with SMTP id ao12mr28962786vdc.83.1367313909462; 
	Tue, 30 Apr 2013 02:25:09 -0700 (PDT)
Received: by 10.52.183.36 with HTTP; Tue, 30 Apr 2013 02:25:09 -0700 (PDT)
In-Reply-To: <F1511140-B61E-4A53-83DB-8B4E494CEA75@dominion.thruhere.net>
References: <1367307108-18479-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lb-RNvd85JO6O0iTZSiuJ3HMe6=rpGdgqa4QF4Xv0SE_g@mail.gmail.com>
	<F1511140-B61E-4A53-83DB-8B4E494CEA75@dominion.thruhere.net>
Date: Tue, 30 Apr 2013 11:25:09 +0200
Message-ID: <CALbNGRSpz5zGFJXfWGWxxp+XK+uJicTumMURb7vt8hn=zcL6qg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: do not recommend udev-extraconf for udev
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
X-List-Received-Date: Tue, 30 Apr 2013 09:43:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2013 at 11:14 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 30 apr. 2013, om 11:09 heeft "Burton, Ross" <ross.burton@intel.com> he=
t volgende geschreven:
>
>> On 30 April 2013 08:31, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m> wrote:
>>> * adding this extra functionality is an image- or distro-decision
>>> * at least automount-rule/script breaks other automount solutions causi=
ng
>>>  misleading kernel messages as 'VFS: could not find a valid V7 on sda'
>>>
>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>
>> If you're going to do this, please also do udev at the same time.
>
> http://patches.openembedded.org/patch/48183/
Suggestion / to be discussed:

* same for udev 182
* add udev-extraconf to core-image-sato
* add to core-image-minimal
* ?

Andreas


