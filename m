Received: from mail-ie0-f181.google.com ([209.85.223.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ronunes@gmail.com>) id 1UNOKd-0006bs-OE
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 16:06:31 +0200
Received: by mail-ie0-f181.google.com with SMTP id 17so1679847iea.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=ivNANQklu33133C4qQog1tTOkUdjk5QH6EYdgF5huQc=;
	b=Vy7uYPc1XPX85zqexwz5+ZmYh1gDlBR7CFQrFQoSw2p31FNMk4NfLzThrgZY0Ucblk
	sJJorKLVYbW9mvsJWV+PKRhHqEpyvpxpOnOWyrZUCy5/XUoT5pElLQ5Fy0yPlUZJq2zt
	HSy6ajtP+724HnQlzJVtVIFpJ0LQiy4uU2QYkoKX3iOXe6rJBNtUFg86FgLPzzn8UYg9
	jP8xmDKqXgTeqfQ4IsKc4Ohvzn+BItkglLhB9mX4LuoxE9LCkFNIKCwKEzPgQqoKXDLa
	CRi6wsHl9UzPDnsi7ULqm1a25CvpxbeQ2PPSpFAQDzXdwQTQi0OHqII6B/dwSYWHen0D
	BkCA==
MIME-Version: 1.0
X-Received: by 10.50.77.110 with SMTP id r14mr397027igw.85.1364996959898; Wed,
	03 Apr 2013 06:49:19 -0700 (PDT)
Received: by 10.64.232.103 with HTTP; Wed, 3 Apr 2013 06:49:19 -0700 (PDT)
In-Reply-To: <CAP9ODKoHwQQR3AHDdXEVjObEFSHzbFJ5mGH0NXk_aevmsU+VDg@mail.gmail.com>
References: <1364949284-32569-1-git-send-email-ronunes@gmail.com>
	<1364949284-32569-2-git-send-email-ronunes@gmail.com>
	<CAJTo0LY14UsodYqHO2iEZfiZCfHVKG6XXNbPCRU95tWP=-qoZg@mail.gmail.com>
	<CAP9ODKoHwQQR3AHDdXEVjObEFSHzbFJ5mGH0NXk_aevmsU+VDg@mail.gmail.com>
Date: Wed, 3 Apr 2013 09:49:19 -0400
Message-ID: <CACb8hfHE6LVe_w20kshhyo6qofbprKbqM37rvvE5nsfbQpkoiA@mail.gmail.com>
From: Rogerio Nunes <ronunes@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gst-plugins-bad: disable librsvg when x11 is disabled
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
X-List-Received-Date: Wed, 03 Apr 2013 14:06:32 -0000
Content-Type: multipart/alternative; boundary=047d7bd75594ea59df04d9751ef8

--047d7bd75594ea59df04d9751ef8
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 3, 2013 at 7:57 AM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Wed, Apr 3, 2013 at 8:30 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 3 April 2013 01:34, Rogerio Nunes <ronunes@gmail.com> wrote:
> >> librsvg depends on gtk+, which in turn does not support framebuffer
> >> as backend in current version (2.15.24). This patch disables librsvg
> >> when x11 is not in the distro.
> >
> > One of my plans is to make every optional dependency a packageconfig
> > option in the long term, so feel free to do the rest whilst you're
> > there! :)
>
> I agree with the longterm goal but let's not hold this until the goal
> is accomplished. This fixes a real issue and delay it won't help.


I agree with both. This is a real issue and I like the long term plan.
Hope I can help to execute it :)

--047d7bd75594ea59df04d9751ef8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>On Wed, Apr 3, 2013 at 7:57 AM, Otavio Salvador=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D=
"_blank">otavio@ossystems.com.br</a>&gt;</span> wrote:<br></div><div class=
=3D"gmail_extra">
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div class=3D""><div class=3D"h=
5">On Wed, Apr 3, 2013 at 8:30 AM, Burton, Ross &lt;<a href=3D"mailto:ross.=
burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>

&gt; On 3 April 2013 01:34, Rogerio Nunes &lt;<a href=3D"mailto:ronunes@gma=
il.com">ronunes@gmail.com</a>&gt; wrote:<br>
&gt;&gt; librsvg depends on gtk+, which in turn does not support framebuffe=
r<br>
&gt;&gt; as backend in current version (2.15.24). This patch disables librs=
vg<br>
&gt;&gt; when x11 is not in the distro.<br>
&gt;<br>
&gt; One of my plans is to make every optional dependency a packageconfig<b=
r>
&gt; option in the long term, so feel free to do the rest whilst you&#39;re=
<br>
&gt; there! :)<br>
<br>
</div></div>I agree with the longterm goal but let&#39;s not hold this unti=
l the goal<br>
is accomplished. This fixes a real issue and delay it won&#39;t help.</bloc=
kquote><div><br></div>I agree with both. This is a real issue and I like th=
e long term plan.<div style>Hope I can help to execute it :)</div></div>
</div></div>

--047d7bd75594ea59df04d9751ef8--
