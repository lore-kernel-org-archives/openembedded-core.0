Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQgQ2-000506-U0
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 17:29:27 +0200
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 23 Oct 2012 08:15:59 -0700
Received: by mail-ie0-f197.google.com with SMTP id 9so10949756iec.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 08:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=sphN4qeY94ZsGM3uv8NzYINBd+lIqvONhbfusD3DtIc=;
	b=n5bx/N/u8aciUdOAM1pX132iIH1hMF904uxxdws4Z3e+durLzxyz+KGkEFyQXYUYEu
	CN6GRiBCUWPCgk24H0T3A+0/dVMdyh418KwsYCR+laRBg4vV4zP4+ijiqw5/3Xw+iWWg
	LBMIyl8Yz+yFm8B4RS7MRbIjTt23OVXoy6o/wa9UT/2xTbPrOck0Y3HlP5qtOlDlgr/U
	demz4mEiYILcFDZ5B9Oyv6fSbb8ifS6+B6cUdboPu8uUZg0GSlLQShflrZO9Eo/eq0gp
	4QmYgkDe+JvNahbC5JS3l1RUOBvgsRWc3XBOPxw5og7kvh8CAenCvJmHMA5enWNpCbOL
	ZiQw==
Received: by 10.60.5.138 with SMTP id s10mr11141124oes.80.1351005358681;
	Tue, 23 Oct 2012 08:15:58 -0700 (PDT)
Received: by 10.60.5.138 with SMTP id s10mr11141121oes.80.1351005358594; Tue,
	23 Oct 2012 08:15:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Tue, 23 Oct 2012 08:15:37 -0700 (PDT)
In-Reply-To: <50869BDC.6050401@communistcode.co.uk>
References: <50869BDC.6050401@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Oct 2012 16:15:37 +0100
Message-ID: <CAJTo0LZHTGaVLnrYidOmLwvqB3Z+n9m5itr_4hA9krEPHihdsQ@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQlZV/l+sw8KRNlSCYjwySMs11Wq3Xj2PjqzG8EOkY5d4t5V6F0QLbKFJhUFxtevJbfoMRDQjfAG1dY311QFBBCkNagfWS+f4jIY18triFfCkGOUbg6S+kos4ZoftAI2UJkyiGmRKomzpTvx/S3xcZ1augRFWavXgtHlxlCexg14DIFo/KXp4oARPD1nOljg8mDFBRtN
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues building meta-toolchain, libxau
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
X-List-Received-Date: Tue, 23 Oct 2012 15:29:27 -0000
Content-Type: text/plain; charset=UTF-8

On 23 October 2012 14:30, Jack Mitchell <ml@communistcode.co.uk> wrote:
> I'm struggling to build a varient of meta-toolchain as I keep running into
> the following error. I can't see any recent changes to libxau soI'm a bit
> stumped...

/usr/bin/grep: /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/libXau.la:
No such file or directory

Hooray libtool!  :(  There have been relatively recent changes (a
month ago?) to libX11 which may be causing this.  Is this from a clean
build?

(this is why people don't like .la files)

Ross


