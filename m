Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id EA1FA746FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 22:36:51 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id l11-v6so7390540uak.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 15:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ozBo+DNxgFwuKxMeqJ6Afe8AGiyZA+ix05n/iuWgoZk=;
	b=HXj9Wky+3axjehsA81CZPe6OYUaiqGdY+7JkTsRsMX9dbLkOn/azBBemfoqfcpBXUp
	nkBsMFdio1ODZkpowx0154d8uqnhSZRmrxF7N8l7AwPfq48cX5toFDdPcVP0VgBlV1hD
	WYHc/AwqSxYNfnd+M3ocphew37pKdYxMQajGlnuxQjIZvEWDGdMrgiKhnegud7/bQpSZ
	zRDkCyscSaQNJiuPlxY3P+z9g2Dy5Q8aElBVCe0zWv8sj5NqO9o0FQ/oZI90zJy1lJCW
	XIU0czSx5aAJFGTjmql25A3xQ/M4Vqr3vRo+0KIwLkGLTVJ2aTAPpW/gQsG8S/ZiCE6c
	fuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ozBo+DNxgFwuKxMeqJ6Afe8AGiyZA+ix05n/iuWgoZk=;
	b=p/NMyeWPxV/8V5+lXpdoghCWmmjNor86qyzVHdXY4Kz1W2VOlqYF7pEwxQVsc/jfGR
	RCykUqeraKnOumFAGjUt/rooNugj5+fprQjSvAD32BEMrYoRqfu4wjdbG95v3QhMAZbr
	MwExmp0UvMBFbn6hTwJHyu8B1ck8KijoOD3GMwKdyTUHzksrnncD95jL6tPOzyQUw1+G
	kUuOI/rX/mDDKz+zL2tC8HfHSSz2PU6cD52Jk2tjk7+QW/cTVeimrnOQT2mvASvp4j0k
	BuKZAatSAUArw2pWJEwoXBN1P0MnnCAHCbT3NwKXBdG3ik2vIAtld1URQYQWPOEH3eaR
	Hy9Q==
X-Gm-Message-State: APt69E2Vf20DdpikuOFGyAYGq/OdW/SyYsUaiB4qtO717bv+apMFFXnZ
	yx9+wIjx+Xj4a21QVYFOl8FWOVulF1QXryP1aOg=
X-Google-Smtp-Source: ADUXVKLGFAVWPeeKl/imtp6RnWxbcOlN+D1Ut5ZxF1AvOL96RwYf4TpgKwnNx5zmlr8vNdB1HmUYwEFtZnILClDFoZ4=
X-Received: by 2002:ab0:5851:: with SMTP id
	p17-v6mr2373872uac.164.1529102212559; 
	Fri, 15 Jun 2018 15:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <1529093808-10025-1-git-send-email-armccurdy@gmail.com>
	<22e45738-aa92-24c7-a3fc-03a0918a1c3a@windriver.com>
In-Reply-To: <22e45738-aa92-24c7-a3fc-03a0918a1c3a@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jun 2018 15:36:26 -0700
Message-ID: <CAMKF1srvZ830wY4_PEV06L4Tea6OkHkSi+fcZMuG0sungLCdyQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@jci.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] common-licenses: Add BSD-1-Clause
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
X-List-Received-Date: Fri, 15 Jun 2018 22:36:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2018 at 3:14 PM Mark Hatle <mark.hatle@windriver.com> wrote=
:
>
> On 6/15/18 3:16 PM, Andre McCurdy wrote:
> > From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> >
> > Some projects are starting to use it.
> >   https://spdx.org/licenses//BSD-1-Clause.html
> >
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > (cherry picked from commit 77f692ecb39d880b2cb420850a31534860eb2cc5)
> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> > ---
> >  meta/files/common-licenses/BSD-1-Clause | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >  create mode 100644 meta/files/common-licenses/BSD-1-Clause
> >
> > diff --git a/meta/files/common-licenses/BSD-1-Clause b/meta/files/commo=
n-licenses/BSD-1-Clause
> > new file mode 100644
> > index 0000000..ded8897
> > --- /dev/null
> > +++ b/meta/files/common-licenses/BSD-1-Clause
> > @@ -0,0 +1,9 @@
> > +
> > +Copyright (c) <YEAR>, <OWNER>
> > +All rights reserved.
> > +
> > +Redistribution and use in source and binary forms, with or without mod=
ification, are permitted provided that the following conditions are met:
> > +
> > +Redistributions of source code must retain the above copyright notice,=
 this list of conditions and the following disclaimer.
> > +THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. "AS IS" AN=
D ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
>
> Hate to nitpick, but isn't BSDi defunct?  I don't think it makes sense to=
 list
> BSDI, since as far as I know they never had a '1-Clause' license.
>
> Maybe a <Organization Here> would be more appropriate.
>

I think we should sync the files we carry with SPDX e.g.
https://github.com/spdx/license-list-data/tree/master/text

> --Mark
>
> IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOS=
E ARE
> DISCLAIMED. IN NO EVENT SHALL Berkeley Software Design, Inc. BE LIABLE FO=
R ANY
> DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGE=
S
> (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVIC=
ES;
> LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED A=
ND ON
> ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF =
THIS
> SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > +
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

