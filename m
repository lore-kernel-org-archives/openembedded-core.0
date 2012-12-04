Received: from mail-ia0-f169.google.com ([209.85.210.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Tfs6c-0007CA-DJ
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 14:00:27 +0100
Received: by mail-ia0-f169.google.com with SMTP id r4so3524018iaj.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 04:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=C0bpurVNT0AXe8OjuCNSnrOaMyxFZ+NiB+71U0I4q+Q=;
	b=sS+BMQbFXU5ErunZVwp+sYtEIXU6y7vFkDe5mibdsgPPeP+hjofQE/1E3ZO8P7pp1E
	MVoCVGhMkH3aYPAlNwu4K+sPVi8Ike+AMXpwDQ92zer7wF/2hN++P7rEbImMYrUQb4I9
	mV8q2EoBXRyNuIW8kWJJU11l6TxPVEBTCtjlAG7/pq7OQvgf5vy8Hp3bBpDKxSG+QqrD
	XOM1Q53phv9ggn4YdrqqKXu7grcC8ZwHKgDxP2xAH7usz6/wmtxUnv/zvNMW82iDaA7S
	npn/2alhw301WJZ3qkbK4B5OruVaFV0N2eSttt7QA82YpHxXHNxd6rO+0McmBAuNmpXU
	1nGA==
MIME-Version: 1.0
Received: by 10.50.190.161 with SMTP id gr1mr2491054igc.14.1354625147434; Tue,
	04 Dec 2012 04:45:47 -0800 (PST)
Received: by 10.64.24.179 with HTTP; Tue, 4 Dec 2012 04:45:47 -0800 (PST)
In-Reply-To: <CAJTo0LZKGRT=hn0uT9hM34EYpg-MwDFWaQuxOWmohwJVvT+s9Q@mail.gmail.com>
References: <CAGiJk9c_5nDZbTwTo1DvHXMEtOXgO=4-YvbsDoD-ZXqY=cTi8g@mail.gmail.com>
	<CAJTo0LahtxpX1G5BKkYxCaN7hyJkkS9riXF0btP8XMWFJzzxfQ@mail.gmail.com>
	<CAGiJk9dStPRuWzJVMQhVziNt+EW4ShNm3CkqCJBaTuYgrbSaog@mail.gmail.com>
	<CAJTo0LZKGRT=hn0uT9hM34EYpg-MwDFWaQuxOWmohwJVvT+s9Q@mail.gmail.com>
Date: Tue, 4 Dec 2012 13:45:47 +0100
Message-ID: <CAGiJk9eoe1fcTAGAzeFyGyRHskz1Cktpg+mwoxmRhW=Edx1aEA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: EGL / GLES issues (mesa)
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
X-List-Received-Date: Tue, 04 Dec 2012 13:00:28 -0000
Content-Type: text/plain; charset=UTF-8

2012/12/4 Burton, Ross <ross.burton@intel.com>:
> On 4 December 2012 12:10, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
>> root@overo:~# ls -l /usr/lib/libEGL.so*
>> lrwxrwxrwx    1 root     root            21 Dec  4  2012
>> /usr/lib/libEGL.so -> libEGL.so.1.6.16.4117
>> lrwxrwxrwx    1 root     root            21 Dec  4  2012
>> /usr/lib/libEGL.so.1 -> libEGL.so.1.6.16.4117
>> lrwxrwxrwx    1 root     root            21 Dec  4  2012
>> /usr/lib/libEGL.so.1.6 -> libEGL.so.1.6.16.4117
>> -rwxr-xr-x    1 root     avahi-au         0 Dec  3  2012
>> /usr/lib/libEGL.so.1.6.16.4117
>
> Have you tried recreating an image?  The different group ownership and
> timestamp is odd.  Who does opkg think provided each of those files,
> not just the versioned .so.?
>
> Ross

This is very strange, as I've checked the image the only corrupted
files were the EGL / GLES ones (all tested GTK+ / console applications
worked).
After re-writing the same image on the same sd-card everything works
as expected...

Doesn't explain why mesa-dri is being built, but at least the Qt
applications work again :)


Well it doesn't look like there is a logical  cause of this error,
so sorry for the noise.


--
Regards
Samuel


