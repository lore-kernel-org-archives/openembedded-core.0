Received: from mail-vb0-f45.google.com ([209.85.212.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TyoN8-0004E1-Nz
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 19:51:38 +0100
Received: by mail-vb0-f45.google.com with SMTP id p1so505607vbi.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 10:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=ts1o1hd7uJOyRj3FiuXRWRM3p/TseYZtmoKVLV/q8BY=;
	b=NJltQlvC6PEc1+F81AltbLxBdEihLmFwkAWTbcx/CMgTGvQpCpNTXNyZNYUJ5MAy5v
	sixqyD92/szfcqncIXHHIkz8plb2rYqL79iJtXX3GYtXNG9zzKXfiYPASVojJ4wzanht
	jKKL6ee9T4Ew6KuHtAr4Z23bQrc9vl1WuomSwraDUG0VDz7f+8IXgZFhwSOYcBeu7SnY
	exPjPmne3TRXSlB8eTb5ZMInr/plfkcOrCFAdUMHtM6Jsl5Cwi0TL3aLXNBZWvx8PqsN
	sP0S4Diz9tpGd0JGG8YAC+Z7zOdCnKgT6kTCUEyO9Hax1nuc7tnszr49KgEpIgklMSDd
	QHjw==
MIME-Version: 1.0
X-Received: by 10.220.154.148 with SMTP id o20mr7066035vcw.54.1359138951938;
	Fri, 25 Jan 2013 10:35:51 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Fri, 25 Jan 2013 10:35:51 -0800 (PST)
In-Reply-To: <20130125180634.GC16904@jama.palm1.palmone.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
Date: Fri, 25 Jan 2013 19:35:51 +0100
Message-ID: <CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Fri, 25 Jan 2013 18:51:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 7:06 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Jan 25, 2013 at 06:53:54PM +0100, Andreas M=C3=BCller wrote:
>> On Fri, Jan 25, 2013 at 6:50 PM, Burton, Ross <ross.burton@intel.com> wr=
ote:
>> > Hi,
>> >
>> > Been chatting to Richard.  How about systemd ships a symlink to
>> > multi-user, and the X11 init script packages change the symlink to
>> > graphical in their postinst.
>> >
>> > (we must remember to put this in the release notes for anyone who has
>> > a custom X init script)
>> >
>> > Ross
>> >
>> Have not yet tested but how about:
>>
>> pkg_postinst_systemd () {
>> if [ -n "$D" ]; then
>>       # no display-manager.service around?
>>       if [ ! -e ${D}${systemd_unitdir}/systemd/system/display-manager.se=
rvice -a \
>
> I think you wanted $D ^ here.
Yes there are more of this but before cleaning up & run into tests:
Would this find friends?

> Cannot we just just u-a for default.target ? And each possible target
> providing own u-a alternative (DMs with higher prio then systemd)?
Sorry but I don't understand this

Andreas


