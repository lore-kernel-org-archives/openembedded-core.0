Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QfIvu-0000eL-Ey
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 23:50:29 +0200
Received: by pvf24 with SMTP id 24so1451429pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 14:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=oC7EjcB5xiByhpZu37sBU8PR5wOCAFreDsDyYwuWuFQ=;
	b=U+6Wr3qWsLjXC89Ia2NjRZ3IGGkAnCo1JvpRPWkp1dzH/01WBptO9DqRUPIci7VdFx
	lmfS5POy27aRRiIoHr2STZH+2DD9xeBN8vLVWmcZBo9im0VbzCaTWhbsrM0IR8onez+j
	VJpCpqaU/DTi0N5rap/DnMKGZ+8S2uImZI6yg=
MIME-Version: 1.0
Received: by 10.142.242.12 with SMTP id p12mr491126wfh.346.1310161462922; Fri,
	08 Jul 2011 14:44:22 -0700 (PDT)
Received: by 10.142.239.3 with HTTP; Fri, 8 Jul 2011 14:44:22 -0700 (PDT)
In-Reply-To: <4E172466.6040805@linux.intel.com>
References: <cover.1310079506.git.andrea.adami@gmail.com>
	<54796cbee0dc1928f2295a57b4a4783a1222ace1.1310079506.git.andrea.adami@gmail.com>
	<4E172466.6040805@linux.intel.com>
Date: Fri, 8 Jul 2011 23:44:22 +0200
Message-ID: <CAAQYJAvA1BPC=JoSbeckRcBLE5eX3qO0gwrUOmua_EjN538ccg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel.bbclass: handle embedding of initramfs images
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
X-List-Received-Date: Fri, 08 Jul 2011 21:50:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 8, 2011 at 5:38 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
>
> On 07/07/2011 04:11 PM, Andrea Adami wrote:
>> * from org.openembedded.dev (oe-classic)
>
> Hi Andrea,
>
> Please include a descriptive blurb about the patch. When people read
> through the commit log they need to know what problem this patch
> addresses and how it intends to go about it. If possible, it should also
> include the commit id from the source (I suspect that isn't an option her=
e).
>
Well, there isn't =A0really much to say: whether you know what an
initramfs is or not :)
Seriously, about the history of the patch, there have been so many
commits that I could not choose one. See next comment.

>
> Hrm... Why is this part of do_configure? Seems a lot more like a deploy
> or install step.

If you look at the history at
http://cgit.openembedded.org/cgit.cgi/openembedded/log/classes/kernel.bbcla=
ss?h=3Dorg.openembedded.dev&ofs=3D50
you'll discover that there was a separate task (72761e4) which has
been unified by the author as of commit =A03e3f297.

After some rounds of fixes, =A0the code was moved in do_configure with
commit id fc03e2b (kernel.bbclass: move initramfs stuff to configure
so we can do postprocessing on it with do_configure_append).


>Also, the cp line has been truncated here.
The original patch sent by git send.email should be sane.

> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>

Regards

Andrea


