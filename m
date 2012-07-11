Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SoxjD-0003J8-IK
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 16:17:19 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 11 Jul 2012 07:06:06 -0700
Received: by qaeb19 with SMTP id b19so2917766qae.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 07:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=42kXgUewFk6qiUEi21P6phc5IsEGkqvndqc4PY1yl2A=;
	b=dY7+LJQnf25yKgUiTOOJHx0FiW94PTa6o0i5rL9ePmLMxOJwm/PGbUCYEoHfNQppGS
	e3KHTCblLmAPVWuRIpUeB+fPUehhHlSkVPei/MHHaT+ilqghO++pYnZw/T2qkYDhZ83f
	JbF6WYXgxhptOHY1VxRPSDyoK+pO3X74oYGZF8fNUD6QNdKv8J0iQ1KTQ3DtPJuX7P7m
	pEyH6Ayv1i6uVbIpF81EOhpYIJ2PJ7kd5I5JOpDWJa86zEBNqYpybKFSqykIoDqwU/Qz
	mbhqX3qX6GXfezP5E2Zi/cFI2k2ViOwfOXpx6vDhtFQQ62GEh1tpbKITLn+qf51WsIf5
	tAbw==
Received: by 10.229.136.17 with SMTP id p17mr25806541qct.86.1342015565699;
	Wed, 11 Jul 2012 07:06:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.218.201 with HTTP; Wed, 11 Jul 2012 07:05:45 -0700 (PDT)
In-Reply-To: <CAJTo0LYRGSkOGOV04C+Pb3ypi7JvbbjC7UJY-Yxywk12FQusaQ@mail.gmail.com>
References: <CAJTo0LYRGSkOGOV04C+Pb3ypi7JvbbjC7UJY-Yxywk12FQusaQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jul 2012 15:05:45 +0100
Message-ID: <CAJTo0LbdM=sqQXYSW8KPJno5mYMR-U08Jy=t3ta9ziJ3_2MLbw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkD3xkoqXyyyGz729cAiaJKy8hXzbWJlAczDk+kL6dKV5PTYQ36xhPUuoEnEpSSLGtBh7C2
Subject: Re: [RFC] webkit-gtk upgrade
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
X-List-Received-Date: Wed, 11 Jul 2012 14:17:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 27 June 2012 07:40, Burton, Ross <ross.burton@intel.com> wrote:
> In the git branch poky-contrib/ross/webkit I've upgraded webkit-gtk
> from a 1.7.1-ish git snapshot to the 1.8.1 tarball.  I've tested that
> web builds and Midori (from meta-oe) works, although obviously more
> testing is needed -- both users of the library and architectures.
>
> I'm going away for a week now so if interested parties could test this
> it would be much appreciated!

Is there really nobody out there using webkit-gtk for real?  I've just
rebased my branch (poky-contrib:ross/webkit) against the current
master, and the webkit-gtk change is a single commit, so please anyone
who actually uses webkit beyond a few minutes of testing in Web -
speak now.

Ross


