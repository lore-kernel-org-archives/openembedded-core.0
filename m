Received: from mail-vb0-f42.google.com ([209.85.212.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1US2lB-0008O4-Ox
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 12:05:15 +0200
Received: by mail-vb0-f42.google.com with SMTP id p12so213784vbe.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 02:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=QuSTkw4tZzaRKSS/LkjgHOVG3qEJ5ZQKAtxFERP1XBM=;
	b=fNNu7eOM++aaoFdT0LlPOlaRB09WaI18uUB99u2Obixxl9GkIo8VF3aRXbqOcDM/tA
	RRWwBFQU6cIe02MRaKKRmeZuV1vqKWsO2vWpQhfomIJsIenVeBxhsL28bLJvjHjmEn4f
	OSbagXgnZ7PsPBzFFrseoEFO76aQ4BX0tv5JcFKcQx1iZgdWbwCmHQ35DI9NdwH4s0t+
	r/GhkgW1J5nesq0EOxOv9/fYMliQCkZODsVUBWyXSYbABdJyPLLmekiE/uNc0AlBzXm2
	UwvxE2LA88PlyaBevyINC3lBl59XkhUOD77ZXz1N8WXmItzbVpitfVWickICSaF45Fcy
	MJzA==
X-Received: by 10.58.188.48 with SMTP id fx16mr952724vec.22.1366105659396;
	Tue, 16 Apr 2013 02:47:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 16 Apr 2013 02:47:19 -0700 (PDT)
In-Reply-To: <CALbNGRSaN3_rkYW7zcd68XWuRqU0iMQ5C3oy9KdgKX_mwmE2-A@mail.gmail.com>
References: <5B2FD9C3-A643-474B-BC8A-DB24FCCBAA1A@dominion.thruhere.net>
	<CALbNGRSaN3_rkYW7zcd68XWuRqU0iMQ5C3oy9KdgKX_mwmE2-A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Apr 2013 10:47:19 +0100
Message-ID: <CAJTo0Laof0_z-tyVRaQ7nVMzkwWdmtZZUVZYP46cu5gMQyZPcw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQntT88jZKPwuShhn8J1rbLR9H5VBsveTE8Shwm+u7Em04R6/3ArTl4mME9Z0FwOFCMnne5A
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Libpng 1.6.x is broken, switch back to 1.5.x before release?
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
X-List-Received-Date: Tue, 16 Apr 2013 10:05:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16 April 2013 10:38, Andreas M=C3=BCller <schnitzeltony@googlemail.com> =
wrote:
> I would like to bisect this - test case are the network-manager-applet
> icons for WLAN. If libpng-1.7.0beta07 fixes let me know.

There are two issues - one is that cairo-png is treating every warning
as fatal.  The other is that libpng 1.6 has stronger function call
ordering enforced, so cairo-png's loader causes a warning.  Which then
gets turned into the "out of memory" error.

I'm working with Chris Wilson now to try and sort this in cairo git,
so we can backport stuff.

Ross


