Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSvhv-0004GH-Mo
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 21:40:55 +0200
Received: by eekd49 with SMTP id d49so826832eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 12:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=RqwXIBxSeHh64NyMu5boxiRFq3LH43pcLtssE9o7gsQ=;
	b=wECHWe+4M6AMWFwh/HVDeZaVVt2XJnnWMG98/oemcFMFwQ9/13eLQcfihA4cRrSgYr
	GjB+7q40d2d347IQtxCYICwXlN6edqp6rc4Spple4emhfgXxKZROMTctmMZu5jHOrhJs
	NFGLzgCjmepb51gS47zLGvWXawiwabLOZhyePrauHG5MehsnXW9LSsEKPkYbuEj3nBcQ
	IA8RTSu6TEWsr9TLtwLtcJybu+aS6V6Un1CIwlihKqhknh0/kGIIowKj4YEG85WjAVP0
	pSKD+hv1jOuXdoQhj1OV7vryHPd2iZd0IVX6hughbeJHBmGQjAC28kx9312077D+CYEB
	ivvQ==
Received: by 10.14.47.136 with SMTP id t8mr2217480eeb.84.1336764659663; Fri,
	11 May 2012 12:30:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Fri, 11 May 2012 12:30:29 -0700 (PDT)
In-Reply-To: <4FAC908B.2040300@linux.intel.com>
References: <cover.1336015963.git.raj.khem@gmail.com>
	<4FAC908B.2040300@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 May 2012 12:30:29 -0700
Message-ID: <CAMKF1srKLK6mu2F+nTzb4sQ2jgxUj5=q2QE_C-o7HYnT7dQN9g@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Enable xserver-xorg for all qemumachines
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
X-List-Received-Date: Fri, 11 May 2012 19:40:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2012 at 9:07 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>
> ERROR: Multiple .bb files are due to be built which each provide
> virtual/libgl
> (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/met=
a/recipes-graphics/mesa/mesa-dri_7.11.bb
> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/meta=
/recipes-graphics/mesa/mesa-xlib_7.11.bb).
> =C2=A0This usually means one provides something the other doesn't and sho=
uld.
>
> I think this might be related to your change, I need to confirm it still.
>
> Builds are completeing but the error exists on all non-x86* qemu machines

interesting I do not see this error on bare oe-core. Do you have some layer
which could be doing something to virtual/libgl provide


