Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQblx-0007hR-1r
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 13:04:05 +0200
Received: by mail-vc0-f172.google.com with SMTP id gd11so2071426vcb.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=GI7ALV8CoUcL4CXDYSlJFslP16iEzob9bjAzh6hRKcY=;
	b=YAnAT4V0sjYD1jHvy8EVLqkSoTSnQ54e6QXPzJjWdEez2NpXVOBCjt47Tj6d/oJeWe
	kImD9HFbtaZVR+yTiEfNK+P6KR0qCOCv+L4Tr6/uI+hOzsMMTSEO1e51SbtTUUACkUpV
	zbq6jNzVB3mxuDyLv8WMAp0YNRkJxVOfdBdGjgUEpmFPTrDwc4ZNpu5opzMyfcfdVr2+
	ovkVDbfw8OqjXDegexnv4eXGsAxiqD3P/vg6P8bz7xVezAoSiga5Zy7JRwYROh5drt7m
	A0lXPhOhcdUaWKJZjjWV14wswqggKJDuGNsTXyeEIh8FL/fyZ4JBP2hdmFvHsOhTT8HF
	4QHw==
X-Received: by 10.52.108.10 with SMTP id hg10mr6719367vdb.34.1365763596440;
	Fri, 12 Apr 2013 03:46:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 12 Apr 2013 03:46:16 -0700 (PDT)
In-Reply-To: <CALbNGRRgm8MspqB0ouUFp2s+y_7CGL+qEFFWRZLC+6bh9sJOGg@mail.gmail.com>
References: <CALbNGRRgm8MspqB0ouUFp2s+y_7CGL+qEFFWRZLC+6bh9sJOGg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Apr 2013 11:46:16 +0100
Message-ID: <CAJTo0LZWKopuBHzAp5g7Uj03kmqfTDzTF8Aq+mWax27wHz11wA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQmsMZVspnz90zLIYE9onyXQyHhXGnRYlW7OuevPkPdNneEd0UeGg+N1XzNYahSpur5/Vmbi
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd/sysvinit switches (was [meta-systemd][PATCH 1/2] Delete systemd class)
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
X-List-Received-Date: Fri, 12 Apr 2013 11:04:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On 12 April 2013 09:56, Andreas M=C3=BCller <schnitzeltony@googlemail.com> =
wrote:
> OK - just in case I have spare cycles to start this: I am afraid I
> lost overview regarding distro features. I found systemd and sysvinit
> which can be set both - still correct?
>
> Ross could you please link me to the information how the use case 'I
> want to build for both init-systems but let image decide which one to
> use' is set up.
> Sorry I didn't follow the last changes in detail because of other
> issues (and personally I just use sysvinit).

It's in the manual!  Okay, only just, and it's still being worked on:

http://www.yoctoproject.org/docs/1.4/dev-manual/dev-manual.html#selecting-a=
n-initialization-manager

(obviously the DISTRO_FEATURES =3D "systemd" bit is wrong, but you can
see what the intention is)

Ross


