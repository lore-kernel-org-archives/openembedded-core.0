Received: from mail-vb0-f53.google.com ([209.85.212.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UStg4-0007wb-2a
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 20:35:27 +0200
Received: by mail-vb0-f53.google.com with SMTP id i3so2720598vbh.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 11:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=/dErq86sWlegL/3iyR9afrcBCnJCDDIqyXAhovYt6EA=;
	b=MFv/FNXYmQib79m/GBGobirr2veidoutj3Sib9f9rkr69Fz85UQvToizO7NxGy5a8r
	0q2ZcFqoymDNbj5HOM1+GJKdCR+aZwzMKss8ayG782rEgBjul5xLl3kvRewmDLyMZXFe
	g6eNPAqESS5nNjXSYgjAHTt0gsfhFbKgaNFQyeXBUGPNg+cDuJkWAY1QXDL+1I+1iBml
	O30Wv0lt6Ry9oXGlANv+HsjATlaCEPv50dOxtJG8kO32N4AxU8MNRyQ78K5+Py57crkf
	LrbknT5FSKW5Rw75JwMsjb8npODPUBjm+1lF+ou4OUZPeZq+XrZU2Mh97v1wSf3W6+wA
	EnDw==
X-Received: by 10.52.108.10 with SMTP id hg10mr7652127vdb.34.1366309070055;
	Thu, 18 Apr 2013 11:17:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Thu, 18 Apr 2013 11:17:29 -0700 (PDT)
In-Reply-To: <CA+chaQdMzU5vxX2G_rAN89gfc0MMhRGbR5hUBE+7Pm8VsM+EEQ@mail.gmail.com>
References: <1366306413-1336-1-git-send-email-ross.burton@intel.com>
	<CA+chaQdMzU5vxX2G_rAN89gfc0MMhRGbR5hUBE+7Pm8VsM+EEQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Apr 2013 19:17:29 +0100
Message-ID: <CAJTo0LbYxus=iaPfFHQJLmt8GEa_u=Pv0A9FTf-MniXvt5z--Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnDBg8k7pjrCgmVDHVp3MGcgbeToUGDrZrT52JgkwT1N7lqIYJJZ9JZFTC+jca+WdPlptZR
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: fix systemd service packaging with multilib
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
X-List-Received-Date: Thu, 18 Apr 2013 18:35:28 -0000
Content-Type: text/plain; charset=UTF-8

On 18 April 2013 19:13, Martin Jansa <martin.jansa@gmail.com> wrote:
> Doesn't this break avahi-ui again?
>
> http://git.openembedded.org/openembedded-core/commit/?id=02492d43cd7095acb3cf29843a50444c28b4d994

Yes, it will, sorry.  Then again why does avahi-ui use avahi.inc,
considering the bulk of the include doesn't actually apply.

(new patch coming tomorrow, I'm about to get off this train)

Ross


