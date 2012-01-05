Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sidebranch.openembedded@gmail.com>)
	id 1Rimdu-0000Rm-LN for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 13:42:02 +0100
Received: by eaal1 with SMTP id l1so303840eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 04:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=BJkUeajuRkCxBGNUF1ZJL9w745Fm31Lv8oKyQwPeHEc=;
	b=QOEH6E3r2Ks4VPIAY0wQtB7TS6vomTSTSM59NtWPbmj3mn0n9/wTvfG0nmkFIxcOK8
	t+QXg9cAmvmo0Krih+0hzLra7wbVv/4hNzjMWhoF4iLXe6dBDEKpNKbhvmz4o96oJACb
	eZGSf1u+FWdg06okQ7exPPqP6X63vcoQcyMrk=
MIME-Version: 1.0
Received: by 10.204.133.213 with SMTP id g21mr677114bkt.126.1325766879945;
	Thu, 05 Jan 2012 04:34:39 -0800 (PST)
Received: by 10.205.121.142 with HTTP; Thu, 5 Jan 2012 04:34:39 -0800 (PST)
In-Reply-To: <CAMKF1sqTpGDnzM=L3k25ipw1wCJGFRttbpVrMXF=ASDH5iXweA@mail.gmail.com>
References: <CAMvUbCzvVSiLqKPsMx1PyLHnaErKwd2R+nRZqbmLPtRfpoF=YQ@mail.gmail.com>
	<CAMKF1sqTpGDnzM=L3k25ipw1wCJGFRttbpVrMXF=ASDH5iXweA@mail.gmail.com>
Date: Thu, 5 Jan 2012 13:34:39 +0100
Message-ID: <CAMvUbCw0L2e6xcYOkrRMj18Lv7Dy=MKcyX1ZYdyNRzbGAdq_TA@mail.gmail.com>
From: Leon Woestenberg <sidebranch.openembedded@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-openembedded: avahi-ui-0.6.30: 'Fetcher failure for URL: 'file://fix_for_automake_1.11.2.patch'
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
X-List-Received-Date: Thu, 05 Jan 2012 12:42:02 -0000
Content-Type: multipart/alternative; boundary=0015175cbb0aef241704b5c727f0

--0015175cbb0aef241704b5c727f0
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Wed, Jan 4, 2012 at 11:38 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Jan 4, 2012 at 1:26 PM, Leon Woestenberg
> <sidebranch.openembedded@gmail.com> wrote:
> >
> > I cannot spot the error, other than that the patch exists in oe-core,
> but it
> > required from meta-oe. That should work, shouldn't it?
>
> I dont think so unless you have the oe-core locations in FILESPATH
>
>
OK, then avahi-ui in meta-oe is broken.  This is unmodified oe-core +
meta-oe, so I think this fails to build for everyone.

I suggest to remove avahi-ui from meta-oe completely.

Regards,

Leon.

--0015175cbb0aef241704b5c727f0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br><div class=3D"gmail_quote">On Wed, Jan 4, 2012 at 11:38 PM, K=
hem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khe=
m@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0pt 0pt 0pt 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<div class=3D"im">On Wed, Jan 4, 2012 at 1:26 PM, Leon Woestenberg<br>
&lt;<a href=3D"mailto:sidebranch.openembedded@gmail.com">sidebranch.openemb=
edded@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I cannot spot the error, other than that the patch exists in oe-core, =
but it<br>
&gt; required from meta-oe. That should work, shouldn&#39;t it?<br>
<br>
</div>I dont think so unless you have the oe-core locations in FILESPATH<br=
>
<br></blockquote></div><br>OK, then avahi-ui in meta-oe is broken.=A0 This =
is unmodified oe-core + meta-oe, so I think this fails to build for everyon=
e.<br><br>I suggest to remove avahi-ui from meta-oe completely.<br><br>Rega=
rds,<br>
<br>Leon.<br><br>

--0015175cbb0aef241704b5c727f0--
