Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qofb0-0004BG-Mw
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 19:51:06 +0200
Received: by ewy5 with SMTP id 5so571774ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 10:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Dqzpt39sr/DigWQqCwmRJ6JlObfkQxbLFAk/4RIJas8=;
	b=FEUtTibKtvxhjp5Erf25KGKZSVtmzRS6plKHnu1VAhG3rq2L8VFUeJuVFOfUIwFk8R
	RyTvoD9Jr8DfbZYBkiEkYuOFagio1ur1NJv4dATOZCpIiPRE3MnbThsg5oqWkwdPlVmM
	IkT7GjonoRw0xjjGAgayoXiQFDWncGnffGC50=
MIME-Version: 1.0
Received: by 10.213.3.198 with SMTP id 6mr370496ebo.15.1312393603572; Wed, 03
	Aug 2011 10:46:43 -0700 (PDT)
Received: by 10.213.113.196 with HTTP; Wed, 3 Aug 2011 10:46:43 -0700 (PDT)
In-Reply-To: <CAD=GYpbk+qV3E2uTuSpQV1R2G77K3-QL+6aHo0kGW5yodmxEvg@mail.gmail.com>
References: <CAD=GYpYeDmU6CN1MzztiKsf+tfOrWgBmkGfQoSpSRhoToDDskg@mail.gmail.com>
	<CAD=GYpbk+qV3E2uTuSpQV1R2G77K3-QL+6aHo0kGW5yodmxEvg@mail.gmail.com>
Date: Wed, 3 Aug 2011 12:46:43 -0500
Message-ID: <CAD=GYpa608_XqqOChnpVVoCfrWrEWfDdRL-4sefc4MbcP8=txA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: systemd-gnome-image do_rootfs failure
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
X-List-Received-Date: Wed, 03 Aug 2011 17:51:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 2, 2011 at 10:00 PM, Joel A Fernandes <agnel.joel@gmail.com> wrote:
> Hi,
>
> I now get a build error as below with systemd-gnome-image in
> do_rootfs, could you take a look?

I did a clean rebuild of a few packages like: font-util, mesa-dri and shadow,
 opkg-cl now doesn't show those errors anymore.

Thanks,
Joel


