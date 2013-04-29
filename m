Received: from mail-ob0-f172.google.com ([209.85.214.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UWu6W-0006nS-Az
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 21:51:46 +0200
Received: by mail-ob0-f172.google.com with SMTP id v19so5862118obq.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2013 12:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=V61c+X295AzlqcBOWiPk4a4wluQXTi7dN6n5SEz0/wU=;
	b=fwdzSWqH+SffYY+BdP0lEGQXhnBN7WYz3FAHtUZalY+6q/4l9GpiFg5KaHOieKKbQu
	0hs3uFPacBM4dgPVvxBFUE9g7cCxg/fueDSzbtvkbd3xnVH6Nnv+I6glp/FzfHSLUapi
	PvDPkWAcnN759vMFx8lEmqno70+Fgps+9AW+oiPTuD3dBJUPIw0HT0urQVqTsgeQSMvm
	OCVpFbS7Pk6A9C6xwK5uioMEmfv6OQAolfOPsnUlwgIqsNYedMQnTH2l+w0unjZHO87N
	Fsa18SaO2J3zjruNymaLlscYVJUXfGD00bGm6K1T9TFfgq5KhNZ5OBQkuWY0a2KrUUPI
	gk5g==
MIME-Version: 1.0
X-Received: by 10.182.40.202 with SMTP id z10mr24147921obk.74.1367263999030;
	Mon, 29 Apr 2013 12:33:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Mon, 29 Apr 2013 12:33:18 -0700 (PDT)
In-Reply-To: <CAJTo0LbYjdxRw-xWSc-Rzb-mnWB9okVSXsQtoukfLa8P7DUEtg@mail.gmail.com>
References: <cover.1367133417.git.hongxu.jia@windriver.com>
	<56dc88629fbf58c9bfb0427320ac916f79e96364.1367133417.git.hongxu.jia@windriver.com>
	<CAJTo0LbYjdxRw-xWSc-Rzb-mnWB9okVSXsQtoukfLa8P7DUEtg@mail.gmail.com>
Date: Mon, 29 Apr 2013 16:33:18 -0300
X-Google-Sender-Auth: xpuaZjSBmwUHmWXSvh_mJwtNbL0
Message-ID: <CAP9ODKo9qxgV6N+r+xwcud8hbRTOsqHzyog_Hw0sZ82nfmrsyA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] udev-extraconf:fix rootless X write to usb storage failed
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
X-List-Received-Date: Mon, 29 Apr 2013 19:51:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 29, 2013 at 7:13 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 28 April 2013 09:14, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Rootless X is owned by xuser, the problem is xuser could not have
>> permissions to write to the usb storage when the file system is
>> vfat(fat16/fat32):
>
> Did I miss something, but why not use a disk group that the xuser has
> access to?  I don't really like tying the automounter to the exact
> configuration of the X server, especially when this will break again
> if the user is using a non-root Wayland session.
>
> Ubuntu can set the user to the current user because as you say, the
> user environment is doing the mounting.  At the moment, we don't have
> that.

You might want to look at pmount. It is an easy way to handle it without udisks.

https://launchpad.net/pmount

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


