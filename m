Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBA176294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:18:30 +0000 (UTC)
Received: by wmec201 with SMTP id c201so135841734wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 06:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Q1GOeU0oDdC7kSUcHu6MIWkbM1Zc8QkNaCIggoGOxIQ=;
	b=UWtyyVqxlAefycaK9nBeThymAbANtof7FbNl8uflFg+3U3H+ae6+TgCVQAVs01sP27
	nnRYiXb6aRJDEVFAXIOZkB0tw+u7Jv+eT5Vy40ZzYwV6JOCH14yKxiQcPS+bMzfYkiWQ
	z/iB1iMjMnasub3G9gcD/2UF7jkP0fTGmPRY5xWhZurKYa6lf1NoReHC7IRSBuvPL0S2
	3UzoFGNEz6FpL6b8XfpvpXLplVnros9AIXAhjDRgPMy5X0mG2MyU78m7mgeu773ymqXM
	+ZLzp0aRoYP3XTWSZffpgH/9Hj2O8GnnbRRRkG7UhF9rJZv6uOuA5IiD53n4B2qdW1I6
	N+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Q1GOeU0oDdC7kSUcHu6MIWkbM1Zc8QkNaCIggoGOxIQ=;
	b=a+opDVAeD2lODXiD8QZzwfiVmHPPDNYCUocyESvZaHwXBa++sPt+aoorrZTSF7kHwp
	tHjptBGWKKRc1uGrRrW0Tk6IyrfiBAGwobhYF3lldgUuoPj7x0jiFf83KZXqtiLZCaSo
	OHm03Ri38vUoLjGskx5SwMVkqPqMovSlz12XZqLQkDZcA5eDSl75djaJYh61uPUeztoG
	xb3Wcx40c4T4bLRwngekBuYBFiIPcaSP02UpZZSlonVvabn3M7lbDEU4zJfjfzHIh3qL
	Yqwpn0RBls4l+rOKNTvPBnQSQgEigcPRat3X9FtohJ7YsmQMcHwwvKkoZTkYQ2femTwR
	sayg==
X-Gm-Message-State: ALoCoQn+IsOnQsNCgwp9pNVmDMTC7qUDHyhj3cXXoOU8aMfnroAAQOnUdn08kqzJpOhwXYXi8kZD
X-Received: by 10.194.203.106 with SMTP id kp10mr4420038wjc.86.1447165110406; 
	Tue, 10 Nov 2015 06:18:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.27.216.207 with HTTP; Tue, 10 Nov 2015 06:18:00 -0800 (PST)
In-Reply-To: <5641F042.5080704@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<74d946dc65eb898819b81599cc6ae3a43297056d.1447080392.git.alexander.kanavin@linux.intel.com>
	<CAHiDW_GnidM1ee=8WwAgcSU5fKS9Mei5LfKzbEx_3u+9ji+3xA@mail.gmail.com>
	<5641F042.5080704@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 10 Nov 2015 16:18:00 +0200
Message-ID: <CAHiDW_Hu4q_K9QW7S44-0DM=ZgZDu1nr4gKZFv4rEJzjtHTiXA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/29] python-pygtk: remove the recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2015 14:18:32 -0000
Content-Type: multipart/alternative; boundary=047d7b6dcaba566b6c052430622a

--047d7b6dcaba566b6c052430622a
Content-Type: text/plain; charset=UTF-8

On 10 November 2015 at 15:25, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 11/10/2015 03:13 PM, Jussi Kukkonen wrote:
>
>> Are the pygtk changes directly related to the introspection changes? If
>> not then maybe they should happen in another patch set.
>>
>
> They are; pygtk requires an old (2.x) non-introspection based version of
> pygobject, and the introspection patchset updates pygobject to latest 3.x
> release which is a much thinner layer on top of libgirepository and is
> incompatible with pygtk.
>

Oh I see that now: It's patch 23 in the series for anyone else looking. I
think this should be pointed out more visibly: the patchset essentially
removes gtk2 python support, a feature we've had so far.

Maintaining python-gobject-2 and python-gtk-2 should be possible alongside
the GI-based versions, but A) it only makes sense if there's real demand
and B) it obviously doesn't have to happen in oe-core.

Jussi

--047d7b6dcaba566b6c052430622a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
0 November 2015 at 15:25, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><span class=3D"">On 11/10/2015 03:13 PM, Jussi Kukkonen wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Are the pygtk changes directly related to the introspection changes? If<br>
not then maybe they should happen in another patch set.<br>
</blockquote>
<br></span>
They are; pygtk requires an old (2.x) non-introspection based version of py=
gobject, and the introspection patchset updates pygobject to latest 3.x rel=
ease which is a much thinner layer on top of libgirepository and is incompa=
tible with pygtk.<br></blockquote><div><br></div><div>Oh I see that now: It=
&#39;s patch 23 in the series for anyone else looking. I think this should =
be pointed out more visibly: the patchset essentially removes gtk2 python s=
upport, a feature we&#39;ve had so far.</div><div><br></div><div>Maintainin=
g python-gobject-2 and python-gtk-2 should be possible alongside the GI-bas=
ed versions, but A) it only makes sense if there&#39;s real demand and B) i=
t obviously doesn&#39;t have to happen in oe-core.</div><div><br></div><div=
>Jussi</div><div><br></div></div></div></div>

--047d7b6dcaba566b6c052430622a--
