Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RVlvu-0005o8-Cb
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 16:18:50 +0100
Received: by qadc10 with SMTP id c10so466139qad.6
	for <openembedded-core@openembedded.org>;
	Wed, 30 Nov 2011 07:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=GRThumVPP36h5ZIAgFbHRMT0wQ7iav4zSSiNuUri+xw=;
	b=OeSDWcw/HrNECc1vwEqiCLhiawh6t2vVWjvwl4NmXXsJ8wxoLzz1o5G/0C8ZIjBE51
	reCjD3K1SIENYqVL5zzLbuoZ4tSr0RwvfWPTdaMEHDDt9Ng4lvPNhPSa0jAf3tVmS20w
	hG4zeqGHTiWNr7dljusAg9I0qpLjDEIG9F8Do=
Received: by 10.229.46.8 with SMTP id h8mr402774qcf.86.1322665929655; Wed, 30
	Nov 2011 07:12:09 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.73.200 with HTTP; Wed, 30 Nov 2011 07:11:48 -0800 (PST)
In-Reply-To: <4ED6070C.20904@emagii.com>
References: <4ED6070C.20904@emagii.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 30 Nov 2011 08:11:48 -0700
X-Google-Sender-Auth: r0ql_05A4bAQeB7xOFGir5-H6t4
Message-ID: <CABcZANm-jdT1wz9MCnW5fYns506+_HHautSxCo_S__T3kPCHYA@mail.gmail.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core@openembedded.org
Subject: Re: Adding kernel patches using "git am"?
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
X-List-Received-Date: Wed, 30 Nov 2011 15:18:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 30, 2011 at 3:35 AM, Ulf Samuelsson
<openembedded-core@emagii.com> wrote:
> Is there a reason for using "patch" instead of "git am" on let's say the
> kernel.
>
> If I want to do some modification, of the kernel, I can like Graeme
> description at
> http://www.slimlogic.co.uk/2011/05/openembeddedangstrom-kernel-workflow/
> do
> bitbake -c configure virtual/kernel
>
> and then have an initialized git tree ready to be modified.
>
> "git am" is of course more sensitive to the patch quality than "patch"
> but that has some advantages as well.
>
> It also makes the recipe more complex at this stage.

echo PATCHTOOL_pn-linux = "git" >> conf/local.conf # (note, uses
git-apply, not git-am, but it's a step in the direction you want,
anyway, and by inspecting patch.bbclass and lib/oe/patch.py and
looking for that patch tool, you can see how you'd go about adding one
for git-am if you desired it)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


