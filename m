Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SxkZs-00064V-38
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 22:04:00 +0200
Received: by eekb57 with SMTP id b57so484661eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2012 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=kC0xc/+HqjRwfiL121iMVu4vNmKST+M/VX0WfeFdlVI=;
	b=w1hvE5F7ChfnVylfq4prdM+ebil9adE3hV02DEEXXydM+ErbhwDxefpupPh3kMf7i+
	GnhDNF/uHAEHRLdHYJ3QhuPfWFkRVKuupGt51QOc5nqQUo//Y4PNdGaPGbMo5gbS+Xk2
	TLqVzssasp1kNCpHK4v6ttR8UZIzEtBSZWmsuPloPml95f8oDQd68F2BMGi4jYNvl0zJ
	5sn1ig1olSeC168FAT/BH6UiKzrdYhIWt00y0ydGi1ikfYMmjQYknO3DgAA/jujoCg1N
	IhwXffgzP8Nns7D64+YYE0ZJVWjHsHbL8+p3NrxqgJ1ETCY0zRjIECfVJpAwZLs+HNgp
	moig==
Received: by 10.14.194.198 with SMTP id m46mr7049250een.13.1344109937775; Sat,
	04 Aug 2012 12:52:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Sat, 4 Aug 2012 12:51:47 -0700 (PDT)
In-Reply-To: <CALbNGRRLGToMpW2tCzdtEcpZmAmgK3d2VKF0SVi-hgBanFOexQ@mail.gmail.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
	<CALbNGRQjUxm0h2+YA=Tog2_JhWPKGJmdy9QyhOjSQWLRQ1eKOQ@mail.gmail.com>
	<501CD3EE.3080100@intel.com>
	<CALbNGRTJM5=Xt4NqoEuEQa2U-eMtmQzy42HmwRK0zvkq-zK-3Q@mail.gmail.com>
	<501D2B2B.6070806@intel.com>
	<3103BB42-D7DD-456B-8733-9A019CA66E99@dominion.thruhere.net>
	<CALbNGRRLGToMpW2tCzdtEcpZmAmgK3d2VKF0SVi-hgBanFOexQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Aug 2012 12:51:47 -0700
Message-ID: <CAMKF1spXi6PqV6ZLqLPMUE0oEF2Sou+Jst-QME-XhLoCANeaPQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] gtk-icon-cache: call postinst scriplet at do_rootfs time
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
X-List-Received-Date: Sat, 04 Aug 2012 20:04:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 4, 2012 at 12:37 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> And less than 3min on overo with the patches we sent (and my xfce
> image is full of gtk-icon-update). Don't misunderstand me: I agree on
> doing things like this on host if possible. But for me the main time
> waiting on a new image is do_rootfs and I just suggest to think about
> having these tasks run only once - but we can do this later or never.
> A bit off topic: As far as I can remember there were times when it was
> a no-go having gtk-native in oe-core. I hope they are over...

I certainly agree with you that it should be run once. However what if
you changed something in icons between towo do rootfs runs ?
but I would like to know how much build time is it adding to do_rootfs ?
sometimes over optimising is bad too.


